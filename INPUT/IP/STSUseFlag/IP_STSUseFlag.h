#ifndef IP_STSUSEFLAG_H
#define IP_STSUSEFLAG_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef unsigned char       unint08;
typedef short               siint16;
typedef unsigned int        unint32;
typedef double              float64;
typedef long long           llong64;
typedef struct TAG_STSMODIFY_FILTER_PARAM2
{
    float64 KS[6][4];			/* �˲�ϵ�� */
} sSTSModifyFP2;
typedef struct TAG_BUS_STSOBJ
{
    unint32 rcvFlg;      /* 接收完成标志 */
    unint32 tmrSych;     /* 三机比对完成标志 */
    unint32 update;      /* 数据更新有效标志 */
    unint32 frmCnt;      /* 帧计数 */
    unint08 rcvBuf[64];
    
    siint16 qINT[3][4];
    llong64 attTimeL[3];
    llong64 attTimeMS[3];
    
    unint32 valid[3];
    unint32 validCnt[3];

    unint32 nodataCnt[3];    /* 连续无效计数 */

    unint32 comCnt;

}BUS_STSOBJ;
typedef struct TAG_STS_ATT
{
    unint32 stsFlg;
    unint32 F_SSInit;
    unint32 F_InitSSC;
    unint32 Fi_STSPriority;
    unint32 Fi_STSaberration;    /* �������ǲ����� */
    unint32 Fi_STSCaliBase;
    unint32 Fi_STSCaliUsing;
    unint32 Fi_STSInstallRecover;

    float64 qsSC[4];

    float64 tno_ss;          /* �����޿��������ۼ�ʱ�� */
    float64 tno_sc;          /* ����C�����������ۼ�ʱ�� */
    
    float64 M_SS[4];
    float64 MSSTemp[4];

    sSTSModifyFP2 K_SS[4];

    float64 wGKMax;
    float64 TSTSInit;        /* ����������Ч�ۼ�ʱ����ֵ */
    float64 dXSSKFmlf;

    unint32 dataSrc;

    float64 mmlfssbd;       /* �궨�����޷�ֵ  */	
    float64 mtaossbd;       /* �˲�ϵ��  */

    float64 AR[3][3];

    unint32 useOld;

}STS_ATT;

/* --- 全局变量定义 --- */
BUS_STSOBJ sBusSTSObj;
STS_ATT sSTSAtt;

/* --- 函数原型 --- */
void STSUseFlag( void );

#endif // IP_STSUSEFLAG_H