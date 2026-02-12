#include"STC8F.h"
#include"IntPut_IO.h"

bit flagOnceTxd = 0;  					//µ¥´Î·¢ËÍÍê³É±êÖ¾,¼´·¢ËÍÍêÒ»¸ö×Ö½Ú
bit cmdArrived = 0;   					//ÃüÁîµ½´ï±êÖ¾,¼´½ÓÊÕµ½Êı¾İ
unsigned char cntRxd = 0;
unsigned char xdata bufRxd[80];   	  //½ÓÊÕ»º³åÇø

void UartInit(void)
{
    SCON = 0x50;
    T2L = BRT;
    T2H = BRT >> 8;
    AUXR = 0x15;
	  ES = 1;					//¿ª´®¿ÚÖĞ¶Ï
		EA = 1;         //¿ª×ÜÖĞ¶Ï
}

//========================================================================
// º¯Êı: unsigned char Uart1Read(unsigned char *buf, unsigned char len)
// ÃèÊö: Uart¶Á
// ²ÎÊı: *buf: ·¢ËÍµÄÊı¾İ ,len:³¤¶È
// ·µ»Ø: ³¤¶È
// °æ±¾: V1.0, 2017-9-23
//========================================================================

unsigned char UartRead(unsigned char *buf, unsigned char len) 
{
    unsigned char i;
    
    if (len > cntRxd) 			//¶ÁÈ¡³¤¶È´óÓÚ½ÓÊÕÊı¾İ³¤¶È
    {
        len = cntRxd; 			//¶ÁÈ¡³¤¶ÈÉèÖÃÎªÊµ¼Ê½ÓÊÕµ½µÄÊı¾İ³¤¶È
    }
    for (i=0; i<len; i++) 	//¿½±´½ÓÊÕµ½µÄÊı¾İ
    {
        *buf = bufRxd[i];
        buf++;
    }
    cntRxd = 0;  						//Çå0½ÓÊÕ¼ÆÊıÆ÷
    
    return len;  						//·µ»ØÊµ¼Ê¶ÁÈ¡µÄ³¤¶È
}

//========================================================================
// º¯Êı: void UartWrite(unsigned char *buf, unsigned char len)
// ÃèÊö: UartĞ´
// ²ÎÊı: *buf: Êı¾İ ,len:³¤¶È
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void UartWrite(unsigned char *buf, unsigned char len) 
{
	
    while (len--)   				//·¢ËÍÊı¾İ
    {
        flagOnceTxd = 0;
        SBUF = *buf;
        buf++;
        while(!flagOnceTxd);
    }
}

//========================================================================
// º¯Êı: void Uart1RxMonitor(unsigned char ms)
// ÃèÊö: Uart½ÓÊÕÊı¾İ¼à¿Øº¯Êı
// ²ÎÊı: ms:³¬Ê±Ê±¼ä
// ·µ»Ø: 
// °æ±¾: V1.0, 2017-9-23
//========================================================================
void Uart1RxMonitor(unsigned char ms)  
{
    static unsigned char cntbkp = 0;
    static unsigned char idletmr = 0;

    if (cntRxd > 0)  									//½ÓÊÕ¼ÆÊıÆ÷´óÓÚ0Ê±£¬¼à¿Ø×ÜÏß¿ÕÏĞÊ±¼äÕ
    {
        if (cntbkp != cntRxd)  				//½ÓÊÕ¼ÆÊıÆ÷·¢Éú¸Ä±ä£¬¼´½ÓÊÕµ½Êı¾İ£¬Çå0¿ÕÏĞ¼ÆÊ±
        {
            cntbkp = cntRxd;
            idletmr = 0;
        }
        else
        {
            if(idletmr < 5)  		    //½ÓÊÕ¼ÆÊıÆ÷Î´¸Ä±ä£¬¼´×ÜÏß¿ÕÏĞ£¬ÀÛ¼Æ¿ÕÏĞÊ±¼ä
            {
                idletmr += ms;
                if (idletmr >= 5)     //¿ÕÏĞÊ±¼ä³¬Ê±5ms
                {
                    cmdArrived = 1;   //½ÓÊÕÊı¾İ½áÊø
                }
            }
        }
    }
    else
    {
        cntbkp = 0;
    }
}

void Uart() interrupt 4 using 3
{
		if(RI)
		{
				RI = 0;
			  if (cntRxd < sizeof(bufRxd))    	//½ÓÊÕ»º³åÇøÃ»ÓĞÓÃÍê
				{
						bufRxd[cntRxd++] = SBUF;   		//±£´æ½ÓÊÕµ½Êı¾İ£¬²¢µİÔö¼ÆÊıÆ÷
				}
		}
    if (TI)
    {
        TI = 0;                 					
				flagOnceTxd = 1;  						 		//µ¥´Î·¢ËÍÍê³É
    }		
}