#include"STC8F.h"
#include"IntPut_IO.h"
#include"Uart.h"
#include"EM41xx.h"
#include"EMReadWriteCard.h"
#include"CopyEM4100.h"
#include"CRC16.h"
#include"T5557.h"

bit LED_flag = 0;
unsigned int  Time_Up = 0;
unsigned int  EM_Wait = 0;

void Delay125us(void)			//@24.000MHz
{
		unsigned char i, j;
	
		_nop_();
		_nop_();
		i = 4;
		j = 128;
		do
		{
				while (--j);
		}while (--i);
}
void Delay100ms(void)		 //@22.1184MHz
{
		unsigned char i, j, k;

		i = 12;
		j = 57;
		k = 122;
		do
		{
				do
				{
						while (--k);
				}while (--j);
		}while (--i);
}
//========================================================================
// º¯Êý: void BP_BP(unsigned char Counter,bit Mode)	
// ÃèÊö: ·äÃùÆ÷º¯Êý
// ²ÎÊý: Counter£º ´ÎÊý   Mode£º1³¤Ïì 0¶ÌÏìº
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void BP_BP(unsigned char Counter,bit Mode)	
{
		unsigned char x;
	  unsigned int y,CheckCount = 0;
	
	  CheckCount = 200;
		if(Mode)  CheckCount = 1000;
	
    EA = 0;
	  for(x = 0;x < Counter;x ++)
	  {
				for(y = 0;y < CheckCount;y ++)
			  {
						BP = !BP;
						Delay125us();
				}
				BP = 0;
				if(x == (Counter - 1))  break;
				Delay100ms();
		}
		EA = 1;	
}

void Timer3InIt(void)		 //¶¨Ê±1ms
{  
    T3L = 0x30;          //65536-11.0592M/12/1000
    T3H = 0xF8;
    T4T3M = 0x08;        //Æô¶¯¶¨Ê±Æ÷ 12TÄ£Ê½
    IE2 = ET3;           //Ê¹ÄÜ¶¨Ê±Æ÷ÖÐ¶Ï
}
void SYS_InIt(void)
{
		BP = 0;
		LED = 0;
	  LED1 = 1;
	  T1CLK = 0;
	  INPORT = 1;
	
		P1M0 = 0x4C; 			     //0100 1100
		P1M1 = 0x00; 	
		P3M0 = 0x12; 			     //0001 0010
		P3M1 = 0x00; 	         //0000 0000
	
		UartInit();	
	  Timer3InIt();
	  T1Clk_Out(125);				 //Ê±ÖÓÊä³ö125K
	  RFID_Timer0InIt();     //¶¨Ê±Æ÷0³õÊ¼»¯£¬ÓÃÓÚRFID½ÅµçÆ½¼ÆÊý
	  Carrier_Off();
	  BP_BP(1,0);
}

