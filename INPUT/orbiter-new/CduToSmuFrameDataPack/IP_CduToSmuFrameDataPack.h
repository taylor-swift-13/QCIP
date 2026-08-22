#ifndef IP_CDUTOSMUFRAMEDATAPACK_H
#define IP_CDUTOSMUFRAMEDATAPACK_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
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
typedef struct TAG_SMU_LVDS_FRAME_CDU_SEND
{
    unint08 frmNum;             /* 帧计数, 0~255循环计数 */

    unint08 cntDataItem3;       /* 第3项数据有效标示维持节拍, 前方地形是否安全 */
    unint08 cntDataItem4;       /* 第4项数据有效标示维持节拍, 路径规划标识 */
    unint08 cntDataItem5;       /* 第5项数据有效标示维持节拍, 运动计次 */
    unint08 cntDataItem7;       /* 第7项数据有效标示维持节拍, 坐标系下的位置（X,Y,Z） */
    unint08 cntDataItem8;       /* 第8项数据有效标示维持节拍, 坡面角1 */
    unint08 cntDataItem9;       /* 第9项数据有效标示维持节拍, 坡面角2 */
    unint08 cntDataItem10;      /* 第10项数据有效标示维持节拍, 前进距离d和前进方向θ */
    unint08 cntDataItem14;      /* 第14项数据有效标示维持节拍, 障碍物信息 */

    /* 数据区 */
    unint08 data[SMU_LVDS_SEND_FRAME_LEN];  /* 数据帧长1024字节 */
} SFrameCduSend;
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
SWalkRecData sWalkRecData;
SWalkSendData sWalkSendData;
SFrameCduSend sFrameCduSend;
SWalkModeData sWalkModeData;

/* --- 函数原型 --- */
void CduToSmuFrameDataPack(unint08 *data, unint08 *dataValid01, unint08 *dataValid02);

#endif // IP_CDUTOSMUFRAMEDATAPACK_H