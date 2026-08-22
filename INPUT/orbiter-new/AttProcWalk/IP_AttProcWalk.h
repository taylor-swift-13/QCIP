#ifndef IP_ATTPROCWALK_H
#define IP_ATTPROCWALK_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
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

/* --- 全局变量定义 --- */
SWalkSendData sWalkSendData;
SWalkAttData sWalkAttData;
SWalkInstrDemandData sWalkInstrDemandData;
SWalkModeData sWalkModeData;

/* --- 函数原型 --- */
void AttProcWalk(void);

#endif // IP_ATTPROCWALK_H