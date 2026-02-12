#ifndef __EMReadWriteCard_H_
#define __EMReadWriteCard_H_
#include"STC8F.h"
#include"IntPut_IO.h"
#include"EM41xx.h"

extern bit reag_Ok;
extern bit RFPLL;
extern unsigned char EM_Buff[10];
extern void Delay_8nus(unsigned int n);
extern void Write_block(unsigned char dat0,unsigned char dat1,unsigned char dat2,unsigned char dat3,unsigned char block);

#endif