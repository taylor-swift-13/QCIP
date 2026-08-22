#ifndef IP_CRUPACK_H
#define IP_CRUPACK_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef struct TAG_CRUCIAL_SAVE
{
    unint32 cycleSave;                      /* 重要数据保存周期计数 */
    unint32 cycleSave3To2;                  /* 重要数据保存周期计数(三机转两机重要数据, 进入无控模式后连续保存80个控制周期) */
    boolu32 firstTime;                      /* 重要数据逻辑打包首次调用标志(常规重要数据) */
    boolu32 firstTime3To2;                  /* 重要数据逻辑打包首次调用标志(三机转两机重要数据) */

    unint08 saveBuff[CRU_TOTAL_LENGTH];     /* 重要数据缓存 */
    unint08 saveBuffLast[CRU_TOTAL_LENGTH]; /* 重要数据缓存 上一拍 */

    float64 tmpTime;                        /* 模式初始时刻打包缓存, s */
} SCrucialSave;
typedef struct TAG_CRUCIAL_RESTORE
{
    polymor flgCruStage;                    /* 重要数据恢复阶段标志, CRU_RESTORE_STAGE_NULL */
    polymor flgCruResult;                   /* 重要数据恢复结果, CRU_RESTORE_RESULT_NULL */

    polymor flgCruSource;                   /* 遥测用，标记数据来源 0:从数管恢复;1:从三取二区恢复 */

    unint32 rcvedFlg;                       /* 重要数据分包接收状态标志: D0~D7, 分别表示数据1~数据8 */
    unint08 rcvBuff[CRU_TOTAL_LENGTH];      /* 重要数据1~8缓存, 分别表示数据1~数据8 */
    unint08 tr32Buff[CRU_TOTAL_LENGTH];     /* 重要数据1~8缓存, 分别表示数据1~数据8, 三取二区 */

    unint32 cycleRestore;                   /* 重要数据恢复周期计数 */

    /* 接收SMU校时时间 */
    unint08 buffer08Time[6];                /* 缓存数管时间码(长6个字节) */
    boolu32 bRecvedTime;                    /* 重要数据恢复星时接收标志 */
    float64 timeRecved;                     /* 数管时间码接收时刻, s */

    unint32 ms;                             /* 星时的毫秒 */
    unint32 sec;                            /* 星时的秒 */

    float64 smuTimeCur;                     /* 恢复的SMU时间 */
    float64 tim;                            /* 重要数据保存/恢复的星时 */
} SCrucialRest;
typedef struct TAG_TIME
{
    llong64 countPeriod;        /* 上电累计周期计数器 */
    ulong64 periodOld;          /* 上拍周期信号锁存星时计数 */
    float64 tRaw;               /* 控制周期头计算“上一个控制周期内硬件累计星时”,单位s */

    float64 sstime;             /* 星时,单位s */

    siint16 cycleTag;           /* 1553B时标寄存器控制周期读取值 */
} STime;
;
typedef struct TAG_AUTOPACK
{
    unint32 Stop;               /* 打包停止标志 */
    unint32 byteID;             /* 目标字节号   */
    void    *pSrc;              /* 打包数据来源 */
    unint32 type;               /* 打包类型     */
    float64 eq;                 /* 打包当量     */
    unint32 bitPara;            /* 位操作位置与条件 */
} AUTOPACK;
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

/* --- 全局变量定义 --- */
SCrucialSave sCrucialSave;
SCrucialRest sCrucialRest;
AUTOPACK CRUPK_FLY[CRU_FLY_MAPTABLE_LENGTH];
AUTOPACK CRUPK_WALK[CRU_WALK_MAPTABLE_LENGTH];
STime sTime;
SGncCtrlFlag sGncCtrlFlag;
SModeProcess sModeProcess;

/* --- 函数原型 --- */
void CruPack(void);

#endif // IP_CRUPACK_H