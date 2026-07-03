#ifndef IP_STSCMDPACK_H
#define IP_STSCMDPACK_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef unsigned char       unint08;
typedef int                 siint32;
typedef unsigned int        unint32;
typedef long long           llong64;
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
STS_OBJ sSTSObj[3];

/* --- 函数原型 --- */
unint32 STSCmdPack( unint32 devNO, unint32 cmdID );

#endif // IP_STSCMDPACK_H