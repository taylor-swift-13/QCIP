#ifndef IP_ATTIERRCALC_H
#define IP_ATTIERRCALC_H

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
typedef struct TAG_ATTI_CTRL_PARAM
{
    float64 thetaM;         /* 角度控制阈值θM, rad */
    float64 dThetar;        /* 角速度控制区标称角速度dθr, rad/s */

    float64 H1C;            /* 滑行段模式调制参数1 */
    float64 H2C;            /* 滑行段模式调制参数2 */

    float64 IMJ;            /* 脉冲调宽控制积分项限幅IMJ, Nm */

    /* 各通道脉冲调宽参数 */
    float64 wCtrl[3];
    float64 ksiCtrl[3];     /* 姿控阻尼 */
    float64 kiCtrl[3];      /* 姿控积分系数 */
    float64 m1Ctrl[3];      /* 姿控速度区系数1 */
    float64 m2Ctrl[3];      /* 姿控速度区系数2 */
    float64 TmJ[3];         /* 调制时间常数 */
    float64 H1J[3];         /* 调制控制参数1 */
    float64 H2J[3];         /* 调制控制参数2 */

    float64 wCtrl2[3];      /*  */
    float64 ksiCtrl2[3];
    float64 kiCtrl2[3];
    float64 m1Ctrl2[3];
    float64 m2Ctrl2[3];

    float64 aThetaPP;       /* 姿控相平面加速度参数 */
    float64 thetaPP1;       /* 姿控相平面角度参数1 */
    float64 thetaPP2;       /* 姿控相平面角度参数2 */

    float64 Iy0;            /* 积分项初值y */
    float64 Iz0;            /* 积分项初值z */

} SAttiCtrlParam;

/* --- 全局变量定义 --- */
SAttiCtrl sAttiCtrl;
SAttiCtrlParam sAttiCtrlParam =
{
    0.08726,    /* 角度控制阈值θM, rad, 对应5° */
    -0.1047,    /* 角速度控制区标称角速度dθr, rad/s, 对应-6°/s */
    0.04,       /* H1C、H2C为滑行段模式调制参数 */
    0.03,       /* H1C、H2C为滑行段模式调制参数 */
    100.0,      /* 脉冲调宽控制积分项限幅IMJ, Nm */

    /* 各通道脉冲调宽参数 */
    /* 滚动     俯仰    偏航 */
    { 1.2,      1.2,   1.2   },    /* ωCtrl[0~2] */
    { 1.0,      1.0,   1.0   },    /* ξCtrl[0~2] */
    { 0.1,      0.1,   0.1   },    /* kiCtrl[0~2] */
    { 1.0,      1.0,   1.0   },    /* m1Ctrl[0~2] */
    { 1.0,      1.0,   1.0   },    /* m2Ctrl[0~2] */
    { 2.0,      2.0,   2.0   },    /* TmJ[0~2] */
    { 0.015,  0.015,   0.015 },    /* H1J[0~2] */
    { 0.005,  0.005,   0.005 },    /* H2J[0~2] */

    /*  */
    /* 滚动     俯仰    偏航 */
    { 2.4,      2.4,   2.4   },    /* ωCtrl2[0~2] */
    { 1.0,      1.0,   1.0   },    /* ξCtrl2[0~2] */
    { 0.1,      0.1,   0.1   },    /* kiCtrl2[0~2] */
    { 1.0,      1.0,   1.0   },    /* m1Ctrl2[0~2] */
    { 1.0,      1.0,   1.0   },    /* m2Ctrl2[0~2] */

    0.0987,                        /* 姿控相平面加速度参数, 5.65°/s2 */
    0.001745,                      /* 姿控相平面角度参数1, 0.1° */
    0.003491,                      /* 姿控相平面角度参数2, 0.2° */

    0.0,                           /* 积分项初值y */
    0.0                            /* 积分项初值z */
};
SGncCtrlFlag sGncCtrlFlag;
SAttiData sAttiData;

/* --- 函数原型 --- */
void AttiErrCalc(void);

#endif // IP_ATTIERRCALC_H