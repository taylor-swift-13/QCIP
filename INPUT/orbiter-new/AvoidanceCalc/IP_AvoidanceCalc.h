#ifndef IP_AVOIDANCECALC_H
#define IP_AVOIDANCECALC_H

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
typedef struct TAG_FTDI_CTRL
{
    polymor flgSafePointSeq;    /* 安全点获取序列标志 */

    unint32 cycleSafePtSeq;     /* 安全点获取序列节拍计数 */

    unint32 cntSafePtSeqProc;   /* 安全点获取序列执行累计次数 */

    polymor flgCmdIdMode;       /* 垂直上升模式/缓速下降模式转入时发送: 0x11,“退待机指令”; 0x22,“待机指令” */
    unint32 cycleFetch;         /* “状态获取命令”延时发送节拍计数, 为0时才发送“状态获取命令” */

    polymor flgLvdsProcess;     /* LVDS图像流程标志 */              /* ??? 未使用, 待删除 */

    unint32 imgNum;             /* 图序号N, 有效范围1~20之间 */

    polymor flgCmdId;           /* 发送指令ID编码, 参见FTDI_CMD_ID_TAKE_IMAGE */

    boolu32 bGrdChkOpen;        /* 地检模式开关, TRUE32:打开 */

    polymor flgEnSync;          /* FTDI同步信号使能标志, 即GPIO_42, FTDI_SYNC_SET_NULL */

    siint32 delayUs;            /* 串口发送延时时间, us */

    unint32 acceBuffLen;        /* (16字节=4字节星时+0xAA+11字节)”+“平台运动信息指令(204字节=4字节星时+0xBBBBBB+197字节), 累计长度信息 */

    boolu32 FTDIFaultCommuEnable;     /* 通讯故障判定使能标志, TRUE32:使能; FALSE32:不使能 */
    boolu32 FTDICriticalFaultEnable;  /* 重大故障标志使能标志, TRUE32:使能; FALSE32:不使能 */
    boolu32 FTDICriticalFaultOnce;    /* 曾发生重大故障标志, TRUE32:发生; FALSE32:未发生 */
    boolu32 bCriticalFault;           /* 重大故障标志（代表从历史通讯结果看是否需要进行自主加断电）, TRUE32:发生故障; FALSE32:无故障 */
    boolu32 bPowerAutoSer;            /* 自主加断电执行序列, TRUE32:开始执行加断电序列; FALSE32:未执行或执行完成 */
    unint32 cyclePowerSeq;            /* FTDI加断电序列节拍计数 */

    unint08 flgSafePointSeqEndFlg;    /* 安全点获取序列结束标志 */
} SFtdiCtrl;
typedef struct TAG_FTDI_SAFE_LAND_DATA
{
    unint32 FTDIVldFlg;         /* 高动态三维安全着陆点有效标志 */
    unint32 FTDIUseFlg;         /* 高动态三维安全着陆点可用标志 */
    unint32 FTDIFailFlg;        /* 高动态三维图像质量差标志 */

    float64 tFTDI;              /* 高动态三维数据时刻 */
    float64 qFTDI[4];           /* 高动态三维数据对应姿态 */
    float64 r_IFTDI[3];         /* 高动态三维数据对应位置 */

    float64 angleFTDI[FTDI_PLATFORM_MOTION_CYCLE][3];   /* 缓存镜像 */
    float64 VFTDI[FTDI_PLATFORM_MOTION_CYCLE][3];       /* 缓存镜像 */

    unint32 pkSeq;              /* 平台运行信息传输包标识, 0:包1,前16拍数据; 16:包2,后16拍数据 */
} SFtdiSafeLandData;
typedef struct TAG_MODE_PROCESS
{
    boolu32 bEnSmuTimeAdj;          /* 数管校时允许标志 */

    boolu32 bWorkModeSwitch;        /* 发生模式切换保存重要数据标志 */

    boolu32 bVertRiseMrvsProcing;   /* 垂直上升模式转出时MRVS自主处理标志, TRUE32:正在执行, FALSE32:未执行/执行完成 */
    unint32 cycleMrvsProc;          /* 垂直上升模式转出时MRVS自主处理节拍计数 */

    siint32 cntTurnoff;             /* 缓速下降模式下延时关闭285N周期计数 */

    boolu32 bFirstH8to9;            /* 缓速下降模式, 首次满足h<h8to9标志 */
    boolu32 bFirstHtouch;           /* 缓速下降模式, 首次满足h<htouch标志 */

    boolu32 bQPGFirstFlg;           /* 计算模式倒计时时间的标志 */

    polymor Sub7Flg;                /* 接近段子模式字 */

    boolu32 bMode8Valid;            /* 缓速下降模式转出条件有效标志 */

    float64 t3;                     /* 平移模式累加时间, s */
    float64 t30;                    /* 平移模式初始时刻, s */
    float64 t40;                    /* 上升调姿模式初始时刻, s */
    float64 t50;                    /* 滑行模式初始时刻, s */
    float64 t60;                    /* 动力减速模式初始时刻, s */
    float64 t70;                    /* 接近模式初始时刻, s */
    float64 t8;                     /* 进入缓速下降模式初始时间, s */

    float64 t7_1;
    float64 t7_4;
    float64 t7_5;

    float64 TModemax;               /* 模式倒计时时间, s */
} SModeProcess;
typedef struct TAG_MODE_PARAM
{
    float64 h3to7;                  /* 平移模式转接近模式高度距离阈值, m */
    float64 r3to7;                  /* 平移模式转接近模式水平距离阈值, m */
    float64 v3to7;                  /* 平移模式转接近模式水平速度阈值, m/s */
    float64 t3to7;                  /* 平移模式转接近模式时间阈值2, s */
    float64 t3max;                  /* 平移模式转接近模式时间阈值, s */
    float64 t3leg;                  /* 平移模式着陆腿调整时间阈值, s */

    float64 t4to5;                  /* 上升调姿模式转滑行模式时间阈值, s */
    float64 t5to6;                  /* 滑行模式转动力减速模式时间阈值, s */
    float64 t6to7;                  /* 动力减速模式转接近模式时间阈值, s */

    float64 t7to8_1;                /* 坑外飞跃接近模式转缓速下降模式时间阈值, s */
    float64 t7to8_2;                /* 进坑飞跃接近模式转缓速下降模式时间阈值, s */

    float64 t7_1to2;                /* 100m平移最大时间阈值, s */
    float64 t7_5to6;                /* 50m平移最大时间阈值, s */
    float64 t7_TDI;                 /* 平移前成像判断时间阈值, s */

    float64 r_tGx1;                 /* 动力减速制导终端目标高度, m */
    float64 v_tGx1;                 /* 动力减速制导终端目标垂向速度, m/s */
    float64 a_tGx1;                 /* 动力减速制导终端目标垂向加速度, m/s2 */

    float64 LcSafe;                 /* 安全制导转换条件高度阈值, m */
    float64 dLcSafe;                /* 安全制导转换条件速度阈值, m/s */

    float64 hslw;                   /* 缓速下降初始高度, m */
    float64 vslw1;                  /* 缓速下降标称速度1, m/s */
    float64 vslw2;                  /* 缓速下降标称速度2, m/s */
    float64 vslw3;                  /* 50m悬停下降终端速度, m/s */
    float64 a_tGx21;                /* 坑外飞跃接近下降制导终端目标垂向加速度, m/s2 */
    float64 a_tGx22;                /* 弹道飞跃接近下降制导终端目标垂向加速度, m/s2 */
    float64 a_tGx23;                /* 50m悬停下降终端加速度, m/s2 */

    float64 h8to9;                  /* 缓速下降模式转无控模式高度阈值, m */
    float64 t8min;                  /* 缓速下降模式最小时间, s */
    float64 t8max;                  /* 缓速下降模式最大时间, s */

    float64 hleg;                   /* 着陆腿足端距离机械系YZ面的距离, m */

    float64 htouch;                 /* 缓速下降模式下, 清除触地开关锁存状态高度, m */

    float64 tBZ4;                   /* 起飞准备星敏可用性判断时间阈值, s */

    float64 alphaFN;                /* 起飞准备姿态角判断阈值, rad */
    float64 tFN;                    /* 起飞准备姿态角判断时间阈值, s */
    float64 tIMU;                   /* 起飞准备IMU有效性判断时间阈值, s */
    float64 tdeltaZ;                /* 起飞准备星敏残差判断时间阈值tδZ, s */
    float64 deltaZmax0;             /* 起飞准备星敏残差判断角度阈值δZmax0, rad */

    siint32 BZ4NumMax;              /* 起飞准备星敏可用性判断计数阈值 */
    siint32 AFNNumMax;              /* 起飞准备姿态角判断计数阈值 */
    siint32 deltaZNumMax;           /* 起飞准备星敏残差判断计数阈值δZNumMax */

    siint32 LmtUseZT2;              /* 有效陀螺个数阈值 */
    siint32 LmtUseZT3;              /* 有效加计个数阈值 */

    siint32 Nturnoff;               /* 延时关闭285N周期数阈值 */
} SModeParam;
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
typedef struct TAG_GUIDE_DATA
{
    float64 aIC[3];             /* 指令加速度矢量 */

    float64 Fc;                 /* 主发动机推力指令 */
    float64 Fmax;               /*  */
    float64 Isp;                /* 发动机标称比冲 */
    float64 dFc;                /* 干扰力估计 */

    float64 tH;                 /* 单次飞跃过程累积时间, s */

    float64 tgo;                /* 剩余制导时间, s */
    float64 tgo1;               /* 滑行段剩余制导时间, s */
    float64 tgo1safe;           /* 安全模式制导制导时间, s */
    float64 tQPG;               /*  */

    float64 tgo2;               /*  */
    float64 tgoG;               /*  */

    float64 tARelate;           /* 相对起飞时刻时间, s, 送遥测 */

    float64 tlamd1;             /* 制导参考时间 */
    float64 lamdv1[3];          /* PEG制导速度增量方向矢量 */
    float64 dlamd1[3];          /* PEG制导指令推力矢量变化率 */

    float64 CQPG0[3];           /* 制导参数 */
    float64 CQPG1[3];           /* 制导参数 */
    float64 CQPG2[3];           /* 制导参数 */

    float64 r_tG[3];            /* 制导终端高度 */
    float64 v_tG[3];            /* 制导终端垂向速度 */
    float64 a_tG[3];            /* 制导终端垂向加速度 */

    float64 a_G[3];             /* 制导加速度 */

    float64 Fx;                 /* 制导系的x坐标 */
    float64 Fy;                 /* 制导系的y坐标 */
    float64 Fz;                 /* 制导系的z坐标 */

    float64 LYF;                /*  */
    float64 LZF;                /*  */

    float64 VYF;                /*  */
    float64 VZF;                /*  */

    float64 rpf[3];             /* 垂直上升终端位置 */
    float64 vpf[3];             /* 垂直上升终端速度 */

    float64 rd[3];              /*  */
    float64 rgravG[3];          /* 迭代重力引起位置变化 */
    float64 rgravpast[3];       /* 迭代重力引起位置变化 */
    float64 rbiasG[3];          /* 迭代位置偏差 */
    float64 rbiaspast[3];       /* 迭代位置偏差 */
    float64 tgopast;            /* 迭代剩余制导时间 */
    float64 VgoG[3];            /* 迭代制导所需速度增量修正 */
    float64 Vgopast[3];         /* 迭代制导所需速度增量修正 */

    float64 vAscend;            /* 垂直上升终端垂直速度 */

    float64 dFcN[100];          /* 存储干扰力数组 */
    siint32 idFc;               /* 存储干扰力计数器 */
    unint32 dFcIniFlg;          /* 制导推力偏差估计标志 */

    boolu32 bHoverFlg;          /* 坑外盘旋飞跃标志HoverFlg, TRUE32:坑外盘旋飞跃, FALSE32:进坑飞跃 */
    boolu32 bAscendFlg;         /* 启动飞跃标志AscendFlg */
    boolu32 bPEGInitFlg;        /* PEG初始化标志 */
    boolu32 bPEGConvergeFlg;    /* PEG收敛标志PEGConvergeFlg */

    boolu32 bCovFlg;            /* 滑行制导收敛标志CovFlg */

    boolu32 bPSOOutFlg;         /*  */

    siint32 nQPGNum;            /* 计数 */
} SGuideData;
typedef struct TAG_AVOID_DATA
{
    polymor flgFTDI;    /* 高动态三维成像标志 */
    polymor flgFTDIOld; /* 高动态三维成像标志(上一拍的) */

    polymor flgSLP;     /* 获得安全着陆点标志 */
} SAvoidData;
typedef struct TAG_AVOID_PARAM
{
    float64 dRFTDI1;    /* 远距离避障目标安全着陆点可用距离, m */
    float64 dRFTDI2;    /* 近距离避障目标安全着陆点可用距离, m */

    float64 hFTDI1;     /* 接近段远距离避障高度上限, m */
    float64 hFTDI2;     /* 接近段远距离避障高度下限, m */

    float64 LcTDI;      /* LcTDI为成像条件位置偏差阈值，m */
    float64 dLcTDI;     /* dLcTDI为成像条件速度偏差阈值，m/s */
    float64 phicTDI;    /* φcTDI为成像条件姿态角偏差阈值，rad */
    float64 wTDI;       /* ωTDI为成像条件角速度偏差阈值，rad/s */

    float64 distace100; /* 高度100m平移距离, m */
    float64 distace50;  /* 高度50m平移距离, m */

    float64 alfa100;    /* 平移方向相对轨道法线的角度阈值 */

    float64 pxMax;      /* 安全点矢量判断阈值x */
    float64 pyMax;      /* 安全点矢量判断阈值y */

    float64 dtFTDI;     /* 安全点成像时刻判断阈值, s */

    float64 mass100;    /* 进坑100m平移质量判断阈值 */
    float64 mass50;     /* 进坑50m平移质量判断阈值 */

    float64 CBC[3][3];  /* 高动态三维系到本体系的转换矩阵 */
    float64 drFTDI[3];  /* 三维相机在机械系下安装位置ΔrFTDI */
} SAvoidParam;

