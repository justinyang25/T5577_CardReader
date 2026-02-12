#include"EMReadWriteCard.h"
#include"Uart.h"

///////////////////////////////////////////////////////////////////
//                        Ð´¿¨Ê±¼ä²ÎÊýus
#define  	Start_Gap	 	  55		//¿ªÊ¼¼äÏ¶	
#define 	Write_Data1		32		//Ð´Êý¾Ý'1'
#define 	Write_DataH0	17		//Ð´Êý¾Ý'0'17 
#define 	Write_DataL0	23		//Ð´Êý¾Ý'0'23

#define WriteCom    0x05         //Ð´ÃüÁî


unsigned char EM_Buff[10];		//¶Á¿¨Êý¾Ý½ÓÊÕ»º³å

void Delay_8nus(unsigned int n)
{
		unsigned char i;
	
		do
		{
				i = 58;
				while (--i);
		}
		while(n--);	 
}

//========================================================================
// º¯Êý: void Write_bit(unsigned char x)
// ÃèÊö: Ð´Ò»¸öÊý¾ÝÎ»
// ²ÎÊý: x£ºÐ´ÈëµÄÊý¾Ý 0/1
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Write_bit(unsigned char x)
{
    if(x)
    {
				Carrier_On(); 						//¿ª´Å³¡
				Delay_8nus(Write_Data1);	//Î¬³ÖÊý¾Ý1µÄ´Å³¡Ê±¼ä
    }
    else
    {
				Carrier_On(); 						//¿ª´Å³¡
				Delay_8nus(Write_DataH0);	//Î¬³ÖÊý¾Ý0µÄ¿ªÆô´Å³¡Ê±¼ä
				Carrier_Off();						//¹Ø±Õ´Å³¡
				Delay_8nus(Write_DataL0);	//Î¬³ÖÊý¾Ý0µÄ¹Ø±Õ´Å³¡Ê±¼ä 	
        Carrier_On(); 						//¿ª´Å³¡    	
    } 
}

//========================================================================
// º¯Êý: void Write_star(void)
// ÃèÊö: ·¢ÆðÊ¼ÐÅºÅ
// ²ÎÊý: 
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Write_star(void)
{	
		Carrier_Off();
		Delay_8nus(Start_Gap); 			//¿ªÆô³¡Ç¿410us
		Write_bit(0);
}

//========================================================================
// º¯Êý: void Write_command(unsigned char command)
// ÃèÊö: Ð´ÃüÁî×Ö
// ²ÎÊý: command  Ð´£º0101 ¶Á£º1001 µÇÂ¼£º0011 ±£»¤£º1100 ½ûÓÃ£º1010º
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Write_command(unsigned char command)
{
		unsigned char i;
		unsigned char mask = 0x08;

		for(i=0;i<4;i++)								
		{
				Write_bit(mask & command);				 
				mask >>= 1;
		}	
}

//========================================================================
// º¯Êý: void Write_Data(unsigned char dat)
// ÃèÊö: Ð´Êý¾Ý
// ²ÎÊý: dat Ð´ÈëµÄÖµ
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Write_Data(unsigned char dat)
{
		unsigned char i;			  		//1f 0001 1111 1
		unsigned char num = 0;
		unsigned char mask = 0x01;	

		for(i=0;i<8;i++)
		{
				Write_bit(mask & dat);
				mask <<= 1;	
		}
		for(i=0;i<8;i++)		  			//¼ÆËãÐ£ÑéÎ»
		{
				dat <<= 1;
				if(CY) num++;
		}
		if((num%2)==0)			  			//ÆæÊý¸ö1 
				Write_bit(0);		  			//·¢ËÍÐ£ÑéÎ»
		else
				Write_bit(1); 	
}

//========================================================================
// º¯Êý: void Write_JY(unsigned char dat) 
// ÃèÊö: Ð´ÁÐÐ£Ñé
// ²ÎÊý: dat Ð´ÈëµÄÖµ
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Write_JY(unsigned char dat)     
{
		unsigned char i;
		unsigned char mask = 0x01;

		for(i=0;i<8;i++)
		{
			Write_bit(mask & dat);
			mask <<= 1;	
		}		
}

//========================================================================
// º¯Êý: void Write_Address(unsigned char add)
// ÃèÊö: Ð´ÉÈÇøµØÖ·
// ²ÎÊý: add µØÖ·
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Write_Address(unsigned char add)
{
		unsigned char i;
		unsigned char dat;
		unsigned char mask = 0x01;	//0010 0000
		unsigned char num = 0;

		dat = add&0x0f;							//Çå¸ß4bit

		for(i=0;i<4;i++)
		{
				dat = dat>>1;
				if(CY) num++;						//¼ÆËã¼ìÑé
		}
		for(i=0;i<6;i++)						//·¢ËÍµØÖ·
		{
				Write_bit(mask & add);	
				mask <<= 1;	
		}														//·¢ËÍÐ£ÑéÖµ
		if(num%2==0)
				Write_bit(0);				
		else
				Write_bit(1);
}

//========================================================================
// º¯Êý: void Write_block(unsigned char dat0,unsigned char dat1,unsigned char dat2,unsigned char dat3,unsigned char block)
// ÃèÊö: ÉÈÇø¿éÐ´
// ²ÎÊý: Êý¾Ý£ºdat0£¬dat1£¬dat2£¬dat3£¬ ¿éµØÖ·£ºblock£¨0-15£©
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Write_block(unsigned char dat0,unsigned char dat1,unsigned char dat2,unsigned char dat3,unsigned char block)
{
    unsigned char i,j,k;
		unsigned char Buff_x[5];

		Buff_x[3] = dat0;
		Buff_x[2] = dat1;
		Buff_x[1] = dat2;
		Buff_x[0] = dat3;
	
		for(i=0;i<8;i++)
		{	
				j = 0; 
				Buff_x[4] = Buff_x[4]<<1;
				for(k=0;k<4;k++)						   				//¼ÆËãÁÐÐ£Ñé
				{
					switch(i)
					{
						case 0:	j=j ^ (Buff_x[k]&0x80);
								break;
						case 1:	j=j ^ (Buff_x[k]&0x40);
								break;
						case 2:	j=j ^ (Buff_x[k]&0x20);
								break;
						case 3:	j=j ^ (Buff_x[k]&0x10);
								break;
						case 4:	j=j ^ (Buff_x[k]&0x08);
								break;
						case 5:	j=j ^ (Buff_x[k]&0x04);
								break;
						case 6:	j=j ^ (Buff_x[k]&0x02);
								break;
						case 7:	j=j ^ (Buff_x[k]&0x01);
								break;																																								
					}
				}
				if(j!=0)
					Buff_x[4] = Buff_x[4]|0x01;			
		}	
		Write_star();		 	   			//Ð´ÆðÊ¼ÐÅºÅ

		Write_command(WriteCom); 	//·¢ËÍÐ´ÃüÁî  0101
		Write_Address(block);   	//·¢ËÍÐ´ÈëµÄµØÖ·

		for(i=0;i<4;i++)		    	//Ð´Êý¾Ý
				Write_Data(Buff_x[i]);
		Write_JY(Buff_x[4]);			//Ð´ÁÐÐ£Ñé
		Write_bit(0);         	 	//Ð´½áÊø·û¡°0¡±
}








