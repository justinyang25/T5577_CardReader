#ifndef __EM41xx_H_
#define __EM41xx_H_
#include"STC8F.h"
#include"IntPut_IO.h"

#define	Carrier_On()	{TR1 = 1;INTCLKO = 0x02;}
#define	Carrier_Off()	{TR1 = 0;INTCLKO = 0x00;T1CLK = 0;}

#define	RF64_Min (100*(FOSC/1000))/12/1000    //100us
#define	RF64_Mid (350*(FOSC/1000))/12/1000    //350us
#define	RF64_Max (650*(FOSC/1000))/12/1000    //650us

#define	RF32_Min (50*(FOSC/1000))/12/1000     //50us
#define	RF32_Mid (200*(FOSC/1000))/12/1000    //200us
#define	RF32_Max (380*(FOSC/1000))/12/1000    //350us¡

extern unsigned int TIME00;		//Âö¿í×îĞ¡Ê±¼ä	  
extern unsigned int TIME05;		//°ë¸öÖÜÆÚÊ±¼äÉÏÏŞ
extern unsigned int TIME10;		//Ò»¸öÖÜÆÚÊ±¼äÉÏÏŞ	
extern bit bitin;
extern unsigned char Buff[11];
extern unsigned char ID[5];
extern void T1Clk_Out(unsigned char Pll);
extern void RFID_Timer0InIt(void);
extern unsigned char readdata(void);
extern bit ReadEM41xxCardNo(void);

#endif