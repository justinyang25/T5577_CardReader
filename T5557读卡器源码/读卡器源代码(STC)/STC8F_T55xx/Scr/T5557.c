#include"T5557.h"
#include"EM41xx.h"

#define  Start_Gap  20   	    //起始   160 200 	   30*8=240  200
#define  GapS       15        //间隔   60  150	   15*8=120  100
#define  Bit_One    55    	  //数据1  220 350	   55*8=440  220
#define  Bit_Zero   20    	  //数据   100 100     25*8=200  100

#define 	TS_8RFmin     (60*(FOSC/1000))/12/1000  	  //96
#define 	TS_8RFmax     (150*(FOSC/1000))/12/1000
#define 	T05_8RFmin    (10*(FOSC/1000))/12/1000
#define 	T05_8RFmax    (60*(FOSC/1000))/12/1000
#define 	TS_16RFmin    (160*(FOSC/1000))/12/1000  	//192
#define 	TS_16RFmax    (250*(FOSC/1000))/12/1000
#define 	T05_16RFmin   (30*(FOSC/1000))/12/1000
#define 	T05_16RFmax   (100*(FOSC/1000))/12/1000
#define 	TS_32RFmin    (360*(FOSC/1000))/12/1000  	//384
#define 	TS_32RFmax    (450*(FOSC/1000))/12/1000
#define 	T05_32RFmin   (80*(FOSC/1000))/12/1000
#define 	T05_32RFmax   (200*(FOSC/1000))/12/1000
#define 	TS_40RFmin    (450*(FOSC/1000))/12/1000  	//480
#define 	TS_40RFmax    (600*(FOSC/1000))/12/1000
#define 	T05_40RFmin   (100*(FOSC/1000))/12/1000
#define 	T05_40RFmax   (220*(FOSC/1000))/12/1000
#define 	TS_50RFmin    (550*(FOSC/1000))/12/1000  	//600
#define 	TS_50RFmax    (700*(FOSC/1000))/12/1000
#define 	T05_50RFmin   (150*(FOSC/1000))/12/1000
#define 	T05_50RFmax   (300*(FOSC/1000))/12/1000
#define 	TS_64RFmin    (700*(FOSC/1000))/12/1000  	//768
#define 	TS_64RFmax    (950*(FOSC/1000))/12/1000
#define 	T05_64RFmin   (180*(FOSC/1000))/12/1000
#define 	T05_64RFmax   (350*(FOSC/1000))/12/1000
#define 	TS_100RFmin   (1000*(FOSC/1000))/12/1000  //1200
#define 	TS_100RFmax   (1350*(FOSC/1000))/12/1000
#define 	T05_100RFmin  (250*(FOSC/1000))/12/1000
#define 	T05_100RFmax  (600*(FOSC/1000))/12/1000
#define 	TS_128RFmin   (1400*(FOSC/1000))/12/1000  //1536us
#define 	TS_128RFmax    (1700*(FOSC/1000))/12/1000
#define 	T05_128RFmin  (400*(FOSC/1000))/12/1000
#define 	T05_128RFmax  (700*(FOSC/1000))/12/1000

unsigned int TS_min = TS_32RFmin;
unsigned int TS_max = TS_32RFmax;
unsigned int T05_min = T05_32RFmin;
unsigned int T05_max = T05_32RFmax;

unsigned char idata T57_Buff[28] = 0;

void DelayNus(unsigned int us)	 //@24MHz
{
		unsigned char i;
	
		EA = 0;
	
		while(us--)
		{
				i = 3;
	  		while (--i);
		}
		EA = 1;
}

void Delay8Nus(unsigned char us)	//@24MHz
{
		unsigned char i;
	
	  EA = 0;
	
		do
		{
				i = 62;
	  		while (--i);
		}while(--us);
		
		EA = 1;
}

void Contrl_PLL(unsigned char nRF)
{
		switch(nRF)
		{
				case 0x08:
									TS_min = TS_8RFmin;
									TS_max = TS_8RFmax;
									T05_min = T05_8RFmin;
									T05_max = T05_8RFmax;					
						break;
				case 0x10:
									TS_min = TS_16RFmin;
									TS_max = TS_16RFmax;
									T05_min = T05_16RFmin;
									T05_max = T05_16RFmax;							
						break;
				case 0x20:
									TS_min = TS_32RFmin;
									TS_max = TS_32RFmax;
									T05_min = T05_32RFmin;
									T05_max = T05_32RFmax;							
						break;
				case 0x28:
									TS_min = TS_40RFmin;
									TS_max = TS_40RFmax;
									T05_min = T05_40RFmin;
									T05_max = T05_40RFmax;							
						break;
				case 0x32:
									TS_min = TS_50RFmin;
									TS_max = TS_50RFmax;
									T05_min = T05_50RFmin;
									T05_max = T05_50RFmax;							
						break;
				case 0x40:
									TS_min = TS_64RFmin;
									TS_max = TS_64RFmax;
									T05_min = T05_64RFmin;
									T05_max = T05_64RFmax;							
						break;		
				case 0x64:
									TS_min = TS_100RFmin;
									TS_max = TS_100RFmax;
									T05_min = T05_100RFmin;
									T05_max = T05_100RFmax;							
						break;
				case 0x80:
									TS_min = TS_128RFmin;
									TS_max = TS_128RFmax;
									T05_min = T05_128RFmin;
									T05_max = T05_128RFmax;							
						break;				
		}
}

