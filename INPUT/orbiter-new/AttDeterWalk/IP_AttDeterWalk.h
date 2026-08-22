#ifndef IP_ATTDETERWALK_H
#define IP_ATTDETERWALK_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef struct TAG_NAVI_DATA
{
    float64 height0;        /* 初始高度 */

    float64 t1;             /* 调整后的导航初始时刻 */
    float64 ri[3];          /* 位置矢量 */
    float64 vi[3];          /* 速度矢量 */
    float64 gi[3];          /* 引力加速度矢量 */

    float64 rim[3];         /* 位置矢量 */
    float64 vim[3];         /* 速度矢量 */

    float64 ai[3];          /* 4.6.6中使用，等后面更新了文档再看下，数据字典没有对应字段 */

    float64 gM;             /* 4.6.3等位置使用，但是在数据字典中没有找到对应字段 */

    float64 cIG[3][3];      /* 制导系到惯性系的转换矩阵 */
    float64 cGI[3][3];      /* 惯性系到制导系的转换矩阵 */
    float64 rG[3];          /* 制导系位置 */
    float64 vG[3];          /* 制导系速度 */
    float64 lcy;            /* 制导系水平位置 */
    float64 lcz;            /* 制导系水平位置 */
    float64 dlcy;           /* 制导系水平速度 */
    float64 dlcz;           /* 制导系水平速度 */

    float64 thetaX;         /* 本体X轴与天向夹角 */
    float64 thetaY;         /* 制导系下俯仰角 */

    float64 wOrbit[3];      /* 轨道法线方向单位矢量 */

    float64 wOrbit0[3];     /* 初始轨道法线方向单位矢量 */
    float64 wOrbitB[3];     /* 初始轨道法线在本体系单位矢量 */

    float64 height;         /* 相对着陆点高度, h */
    float64 vmbi[3];        /* 惯性系下着陆器相对月面的速度矢量 */
    float64 dh;             /* 垂向速度 */

    float64 EulerFN;        /* 月面确定姿态相对注入姿态的偏差（遥测） */

    float64 angleFN[3];     /* 机械系相对极区导航系的姿态角, 起飞姿态偏差估计 */
    siint32 NumFN;          /*  */

    float64 qFNEst[4];      /* 机械系相对极区导航坐标系的姿态（遥测） */
    float64 qFN0[4];        /* 机械系相对极区导航系的姿态四元数 */
    float64 qFNIN[4];       /* 地面注入的机械系相对极区导航系的姿态四元数 */
    float64 qFNIN0[4];      /* 地面注入的机械系相对极区导航系的目标姿态四元数 */

    float64 cfbn[3][3];     /* 飞跃器本体系相对极区导航坐标系的转换矩阵CFBN */
    float64 cfn[3][3];      /* 飞跃器机械系相对极区导航坐标系的转换矩阵CFN */
    float64 cnm[3][3];      /* 月固系到极区导航坐标系的转换矩阵CNM */

    float64 cmi[3][3];      /* 当前时刻月球固联坐标系相对J2000惯性坐标系的姿态变换阵CMI */
    float64 cim[3][3];      /* CMI的转置 */
    float64 wmi[3];         /* 惯性系下月球自转角速度矢量方向 */

    float64 is;             /* 太阳在地心惯性坐标系的倾角 */
    float64 us;             /* 太阳在地心惯性坐标系的纬度幅角 */
    float64 SI[3];          /* 太阳矢量SI */
    float64 RFR[3];         /* 中继星位置矢量RFR */

    float64 rca;            /* 起飞点的月心距 */
    float64 lmdca;          /* 起飞点的月心经度 */
    float64 lca;            /* 起飞点的月心纬度 */

    float64 rM;             /* 目标着陆点的月心距 */
    float64 lmdcal;         /* 目标着陆点的月心经度 */
    float64 lcal;           /* 目标着陆点的月心纬度 */

    float64 rMGP;           /* 全局定位的月心距 */
    float64 lmdcGP;         /* 全局定位的月心经度 */
    float64 lcGP;           /* 全局定位的月心纬度 */

    float64 lmdA;           /*  */
    float64 LA;             /*  */
    float64 r;              /*  */

    float64 tLI0;           /* 初始目标着陆点对应时间 */
    float64 r_LI0[3];       /* 初始惯性系下目标着陆点位置矢量 */
    float64 r_LI[3];        /* 更新后的着陆点位置向量 */

    float64 angleFTDI[FTDI_PLATFORM_MOTION_CYCLE][3];   /*  */
    float64 VFTDI[FTDI_PLATFORM_MOTION_CYCLE][3];       /*  */

    float64 tm;             /* 测距和测速对应的时间 */
    float64 Rm;             /* 测距敏感器测量距离Rm */
    float64 Vm;             /* 测距敏感器测量速度Vm */
    float64 dqulast;        /*  */
    float64 uRB[3];         /* 当前引入测距信息修正的测距敏感器本体安装单位矢量 */
    float64 uVB[3];         /* 当前引入测速信息修正的测速敏感器本体安装单位矢量 */

    float64 UVBR6[3];       /* 敏感器本体安装单位矢量 */
    float64 dvp6;           /* 垂向速度误差估计 */

    float64 dvgb[3];        /* 体轴速度误差 */

    float64 dquR[4];        /* 四个MRVS的测距修正残差 */
    float64 dquV[4];        /* 四个MRVS的测速修正残差 */
    float64 dHAll[4];       /* 四个MRVS的高度修正量dH */
    float64 dVverAll[4];    /* 四个MRVS的速度修正量dVver */
    float64 dqulastAll[4];  /* 四个MRVS的 */
    float64 cosRAll[4];     /* 四个MRVS的 */
    float64 dvpAll[4];      /* 四个MRVS的测速波束修正量 */

    float64 dH;             /* 高度修正量dH */
    float64 dVver;          /* 测距仪估计的垂向速度修正量dVver */
    float64 dqu;            /*  */
    float64 cosR;           /*  */
    float64 dvp;            /* 速度修正量 */

    siint32 RangeModifyNum;     /* 位置修正累计计数 */
    siint32 VelocityModifyNum;  /* 测速修正累计计数 */
    siint32 SRMNum;         /*  */
    siint32 NumRin;         /*  */
    siint32 NumVin;         /*  */

    siint32 numVpn[4];      /* 测速波束R1~R4未能引入修正的计数器 */
    siint32 numVpy[4];      /* 测速波束R1~R4连续引入修正的计数器 */

    unint32 Npos;           /*  */

    siint32 h100Flg;        /* 进坑飞跃100m平移标志 */

    siint32 nINNum;         /* 惯导修正周期计数 */

    float64 DeltaVI[3];     /* 没有找到对应注释，4.4.1以及4.4.5使用 */

    float64 drI[3];         /* 月面导航位置误差 */
    float64 dvI[3];         /* 月面导航速度误差 */

    float64 lon;            /* 经度, rad */
    float64 lat;            /* 纬度, rad */
} SNaviData;

/* --- 全局变量定义 --- */
SNaviData sNaviData;

/* --- 函数原型 --- */
void AttDeterWalk(void);

#endif // IP_ATTDETERWALK_H