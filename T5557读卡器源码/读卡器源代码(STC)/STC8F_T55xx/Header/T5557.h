#ifndef __T5557_H_
#define __T5557_H_

#define E5557_Config  0x00148040 //5557配置字
#define E5557_Default 0x000880E8 //5557缺省配置字

extern unsigned char idata T57_Buff[28];
extern void DelayNus(unsigned int us);	 //@24MHz
extern unsigned char T5557ReadPage(unsigned char page,unsigned char nRF);
extern void T5557Write_Block(unsigned char _page,   //页 0/1
														 unsigned char _block,					//块地址
														 unsigned char _codeEnDisble, 	//正常写 0/保护写1
														 unsigned long Passwrod,				//密码数据
														 unsigned long Bankdata,				//块数据
														 unsigned char  BankLock);			//块锁
extern unsigned char T5557Read_Block(unsigned char _page,   //页 0/1
															unsigned char _block,					//块地址
															unsigned char _codeEnDisble, 	//正常写 0/保护写1
															unsigned long Passwrod,				//密码数据
															unsigned char nRF);						//速率															 
extern void Write_Aor(unsigned long W_data);	
															
#endif
															