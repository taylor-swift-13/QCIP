#ifndef IP_CTRLATTERR_H
#define IP_CTRLATTERR_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef unsigned int        unint32;
typedef double              float64;
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
typedef struct TAG_ATT_CTRL
{
    float64 ang[3];
    float64 rate[3];

    float64 sitaBT;      /* ���ٶȿ�������ֵ */
    float64 dAngt[3];

    float64 e[3];
    float64 de[3];

}ATT_CTRL;

/* --- 全局变量定义 --- */
ATT_PUB sAttPub;
ATT_CTRL sAttCtrl;

/* --- 函数原型 --- */
void CtrlAttErr( float64 * q, float64 * w, float64 * qt, float64 * wt );

#endif // IP_CTRLATTERR_H