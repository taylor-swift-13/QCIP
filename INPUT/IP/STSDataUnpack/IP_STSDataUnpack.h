#ifndef IP_STSDATAUNPACK_H
#define IP_STSDATAUNPACK_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef unsigned char       unint08;
typedef unsigned short      unint16;
typedef int                 siint32;
typedef unsigned int        unint32;
typedef float               float32;
typedef double              float64;
typedef long long           llong64;
typedef unsigned long long  ulong64;
typedef struct TAG_SYNC_TIME
{
	llong64 tLong;
    unint32 cycle;
	unint32 update;

}SYNC_TIME;
typedef union TAG_TYPECONVER_32BIT                /* 32位联合                 */
{
    unint08 ui08[4];                              /*  8位无符号整型           */
    unint16 ui16[2];                              /* 16位无符号整型           */
    unint32 ui32;                                 /* 32位无符号整型           */
    siint32 si32;                                 /* 32位有符号整型           */
    float32 fl32;                                 /* 32位浮点型               */
} UTYPECONVER32;
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
typedef struct TAG_SDEV_STATE
{
	unint32 devID;                 /* �豸ID */
	unint32 ioNO;                  /* �豸�ӿ�ͨ���� */

    unint08 * rdBuf;               /* ���ݶ����������� */
    unint08 * wrBuf;               /* ����д���������� */

	unint32 power;                 /* �ӵ�״̬ */
	unint32 online;                /* ����״̬ */
	unint32 health;                /* ����״̬ */

	unint32 comN1;                 /* ͨѶʧ��ʱ���о�N1 */
	unint32 comN2;                 /* ͨѶʧ��ʱ���о�N2 */

    unint32 comFlag;               /* ͨ�ųɹ���־ */
    unint32 comErrCnt;             /* ͨ��ʧ�ܼ������ۼƣ� */

    unint32 comFailCnt;            /* ͨ��ʧ�ܼ����������� */
    unint32 comOKCnt;              /* ͨ�ųɹ������������� */

    unint32 autoRstByCmd;   
    unint32 autoRst;   
	unint32 rstCnt;

    unint32 (*fRead)( unint32 no );    /* ���ݶ��������  */
    unint32 (*fWrite)( unint32 no );   /* ����д�������  */
	void (*fOnOffEntry)( unint32 no, unint32 act );    /* �ӵ�/�ϵ������� */

/*     void (*selfDiag)( void );       ����������Ϲ������ */

}SDEV_STATE;
typedef struct TAG_STS_OBJ
{
    SDEV_STATE dev;

	unint08 sndBuf[128];
	unint08 rcvBuf[150];
    unint08 testBuf[128];

    unint32 rtsBit;

    unint32 pkDown;      /* 下传包类型 */

    unint32 ADBValid;
    siint32 qINT[4];
    unint32 SYNCCnt;
    siint32 OffSet;
    unint32 mode;

    unint32 testCmd;
    unint32 HK1Down;

    llong64 attTimeL;
    llong64 attTimeMS;
	
}STS_OBJ;

/* --- 全局变量定义 --- */
SYNC_TIME sSyncTime;
GNC_TIME sTime;
STS_OBJ sSTSObj[3];

/* --- 函数原型 --- */
void STSDataUnpack( unint32 devNO, unint08 * pSrc );

#endif // IP_STSDATAUNPACK_H