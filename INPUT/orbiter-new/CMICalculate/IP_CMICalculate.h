#ifndef IP_CMICALCULATE_H
#define IP_CMICALCULATE_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef struct TAG_TIME
{
    llong64 countPeriod;        /* 上电累计周期计数器 */
    ulong64 periodOld;          /* 上拍周期信号锁存星时计数 */
    float64 tRaw;               /* 控制周期头计算“上一个控制周期内硬件累计星时”,单位s */

    float64 sstime;             /* 星时,单位s */

    siint16 cycleTag;           /* 1553B时标寄存器控制周期读取值 */
} STime;
;
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
typedef struct TAG_NAVI_FLAG
{
    polymor ReNaviFlg;      /* 导航重置标志 */
    polymor WalkReNaviFlg;  /* 行走导航重置标志 */

    boolu32 bSIFlg;         /* 太阳矢量注入标志, TRUE32:使用注入的太阳矢量, FALSE32:使用星上自主计算的太阳矢量 */           /* ??? 待用户需求增加算法使用 */
    boolu32 bRFRFlg;        /* 中继星矢量注入标志, TRUE32:使用注入的中继星矢量, FALSE32:使用星上自主计算的中继星矢量 */

    boolu32 RFlg;           /* 允许测距修正标志 */
    boolu32 VFlg;           /* 允许测速修正标志 */
    boolu32 VVelFlg;
    boolu32 VnumFlg;
} SNaviFlag;
typedef struct TAG_NAVI_PARAM
{
    float64 HRinmax;        /* 测距信息允许引入最大高度 */
    float64 HRinmin;        /* 测距信息允许引入最小高度 */

    float64 HVinmax;        /* 测速信息允许引入最大高度 */
    float64 HVinmin;        /* 测速信息允许引入最小高度 */

    float64 RmMax;          /* 测距数据最大值 */
    float64 RmMin;          /* 测距数据最小值 */

    float64 VmMax;          /* 测速数据最大值 */
    float64 VmMin;          /* 测速数据最小值 */

    float64 thetaW;         /* 波束重合判断夹角阈值, rad */

    float64 mdeltat;        /* 微波测距测速数据有效时间阈值 */

    float64 uVBR[4][3];     /* 微波波束R1~R4本体安装单位矢量u_VBR1~u_VBR4 */

    siint32 nINNumMax;      /* 导航修正周期 */

    siint32 RMNMax;         /* 强制引入测距修正最大次数 */
    siint32 VMNMax;         /* 强制引入测速修正最大次数 */
    float64 hRin0;          /* 强制引入测距修正高度阈值, m */
    float64 hVin0;          /* 强制引入测速修正高度阈值, m */

    float64 hREVU;          /* 测距估计的垂直速度引入修正高度, m */
    float64 dvp6max;        /* 测距估计的垂直速度修正量限幅, m/s */

    float64 costhetaIA;     /* 微波波束入射角判断角度余弦 */
    float64 costhetaIA6;    /* 动力减速微波入射角判断角度余弦 */

    float64 thetaHL;        /* 微波波束指向判断夹角阈值, rad */

    float64 dRLI1;          /* 坑外飞跃测距足印距离标称着陆点距离阈值, m */
    float64 dRLI2;          /* 弹道飞跃测距足印距离标称着陆点距离阈值, m */
    float64 dRLI3;          /* 弹道飞跃安全模式制导测距足印距离标称着陆点距离阈值, m */

    float64 da1;            /* 测距数据判断加速度阙值1 */
    float64 da2;            /* 测距数据判断加速度阙值2 */

    float64 dh1;            /* 测距数据判断高度阈值1 */
    float64 dh2;            /* 测距数据判断高度阈值2 */

    float64 whh;            /* 测距修正系数1 */
    float64 hhh;            /* 测距修正系数2 */

    float64 whv;            /* 垂向速度估计系数1 */
    float64 hhv;            /* 垂向速度估计系数2 */

    float64 dv1;            /* 测速数据判断高度阈值1 */
    float64 dv2;            /* 测速数据判断高度阈值2 */
    float64 dv3;            /* 测速数据判断高度阈值3 */

    float64 Wv;             /* 测速修正系数1 */
    float64 Vv;             /* 测速修正系数2 */

    float64 tEPH0;          /* 星时t的零时刻对应2021-1-1 T 00:00:00（北京时间），相对J2000.0历元时刻的时间差 */

    float64 tME;            /* 月固系计算参考时刻 */
    float64 qME[4];         /* tME时刻月固系相对惯性系姿态四元数 */

    float64 LZ;             /* 着陆器的月心纬度 */
    float64 lmdZ;           /* 着陆器的月心经度 */
    float64 rZ;             /* 着陆器的月心距 */

    float64 LX;             /* 巡视器的月心纬度 */
    float64 lmdX;           /* 巡视器的月心经度 */
    float64 rX;             /* 巡视器的月心距 */

    float64 Gm;             /* 月球引力常数 */

    float64 wM;             /* 月球自转角速度大小, rad/s */

    float64 phiR;           /* 坑外飞跃滚动调姿角度, φR */

    siint32 NRe;            /* 重要数据恢复时允许的导航最大迭代次数 */
} SNaviParam;

