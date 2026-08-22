#ifndef IP_ATTDETERWALKMODE_H
#define IP_ATTDETERWALKMODE_H

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
typedef struct TAG_WALK_SEND_DATA
{
    unint32 tiltAlarm;          /* GNC状态标识 */
    unint32 WIFIreleaseFlag;    /* WIFI相机释放标识 */
    unint32 FWSafeIF;           /* 前方地形是否安全 */
    unint32 PathPlanFlag;       /* 路径规划标识 */
    unint32 MoveNum;            /* 运动计次 */
    unint32 MFaultFlag;         /* 运动故障标识 */
    unint32 MstopFlag;          /* 最后导航点到达标识（含转向）:
                                      00H：未到达最后导航点
                                      55H：到达最后导航点
                                      BBH：故障退出

                                   最后导航点到达，且GNC收到数管LVDS发送的最后一个动作静止标识后发送。
                                      1）初始：该项数据有效标示为无效
                                      2）正常运行后：每16ms有效标示均有效。
                                */

    float64 r_fyq;              /* 飞跃器本体在行走定位参考坐标系下的滚动角 */
    float64 p_fyq;              /* 飞跃器本体在行走定位参考坐标系下的俯仰角 */
    float64 y_fyq;              /* 飞跃器本体在行走定位参考坐标系下的偏航角 */
    float64 xn;                 /* 飞跃器机械系坐标原点在行走定位参考坐标系下的x坐标 */
    float64 yn;                 /* 飞跃器机械系坐标原点在行走定位参考坐标系下的y坐标 */
    float64 zn;                 /* 飞跃器机械系坐标原点在行走定位参考坐标系下的z坐标 */
    float64 SlopeAgl1;          /* 坡面角1 */
    float64 SlopeAgl2;          /* 坡面角2 */
    float64 d;                  /* 前进距离 */
    float64 TurnAgl;            /* 转弯角度 */

    unint32 Haznum;             /* 障碍数量 */
    unint08 HazIfin[1800];      /* 障碍包络信息 -- 障碍数量最大150，150*6*2 = 1800 */
} SWalkSendData;
typedef struct TAG_WALK_INSTRDEMAND_DATA
{
    unint32 PlanMode;           /* 采用的规划模式; 0x00:全局规划+局部规划行走, 0x11:仅局部规划行走, 0x22:地面规划行走 */
    unint32 WalkMode;           /* 具体采用的行走方式; 0x00:连续行走, 0x11:间断行走, 0x22:前方近处地形是否安全判断 */
    unint32 autogpState;        /* 自主选择目标点的方式; 0x00:正前方1个目标点, 0x02:正前方10m、7m目标点依次规划，无路径退出 */

    unint32 tgpNum;             /* 地面全局目标数量 */

    unint32 autoORdesign;       /* 自主选择目标，还是地面指定; 0:自主选择, 1:地面指定 */

    float64 tgpCSYS[21];        /* 地面全局目标点坐标 */

    unint32 VisOdoIF;           /* 是否开启视觉里程任务; 0:不开启, 1:开启 */

    unint32 WIFIreleaseIF;      /* 是否进行投放WIFI相机计算; 0:不进行投放计算, 1:投放计算 */
    unint32 GlobalLocIF;        /* 是否需要进行全局定位; 0:不自主进行全局定位, 1:进行全局定位 */        /* ??? 未使用, 待删除 */

    unint32 LplanSensor;        /* 局部感知选用的敏感器; 0:TOF相机, 1:光学地形敏感器 */
    unint32 SetPOSBasis;        /* 设置位置姿态基准; 0:不设置,
                                                    1:将当前位置置为起始点零点，同时将偏航角置为零位基准,
                                                    2:将当前位置置为起始点零点，偏航角基准不变,
                                                    3:将偏航角置为零位基准，位置基准不变,
                                                    4:位置置零，偏航角不变,
                                                    5:地面注入位置和姿态,
                                                    6:地面注入姿态
                                */
    unint32 ComPhoto2SMU;       /* 激光雷达采图指令自动下传 */
    unint32 ComPhoto2SMULocal;  /* TOF采图指令图像自动下传 */
    unint32 ComPhoto2SMUOts;    /* 光学地形图像自动下传 */

    unint32 LastSteerIF;        /* 最终目标点转向约束; 0：不约束, 1：需要约束 */

    unint32 BlobFiltIF;         /* 是否开启Blob滤波; 0：不开启, 1：开启 */
    unint32 TelePerception;     /* 地面拍图指令标识; 0：无意义
                                                    1：激光雷达拍图
                                                    2：局部TOF拍图
                                                    3：光学地形拍图
                                */
    unint32 TimeWatch;          /* 是否开启时间监控; 0：不开启, 1：开启 */

    unint32 SocAITTestFlag;     /* AIT测试姿态标志; 0：不开启, 1：开启 */
    unint32 DspAITTestFlag;     /* AIT测试规划标志; 0：不开启, 1：开启 */
    unint32 AccAttIF;           /* 是否开启加计定姿; 0：不开启, 1：开启 */
} SWalkInstrDemandData;
typedef struct TAG_WALK_ATTDATA
{
    float64 InitialYaw;         /* 落地时刻偏航角 */
    float64 r_b;                /* 当前本体滚动姿态 */
    float64 p_b;                /* 当前本体俯仰姿态 */
    float64 y_b;                /* 当前本体偏航姿态 */

    float64 Acc_r_b;            /* 加计确定滚动姿态（行走定位参考系） */
    float64 Acc_p_b;            /* 加计确定俯仰姿态（行走定位参考系） */

    unint32 AttValidIF;         /* 姿态有效标志, 地面注入修改 */
} SWalkAttData;
typedef struct TAG_WALK_MODE_DATA
{
    unint32 MultiPlanNum;           /* (行走) 当前处理到的全局目标点  */
    float64 Telerb;                 /* 当前本体滚动姿态（极区导航系） */
    float64 Telepb;                 /* 当前本体俯仰姿态（极区导航系） */
    float64 Teleyb;                 /* 当前本体偏航姿态（极区导航系） */

    float64 Telebx;                 /* 当前本体位置x坐标（极区导航系） */
    float64 Teleby;                 /* 当前本体位置y坐标（极区导航系） */
    float64 Telebz;                 /* 当前本体位置z坐标（极区导航系） */

    float64 xk[9];                  /* 滤波状态量: 其中xk[0], xk[1],xk[2]分别对应导航系下x,y,z方向位移；
                                                      xk[3], xk[4],xk[5]分别对应导航系下x,y,z方向速度；
                                                      xk[6], xk[7],xk[8]分别对应导航系下x,y,z方向线加速度
                                    */
    float64 Pk[9][9];               /* 系统方差阵，初值单位阵 */

    unint32 TaskNumber;             /* 当前所处的双机冷任务号 */

    siint32 SignValidLeg5;          /* 有效腿数量为0次数 */
    siint32 Num_ValidLeg;           /* 有效腿数量 */

    boolu32 LOFirstIF;              /* 腿式里程的首次处理判断 */

    boolu32 bVisionClFlag;          /* 图像采集标志 */
    boolu32 bVisodoCalIFlag;        /* 视觉里程结果是否计算完成 */

    boolu32 bVoFirstIF;             /* 进入该模式的第一帧视觉里程 */

    float64 VOShoot[20];            /* 视觉里程信息数据结构体，最大上限为20 */

    unint32 VOShootNum;             /* 处理图数目 */
    unint32 VOCalNum;               /* 视觉里程处理的帧数 */

    boolu32 bVisOdoFlag;            /* 视觉里程当前步是否启用标识, TRUE32:启用 */

    boolu32 bReLPFlag;              /* 连续行走无路径的再次规划标识 FALSE32:为可用对应文档0 */

    siint32 lpNum;                  /* 当前局部规划到全局的第几个点 */

    unint32 InconsisState;          /* 一次运动中着采行与GNC判断运动状态不一致的次数 */

    float64 RV[9];
    float64 QV[9];

    float64 AttBaseBoard;

    boolu32 GTime_Valid;
    boolu32 LTime_Valid;
    siint32 GTime;
    siint32 LTime;

    boolu32 DualModeJetEnable;      /* 双机冷模式下控制推进电磁阀使能标志 */

    siint32 STWalkFlg;              /* 行走动态星敏修正标志 */
} SWalkModeData;
typedef struct TAG_QUATERNION
{
    float64 q4[4];
} SQuater;
;
typedef struct TAG_GNC_CTRL_FLAG
{
    unint32 ZT1;                    /* 指定工作模式标志 */
    unint32 ZT2;                    /* 指定陀螺工作标志 */
    unint32 ZT3;                    /* 指定加计工作标志 */
    unint32 ZT4;                    /* 指定星敏工作标志 */
    unint32 ZT5;                    /* 指定285N发动机工作标志 */
    unint32 ZT6;                    /* 指定动态三维工作标志 */
    unint32 ZT7;                    /* 指定微波测距测速工作标志 */
    unint32 ZT8;                    /* 故障处理标志 */
    unint32 ZT9;                    /* 功能使能标志 */
    unint32 ZT10;                   /* 功能使能标志 */

    polymor flgWalkMode;            /* (行走模式切换)地面注入的指令, WALK_MODE_SWITCH_CMD_NULL */

    unint32 BZ1;                    /* 模式字 */
    unint32 BZ2;                    /* 陀螺使用标志 */
    unint32 BZ3;                    /* 加计使用标志 */
    unint32 BZ4;                    /* 星敏使用标志 */
    unint32 BZ7;                    /* 微波测距测速使用标志 */

    unint32 OldBZ7;                 /* 缓存BZ7 */

    unint32 BZ1Save;                /* 缓存4个控制周期的BZ1: HIHI8,当前控制周期; HILO8,上一个控制周期; LOHI8,上两个控制周期; LOLO8,上三个控制周期; */

    boolu32 bInerAtt;               /* 重新确定惯性基准标志IAFlg */

    boolu32 bTccmdZT1;              /* 遥控指定工作模式标志 */

    unint32 flgFailure;             /* 故障标志FailureFlg */
    unint32 SysFailureFlg;          /* 系统故障标志SysFailureFlg */

    unint32 SysFailureFlgEnable;    /* 系统故障诊断使能标志 */

    float64 SysFailFlgMrvsTime;     /* 系统故障微波诊断时间, s */

    siint32 BZ4Num;                 /* 起飞准备星敏可用性判断计数 */
    siint32 AFNNum;                 /* 起飞准备姿态角判断计数阈值 */
    siint32 deltaZNum;              /* 起飞准备星敏残差判断计数, δZNum */

    siint32 NumZT7;                 /* 当前引入测距信息修正的ZT7位数 */

    siint32 FlgPhi;                 /* 坑外滚动调姿新增变量 */
    boolu32 AVCFlgX;
    boolu32 AVCFlgY;
    boolu32 AVCFlgZ;

    unint32 UseZT2;                 /* 可用陀螺工作标志 */
    unint32 UseZT3;                 /* 可用加计工作标志 */

    siint32 GyrInvNum;              /* 陀螺无效累计计数 */
    siint32 AccInvNum;              /* 加计无效累计计数 */
} SGncCtrlFlag;
typedef struct TAG_STS_DATA_COMMON
{
    polymor flgCalibrate;           /* 星敏感器基准标定标志 */
                                    /* 0, 不进行标定；
                                       1, 表示以星敏感器A为基准标定星敏感器B；
                                       2, 表示由地面注入星敏感器B的标定数据；
                                       3, 表示以星敏感器A为基准标定着陆器星敏感器A；
                                       4, 表示以星敏感器A为基准标定着陆器星敏感器B；
                                       5, 表示以星敏感器A为基准标定着陆器星敏感器C；
                                       6, 表示由地面注入着陆器星敏感器A的标定数据；
                                       7, 表示由地面注入着陆器星敏感器B的标定数据；
                                       8, 表示由地面注入着陆器星敏感器C的标定数据；
                                       9，表示以星敏感器B为基准标定着陆器星敏感器A；
                                       10,表示以星敏感器B为基准标定着陆器星敏感器B；
                                       11,表示以星敏感器B为基准标定着陆器星敏感器C；
                                    */

    float64 deltaZrOld[3];          /* 上一控制周期星敏的残差(A或B) */
    float64 deltaZr[3];             /* 星敏的残差(A或B) */

    float64 gamma[3];               /* 光行差补偿 */

    unint32 cntDeltaZr;             /* 残差判定累计计数 */
} SStsDataCom;
typedef struct TAG_ATTI_DATA
{
    SQuater q;                  /* 姿态四元数q */
    SQuater q0;                 /* 姿态四元数q0 */
    SQuater qg;                 /* 姿态四元数qg */
    SQuater Q0;                 /* 前四子样姿态四元数(128ms采样使用) */
    SQuater Q1;                 /* 后四子样姿态四元数(128ms采样使用) */

    float64 cbi[3][3];          /* 姿态转换矩阵CBI */
    float64 cib[3][3];          /* 姿态转换矩阵CIB */

    SQuater qGI;                /* 目标姿态四元数qGI */
    float64 wGI[3];             /* 目标姿态角速度矢量ωGI */
    float64 eulerBT;            /* 姿态误差角EulerBT */
} SAttiData;
typedef struct TAG_THRU_CTRL
{
    float64 Tc[THRU_THRU_GROUP_NUM][3];         /* 所有推力器(6个285N+16个40N), 三轴控制力矩, 发动机顺序与sThruInsTimerParam相同 */

    float64 tNJSum;                             /* 为不喷气时间累积, 单位s */
    float64 Isp285N;                            /* 285N发动机标称比冲 */
    float64 F285;                               /* 285N发动机标称推力 */
    float64 I285[THRU_285N_GROUP_NUM][3];       /* 285N ??? */
    float64 Isp285[THRU_285N_GROUP_NUM];        /* 实时计算的285N发动机比冲, 初值同Isp285N */
    float64 Impulse285[THRU_285N_GROUP_NUM];    /* 285N发动机冲量 */

    float64 oldT285[THRU_285N_GROUP_NUM];       /* 285N ??? */
    float64 oldT40[THRU_40N_GROUP_NUM];         /* 40N ??? */
    float64 Fest[THRU_285N_GROUP_NUM];          /* 285N ??? */
    float64 Test[THRU_285N_GROUP_NUM];          /* 285N ??? */

    boolu32 bRecv285TempErr;                    /* 收到超温消息标志 */
    unint32 Flg_285TempErr;                     /* 发动机超温标志, 0xFF表示无285N发动机超温, 0x91~0x96分别表示AF1~AF3、BF1~BF3 */
    unint32 Fault285k;                          /* 故障285N发动机编号，9表示无故障 */
    unint32 F285WMNum;                          /* 累计计数器 */

    polymor flgAutoSeqLVF;                      /* 推进自锁阀自主序列标志, THRU_LVF_AUTO_SEQ_NULL */
    unint32 cycleStart;                         /* 推进自锁阀自主序列节拍计数 */

    boolu32 bAttFlg;                            /* 标志 */
    polymor FlagSP;                             /* 285N错峰延时标志: 0表示6台285N同时开机; 1表示4台285N同时开机; 2表示2台285N同时开机 */
    polymor FlagSP40;                           /* 40N错峰延时标志: 0表示不延时; 1表示延时 */

    boolu32 Flg_285TempEnable;                  /* 285N发动机温度监测使能标志 */
} SThruCtrl;
typedef struct TAG_ATTI_CTRL
{
    boolu32 bAVCtrl;        /* 角速度区控制标志AVCFlg */

    float64 angleErr[3];    /* 三轴姿态角偏差 */
    float64 rateErr[3];     /* 三轴姿态角速度偏差 */

    float64 I[3];           /* 积分项I */

    float64 Iy4;            /* BZ1=4时积分项Iy */
    float64 Iz4;            /* BZ1=4时积分项Iz */

    float64 PWI[3];         /* 脉冲调宽控制累积脉宽 */

    float64 PwLY;           /* 腰部40N水平机动脉宽 */
    float64 PwLZ;           /* 腰部40N水平机动脉宽 */

    float64 TcAxis[3];      /* 三轴姿控力矩Tcx/Tcy/Tcz */

    float64 TJAxis[3];      /* 三轴姿控脉宽TJx/TJy/TJz */

    float64 T40x;           /* 姿控脉宽累积, 腰部40N */
    float64 T40yz;          /* 姿控脉宽累积, 底部40N */
} SAttiCtrl;
typedef struct TAG_GYRO_DATA
{
    float64 vecVG[IMU_HEAD_NUM][3];             /* 陀螺1~6安装矢量 */

    float64 dgLastCycle[IMU_HEAD_NUM];          /* 上一控制周期测量数据(128ms采样使用) */
    float64 dgLastCycle16ms[IMU_HEAD_NUM];      /* 上一控制周期测量数据(16ms采样使用) */

    float64 dg[IMU_HEAD_NUM];                   /* 当前控制周期测量数据(经过常值漂移修正) (陀螺128ms角度增量, rad) */
    float64 dgo[IMU_HEAD_NUM];                  /* 当前控制周期测量数据(未经过常值漂移修正) */
    float64 dgg[IMU_HEAD_NUM];                  /* 当前控制周期测量数据 ??? */
    float64 Olddg[IMU_HEAD_NUM][IMU_HIS_CACHE_NUM];    /* 缓存历史陀螺数据（共10拍） */

    float64 dgt[IMU_OCTO_NUM][3];               /* Δt1周期三轴角度增量Δgtm(128ms采样使用) */
    float64 dgt16ms[3];                         /* Δt1周期三轴角度增量Δgtm(16ms采样使用) */

    float64 dgt0[3];                            /* 单个Δt1周期三轴角度增量Δgt0 */

    float64 w[3];                               /* 三轴绝对角速度, rad/s */
    float64 wg[3];                              /* 三轴绝对角速度, rad/s ??? */
    float64 dggt[3];                            /* ???, rad/s */

    float64 w8[3];                              /* 当前控制周期第八子样三轴角速度, rad/s */
    float64 oldw8[3];                           /* 上一控制周期第八子样三轴角速度, rad/s */

    siint32 gyroPulseOld[IMU_OCTO_NUM][IMU_HEAD_NUM];   /* 缓存上一控制周期八子样陀螺1~6脉冲增量(128ms采样使用) */
    siint32 gyroPulseOld16ms[IMU_HEAD_NUM];     /* 缓存上一个16ms采样陀螺1~6脉冲增量(16ms采样使用) */

    siint32 cntGyroOut[IMU_HEAD_NUM];           /* 剔野计数 */
    siint32 cntConst[IMU_HEAD_NUM];             /* 常值计数 */

    float64 PHI[3];                             /* 没有找到变量意义注释 */
} SGyroData;
typedef struct TAG_LEN3_VECTOR
{
    float64 d3[3];
} S3Vector;
typedef struct TAG_IMU_PARAM
{
    /* IMU组件在机械系下的安装位置 */
    float64 pacc1[3];                               /* IMU组件1（编号1、3、5） */
    float64 pacc2[3];                               /* IMU组件2（编号2、4、6） */

    /* IMU当量和安装系数 */
    float64 coefPulseGyro[IMU_HEAD_NUM];            /* 陀螺1~6脉冲当量系数, °/^ */
    float64 coefPulseAccePos[IMU_HEAD_NUM];         /* 加计1~6正脉冲当量系数, (s•g0)/^ */
    float64 coefPulseAcceNeg[IMU_HEAD_NUM];         /* 加计1~6负脉冲当量系数, (s•g0)/^ */
    float64 vecVG0[IMU_HEAD_NUM][3];                /* 陀螺1~6安装矢量 */
    float64 vecVA0[IMU_HEAD_NUM][3];                /* 加计1~6安装矢量 */

    float64 dGxy1;                                  /* 陀螺1安装补偿量 */
    float64 dGxz1;                                  /* 陀螺1安装补偿量 */
    float64 dGyx1;                                  /* 陀螺3安装补偿量 */
    float64 dGyz1;                                  /* 陀螺3安装补偿量 */
    float64 dGzx1;                                  /* 陀螺5安装补偿量 */
    float64 dGzy1;                                  /* 陀螺5安装补偿量 */
    float64 dGxy2;                                  /* 陀螺2安装补偿量 */
    float64 dGxz2;                                  /* 陀螺2安装补偿量 */
    float64 dGyx2;                                  /* 陀螺4安装补偿量 */
    float64 dGyz2;                                  /* 陀螺4安装补偿量 */
    float64 dGzx2;                                  /* 陀螺6安装补偿量 */
    float64 dGzy2;                                  /* 陀螺6安装补偿量 */

    float64 dAxy1;                                  /* 加计1安装补偿量 */
    float64 dAxz1;                                  /* 加计1安装补偿量 */
    float64 dAyx1;                                  /* 加计3安装补偿量 */
    float64 dAyz1;                                  /* 加计3安装补偿量 */
    float64 dAzx1;                                  /* 加计5安装补偿量 */
    float64 dAzy1;                                  /* 加计5安装补偿量 */
    float64 dAxy2;                                  /* 加计2安装补偿量 */
    float64 dAxz2;                                  /* 加计2安装补偿量 */
    float64 dAyx2;                                  /* 加计4安装补偿量 */
    float64 dAyz2;                                  /* 加计4安装补偿量 */
    float64 dAzx2;                                  /* 加计6安装补偿量 */
    float64 dAzy2;                                  /* 加计6安装补偿量 */

    /* IMU零偏系数 */
    polymor flgZeroAcce;                            /* 加计零位估计标志, IMU_ACCE_ZERO_NO_PROC */
    float64 coefZeroAcce;                           /* 加计零位估计系数 */
    float64 lmtZeroAcce;                            /* 加计零位限幅, m/s2 */
    float64 zeroAcceAsn0Init[IMU_HEAD_NUM];         /* 加计1~6零位偏差初始装订值, m/s2 */
    float64 zeroAcceAsn0Inj[IMU_HEAD_NUM];          /* 加计1~6零位偏差地面注入值, m/s2 */

    float64 constDriftGyro[IMU_HEAD_NUM];           /* 陀螺1~6常值漂移, bn, rad/h */
    float64 constDriftEstiGyro[IMU_HEAD_NUM];       /* 陀螺1~6常值漂移估计值, btn, rad/h */

    float64 wOutGyro;                               /* 陀螺数据剔野角速度阈值, ωout, rad/s */
    float64 wOutGyroM;                              /* 陀螺数据剔野角速度阈值(行走), Mωout, rad/s */
    float64 dgMaxGyro;                              /* 陀螺数据饱和角度增量阈值, rad */
    siint32 lmtNumOutGyro;                          /* 陀螺数据剔野计数阈值 */
    siint32 lmtNumConstGyro;                        /* 陀螺数据常值计数阈值 */
    siint32 lmtNumConstGyroM;                       /* 陀螺数据常值计数阈值(行走) */

    float64 mg;                                     /* 陀螺故障判别阈值因子 */
    float64 mg0;                                    /* 陀螺故障判别因子0 */
    float64 mg2;                                    /* 陀螺故障判别因子2 */

    float64 aOutAcce;                               /* 加计数据剔野加速度阈值, aout, m/s2 */
    float64 aOutAcceM;                              /* 加计数据剔野加速度阈值(行走), Maout, m/s2 */
    float64 dvMaxAcce;                              /* 加计数据饱和速度增量阈值, m/s */
    siint32 lmtNumOutAcce;                          /* 加计数据剔野计数阈值 */
    siint32 lmtNumConstAcce;                        /* 加计数据常值计数阈值 */
    siint32 lmtNumConstAcceM;                       /* 加计数据常值计数阈值(行走) */

    float64 ma;                                     /* 加计故障判别阈值因子 */
    float64 ma0;                                    /* 加计故障判别因子0 */
    float64 ma2;                                    /* 加计故障判别因子2 */

    float64 g0;                                     /* 重力加速度(地球), m/s2 */

    float64 kNJ1;                                   /* 不喷气时间累积系数1 */
    float64 kNJ2;                                   /* 不喷气时间累积系数2 */

    float64 wAZ;                                    /* 滑行加计零位估计角速度阈值, ωAZ, rad/s */

    siint32 NIMUFault;                              /* IMU连续故障检测计数器 */

    siint32 NImuDiag;                               /* 陀螺 处理历史数据时的平均拍数 */
} SImuParam;
typedef struct TAG_ATTI_HISTORY_DATA
{
    SQuater  qIns[ATT_HISTORY_BUFF_NUM][IMU_OCTO_NUM];  /* 缓存10拍历史数据 */
    S3Vector rIns[ATT_HISTORY_BUFF_NUM][IMU_OCTO_NUM];  /* 缓存10拍历史数据 */
    S3Vector vIns[ATT_HISTORY_BUFF_NUM][IMU_OCTO_NUM];  /* 缓存10拍历史数据 */
    siint32 indexIns;           /* 指向缓存10拍历史数据最新一拍数据的游标, 范围0~9 */
    siint32 indexInsCycle;      /* 指向缓存每拍8子样历史数据最新子样数据的游标, 范围0~7 */
} SAttiHistoryData;
typedef struct TAG_ACCE_DATA
{
    float64 vecVA[IMU_HEAD_NUM][3];             /* 加计1~6安装矢量 */

    float64 dvLastCycle[IMU_HEAD_NUM];          /* 上一控制周期测量数据(128ms采样) */
    float64 dvLastCycle16ms[IMU_HEAD_NUM];      /* 上一控制周期测量数据(16ms采样) */

    float64 as[IMU_HEAD_NUM];                   /* 当前控制周期测量数据 */
    float64 as0[IMU_HEAD_NUM];                  /* 加计零位 */

    float64 dvBm[IMU_OCTO_NUM][3];              /* Δt1周期三轴加速度(128ms采样) */
    float64 dvBm16ms[3];                        /* Δt1周期三轴加速度(16ms采样) */

    float64 aB[3];                              /* 三轴加速度矢量, m/s2 */

    float64 Oldas[IMU_HEAD_NUM][ATT_HISTORY_BUFF_NUM];    /* 缓存历史加计数据（共10拍） */

    siint32 accePulseOld[IMU_OCTO_NUM][IMU_HEAD_NUM];   /* 缓存上一控制周期八子样加计1~6脉冲增量 */
    siint32 accePulseOld16ms[IMU_HEAD_NUM];     /* 缓存上一控制周期八子样加计1~6脉冲增量 */

    siint32 cntAcceOut[IMU_HEAD_NUM];           /* 剔野计数 */
    siint32 cntConst[IMU_HEAD_NUM];             /* 常值计数 */
} SAcceData;
typedef struct TAG_DODY_DATA
{
    float64 Jb[3][3];       /* 本体系惯量Jb */

    float64 pgoF[3];        /* 质心在飞跃器机械系下的坐标PgoF */

    float64 Itotal[3];      /* 冲量累积Itotal */
    float64 Htotal[3];      /* 冲量矩累积Htotal(考虑质心变化) */
    float64 HtotalP[3];     /* 冲量矩累积HtotalP(不考虑质心变化) */

    float64 mass;           /* 飞跃器质量 */

    float64 hgo;            /* 机械系X向质心位置 */
    float64 ygo;            /* 机械系Y向质心位置 */
    float64 zgo;            /* 机械系Z向质心位置 */
} SBodyData;
typedef struct TAG_WALK_REC_DATA
{
    float64 legPos[6][3];       /* 六腿的足端位置信息 */
    float64 legSpeed[6][3];     /* 六腿的足端速度信息 */
    float64 walkspeed;          /* 当前整器参考速度 */

    unint08 ContactStatus[6];   /* 六腿的触地状态量 */
    unint08 ShelterType[3];     /* 当前时刻步态的遮挡类型, -Z侧TOF/+Z侧TOF/光学相机镜头 */
    unint08 ReachStatus;        /* GNC规划路径点到达标识（含移动及转向） */
    unint08 WalkStatus;         /* 飞跃器行走过程中的状态量: 55H表示行进, AAH表示原地转弯, EEH表示静止, FFH表示数据无意义，CCH表示故障模式 */
    unint08 walkgaits;          /* 当前步态信息 */
    unint08 WIFIHshakeSig;      /* WIFI相机释放标识反馈信息 */
} SWalkRecData;
typedef struct TAG_TIME
{
    llong64 countPeriod;        /* 上电累计周期计数器 */
    ulong64 periodOld;          /* 上拍周期信号锁存星时计数 */
    float64 tRaw;               /* 控制周期头计算“上一个控制周期内硬件累计星时”,单位s */

    float64 sstime;             /* 星时,单位s */

    siint16 cycleTag;           /* 1553B时标寄存器控制周期读取值 */
} STime;
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
typedef struct TAG_STS_RAW
{
    boolu32 bDataValid;             /* 数据有效性标志 */
    polymor flgAbnormal;            /* 数据包解析错误码 */

    siint32 attQuat[4];             /* 姿态矢量源码,2^-30 */
    siint32 attRate[3];             /* 角速率源码,2^-11 */

    float64 qv[4];                  /* 姿态四元数, 0/1/2为姿态矢量, 3为姿态标量 */
    float64 rate[3];                /* 角速率X/Y/Z, deg/s */

    float64 tS;                     /* 测量时刻, s */
    float64 tSTM;                   /* 测量相对时刻, s, 遥测 */

    siint32 tIntegOffset;           /* 积分中心时刻偏移量, us */

    unint32 cntRecvSync;            /* 星敏接收校时计数 */

    unint08 numStarsExtract;        /* 提取星数 */
    unint08 numStarsIdentify;       /* 识别星数 */

    unint08 status;                 /* 状态标志 */
    unint08 quality;                /* 质量标志 */

    /* 数据区 */
    unint08 data[60];               /* 数据长度为STS_TM_ADB_LEN */
} SStsRaw;
typedef struct TAG_STS_DATA
{
    float64 dtS;                    /* 星敏测量延时 */

    float64 deltaZ[3];              /* 星敏残差 */
    float64 deltaZm;                /* 星敏残差 */

    float64 tmpXI[3];
    float64 tmpYI[3];
    float64 tmpZI[3];
    float64 tmpQ[4];

    siint32 attQuatOld[4];          /* 缓存上一控制周期星敏姿态矢量源码,2^-30 */

    siint32 cntConst;               /* 常值计数 */
    siint32 cntDeltaZm;             /* 残差判定累计计数 */
} SStsData;
typedef struct TAG_WALK_POINTTODATA
{
    float64 RstarVec[3];        /* 中继星矢量 */
    float64 SunVec[3];          /* 太阳矢量 */
} SWalkPointToData;
typedef struct TAG_STS_PROC_PARAM
{
    float64 dNormq;             /* 星敏数据模值判断阈值 */
    float64 tValid;             /* 星敏数据有效性判断时间阈值 */
    float64 ASTSV;              /* 星敏数据有效性判断角度阈值, ASTSV, rad */
    float64 ASTSV2;             /* 动力过程星敏有效性判断角度阈值, ASTSV2, rad */
    float64 theta;              /* 星敏数据夹角判断阈值, rad */
    float64 deltaZrMax;         /* 星敏捕获角度阈值, rad */
    float64 deltaZMax;          /* 星敏修正残差限幅阈值, rad */

    float64 tsUP;               /*  */
    float64 wSTSFlg;            /* 动力过程星敏有效性判断角速度阈值, ωSTSFlg, rad/s */

    float64 calibK;             /* 星敏安装标定修正系数 */
    float64 thetaSMax;          /* 星敏安装误差标定限幅, rad */

    float64 CBS[5][3][3];       /* 星敏感器测量轴在本体坐标系中安装矢量 */
    float64 CBSR[5][3][3];      /* 星敏感器测量轴在本体坐标系中标定安装矢量 */

    float64 calibErr[3];        /* 被标定星敏在轨标定安装误差角(飞跃器星敏感器B、着陆器星敏感器A/B/C共用数据) */

    siint32 lmtNumConst;        /* 星敏常值判断最大计数阈值 */
    siint32 lmtNumDeltaZr;      /* 星敏残差判断计数阈值 */
    siint32 lmtNumUnMd;         /* 星敏连续未引入次数 */
} SStsProcParam;
typedef struct TAG_ATTI_MODIFY_PARAM
{
    float64 a12;                /* 陀螺姿态预估中加速度计修正因子, a12 */
    float64 a23;                /* 陀螺姿态预估中加速度计修正因子, a23 */
    float64 a34;                /* 陀螺姿态预估中加速度计修正因子, a34 */
    float64 a13;                /* 陀螺姿态预估中加速度计修正因子, a13 */
    float64 a24;                /* 陀螺姿态预估中加速度计修正因子, a24 */
    float64 a14;                /* 陀螺姿态预估中加速度计修正因子, a14 */

    float64 cBF[3][3];          /* 机械系到本体系的姿态转换矩阵CBF */

    float64 cFBF[3][3];         /* 导航本体坐标系相对机械坐标系的转换矩阵CFBF */

    float64 Q[3];               /* 系统方差阵 */
    float64 R[5][3][3];         /* 测量方差阵RA/RB/RAZ/RBZ/RCZ */

    float64 KS[5][6][3];        /* 姿态四元数修正系数KS */
    float64 KST[5][6][3];       /* 陀螺在轨标定修正系数KS */

    float64 mKSq[5];            /* KS前三行修正系数 */
    float64 mKSb[5];            /* KS后三行修正系数 */

    float64 mKS2;               /* 飞跃动力过程星敏滤波修正放大系数 */
    float64 mKS5;               /* 滑行模式星敏滤波修正放大系数 */
    float64 wsDb;               /* 陀螺漂移不修正时角速度阈值ωsΔb, rad/s */
    float64 bMax;               /* 陀螺漂移估计限幅阈值, rad/h */
    float64 wMax;               /* 陀螺最大角速度, rad/s */
    float64 gGyro;              /* 标定期间陀螺有效性检测的门限Ggyro, rad/s */

    float64 mass0;              /* 飞跃器干重, kg */
    float64 massmax;            /* 飞跃器动力下降段最大质量 */
    float64 massmin;            /* 飞跃器动力下降段最小质量 */

    float64 para[4][3];         /* Para质量特性拟合参数 */

    float64 Ixy;                /* 惯量积取值Ixy */
    float64 Ixz;                /* 惯量积取值Ixz */
    float64 Iyz;                /* 惯量积取值Iyz */

    float64 ygo0;               /* 机械系Y向质心初值 */
    float64 zgo0;               /* 机械系Z向质心初值 */

    float64 kgo;                /* 质心估计系数 */
    float64 gomax;              /* 质心估计限幅 */

    float64 LmtPhi;             /* 启动滚动调姿角度判断阈值 */
    float64 dot_rI_aIc;         /* 制导推力方向与月心方向夹角余弦保护阈值 */

    siint32 GyrInvMaxN;         /* 陀螺小于3个判断最大次数 */
    siint32 AccInvMaxN;         /* 加计小于3个判断最大次数 */
} SAttiModifyParam;
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
typedef struct TAG_WALK_CTRL_FLAG
{
    unint32 Task;               /* 任务完成标志 */
    unint32 MoveFlag;           /* 运动状态标志 */
    unint32 TurnFlag;           /* 转向状态标志 */
    unint32 AutoPlan;           /* 自主全局规划标志 */
    unint32 AvoidObs;           /* 自主局部规划标志 */
    unint32 VisOdo;             /* 视觉里程标志 */

    unint32 nVOPcpt;            /* TOF拍图启用标志 */
} SWalkCtrlFlag;