void UartDriver(void)			 //´®¿Ú½ÓÊÕÊý¾Ý´¦Àí
{
	  union 
		{
				unsigned int  _uint;					
				unsigned char B[2];
		}xdata CRC16_Base;	
		
	  union 
		{
				unsigned long uL;					
				unsigned char B[4];
		}PassData;
		
	  union 
		{
				unsigned long uL;					
				unsigned char B[4];
		}BankData;		
		
	  unsigned char i,j; 
	  unsigned char Uart_Len;
	  unsigned char xdata Uart_Buff[60];
		unsigned char xdata ListEM4100UID[5];
	  unsigned char Read_PLL = 0;
		unsigned char UserPassFlag = 0;
		unsigned char	BankLock = 0;
		unsigned char	BankLock_bit = 0;
		
		if(cmdArrived)	
		{
				cmdArrived = 0;
			  Uart_Len = UartRead(Uart_Buff, sizeof(Uart_Buff)); 	//½«½ÓÊÕµ½Êý¾Ý¶ÁÈ¡µ½»º´æ
				if((Uart_Buff[0] == 0xAA) && (Uart_Buff[Uart_Len - 1] == 0xEE))	//ºÏ¸ñµÄÊý¾ÝÍ·ºÍÎ²
				{
						CRC16_Base._uint = GetCRC16(Uart_Buff, Uart_Len - 3);  
					  if((Uart_Buff[Uart_Len - 2] == CRC16_Base.B[0]) && (Uart_Buff[Uart_Len - 3] == CRC16_Base.B[1])) //CRC16Ð£ÑéÕýÈ·
						{
								LED = 1;
								if((Uart_Buff[1] == 0xFF) && (Uart_Buff[2] == 0xFF))	 //Áª»ú
								{
										LED_flag = 1;
										BP_BP(1,0);
								}
								else
								{
										switch(Uart_Buff[1])
										{
												case 0xF0:						//¶Á
																	Read_PLL = Uart_Buff[2];  		//¶Á¿¨ËÙÂÊ
																	UserPassFlag = Uart_Buff[4];	//ÊÇ·ñ±£»¤¶Á 0 Õý³£ 1±£»¤
																	for(i = 0; i < 4; i ++)  PassData.B[i] = Uart_Buff[i + 5];	//ÃÜÂë
																	if(Uart_Buff[3] & 0x10)		//µÚ1Ò³
																	{   
																			Uart_Buff[1] = 0xF0;	//·µ»Ø¶ÁµÚÒ»Ò³±ê¼Ç 0xF0
																		  Uart_Buff[2] = 0;
																			Uart_Len = 4;																		
																			switch(Uart_Buff[3])
																			{
																					case 0x12:				//¿é1
																										Uart_Buff[2] = T5557Read_Block(1,1,UserPassFlag,PassData.uL,Read_PLL);
																										if(Uart_Buff[2])
																										{
																												for(i = 0; i < 4; i ++)  Uart_Buff[Uart_Len ++] = T57_Buff[i];
																												BP_BP(1,0);
																										}
																										else
																										{
																												for(i = 0; i < 4; i ++)  Uart_Buff[Uart_Len ++] = 0;
																												BP_BP(2,0);																												
																										}
																									break;
																					case 0x14:				//¿é2
																										Uart_Buff[2] = T5557Read_Block(1,2,UserPassFlag,PassData.uL,Read_PLL);
																										if(Uart_Buff[2])
																										{
																												for(i = 0; i < 4; i ++)  Uart_Buff[Uart_Len ++] = T57_Buff[i];
																												BP_BP(1,0);
																										}
																										else
																										{
																												for(i = 0; i < 4; i ++)  Uart_Buff[Uart_Len ++] = 0;
																												BP_BP(2,0);																												
																										}																					
																									break;	
																					case 0x16:        //µÚ1Ò³ ËùÓÐ¿é
																										Uart_Buff[2] = T5557ReadPage(1,Read_PLL);
																										if(Uart_Buff[2])
																										{
																												for(i = 0; i < 8; i ++)  Uart_Buff[Uart_Len ++] = T57_Buff[i];
																												BP_BP(1,0);
																										}
																										else
																										{
																												for(i = 0; i < 8; i ++)  Uart_Buff[Uart_Len ++] = 0;
																												BP_BP(2,0);																												
																										}																						
																									break;																									
																			}
																			CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																			Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																			Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																			Uart_Buff[Uart_Len ++] = 0xEE;
																			UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý		
																	}
																	else			 //µÚ0Ò³
																	{
																			Uart_Buff[1] = 0xF0;	//·µ»Ø¶ÁµÚÒ»Ò³±ê¼Ç 0xF0
																		  Uart_Buff[2] = 0;
																			Uart_Buff[3] = Uart_Buff[3] & 0x0F;
																				
																		  if(Uart_Buff[3] == 0x0F) //¶ÁËùÓÐ¿é
																			{
																					if(UserPassFlag) 	   //±£»¤¶Á
																					{
																							for(i = 1; i < 7; i ++)  //¶Á1 - 6¿é
																							{
																									Uart_Len = 4;
																									Uart_Buff[2] = T5557Read_Block(0,i,UserPassFlag,PassData.uL,Read_PLL);	
																									if(Uart_Buff[2])
																									{
																											for(j = 0; j < 4; j ++)  Uart_Buff[Uart_Len ++] = T57_Buff[j];
																											BP_BP(1,0);																											
																									}
																									else
																									{
																											for(j = 0; j < 4; j ++)  Uart_Buff[Uart_Len ++] = 0;
																											BP_BP(2,0);																										
																									}
																									Uart_Buff[3] = i;   //µØÖ·
																									CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																									Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																									Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																									Uart_Buff[Uart_Len ++] = 0xEE;
																									UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý		
																									for(j = 0; j < 4; j ++) DelayNus(50000);	
																							}
																					}
																					else							//Õý³£¶Á
																					{
																							Uart_Buff[2] = T5557ReadPage(0,Read_PLL);    //¶Á0Ò³
																						  Uart_Len = 4;
																							if(Uart_Buff[2])
																							{
																									for(i = 0; i < 28; i ++)  Uart_Buff[Uart_Len ++] = T57_Buff[i];
																									BP_BP(1,0);
																							}
																							else
																							{
																									for(i = 0; i < 28; i ++)  Uart_Buff[Uart_Len ++] = 0;
																									BP_BP(2,0);																												
																							}	
																							CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																							Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																							Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																							Uart_Buff[Uart_Len ++] = 0xEE;
																							UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý		
																					}
																			}
																			else			//¿é¶Á
																			{	
																					Uart_Len = 4;
																					Uart_Buff[2] = T5557Read_Block(0,Uart_Buff[3],UserPassFlag,PassData.uL,Read_PLL);
																					if(Uart_Buff[2])
																					{
																							for(i = 0; i < 4; i ++)  Uart_Buff[Uart_Len ++] = T57_Buff[i];
																							BP_BP(1,0);
																					}
																					else
																					{
																							for(i = 0; i < 4; i ++)  Uart_Buff[Uart_Len ++] = 0;
																							BP_BP(2,0);																												
																					}	
																					CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																					Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																					Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																					Uart_Buff[Uart_Len ++] = 0xEE;
																					UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý		
																			}
																	}
																	break;
												case 0xF1:						//Ð´
																	Read_PLL = Uart_Buff[2];  		//¶Á¿¨ËÙÂÊ
																	for(i = 0; i < 4; i ++)  PassData.B[i]  = Uart_Buff[i + 6];	//ÃÜÂë
																	BankLock = Uart_Buff[4];      //¿éËø
																	UserPassFlag = Uart_Buff[5];	//ÊÇ·ñ±£»¤Ð´ 0 Õý³£ 1±£»¤
																	
																	if(Uart_Buff[3] & 0x10)				//µÚ1Ò³
																	{
																			switch(Uart_Buff[3])
																			{	
																					case 0x12:for(j = 0; j < 4; j ++)  BankData.B[j] = Uart_Buff[10 + j];	   //Êý¾Ý
                                                    T5557Write_Block(1,1,UserPassFlag,PassData.uL,BankData.uL,BankLock_bit);
                                                    Uart_Buff[2] = T5557Read_Block(1,1,UserPassFlag,PassData.uL,Read_PLL);   //¶Á³öÊý¾Ý
                                                    if(Uart_Buff[2])
                                                    {
                                                        if((T57_Buff[0] == BankData.B[0]) && 
																													 (T57_Buff[1] == BankData.B[1]) && 
																													 (T57_Buff[2] == BankData.B[2]) && 
																													 (T57_Buff[3] == BankData.B[3])) 
                                                        {
                                                             BP_BP(1,0);   
                                                        }
                                                        else
                                                        {
                                                             Uart_Buff[2] = 0;
                                                             BP_BP(2,0);  
                                                        }
                                                    }
                                                    else
                                                    {
                                                        BP_BP(2,0); 
                                                    }
																										Uart_Len = 4;
																										CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																										Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																										Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																										Uart_Buff[Uart_Len ++] = 0xEE;
																										UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý	
																										break;
																					case 0x14:for(j = 0; j < 4; j ++)  BankData.B[j] = Uart_Buff[10 + j];	   //Êý¾Ý
                                                    T5557Write_Block(1,2,UserPassFlag,PassData.uL,BankData.uL,BankLock_bit);
                                                    Uart_Buff[2] = T5557Read_Block(1,2,UserPassFlag,PassData.uL,Read_PLL);   //¶Á³öÊý¾Ý
                                                    if(Uart_Buff[2])
                                                    {
                                                        if((T57_Buff[0] == BankData.B[0]) && 
																													 (T57_Buff[1] == BankData.B[1]) && 
																													 (T57_Buff[2] == BankData.B[2]) && 
																													 (T57_Buff[3] == BankData.B[3])) 
                                                        {
                                                             BP_BP(1,0);   
                                                        }
                                                        else
                                                        {
                                                             Uart_Buff[2] = 0;
                                                             BP_BP(2,0);  
                                                        }
                                                    }
                                                    else
                                                    {
                                                        BP_BP(2,0); 
                                                    }
																										Uart_Len = 4;
																										CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																										Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																										Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																										Uart_Buff[Uart_Len ++] = 0xEE;
																										UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý	
																										break;
																					case 0x16:BankLock = BankLock >> 1;
																										for(i = 1; i < 3; i ++)       	//Ð´1 - 2¿é
																										{
																												BankLock_bit = BankLock & 0x01;
																												for(j = 0; j < 4; j ++)  BankData.B[j] = Uart_Buff[(i - 1) * 4 + 10 + j];	//Êý¾Ý
																												T5557Write_Block(1,i,UserPassFlag,PassData.uL,BankData.uL,BankLock_bit);	
																												BankLock = BankLock >> 1;	
																												Uart_Buff[2] = T5557Read_Block(1,i,UserPassFlag,PassData.uL,Read_PLL);    //¶Á³öÊý¾Ý
																												Uart_Buff[3] = 0x10 | (1 << i);  //µØÖ· µÚÒ»Ò³µÄµØÖ·
																												Uart_Len = 4;
																												if(Uart_Buff[2])
																												{
																														if((T57_Buff[0] == BankData.B[0]) && 
																															 (T57_Buff[1] == BankData.B[1]) && 
																															 (T57_Buff[2] == BankData.B[2]) && 
																															 (T57_Buff[3] == BankData.B[3])) 
																															 {
																																	BP_BP(1,0);   
																															 }
																															 else
																															 {
																																	Uart_Buff[2] = 0;
																																	BP_BP(2,0);
																															 }
																												}
																												else
																												{
																														BP_BP(2,0);
																												}
																												CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																												Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																												Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																												Uart_Buff[Uart_Len ++] = 0xEE;
																												UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý		
																												for(j = 0; j < 4; j ++) DelayNus(50000);	
																										}
																										break;																					
																			}
																	}
																	else
																	{
																			Uart_Buff[3] = Uart_Buff[3] & 0x0F;  //µØÖ·
																			if(Uart_Buff[3] == 0x0F)			//Ð´0Ò³ 1 - 7
																			{
																					BankLock = BankLock >> 1;
																					for(i = 1; i < 8; i ++)   //Ö»Ð´1 - 7¿é
																					{
																							if((UserPassFlag) && (i == 7))  break; //±£»¤Ð´ Ö»Ð´1 - 6¿é
																						
																							BankLock_bit = BankLock & 0x01;
																							for(j = 0; j < 4; j ++)  BankData.B[j] = Uart_Buff[(i - 1) * 4 + 10 + j];	//Êý¾Ý
																							T5557Write_Block(0,i,UserPassFlag,PassData.uL,BankData.uL,BankLock_bit);	
																							BankLock = BankLock >> 1;		
																							Uart_Buff[2] = T5557Read_Block(0,i,UserPassFlag,PassData.uL,Read_PLL);
																							Uart_Buff[3] = i;  //µØÖ·
																							Uart_Len = 4;
																							if(Uart_Buff[2])
																							{
																									 if((T57_Buff[0] == BankData.B[0]) && 
																											(T57_Buff[1] == BankData.B[1]) && 
																											(T57_Buff[2] == BankData.B[2]) && 
																											(T57_Buff[3] == BankData.B[3])) 
																									 {
																												BP_BP(1,0);   
																									 }
																									 else
																									 {
																												Uart_Buff[2] = 0;
																												BP_BP(2,0);
																									 }
																							}
																							else
																							{
																									 BP_BP(2,0);
																							}
																							CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																							Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																							Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																							Uart_Buff[Uart_Len ++] = 0xEE;
																							UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý		
																							for(j = 0; j < 4; j ++) DelayNus(50000);	
																					}
																			}
																			else		//¿éÐ´
																			{
																					for(i = 0; i < 4; i ++)  BankData.B[i] = Uart_Buff[i + 10];	//Êý¾Ý
																					T5557Write_Block(0,Uart_Buff[3],UserPassFlag,PassData.uL,BankData.uL,BankLock);		
																					if((UserPassFlag) && Uart_Buff[3] == 0x07)  //ÕâÀïµÄÐ´µÄÐÞ¸ÄÃÜÂë ÏÈÔ­ÃÜÂëÐ´£¬ÔÙÓÃÐÂÃÜÂë¶Á
																					{
																							Uart_Buff[2] = T5557Read_Block(0,Uart_Buff[3],UserPassFlag,BankData.uL,Read_PLL); //ÐÂÃÜÂëÎªÐ´ÈëµÄÊý¾Ý
																					}
																					else
																					{
																							if(Uart_Buff[3] == 0)         //Ð´ÅäÖÃ¿é 
																							{
																									if(BankData.B[3] & 0x10)  //ÃÜÂë±»Ê¹ÄÜ
																									{	
																											Uart_Buff[2] = T5557Read_Block(0,Uart_Buff[3],1,PassData.uL,Read_PLL);  //ÓÃ±£»¤¶Á
																									}		
																									else
																									{
																											Uart_Buff[2] = T5557Read_Block(0,Uart_Buff[3],0,PassData.uL,Read_PLL);  //Õý³£¶Á
																									}
																							}
																							else
																							{
																									Uart_Buff[2] = T5557Read_Block(0,Uart_Buff[3],UserPassFlag,PassData.uL,Read_PLL);
																							}																					
																					}
																					Uart_Len = 4;
																					if(Uart_Buff[2])
																					{
																							if((T57_Buff[0] == BankData.B[0]) &&  //¶Ô¶Á³öµÄÊý¾ÝÑéÖ¤
																								 (T57_Buff[1] == BankData.B[1]) && 
																								 (T57_Buff[2] == BankData.B[2]) && 
																								 (T57_Buff[3] == BankData.B[3])) 
																							{
																									BP_BP(1,0);
																							}
																							else
																							{
																									Uart_Buff[2] = 0;
																									BP_BP(2,0);
																							}
																					}
																					else
																					{
																							BP_BP(2,0);
																					}	
																					CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																					Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																					Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																					Uart_Buff[Uart_Len ++] = 0xEE;
																					UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý		
																			}
																	}		
																	break;		
												case 0xF2:						//»½ÐÑ
																	for(i = 0; i < 4; i ++)  PassData.B[i]  = Uart_Buff[i + 2];	//ÃÜÂë
																	Write_Aor(PassData.uL);		//AOR»½ÐÑ
																	BP_BP(1,0);
																	break;		
												case 0xF3:						//¶ÁEM4100
																	Carrier_On();	 				//´ò¿ª´Å³¡	
																	EM_Wait = 1000;
																	Uart_Buff[1] = 0xF3;
																	Uart_Buff[2] = 0;
																	Uart_Len = 3;	
																	while(EM_Wait > 0)
																	{
																			if(ReadEM41xxCardNo())
																			{
																					Uart_Buff[2] = 1;
																				  BP_BP(1,0);
																				  for(i = 0; i < 5; i ++) Uart_Buff[Uart_Len ++] = ID[i];
																				  break;
																			}
																	}
																	if(Uart_Buff[2] == 0)
																	{
																			BP_BP(2,0);
																			for(i = 0; i < 5; i ++) Uart_Buff[Uart_Len ++] = 0;																			
																	}
																	CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																	Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																	Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																	Uart_Buff[Uart_Len ++] = 0xEE;
																	UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý			
																	Carrier_Off();
																	break;		
												case 0xF4:						//¸´ÖÆEM4100
																	for(i = 0; i < 5; i ++)
																	{
																			Buff[i] = Uart_Buff[3 + i];
																			ListEM4100UID[i] = Buff[i];
																	}
																	switch(Uart_Buff[2])
																	{
																			case 0:         //»ù¿¨ÊÇ57¿¨
																							T5557CopyEM4100(Buff);
																						break;
																			case 1:         //»ù¿¨ÊÇ57¿¨
																							EM4305CopyEM4100(Buff);
																						break;
																	}
																	Carrier_Off();	
																	DelayNus(50000);	
																	Carrier_On();	 				//´ò¿ª´Å³¡	
																	EM_Wait = 1000;
																	Uart_Buff[1] = 0xF4;
																	Uart_Buff[2] = 0;
																	Uart_Len = 3;	
																	while(EM_Wait > 0)
																	{
																			if(ReadEM41xxCardNo())   //¶Á³öÀ´±È½Ï
																			{
																					for(i = 0; i < 5; i ++)
																				  {
																							if(ID[i] != ListEM4100UID[i])  break;
																					}
																					if(i == 5)
																					{
																							Uart_Buff[2] = 1;
																							BP_BP(1,0);
																							for(i = 0; i < 5; i ++) Uart_Buff[Uart_Len ++] = ID[i];
																					}
																				  break;
																			}
																	}
																	if(Uart_Buff[2] == 0)        //´íÎó
																	{
																			BP_BP(2,0);
																			for(i = 0; i < 5; i ++) Uart_Buff[Uart_Len ++] = 0;																			
																	}
																	CRC16_Base._uint = GetCRC16(Uart_Buff,Uart_Len); 	
																	Uart_Buff[Uart_Len ++] = CRC16_Base.B[0];
																	Uart_Buff[Uart_Len ++] = CRC16_Base.B[1];
																	Uart_Buff[Uart_Len ++] = 0xEE;
																	UartWrite(Uart_Buff,Uart_Len);	 //·µ»ØÊý¾Ý			
																	Carrier_Off();																	
																	break;														
										}
								}
								LED = 0;
						}
				}	 
		}
}
void main(void)
{
		SYS_InIt();
	
	  while(1)
		{
			  UartDriver();								//´®¿Ú½ÓÊÕÊý¾Ý½âÎö
		}
}

void TM3_Isr() interrupt 19 using 1
{
		AUXINTIF &= ~0x02;              //Çå³ýÖÐ¶Ï±êÖ¾
	
	  Uart1RxMonitor(1);
	
	  if(LED_flag) Time_Up ++;
	  if(Time_Up >= 500)
		{
				Time_Up = 0;
			  LED1 = ~LED1;					
		}
		if(EM_Wait > 0) EM_Wait --;
}