/* --- 全局变量定义 --- */
STime sTime;
SNaviData sNaviData;
SNaviFlag sNaviFlag;
SNaviParam sNaviParam =
{
    6000.0,                 /* 测距信息允许引入最大高度 */
    5.0,                    /* 测距信息允许引入最小高度 */

    6000.0,                 /* 测速信息允许引入最大高度 */
    5.0,                    /* 测速信息允许引入最小高度 */

    6000.0,                 /* 测距数据最大值 */
    2.0,                    /* 测距数据最小值 */

    150.0,                  /* 测速数据最大值 */
    -150.0,                 /* 测速数据最小值 */

    0.1745,                 /* 微波波束重合判断夹角阈值θW, rad */
    0.8,                    /* float64 mdeltat */

    {
        {-0.681998360062498,  0.376675002560280,  0.626892478275403},   /* 微波波束R1本体安装单位矢量u_VBR1 */
        {-0.901277497576550, -0.035972540330746,  0.431747324774487},   /* 微波波束R2本体安装单位矢量u_VBR2 */
        {-0.901277497576550,  0.398098345859369,  0.170931223396453},   /* 微波波束R3本体安装单位矢量u_VBR3 */
        {-1.0,                0.0,                0.0              }    /* 微波波束R4本体安装单位矢量u_VBR4 */
    },

    4,                              /* 导航修正周期 */

    10,                             /* 强制引入测距修正最大次数 */
    10,                             /* 强制引入测速修正最大次数 */
    2000.0,                         /* 强制引入测距修正高度, m */
    2000.0,                         /* 强制引入测速修正高度, m */

    300.0,                          /* 测距估计的垂直速度引入修正高度, m */
    2.0,                            /* 测距估计的垂直速度修正量限幅, m/s */

    0.6428,                         /* 微波波束入射角判断角度余弦, （cos50˚） */
    0.6428,                         /* 动力减速微波入射角判断角度余弦, （cos50˚） */

    0.08727,                        /* 微波波束指向判断夹角阈值, rad, 初值0.08727（5˚） */

    20.0,                           /* 坑外飞跃测距足印距离标称着陆点距离阈值, m */
    100.0,                          /* 弹道飞跃测距足印距离标称着陆点距离阈值, m */
    6000.0,                         /* 弹道飞跃安全模式制导测距足印距离标称着陆点距离阈值, m */

    0.0086,                         /* 测距数据判断加速度阙值1 */
    7.4e-5,                         /* 测距数据判断加速度阙值2 */

    2.4,                            /* 测距数据判断高度阈值1 */
    0.02,                           /* 测距数据判断高度阈值2 */

    100.0,                          /* 测距修正系数1 */
    1000.0,                         /* 测距修正系数2 */

    2.0,                            /* 垂向速度估计系数1 */
    100.0,                          /* 垂向速度估计系数2 */

    0.3,                            /* 测速数据判断高度阈值1 */
    0.02,                           /* 测速数据判断高度阈值2 */
    12.0,                           /* 测速数据判断高度阈值3 */

    0.1,                            /* 测速修正系数1 */
    200.0,                          /* 测速修正系数2 */

    662702469.184,                  /* 星时t的零时刻对应2021-1-1 T 00:00:00（北京时间），相对J2000.0历元时刻的时间差 */

    184723200.0,                    /* 月固系计算参考时刻 */
    {0.18596651, -0.04911382, 0.29026487, 0.93741698},            /* tME时刻月固系相对惯性系姿态四元数 */

    -1.549922188941044,             /* 着陆器的月心纬度 */
    2.153788656838563,              /* 着陆器的月心经度 */
    1739042.0810546875,             /* 着陆器的月心距 */

    -1.549922188941044,             /* 巡视器的月心纬度 */
    2.153788656838563,              /* 巡视器的月心经度 */
    1739042.0810546875,             /* 巡视器的月心距 */

    4.90279980693169e12,            /* 月球引力常数 */

    2.6617e-6,                      /* 月球自转角速度大小, rad/s */

    0.0,                            /* 坑外飞跃滚动调姿角度 */

    24                              /* 重要数据恢复时允许的导航最大迭代次数 */
};

/* --- 函数原型 --- */
void CMICalculate(void);

#endif // IP_CMICALCULATE_H