/* --- 全局变量定义 --- */
SNaviData sNaviData;
SWalkSendData sWalkSendData;
SWalkAttData sWalkAttData;
SWalkInstrDemandData sWalkInstrDemandData;
SWalkModeData sWalkModeData;
SGncCtrlFlag sGncCtrlFlag;
SStsDataCom sStsDataCom;
SAttiData sAttiData;
SAttiCtrl sAttiCtrl;
SThruCtrl sThruCtrl;
SGyroData sGyroData;
SAttiHistoryData sAttiHistoryData;
SImuParam sImuParam =
{
    /* IMU组件1（编号1、3、5） */
    { 0.236,  0.64, 0.535 },

    /* IMU组件2（编号2、4、6） */
    { 0.236, -0.65, -0.56 },

    /* 陀螺1~6脉冲当量系数, 25000, °/^ */
    { 0.0000396691511865969, 0.0000398227433939694, 0.0000398148786513369, 0.0000396647048887054, 0.0000398807516074804, 0.0000397755991161830 },

    /* 加计1~6正脉冲当量系数, 50000, (m/s)/^ */
    { 0.000192020330190863, 0.000193027823435828, 0.000188683987303228, 0.000193828173688729, 0.000193036855619570, 0.000193939397700643 },

    /* 加计1~6负脉冲当量系数, 50000, (m/s)/^ */
    { 0.000191873869179360, 0.000192953984256653, 0.000188594822412043, 0.000193814409252421, 0.000192883627983649, 0.000193834188730069 },

    /* 陀螺1~6安装矢量 */
    {
        { 0.578482350356536, -0.421211627830389, -0.698526259281963 },
        { 0.579403091371876,  0.419370262855396,  0.698870975460643 },
        { 0.577130911723291,  0.816517402791436, -0.014806811681489 },
        { 0.577507512444541, -0.816251785824289,  0.014768046884314 },
        { 0.577197408670249, -0.395430276954121,  0.714477464649751 },
        { 0.576490943019366,  0.395657875466674, -0.714921700746201 }
    },

    /* 加计1~6安装矢量 */
    {
        { 0.577200047052889, -0.422209264668057, -0.698984579594286 },
        { 0.578628356983071,  0.420368952189304,  0.698912847592845 },
        { 0.576773331126901,  0.816761325833737, -0.015279434645751 },
        { 0.576578480437783, -0.816918454837569,  0.014194859698333 },
        { 0.577570615789756, -0.393950235597262,  0.714993283639157 },
        { 0.576350359851754,  0.396183761763381, -0.714743792987228 }
    },

    /* 陀螺1~6安装补偿量 */
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0,

    /* 加计1~6安装补偿量 */
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0,

    /* IMU零偏系数 */
    IMU_ACCE_ZERO_NO_PROC,    /* 加计零位估计标志 */
    0.001,                    /* 加计零位估计系数 */
    0.1,                      /* 加计零位限幅, m/s2 */

    /* 加计1~6零位偏差初始装订值, m/s2 */
    { -0.007182517335930, -0.005685802581800, -0.005614419834648, -0.011073642056400, -0.016443192085012, -0.012232169664000 },

    /* 加计1~6零位偏差地面注入值, m/s2 */
    { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

    /* 陀螺1~6常值漂移, rad/h */
    { 0.009053022830095, 0.009056513488599, 0.005939355444537, 0.009313076888642, 0.007721336610823, 0.006832964021558 },

    /* 陀螺1~6常值漂移估计值, rad/h */
    { 0.009053022830095, 0.009056513488599, 0.005939355444537, 0.009313076888642, 0.007721336610823, 0.006832964021558 },

    /* 陀螺数据剔野角速度阈值, ωout, rad/s */
    0.35,

    /* 陀螺数据剔野角速度阈值(行走), Mωout, rad/s */
    0.1745,

    /* 陀螺数据饱和角度增量阈值, rad */
    0.028,

    /* 陀螺数据剔野计数阈值 */
    16,

    /* 陀螺数据常值计数阈值 */
    5,

    /* 陀螺数据常值计数阈值(行走) */
    600,

    /* 陀螺故障判别阈值因子 */
    0.2,

    /* 陀螺故障判别因子0 */
    0.2,

    /* 陀螺故障判别因子2 */
    1.0,

    /* 加计数据剔野加速度阈值, aout, m/s2 */
    35.0,

    /* 加计数据剔野加速度阈值(行走), Maout, m/s2 */
    23.2,

    /* 加计数据饱和速度增量阈值, m/s */
    3.29,

    /* 加计数据剔野计数阈值 */
    16,

    /* 加计数据常值计数阈值 */
    5,

    /* 加计数据常值计数阈值(行走) */
    600,

    /* 加计故障判别阈值因子 */
    0.2,

    /* 加计故障判别因子0 */
    0.2,

    /* 加计故障判别因子2 */
    1.0,

    /* 重力加速度(地球), m/s2 */
    9.8015,

    /* 不喷气时间累积系数1 */
    3.0,

    /* 不喷气时间累积系数2 */
    1.5,

    /* 滑行加计零位估计角速度阈值, ωAZ, rad/s */
    0.01745,

    /* IMU连续故障检测计数器 */
    8,

    /* 陀螺 处理历史数据时的平均拍数 */
    5
};
SAcceData sAcceData;
SBodyData sBodyData;
SWalkRecData sWalkRecData;
STime sTime;
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
SStsData sStsData[DEV_NUM_STS_ALL];
SStsRaw sStsRaw[DEV_NUM_STS_ALL];
SWalkPointToData sWalkPointToData;
SStsProcParam sStsProcParam =
{
    0.05,       /* 星敏数据模值判断阈值 */
    1.0,        /* 星敏数据有效性判断时间阈值 */
    0.01745,    /* 星敏数据有效性判断角度阈值, ASTSV, rad, 对应1° */
    0.008727,   /* 动力过程星敏有效性判断角度阈值, ASTSV2, rad, 对应0.5° */
    0.01745,    /* 星敏数据夹角判断阈值, rad, 对应1°*/
    0.01745,    /* 星敏捕获角度阈值, rad, 对应1° */
    0.01745,    /* 星敏修正残差限幅阈值, rad, 对应1° */

    0.0,        /*  */
    0.01745,    /* 动力过程星敏有效性判断角速度阈值, ωSTSFlg, rad/s, 对应1°/s */

    0.001,      /* 星敏安装标定修正系数 */
    0.01745,    /* 星敏安装误差标定限幅, rad, 对应1° */

    /* 星敏感器测量轴在本体坐标系中安装矢量 */
    {
        /* 飞跃器星敏A */
        {
            /*       XAB                 YAB                    ZAB      */
            { -0.001036241797244,     -0.100748685646516,    0.994911367179729 },
            { -0.514222070801417,      0.853346753433685,    0.085877705517160 },
            { -0.857656451094283,     -0.511516393427121,   -0.052691471337124 }
        },

        /* 飞跃器星敏B */
        {
            /*       XBB                    YBB                    ZBB      */
            { -0.052030802323644,     -0.102547604364848,    0.993366389832367 },
            { -0.517867599639449,      0.853285892187856,    0.060961753885941 },
            { -0.853877008036422,     -0.511260378899252,   -0.097503231303180 }
        },

        /*  着陆器星敏A */
        {
            /*       XAZB                   YAZB                    ZAZB      */
            { -0.496662403508957,    -0.363820759397872,     0.788010730873547 },
            { -0.601948299011850,     0.798462756977980,    -0.010745745012026 },
            { -0.625287695590954,    -0.479678726597584,    -0.615567719257821 }
        },

        /* 着陆器星敏B */
        {
            /*       XBZB                   YBZB                    ZBZB      */
            {  0.254953308652095,     0.560390844353731,     0.788010730873547 },
            { -0.726697682606366,    -0.426569318391262,     0.538469214256258 },
            {  0.637894417989283,    -0.709930079776683,     0.298479468852360 }
        },

        /* 着陆器星敏C */
        {
            /*       XCZB                   YCZB                    ZCZB      */
            { -0.566947041385740,    -0.654653440080885,    -0.499999925654213 },
            { -0.080195068003599,     0.647957658035612,    -0.757442819268163 },
            {  0.819841328143352,    -0.389332437363325,    -0.419857654312600 }
        }
    },

    /* 星敏感器测量轴在本体坐标系中标定安装矢量(初始装订同星敏感器测量系坐标轴在本体坐标系中的表示) */
    {
        /* 飞跃器星敏A(不使用) */
        {
            /*       XAR                 YAR                    ZAR      */
            {               0.0,  -0.104528463267653,   0.994521895368273 },
            {-0.515038074910054,   0.852471648541971,   0.089598380705674 },
            {-0.857167300702112,  -0.512216642446374,  -0.053836138494679 }
        },

        /* 飞跃器星敏B */
        {
            /*       XBR                 YBR                    ZBR      */
            {-0.052335956242944,  -0.104384393414461,   0.993158833976515 },
            {-0.514332233128319,   0.855288821624417,   0.062790591026975 },
            {-0.855992582706984,  -0.507528079087030,  -0.098451792824107 }
        },

        /* 着陆器星敏A */
        {
            /*       XAZR                   YAZR                    ZAZR      */
            { -0.496662403508957,    -0.363820759397872,     0.788010730873547 },
            { -0.601948299011850,     0.798462756977980,    -0.010745745012026 },
            { -0.625287695590954,    -0.479678726597584,    -0.615567719257821 }
        },

        /* 着陆器星敏B */
        {
            /*       XBZR                   YBZR                    ZBZR      */
            {  0.254953308652095,   0.560390844353731,   0.788010730873547 },
            { -0.726697682606366,  -0.426569318391262,   0.538469214256258 },
            {  0.637894417989283,  -0.709930079776683,   0.298479468852360 }
        },

        /* 着陆器星敏C */
        {
            /*       XCZR                   YCZR                    ZCZR      */
            { -0.566947041385740,  -0.654653440080885,  -0.499999925654213  },
            { -0.080195068003599,   0.647957658035612,  -0.757442819268163  },
            {  0.819841328143352,  -0.389332437363325,  -0.419857654312600  }
        }
    },

    /* 星敏感器在轨标定安装误差角(共用) */
    {0.0, 0.0, 0.0},

    /* 星敏常值判断最大计数阈值 */
    5,

    /* 星敏残差判断计数阈值 */
    5,

    /* 星敏连续未引入次数 */
    4687
};
SAttiModifyParam sAttiModifyParam =
{
    214.0/315.0,    /* 陀螺姿态预估中加速度计修正因子, a12 */
    214.0/315.0,    /* 陀螺姿态预估中加速度计修正因子, a23 */
    214.0/315.0,    /* 陀螺姿态预估中加速度计修正因子, a34 */
    46.0/105.0,     /* 陀螺姿态预估中加速度计修正因子, a13 */
    46.0/105.0,     /* 陀螺姿态预估中加速度计修正因子, a24 */
    54.0/105.0,     /* 陀螺姿态预估中加速度计修正因子, a14 */

    /* 机械系到本体系的姿态转换矩阵 */
    {
        { 1.0,  0.0,                0.0               },
        { 0.0,  0.857167300702112,  0.515038074910054 },
        { 0.0, -0.515038074910054,  0.857167300702112 }
    },

    /* 导航本体坐标系相对机械坐标系的转换矩阵CFBF */
    {
        { 0.0,               -1.0,                0.0 },
        { 0.0,                0.0,                1.0 },
        {-1.0,                0.0,                0.0 }
    },

    /* 系统方差阵 */
    { 3.084259E-04, 3.084259E-04, 3.084259E-04},

    /* 测量方差阵RA/RB/RAZ/RBZ/RCZ */
    {
        /* 飞跃器星敏A测量方差阵RA */
        {
            {  2.093210010250047,  0.180958082609238, -0.108730585534628 },
            {  0.180958082609238,  0.100918809890746, -0.009795746521473 },
            { -0.108730585534628, -0.009795746521473,  0.090501828259482 }
        },

        /* 飞跃器星敏A测量方差阵RB */
        {
            {  2.087702339294345,  0.126641352785445, -0.198565868284963 },
            {  0.126641352785445,  0.092622610222890, -0.012553951896573 },
            { -0.198565868284963, -0.012553951896573,  0.104299775989056 }
        },

        /* 着陆器星敏A测量方差阵RAZ */
        {
            {  1.345652688562578, -0.017196186185187, -0.985079870972372 },
            { -0.017196186185187,  0.084850446534118,  0.013433087514194 },
            { -0.985079870972372,  0.013433087514194,  0.854127513303661 }
        },

        /* 着陆器星敏B测量方差阵RBZ */
        {
            {  1.345652688562571,  0.861700780446516,  0.477650317692885 },
            {  0.861700780446516,  0.673439583924359,  0.326391483238079 },
            {  0.477650317692885,  0.326391483238079,  0.265538375913415 }
        },

        /* 着陆器星敏C测量方差阵RCZ */
        {
            {  0.592311498605136,  0.769100809779306,  0.426319787724514 },
            {  0.769100809779306,  1.249715894502626,  0.645825819876579 },
            {  0.426319787724514,  0.645825819876579,  0.442603255292568 }
        }
    },

    /* 姿态四元数修正系数KS */
    {
        /* 飞跃器星敏A修正系数KSA */
        {
            {  0.002499371874387, -0.000418445992884,  0.000251427718314 },
            { -0.000418445992884,  0.007106329781037,  0.000022651604284 },
            {  0.000251427718314,  0.000022651604284,  0.007130417924317 },
            { -0.081390034051200,  0.034290947549703, -0.020604079971755 },
            {  0.034290947549697, -0.458922510468781, -0.001856260993345 },
            { -0.020604079971753, -0.001856260993345, -0.460896493424355 }
        },

        /* 飞跃器星敏B修正系数KSB */
        {
            {  0.002512096928870, -0.000292845115548,  0.000459163167188 },
            { -0.000292845115548,  0.007125513802094,  0.000029029723806 },
            {  0.000459163167188,  0.000029029723806,  0.007098511556122 },
            { -0.082432767386143,  0.023998170252163, -0.037627658016608 },
            {  0.023998170252164, -0.460494608576458, -0.002378937592856 },
            { -0.037627658016607, -0.002378937592856, -0.458281819420655 }
        },

        /* 着陆器星敏A修正系数KSAZ */
        {
            {  0.004228017322001,  0.000039764320545,  0.002277890651447 },
            {  0.000039764320545,  0.007143486133281, -0.000031062561900 },
            {  0.002277890651447, -0.000031062561900,  0.005364616124459 },
            { -0.223049630233673, -0.003258619399745, -0.186669319771259 },
            { -0.003258619399745, -0.461967411238770,  0.002545524868179 },
            { -0.186669319771241,  0.002545524868178, -0.316191996471893 }
        },

        /* 着陆器星敏A修正系数KSBZ */
        {
            {  0.004228017322001, -0.001992589849782, -0.001104514695097 },
            { -0.001992589849781,  0.005782437417220, -0.000754745001180 },
            { -0.001104514695097, -0.000754745001180,  0.006725664840520 },
            { -0.223049630233676,  0.163289397410523,  0.090513127432236 },
            {  0.163289397410507, -0.350431750893854,  0.061850087440157 },
            {  0.090513127432231,  0.061850087440160, -0.427727656816809 }
        },

        /* 着陆器星敏A修正系数KSCZ */
        {
            {  0.005970037339382, -0.001778462433596, -0.000985818396660 },
            { -0.001778462433597,  0.004449860781357, -0.001493402353362 },
            { -0.000985818396661, -0.001493402353362,  0.006316221459001 },
            { -0.365805249984780,  0.145742014660496,  0.080786164781750 },
            {  0.145742014660510, -0.241229329784868,  0.122381819017454 },
            {  0.080786164781751,  0.122381819017443, -0.394174458174695 }
        }
    },

    /* 陀螺在轨标定修正系数KS */
    {
        /* 飞跃器星敏A修正系数KSA */
        {
            {  0.008062796090859, -0.000138015554709,  0.000082928111638 },
            { -0.000138015554709,  0.009582303654126,  0.000007471152272 },
            {  0.000082928111638,  0.000007471152272,  0.009590248618382 },
            { -0.677326604654726,  0.006017519550012, -0.003615690521828 },
            {  0.006017519550005, -0.743577589825432, -0.000325744478224 },
            { -0.003615690521826, -0.000325744478224, -0.743923992648197 }
        },

        /* 飞跃器星敏B修正系数KSB */
        {
            {  0.008066992492558, -0.000096588807063,  0.000151445321131 },
            { -0.000096588807063,  0.009588631094708,  0.000009574844322 },
            {  0.000151445321131,  0.000009574844322,  0.009579724971341 },
            { -0.677509568769978,  0.004211300952846, -0.006603061416504 },
            {  0.004211300952843, -0.743853468130169, -0.000417466083717 },
            { -0.006603061416497, -0.000417466083717, -0.743465158480625 }
        },

        /* 着陆器星敏A修正系数KSAZT */
        {
            {  0.008632953206483,  0.000013115419555,  0.000751314021813 },
            {  0.000013115419555,  0.009594558890532, -0.000010245328631 },
            {  0.000751314021813, -0.000010245328631,  0.009007836266353 },
            { -0.702185625777966, -0.000571836223411, -0.032757516527701 },
            { -0.000571836223411, -0.744111921805748,  0.000446699398933 },
            { -0.032757516527725,  0.000446699398933, -0.718530639544680 }
        },

        /* 着陆器星敏B修正系数KSBZT */
        {
            {  0.008632953206483, -0.000657213590526, -0.000364300796089 },
            { -0.000657213590526,  0.009145645776947, -0.000248936665120 },
            { -0.000364300796089, -0.000248936665120,  0.009456749379938 },
            { -0.702185625777964,  0.028654709520700,  0.015883623894218 },
            {  0.028654709520704, -0.724539175509508,  0.010853713208168 },
            {  0.015883623894207,  0.010853713208164, -0.738103385840877 }
        },

        /* 着陆器星敏C修正系数KSCZT */
        {
            {  0.009207521640884, -0.000586588194117, -0.000325151334153 },
            { -0.000586588194117,  0.008706123576429, -0.000492567159700 },
            { -0.000325151334153, -0.000492567159700,  0.009321703146055 },
            { -0.727236981722008,  0.025575421070125,  0.014176695620310 },
            {  0.025575421070124, -0.705375875837514,  0.021476075790404 },
            {  0.014176695620308,  0.021476075790425, -0.732215329568858 }
        }
    },

    /* KS前三行修正系数 */
    { 1.0,  1.0,  1.0,  1.0,  1.0 },

    /* KS后三行修正系数 */
    { 1.0,  1.0,  1.0,  1.0,  1.0 },

    5.0,            /* 飞跃动力过程星敏滤波修正放大系数 */
    1.0,            /* 滑行模式星敏滤波修正放大系数 */
    0.001745,       /* 陀螺漂移不修正时角速度阈值ωsΔb, rad/s, 0.1°/s */
    0.1745,         /* 陀螺漂移估计限幅阈值, rad/h, 10°/h */
    1.745,          /* 陀螺最大角速度, rad/s, 100°/s */
    0.0349,         /* 标定期间陀螺有效性检测的门限Ggyro, rad/s, 2°/s */

    350.0,          /* 飞跃器干重, kg */
    600.0,          /* 飞跃器动力下降段最大质量 */
    300.0,          /* 飞跃器动力下降段最小质量 */

    /* Para质量特性拟合参数 */
    {
        { 1.655250095786232e-06, -1.252528405793260e-04,  1.755088203121194e-01 },
        { 2.532387498474228e-05,  1.552707483869655e-01,  3.139748349870507e+02 },
        { 9.136320383880369e-05,  5.640334064611586e-02,  1.742938984613590e+02 },
        { 9.135789420088516e-05,  8.676335243797055e-02,  1.700217097875879e+02 }
    },

    0.0,                /* 惯量积取值Ixy */
    2.0,                /* 惯量积取值Ixz */
    9.0,                /* 惯量积取值Iyz */

   -1.8e-3,             /* 机械系Y向质心初值 */
   -5.0e-4,             /* 机械系Z向质心初值 */

    0.01,               /* 质心估计系数 */
    0.002,              /* 质心估计限幅 */

    0.08727,            /* 启动滚动调姿角度判断阈值 */
    -0.999847695156391, /* 制导推力方向与月心方向夹角余弦保护阈值 */

    20,                 /* 陀螺小于3个判断最大次数 */
    20                  /* 加计小于3个判断最大次数 */
};
SFtdiCtrl sFtdiCtrl;
SFtdiSafeLandData sFtdiSafeLandData;
SGuideData sGuideData;
SWalkCtrlFlag sWalkCtrlFlag;

/* --- 函数原型 --- */
void AcceDataProc128(void);
void AcceDataProc16(void);
void AcceFaultDataProc(void);
void AcceVAComplement(void);
void AttDeterStsGyro(void);
void AttDeterWalk(void);
void AttDeterWalkMode(void);
void AttProcWalk(void);
void CMICalculate(void);
void CentroidAndInertiaEst(void);
void DeviceDataProc(void);
void GyroDataProc128(void);
void GyroDataProc16(void);
void GyroFaultDataProc(void);
void GyroVGComplement(void);
void ImpulseMomentCalc(void);
void MrvsDataProc(void);
void RelaySatOrbitCalc(void);
void SavaLastCycleData(void);
void StsDataProc(void);
void SunCalendarCalc(void);
void ThruStatusClear(void);
void ThruTimerClear285N(void);
void ThruTimerClear40N(void);

#endif // IP_ATTDETERWALKMODE_H