#ifndef IP_ATTMNVRMAIN_H
#define IP_ATTMNVRMAIN_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

#ifdef DBL_PI
#undef DBL_PI
#endif

/* --- 类型定义 --- */
typedef int                 siint32;
typedef unsigned char       unint08;
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
typedef  struct TAG_SMNVRDATA
{
	float64 dphaidmax;	        /* ���������������ٶ� */
	float64 phaim;    	        /* ������Ŀ����̬�� */
	float64 phaim0;   	        /* ������ʼʱ����̬�� */
	float64 amax;     	        /* �������������Ǽ��ٶ� */
    float64 dXmax;

	float64 e[3];        
        
	float64 tmstar;             /* ����ʱ�� */
	float64 tm1;      	        /* ���ٶε���ֹʱ��(����ʱ��) */
	float64 tm2;      	        /* ���ٶε���ֹʱ��(����ʱ��) */
	float64 tm3;      	        /* ���ٶ���ֹʱ��(����ʱ��) */
        
	float64 ar;       	        /* �滮�Ļ����Ǽ��ٶ� */
	float64 dphair;   	        /* �滮�Ļ������ٶ� */
	float64 phair;    	        /* �滮�Ļ����Ƕ� */

    unint32 Fi_AttManuMode;
    float64 qb0[4];
    float64 qtb0[4];
    float64 qtm0[4];
    float64 Ctm0[3][3];
    float64 tacc;
    float64 tsli;

    float64 wT_AMJet;

    float64 m_MWManeuver1;
    float64 m_MWManeuver2;
    float64 m_MWManeuver3;

    float64 Zcamera[3];
    float64 aSunAvoidLim;

    float64 phiAttMovLimt;

    unint32 F_AttMovePhase;
    
    float64 aAttManuMW;
    float64 wAttManuMW;
	float64 aAttManuJ1;
    float64 wAttManuJ1;
    float64 aAttManuJ4;
    float64 wAttManuJ4;

    float64 TimePreMnvr;
    unint32 F_AttManeuInVVLH;

    float64 dEuler;
    
} SMnvrData;
typedef struct TAG_ATT_PUB
{
    unint32 F_AttSafe;

    float64 Coi[3][3];
    float64 Coiv[3][3];
    float64 Cbi[3][3];
    float64 Cib[3][3];
    float64 Cbo[3][3];
    float64 Cto[3][3];
    float64 Cbt[3][3];
    float64 Cti[3][3];

    float64 CbiSC[3][3];
    float64 Cbovvlh[3][3];    /* �������VVLH���ϵ����̬�� */
    float64 Coitemp[3][3];    /* ��׼ϵ��̬�� */

    float64 qoi[4];
    float64 qoitemp[4];
    float64 qto[4];

    float64 qs[4];
    float64 qsSC[4];
    float64 qti[4];
    float64 qGI[4];
    float64 qbt[4];

    float64 ws[3];
    float64 normW;
    float64 wti[3];
    float64 wbt[3];
    float64 wbo[3];
    float64 woitemp[3];
    float64 wbovvlh[3];

    float64 ang_r[3];
    float64 dAng_r[3];

    float64 ang_o[3];
    float64 dAng_o[3];

    float64 ang_t[3];
    float64 ang_ovvlh[3];
    float64 dAng_ovvlh[3];

    unint32 EulerSeq;
    unint32 EulerSeq2;
   
}ATT_PUB;

/* --- 全局变量定义 --- */
const float64 DBL_PI        = 6.283185307179586;
GNC_TIME sTime;
SMnvrData sAttMnvr;
unint32 WorkMode;
ATT_PUB sAttPub;

/* --- 函数原型 --- */
void AttMnvrMain( void );
void targetTrack( void );

#endif // IP_ATTMNVRMAIN_H
