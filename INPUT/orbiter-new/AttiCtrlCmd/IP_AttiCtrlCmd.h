#ifndef IP_ATTICTRLCMD_H
#define IP_ATTICTRLCMD_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
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

/* --- 全局变量定义 --- */
SGncCtrlFlag sGncCtrlFlag;
SAttiData sAttiData;

/* --- 函数原型 --- */
void AttiCtrlCmd(void);

#endif // IP_ATTICTRLCMD_H