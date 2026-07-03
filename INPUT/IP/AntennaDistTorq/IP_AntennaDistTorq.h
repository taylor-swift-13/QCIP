#ifndef IP_ANTENNADISTTORQ_H
#define IP_ANTENNADISTTORQ_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef unsigned int        unint32;
typedef double              float64;
typedef long long           llong64;
typedef unsigned long long  ulong64;
typedef struct TAG_GNC_TIME
{
	llong64 tLong;                      /* 有符号长整型星时 us */
	llong64 tLongMs;                    /* 有符号长整型星时 ms */
	float64 tDbl;                       /* 双精度浮点星时   s */
//	unint32 tU32;                       /* 校时广播整秒 */

	ulong64 newCycle;                   /* 当前读到(或系统软件)的控制周期时钟计数器 无符号  */
	ulong64 oldCycle;                   /* 上周期保存的时钟计数器数 无符号  */

	unint32 ErrCnt;                     /* 星时计数器错误计数 */

	float64 prd;                        /* 控制周期 */

	unint32 cycle;                      /* 控制周期节拍 */

	unint32 reset;                      /* 上电第一拍 */

}GNC_TIME;
typedef struct TAG_ANTENNA_TORQ
{
    float64 ma1;
    float64 ma2;
    float64 ro1[3];
    float64 ro1c1[3];
    float64 Ja1[3][3];

    float64 ro1o2[3];
    float64 ro2c2[3];
    float64 Ja2[3][3];

}ANTENNA_TORQ;
typedef struct TAG_ANTENNA_CTRL
{
    unint32 Fi_AntennaCtlAllow;
    unint32 F_AntennaCtlPst;
    unint32 Fi_AntennaTrajectPlaning;

    float64 Aaf;
    float64 Aax;
    float64 Aac;
    float64 Aacpst;
    float64 Aacpst2;
    float64 Aafe;
    float64 Aace;
    float64 dAac;

    float64 Baf;
    float64 Bax;
    float64 Bac;
    float64 Bacpst;
    float64 Bacpst2;
    float64 Bafe;
    float64 Bace;
    float64 dBac;

    float64 wDTa;
    float64 wDTb;
	float64 dwDTa;
	float64 dwDTb;

    float64 HsigmaDtpat[3];

    float64 TDT[3];

    float64 aLimAntanna;
    float64 bLimAntanna;
    float64 aLimAntanna2;
    float64 aLimAntanna3;
    float64 aLimAntanna4;
    float64 aLimAntanna5;
    float64 FilterAntenna;
    float64 daLimAntanna;

    float64 Aa0;
    float64 Ba0;

    float64 CAntenna[3][3];
    float64 Cbitemp[3][3];
   	float64 eSGa[3];

    float64 kDT0;
    float64 kDT1;
    float64 kDT2;

    float64 wDTlim;
    float64 dwDTlim;

    unint32 comCnt;
    unint32 attSrc;

    unint32 Fi_AntennaTorCompensate;

    unint32 CtrlAllowTM;
    
}ANTENNA_CTRL;

/* --- 全局变量定义 --- */
GNC_TIME sTime;
ANTENNA_TORQ sAntennaPara = 
{
    2.16,                    /* ma1 */
    4.72,                    /* ma2 */
  { 1.311, -0.032, -1.610 },      /* ro1[3]  */
  { 0.27*0.001, 31.5*0.001, 121.7*0.001 },        /* ro1c1[3]  */

  {  /* Ja1[3][3]; */
    { 0.00605, 0.0,     0.0     },
    { 0.0,     0.00864, 0.0     },
    { 0.0,     0.0,     0.00938 }
  },
   
  { 0.0, 0.0, 0.145 },   /* ro1o2[3] 0.00325-0.03075 -0.035+0.0265  0.361283-0.159283 */
  { 0.00024, 0.03160, 0.11970 },   /* ro2c2[3]; */
  
  {  /* Ja2[3][3]; */
    { 0.179,  0.0,    0.0  },
    { 0.0,    0.194,  0.0  },
    { 0.0,    0.0,    0.32 }
  }
};
ANTENNA_CTRL sAntennaCtrl;

/* --- 函数原型 --- */
void AntennaDistTorq( void );

#endif // IP_ANTENNADISTTORQ_H