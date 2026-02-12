#ifndef __IntPut_IO_H_
#define __IntPut_IO_H_
#include<intrins.h>
#define FOSC 24000000L					//系统时钟
#define BAUD 9600								//波特率
#define BRT (65536-FOSC/BAUD/4)

sbit KEY0      = P1^0; 
sbit LED       = P1^2;
sbit LED1      = P1^3;
sbit I2C_SDA   = P1^4;
sbit I2C_SCL   = P1^5;
sbit BP        = P1^6;

sbit INPORT		 = P3^2;
sbit T1CLK     = P3^4;

#endif

