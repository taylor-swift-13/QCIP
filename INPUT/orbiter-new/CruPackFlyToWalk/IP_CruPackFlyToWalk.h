#ifndef IP_CRUPACKFLYTOWALK_H
#define IP_CRUPACKFLYTOWALK_H

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
typedef struct TAG_AUTOPACK
{
    unint32 Stop;               /* 打包停止标志 */
    unint32 byteID;             /* 目标字节号   */
    void    *pSrc;              /* 打包数据来源 */
    unint32 type;               /* 打包类型     */
    float64 eq;                 /* 打包当量     */
    unint32 bitPara;            /* 位操作位置与条件 */
} AUTOPACK;

/* --- 全局变量定义 --- */
SCrucialSave sCrucialSave;
SCrucialRest sCrucialRest;
AUTOPACK CRUPK_FLYTOWALK[CRU_FLYTOWALK_MAPTABLE_LENGTH];
STime sTime;

/* --- 函数原型 --- */
void CruPackFlyToWalk(void);

#endif // IP_CRUPACKFLYTOWALK_H