void Contrl_RF(bit state,unsigned int dtime)	//控制载波时长 
{
		if(state) 
		{
				Carrier_On();			     //开启载波
		}
		else
		{
				Carrier_Off();			   //关闭载波
		}
		Delay8Nus(dtime);	
}

void Write_Bit(bit dat)
{
		if(dat)
				Contrl_RF(1,Bit_One);    	//1
		else
				Contrl_RF(1,Bit_Zero);   	//0		
		Contrl_RF(0,GapS);   					//数据间隔
}

void Write_Start(void)
{
		Carrier_On();			  	  							//开启载波
		DelayNus(10000);		    							//POR 启动延时6MS 
		Contrl_RF(0,Start_Gap); 							//写起始间隙
}

void Write_Opcode(unsigned char Opcode)		//写操作码	1P/0P
{
	  if((Opcode&0x02)==0x02)
			Write_Bit(1);
		else
			Write_Bit(0);
	  if((Opcode&0x01)==0x01)
			Write_Bit(1);
		else
			Write_Bit(0);		
}
/**********************************************************************************/
//void T5557Write_Block(unsigned char _page,           //页 0/1
//											unsigned char _block,					 //块地址
//											unsigned char_codeEnDisble,    //正常写 0/保护写1
//											unsigned char Passwrod,        //密码数据
//											unsigned char Bankdata,        //块数据
//											unsigned char BankLock)        //块锁
/**********************************************************************************/

void T5557Write_Block(unsigned char _page,          //页 0/1
											unsigned char _block,					//块地址
											unsigned char _codeEnDisble, 	//正常写 0/保护写1
											unsigned long  Passwrod,				//密码数据
											unsigned long  Bankdata,				//块数据
											unsigned char  BankLock)			//块锁
{
		unsigned char i;
	
		Write_Start();		//写起始
		if(_page == 1)  Write_Opcode(0x03);//操作码11 对1页  操作码
		else
		{
				Write_Opcode(0x02);     				//10 对0页  操作码
		}
		if(_codeEnDisble)         					//保护写
		{
				for(i = 0;i < 32;i ++)	  			//写密码
				{
						if(Passwrod & 0x80000000) Write_Bit(1);
						else
								Write_Bit(0);		
						Passwrod = Passwrod << 1;			       			
				}					
		}
		if(BankLock == 1) Write_Bit(1);	//块锁信号 0：不锁	
		else
		{
				Write_Bit(0);	
		}	
		for(i = 0;i < 32;i ++)
		{
			  if(Bankdata & 0x80000000) Write_Bit(1);
			  else
					 Write_Bit(0);
				Bankdata = Bankdata << 1;				       			
		}	
		for(i = 0;i < 3;i ++)				//块地址 0000 0xxx
		{		
			  if(_block & 0x04) Write_Bit(1);
			  else
						Write_Bit(0);
				_block = _block << 1;
		}		
		Carrier_On();								//给卡一个编程的时间
		DelayNus(10000);
		Carrier_Off();
}

void Write_Aor(unsigned long W_data)	//AOR唤醒
{
	  unsigned char i;
		
		Write_Start();										//写起始	
	  Write_Opcode(0x02);     			  	//操作码10
	
	  for(i = 0;i < 32;i ++)						//写密码
		{
			  if(W_data & 0x80000000)  Write_Bit(1);	
			  else
						Write_Bit(0);				
				W_data = W_data << 1;    
		}
		Carrier_On();										  //给卡一个编程的时间		
}

/**********************************************************************************/
//读卡同步头   循环检测200次
//返回值 0失败 1成功
//nRF ：RF/N
/**********************************************************************************/
bit Findhead(unsigned char nRF) 
{ 
		unsigned char	n = 50;
    unsigned int Ts;
		unsigned int ErrTimes = 0;
	
		while(n--)
		{
				ErrTimes = 0;
				TR0 = 0;TH0 = 0;TL0 = 0; 			//				      +---+
				while(!INPORT)								//找上升沿	----+	  +------
				{
						ErrTimes ++;
						DelayNus(1);
						if(ErrTimes == 2500) break;
				}
				if(ErrTimes == 2500)  continue;
				ErrTimes = 0;
				TR0 = 1; 
				while(INPORT)								 //找下降沿				
				{
						ErrTimes ++;
						DelayNus(1);
						if(ErrTimes == 2500) break;					
				}
				if(ErrTimes == 2500)  continue;
				ErrTimes = 0;
				TR0 = 0;
				Ts = TH0 *256 + TL0;
				TH0 = 0;TL0 = 0;TR0 = 1; 		
				if(!((TS_min < Ts)&&(Ts < TS_max))) continue;  //检测同步信号1.5P     
				while(!INPORT)								//等待上升沿
				{
						ErrTimes ++;
						DelayNus(1);
						if(ErrTimes == 2500) break;								
				}
				if(ErrTimes == 2500)  continue;
				
				TR0 = 0;
				Ts = TH0 *256 + TL0;
				if(Ts > T05_max) continue; 	 	  //0.5p,找到同步头
			
			  Delay8Nus((nRF / 4) + nRF);			//跳过一个数据周期时间				
			  return 1; 
		}		
		return 0; 
}

