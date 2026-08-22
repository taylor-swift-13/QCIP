#ifndef IP_CDUTOSMUALIGN_H
#define IP_CDUTOSMUALIGN_H

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
typedef struct TAG_SMU_LVDS_ALIGN_TOSMU
{
    unint32 SMUWIFIreleaseFlag;    /* 送数管版本的WIFI相机释放标识 */
    unint32 SMUFWSafeIF;           /* 送数管版本的前方地形是否安全 */
    unint32 SMUPathPlanFlag;       /* 送数管版本的路径规划标识 */
    unint32 SMUMoveNum;            /* 送数管版本的运动计次 */

    float64 SMUSlopeAgl1;          /* 送数管版本的坡面角1 */
    float64 SMUSlopeAgl2;          /* 送数管版本的坡面角2 */
    float64 SMUd;                  /* 送数管版本的前进距离 */
    float64 SMUTurnAgl;            /* 送数管版本的转弯角度 */

    boolu32 bFWSafeIF;             /* 本周期是否要更新 前方地形是否安全 */
    boolu32 bPathPlanFlag;         /* 本周期是否要更新 路径规划标识 */
    boolu32 bMoveNum;              /* 本周期是否要更新 运动计次 */
    boolu32 bSlopeAgl1;            /* 本周期是否要更新 坡面角1 */
    boolu32 bSlopeAgl2;            /* 本周期是否要更新 坡面角2 */
    boolu32 bDAndTheta;            /* 本周期是否要更新 前进距离和转弯角度 */

} SAlignToSmu;

/* --- 全局变量定义 --- */
SWalkSendData sWalkSendData;
SFrameCduSend sFrameCduSend;
SAlignToSmu sAlignToSmu;

/* --- 函数原型 --- */
void CDUToSMUAlign(void);

#endif // IP_CDUTOSMUALIGN_H