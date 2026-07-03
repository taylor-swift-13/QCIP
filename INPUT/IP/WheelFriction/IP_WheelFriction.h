#ifndef IP_WHEELFRICTION_H
#define IP_WHEELFRICTION_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef int                 siint32;
typedef unsigned int        unint32;
typedef double              float64;
typedef struct TAG_MW_DATA
{
    unint32 Fi_WheelSelect[4];
    unint32 F_Valid_MW[4];

    float64 h[4];                                 /* ʵ���ĸ������ֽǶ���     */
    float64 hT[4];                                /* �����ֱ���Ŀ��Ƕ���     */
    float64 HTtemp[4];                            /* ����ͣ���ڼ䱣�ֽǶ���   */
    float64 cwh[3][4];                            /* ��װ����                 */
    float64 dwh[4][3];                            /* �������ط������         */
    float64 vf[4];                                /* Ħ�����صĲ�����ѹ       */
    float64 vh[4];                                /* ���ֽǶ��������ѹ       */

    unint32 dynFricTest[4];
    unint32 cmdClear[4];

}MW_DATA;
typedef struct TAG_UNLOAD_PARA
{
    float64 V_AttOutLmt;
    float64 V_dAttOutLmtYZ;
    float64 V_dAttOutLmtX;

    float64 V_AttInLmt;
    float64 V_dAttInLmtYZ;
    float64 V_dAttInLmtX;

}UNLOAD_PARA;
typedef struct TAG_MW_PARAM
{

    float64 a_max[2];                   /* ��̬�������Ǽ��ٶ�           ��λ deg/s^2  */
    float64 datt_max[2];                /* ��̬�����滮�����ٶ�         ��λ deg/s    */
    float64 kf[4];                      /* ��Ħ������ϵ��                               */
    float64 vf0[4];                     /* ��Ħ��������Ӧ�Ĳ�����ѹ                     */
    float64 cut[4];                     /* ���Ƶ�ѹ����������ϵ��           ��λ Nm/V  */
    float64 kph;                        /* �������ֿ��Ʋ���                   ��λ ��    */
    float64 kih;                        /* �������ֿ��Ʋ���                   ��λ ��    */
    float64 h0[4];                      /* ��ƽǶ���    */
    float64 TMWkeepmlf;                 /* ת�ٱ������������޷�ֵ */
    float64 VWMLim;                     /* ������������������ѹ */ 
    float64 mMaxUWH;                    /* ����������������ܵ�ѹ */
    float64 Ih_MWmlf;                   /* ������ת�ٱ���������������޷�ֵ */
    
    float64 Kp_AM[2][3];
    float64 Ki_AM[2][3];
    float64 Kd_AM[2][3];

    float64 Kp_NM[2][3];
    float64 Ki_NM[2][3];
    float64 Kd_NM[2][3];

    float64 Cwh[5][3][4];
    float64 Dwh[5][4][3];

    float64 Mlf_phi_Mw;                 
    float64 Mlf_I_MW;                   /*       �����ֻ������޷� */

} MW_PARAM;
typedef struct TAG_STRUCT_FILTER
{
    float64 A11;                                  /* 01 A11 */
    float64 H1;                                   /* 02 H1  */
    float64 D1;                                   /* 03 D1  */
    float64 A32;                                  /* 04 A32 */
    float64 A33;                                  /* 05 A33 */
    float64 H2;                                   /* 06 H2  */
    float64 H3;                                   /* 07 H3  */
    float64 D2;                                   /* 08 D2  */
    float64 A54;                                  /* 09 A54 */
    float64 A55;                                  /* 10 A55 */
    float64 H4;                                   /* 11 H4  */
    float64 H5;                                   /* 12 H5  */
    float64 D3;                                   /* 13 D3  */
    float64 A76;                                  /* 14 A76 */
    float64 A77;                                  /* 15 A77 */
    float64 H6;                                   /* 16 H6  */
    float64 H7;                                   /* 17 H7  */
    float64 D4;                                   /* 18 D4  */
}STRUCT_FILTER;
typedef struct TAG_MW_CTRL
{
    unint32 Fi_MWCtrlMode;
    unint32 UnLoadMode;
    unint32 F_WheelSaturation;
    unint32 F_AttOutLmt;
    unint32 Fi_GGTorCal;                /* �ֿ��ݶ����ز�����־��1��������������������           */
    unint32 Fi_WheelH_AutoAdjust;       /* �Ƕ����Ե��� */

    float64 i[3];                       /* 10    ��̬ƫ�������                                */
    float64 ih[4];                      /* 09    �Ƕ���ƫ�������                              */
    float64 X[3][8];

    float64 mdH1;
    float64 mdH2;
    float64 mwk;
    float64 mmlfTW;

    float64 mdAttInLmt;

    unint32 outCnt;
    unint32 inCnt;

    UNLOAD_PARA * unload;
    MW_PARAM * para;   
    STRUCT_FILTER * filter[2]; 

}MW_CTRL;

/* --- 全局变量定义 --- */
MW_DATA sMWData;
MW_CTRL sMWCtrl;

/* --- 函数原型 --- */
void WheelFriction( void );

#endif // IP_WHEELFRICTION_H