unsigned char T5557ReadPage(unsigned char page,unsigned char nRF)
{
		bit	Demod_Bit;
		unsigned char i,j,k;
	  unsigned char readCount = 0;
		unsigned int ErrTimes = 0;
	
	  Contrl_PLL(nRF);			//设置解码速率
		Write_Start();				//写起始	
		if(page == 1) 
		{
				Write_Opcode(0x03);  	//操作码11
				readCount = 2;
		}
		else
		{
				Write_Opcode(0x02);  	//操作码10
				readCount = 7;
		}	
		Carrier_On();	 		//打开磁场
		
		if(Findhead(nRF))
		{
				for(i = 0;i < readCount;i ++)   //多少个块
				{
						for(j = 0;j < 4;j ++) 			//4个字节
						{
								T57_Buff[(i * 4) + j] = 0;
								for(k = 0;k < 8;k ++) 	//8bit
								{
										T57_Buff[(i * 4) + j] = T57_Buff[(i * 4) + j] << 1;
										Demod_Bit = INPORT;
										if(Demod_Bit) T57_Buff[(i * 4) + j] = T57_Buff[(i * 4) + j] | 0x01;
									
										ErrTimes = 0;
										while(INPORT == Demod_Bit)		//等待跳变
									  {
												ErrTimes ++;
												DelayNus(1);
										}
										if(ErrTimes > TS_min)
										{
												Carrier_Off();
												return 0;
										}
										Delay8Nus((3 * nRF) / 4);
								}
						}
				}
				Carrier_Off();
				return 1;
		}
		Carrier_Off();
		return 0;
}
/**********************************************************************************/
//void T5557Write_Block(uint8_t _page,          	//页 0/1
//											uint8_t _block,						//块地址
//											uint8_t _codeEnDisble,    //正常写 0/保护写1
//											uint32_t Passwrod,        //密码数据
//											uint32_t Bankdata,        //块数据
//											uint8_t  BankLock)        //块锁
/**********************************************************************************/
unsigned char T5557Read_Block(unsigned char _page,          //页 0/1
															unsigned char _block,					//块地址
															unsigned char _codeEnDisble, 	//正常写 0/保护写1
															unsigned long Passwrod,				//密码数据
															unsigned char nRF)						//速率									 	
{
		bit	Demod_Bit;
		unsigned char i,j;
		unsigned int ErrTimes = 0;	
	
		Contrl_PLL(nRF);			//设置解码速率
		
	  Write_Start();			 //写起始	
		if(_page == 1) 
		{
				Write_Opcode(0x03);  //操作码11   读1页指定块
		}
		else
		{
				Write_Opcode(0x02);  //操作码10   读0页指定块
		}	
		if(_codeEnDisble == 1)
		{
				for(i = 0;i < 32;i ++) //写密码
				{
						if(Passwrod & 0x80000000)  Write_Bit(1);
						else
								Write_Bit(0);
						Passwrod = Passwrod << 1;			       			
				}					
		}
		Write_Bit(0);		
		for(i = 0;i < 3;i ++)			 //块地址 0000 0xxx
		{		
			  if(_block & 0x04) Write_Bit(1);
			  else
						Write_Bit(0);
				_block = _block << 1;
		}	
		Carrier_On();
		
		if(Findhead(nRF))
		{
			  for(i = 0;i < 4;i ++)											//读取4字节数据 
			  {
						T57_Buff[i] = 0;
						for(j = 0;j < 8;j ++)			
						{
								T57_Buff[i] = T57_Buff[i] << 1;
								Demod_Bit = INPORT;
							  if(Demod_Bit) T57_Buff[i] = T57_Buff[i]|0x01;
							
								ErrTimes = 0;	
							  while(INPORT == Demod_Bit)		//等待跳变
								{
										ErrTimes ++;
										DelayNus(1);
								}
								if(ErrTimes > TS_min)
								{
										Carrier_Off();
										return 0;
								}									
							  Delay8Nus((3 * nRF) / 4);
						}
				}	
				Carrier_Off();
				return 1; 
		}
		Carrier_Off();
		return 0; 
}

