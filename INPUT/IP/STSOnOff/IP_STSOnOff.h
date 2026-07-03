#ifndef IP_STSONOFF_H
#define IP_STSONOFF_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef unsigned char       unint08;
typedef unsigned int        unint32;
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
typedef struct TAG_ICU_OBJ
{
    SDEV_STATE dev;

	unint08 sndBuf[ICU_SND_LEN];
	unint08 rcvBuf[ICU_RCV_LEN];

    unint08 cmdBuf[ICU_SND_LEN];

}ICU_OBJ;

/* --- 全局变量定义 --- */
ICU_OBJ sICUObj[2];

/* --- 函数原型 --- */
void STSOnOff( unint32 devNO, unint32 act );

#endif // IP_STSONOFF_H