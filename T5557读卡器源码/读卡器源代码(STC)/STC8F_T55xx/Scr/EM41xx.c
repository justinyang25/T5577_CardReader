#include"EM41xx.h"
#include"Uart.h"

bit bitin = 0;				  					//上一次的姿态位
unsigned char Buff[11];						//解码缓冲区
unsigned char ID[5];							//ID卡号
                               
unsigned int TIME00 = RF64_Min;		//脉宽最小时间	  
unsigned int TIME05 = RF64_Mid;		//半个周期时间上限
unsigned int TIME10 = RF64_Max;		//一个周期时间上限	

void Delay10us()		//@24.000MHz
{
	unsigned char i;

	i = 78;
	while (--i);
}

void T1Clk_Out(unsigned char Pll)
{
	  unsigned int Pll_temp;
	
	  Pll_temp = 65536 - (FOSC/2/12/1000/Pll);
	
	  AUXR &= 0xBF;      //12T模式
		TMOD &= 0x0F;      //模式0
	  TL1 = Pll_temp;
	  TH1 = Pll_temp >> 8;
	  TR1 = 1;           //启动定时器
    INTCLKO = 0x02;    //使能时钟输出
}


/*曼彻斯特码解码后的数据放在 Buff[0~10];
			  数据格式：1111 1111 同步头，8个1
			  数据格式：1xxx xxxx 同步头，1个1，x表示无意义
Buff[0] =     数据格式：D00D01D02D03 P0xxx 八个版本位或厂商信息的前四位，x表示无意义；P0为行效验位
Buff[1] =     数据格式：D10D11D12D13 P1xxx 八个版本位或厂商信息的后四位，x表示无意义；P1为行效验位
Buff[2] =     数据格式：D20D21D22D23 P2xxx 三十二个数据，x表示无意义；P2为行效验位
Buff[3] =     数据格式：D30D31D32D33 P3xxx 三十二个数据，x表示无意义；P3为行效验位
Buff[4] =     数据格式：D40D41D42D43 P4xxx 三十二个数据，x表示无意义；P4为行效验位
Buff[5] =     数据格式：D50D51D52D53 P5xxx 三十二个数据，x表示无意义；P5为行效验位
Buff[6] =     数据格式：D60D61D62D63 P6xxx 三十二个数据，x表示无意义；P6为行效验位
Buff[7] =     数据格式：D70D71D72D73 P7xxx 三十二个数据，x表示无意义；P7为行效验位
Buff[8] =     数据格式：D80D81D82D83 P8xxx 三十二个数据，x表示无意义；P8为行效验位
Buff[9] =     数据格式：D90D91D92D93 P9xxx 三十二个数据，x表示无意义；P9为行效验位
Buff[10] =    数据格式：PC0PC1PC2PC3 0xxx  四个列效验位，x表示无意义；0为停止位
*/

void RFID_Timer0InIt(void)
{
		AUXR &= 0x7F;			//定时器0时钟为12T模式
		TMOD &= 0xF0;			//设置定时器模式 16位不自动重装
		TMOD |= 0x01;			//设置定时器模式
		TR0 = 1;		    	//定时器0开始计时
		INPORT = 1;	
}

//========================================================================
// 函数: unsigned char readbit(void)
// 描述: EM卡数据位检测
// 参数: 
// 返回: 1 一个周期  2 半个周期  0失败
// 版本: V1.0, 2017-9-23
//========================================================================
unsigned char readbit(void)
{
		unsigned int mk = TIME10;	//装入超时值

		TL0 = 0;
		TH0 = 0;									//初始化定时计数器
		TR0 = 1;									//开始计时
		while(--mk)								//超时机制，防止死等
		{
				if(bitin != INPORT)		//有跳变
				{
					  Delay10us();
					  if(bitin != INPORT)		//有跳变
									break;
				}
		}
		TR0 = 0;									//停止计时
		if(mk==0)									//超时退出，直接返回 失败
					return 0;
		bitin = INPORT;									//保存IO口状态
		mk = TH0 * 256 + TL0;							//计算这个跳变的脉宽

		if((mk>TIME05)&&(mk<=TIME10))		//一个周期时间
			return 1;
		if((mk>=TIME00)&&(mk<=TIME05))	//半周期时间
			return 2;
		return 0;												//错误
}

//========================================================================
// 函数: unsigned char readdata(void)
// 描述: 读一个完整的数据位
// 参数: 
// 返回: 
// 版本: V1.0, 2017-9-23
//========================================================================
unsigned char readdata(void)
{
		switch(readbit())
		{
				case 1:												//一个周期
					return !bitin;
				case 2:												//半个周期
					if(readbit()!=2) return 2;	//再读半个周期
					return !bitin;
				default:
					return 2;
		}
}

//========================================================================
// 函数: bit CheckDataRFID(void)
// 描述: EM4100接收解码
// 参数: 
// 返回: 
// 版本: V1.0, 2017-9-23
//========================================================================
bit CheckDataRFID(void)
{
		unsigned char i,j;
	
		bitin = INPORT;		//保存IO状态
	
		for(i=0;i<9;i++)	
		{
				if(readdata()!=1)		 	//不是连续的9个数据1，直接跳出解码函数。
					return 0;
		}

		 /////////////////////////////////读取数据///////////////////////////////
		for(i=0;i<11;i++)			 //11个字节
		{
				Buff[i] = 0x00;
				for(j=0;j<5;j++)		 //每个字节保存5bit  数据xxxx 校验x
				{
						Buff[i] <<= 1;
						switch(readdata())
						{
								case 0:		//0
									break;
								case 1:		//1
									Buff[i] |= 0x08;
									break;
								case 2:		//err
									return 0;
						}
				}
		}	
    ///////////////////////////////////结束位//////////////////////////////
		if(Buff[10]&0x08!=0x00)
			return 0;
		for(i=0;i<10;i++)										//行奇校验
			if((((Buff[i]>>4) ^
						 (Buff[i]>>3) ^
						 (Buff[i]>>2) ^
						 (Buff[i]>>1) ^
							Buff[i])&0x08)!=0)
					return 0;		
																				
		j=0;																//列奇校验
		for(i=0;i<11;i++)
			j=j ^ (Buff[i]&0x80);
		if(j!=0)
			return 0;
		for(i=0;i<11;i++)
			j=j ^ (Buff[i]&0x40);
		if(j!=0)
			return 0;
		for(i=0;i<11;i++)
			j=j ^ (Buff[i]&0x20);
		if(j!=0)
			return 0;
		for(i=0;i<11;i++)
			j=j ^ (Buff[i]&0x10);
		if(j!=0)
			return 0; 
		return 1;					//成功
}

//========================================================================
// 函数: bit ReadEM41xxCardNo(void)
// 描述: EM41数据 合并卡号
// 参数: 
// 返回: 1成功 0失败
// 版本: V1.0, 2017-9-23
//========================================================================
bit ReadEM41xxCardNo(void)
{
		if(CheckDataRFID())				//检测到卡数据
		{
				ID[0]=(Buff[0] & 0xF0) | (Buff[1]>>4 & 0x0F);
				ID[1]=(Buff[2] & 0xF0) | (Buff[3]>>4 & 0x0F);
				ID[2]=(Buff[4] & 0xF0) | (Buff[5]>>4 & 0x0F);
				ID[3]=(Buff[6] & 0xF0) | (Buff[7]>>4 & 0x0F);
				ID[4]=(Buff[8] & 0xF0) | (Buff[9]>>4 & 0x0F);
				return 1;
		}	
    return 0;		
}