/* --- 全局变量定义 --- */
STime sTime;
SModeProcess sModeProcess;
SModeParam sModeParam =
{
    /* 平移模式转接近模式高度距离阈值, m */
    2.0,

    /* 平移模式转接近模式水平距离阈值, m */
    2.0,

    /* 平移模式转接近模式水平速度阈值, m/s */
    2.0,

    /* 平移模式转接近模式时间阈值2, s */
    150.0,

    /* 平移模式转接近模式时间阈值, s */
    5.0,

    /* 平移模式着陆腿调整时间阈值, s */
    21.0,

    /* 上升调姿模式转滑行模式时间阈值, s */
    50.0,

    /* 滑行模式转动力减速模式时间阈值, s */
    80.0,

    /* 动力减速模式转接近模式时间阈值, s */
    120.0,

    /* 坑外飞跃接近模式转缓速下降模式时间阈值, s */
    20.0,

    /* 进坑飞跃接近模式转缓速下降模式时间阈值, s */
    150.0,

    /* 100m平移最大时间阈值, s */
    60.0,

    /* 50m平移最大时间阈值, s */
    60.0,

    /* 平移前成像判断时间阈值, s */
    10.0,

    /* 动力减速制导终端目标高度, m */
    100.0,

    /* 动力减速制导终端目标垂向速度, m/s */
    0.0,

    /* 动力减速制导终端目标垂向加速度, m/s2 */
    1.0,

    /* 安全制导转换条件高度阈值, m */
    2.0,

    /* 安全制导转换条件速度阈值, m/s */
    2.0,

    /* 缓速下降初始高度, m */
    18.0,

    /* 缓速下降标称速度1, m/s */
    -2.0,

    /* 缓速下降标称速度2, m/s */
    -0.7,

    /* 50m悬停下降终端速度, m/s */
    -2.0,

    /* 坑外飞跃接近下降制导终端目标垂向加速度, m/s2 */
    0.4,

    /* 弹道飞跃接近下降制导终端目标垂向加速度, m/s2 */
    0.3,

    /* 50m悬停下降终端加速度, m/s2 */
    0.2,

    /* 缓速下降模式转无控模式高度阈值, m */
    2.0,

    /* 缓速下降模式最小时间, s */
    8.37,

    /* 缓速下降模式最大时间, s */
    32.72,

    /* 着陆腿足端距离机械系YZ面的距离, m */
    0.6764,

    /* 缓速下降模式下, 清除触地开关锁存状态高度, m */
    6.0,

    /* 起飞准备星敏可用性判断时间阈值, s */
    600.0,

    /* 起飞准备姿态角判断阈值, rad */
    0.08726,

    /* 起飞准备姿态角判断时间阈值, s */
    600.0,

    /* 起飞准备IMU有效性判断时间阈值, s */
    600.0,

    /* 起飞准备星敏残差判断时间阈值tδZ, s */
    60.0,

    /* 起飞准备星敏残差判断角度阈值δZmax0, rad */
    0.008726,

    /* 起飞准备星敏可用性判断计数阈值 */
    5,

    /* 起飞准备姿态角判断计数阈值 */
    5,

    /* 起飞准备星敏残差判断计数阈值δZNumMax */
    400,

    /* 有效陀螺个数阈值 */
    4,

    /* 有效加计个数阈值 */
    4,

    /* 延时关闭285N周期数阈值 */
    10
};
SFtdiCtrl sFtdiCtrl;
SFtdiSafeLandData sFtdiSafeLandData;
SNaviData sNaviData;
SGuideData sGuideData;
SAvoidData sAvoidData;
SAvoidParam sAvoidParam =
{
    16.0,           /* 远距离避障目标安全着陆点可用距离, m */
    8.0,            /* 近距离避障目标安全着陆点可用距离, m */

    100.0,          /* 接近段远距离避障高度上限, m */
    50.0,           /* 接近段远距离避障高度下限, m */

    1.0,            /* LcTDI为成像条件位置偏差阈值，初值1m */
    1.0,            /* dLcTDI为成像条件速度偏差阈值，初值1m/s */
    0.01745,        /* φcTDI为成像条件姿态角偏差阈值，初值0.01745rad（1˚） */
    0.01745,        /* ωTDI为成像条件角速度偏差阈值，初值0.01745rad/s（1˚/s） */

    36.0,           /* 高度100m平移距离, m */
    18.0,           /* 高度50m平移距离, m */

    0.0,            /* 平移方向相对轨道法线的角度阈值 */

    -0.9684,        /* 安全点矢量判断阈值x */
    0.1736,         /* 安全点矢量判断阈值y */

    6.0,            /* 安全点成像时刻判断阈值, s */

    404.0,          /* 进坑100m平移质量判断阈值 */
    397.0,          /* 进坑50m平移质量判断阈值 */

    /* 高动态三维系到本体系的转换矩阵 */
    {
        {  0.003607587737626, 0.000456742697906, -0.999993388326554 },
        { -0.857150036737054, 0.515058882066615, -0.002857013468102 },
        {  0.515054171745442, 0.857154676467671,  0.002249617127389 }
    },

    /* 三维相机在机械系下安装位置ΔrFTDI */
    {0.1300307,  -0.385437,  -0.975637}
};

/* --- 函数原型 --- */
void AvoidanceCalc(void);

#endif // IP_AVOIDANCECALC_H