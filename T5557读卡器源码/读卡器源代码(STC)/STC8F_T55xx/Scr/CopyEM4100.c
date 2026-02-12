#include"CopyEM4100.h"

unsigned long Write_Buf[2];			//写入的数据

void CopyEM4100Uid(unsigned char *buf)
{
		unsigned char x,j;
		unsigned char _Uid[11];
		
		for(x = 0;x < 5;x ++)
		{	
				_Uid[x * 2]   = buf[x]&0xf0;  //清低4位
				_Uid[x * 2+1] = buf[x]<<4;	   //得到低四位
		}

		for(x = 0;x < 10;x ++)						   //行校验数据生成
		{
			if((((_Uid[x] >> 4) ^
					 (_Uid[x] >> 3) ^
					 (_Uid[x] >> 2) ^
					 (_Uid[x] >> 1) ^
						_Uid[x]) & 0x08) != 0)
				_Uid[x] = _Uid[x] | 0x08;	   //将第5位置1
		}
		j = 0;
		for(x = 0;x < 11;x ++)	j = j ^ (_Uid[x] & 0x80);				   //列校验数据生成
		if(j != 0)	_Uid[10] = _Uid[10] | 0x80;	
		j = 0;
		for(x = 0;x < 11;x ++)	j = j ^ (_Uid[x] & 0x40);
		if(j != 0)	_Uid[10] = _Uid[10] | 0x40;
		j = 0;
		for(x = 0;x < 11;x ++)	j = j ^ (_Uid[x] & 0x20);
		if(j != 0)	_Uid[10] = _Uid[10] | 0x20;
		j = 0;
		for(x = 0;x < 11;x ++)	j = j ^ (_Uid[x] & 0x10);
		if(j !=0 )	_Uid[10] = _Uid[10] | 0x10;			
		for(x = 0;x < 11;x ++)		Buff[x] = _Uid[x];		//转换好的数据，放入Buff缓冲等待合并数据				
}

void Write_DataManage(void)
{	
		Write_Buf[1] = 0;													
		Write_Buf[0] = 0x000001FF;		// 0000 0000 0000 0000	0000 0001 1111 1111
		Write_Buf[0] = (Write_Buf[0] << 5) | (Buff[0] >> 3); 
	  Write_Buf[0] = (Write_Buf[0] << 5) | (Buff[1] >> 3);
	  Write_Buf[0] = (Write_Buf[0] << 5) | (Buff[2] >> 3);
	  Write_Buf[0] = (Write_Buf[0] << 5) | (Buff[3] >> 3);
		Write_Buf[0] = (Write_Buf[0] << 3) | (Buff[4] >> 5);
		Write_Buf[1] = (Buff[4] >> 3) & 0x03;			  						
		Write_Buf[1] = (Write_Buf[1] << 5) | (Buff[5] >> 3);		
	  Write_Buf[1] = (Write_Buf[1] << 5) | (Buff[6] >> 3);	
	  Write_Buf[1] = (Write_Buf[1] << 5) | (Buff[7] >> 3);	
	  Write_Buf[1] = (Write_Buf[1] << 5) | (Buff[8] >> 3);	
		Write_Buf[1] = (Write_Buf[1] << 5) | (Buff[9] >> 3);	
		Write_Buf[1] = (Write_Buf[1] << 5) | (Buff[10] >> 3);	
}

void EM4305CopyEM4100(unsigned char *buf)
{
		unsigned char x,y;
		unsigned char idata buff_x[8];	
	  
		EA = 0;
	  CopyEM4100Uid(buf);
	  Write_DataManage();
		for(x=0;x<4;x++)	//移位
		{
				for(y=0;y<8;y++)
				{
						buff_x[x] = buff_x[x]>>1;
						Write_Buf[0] = Write_Buf[0]<<1;
						if(CY) buff_x[x] = buff_x[x]|0x80;
				}	
		}
		for(x=4;x<8;x++)	//移位
		{
				for(y=0;y<8;y++)
				{
						buff_x[x] = buff_x[x]>>1;
						Write_Buf[1] = Write_Buf[1]<<1;
						if(CY) buff_x[x] = buff_x[x]|0x80;
				}	
		}
		Write_block(0,0x01,0x80,0x5f,0x04);   //写配置块
		Delay_8nus(6250);
		Write_block(buff_x[3],buff_x[2],buff_x[1],buff_x[0],0x05);
		Delay_8nus(6250);
		Write_block(buff_x[7],buff_x[6],buff_x[5],buff_x[4],0x06);
		Delay_8nus(6250);
		EA = 1;
}

void T5557CopyEM4100(unsigned char *buf)
{
	  EA = 0;
		CopyEM4100Uid(buf);
	  Write_DataManage();
	  T5557Write_Block(0,0,0,0,E5557_Config,0);//写配置块   
	  Delay_8nus(1250);
		T5557Write_Block(0,1,0,0,Write_Buf[0],0);//写0页第一块
	  Delay_8nus(1250);
		T5557Write_Block(0,2,0,0,Write_Buf[1],0);//写0页第二块		
	  EA = 1;   	
}