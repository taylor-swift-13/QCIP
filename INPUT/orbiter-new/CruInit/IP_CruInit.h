#ifndef IP_CRUINIT_H
#define IP_CRUINIT_H

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
;
typedef struct TAG_SMU_SERVICE_REQUEST
{
    /* 公共数据 */
    boolu32 bNeedSetReg;        /* 设置寄存器标志 */
    polymor flgType;            /* 表征当前正在响应的服务请求类型, 定义见SMU_SERV_REQ_TYPE_NULL */
    unint32 cntSerReq;          /* 服务请求累计计数器 */
    unint32 cntSerSetGap;       /* 服务请求两次设置间隔累计计数器 */
    unint16 modeVec;            /* 方式代码矢量字 */

    /* 接收飞跃器控制与驱动单元重要数据及器上时间 */
    boolu32 bCruRestore;        /* 请求恢复重要数据标志 */

    /* 飞跃器CDU判断飞跃器着陆后关闭285N发动机并告知SMU */
    boolu32 bCloseThru;         /* 发送285N发动机关机标志 */

    /* 飞跃器CDU通知飞跃器SMU进入平移段或滑行段 */
    boolu32 bSendTranGlideMode;  /* 发送进入平移段或滑行段标志 */

    /* 飞跃器CDU通知飞跃器SMU距离月面6m */
    boolu32 bSendDistance6m;  /* 发送距离月面6m标志 */

    /* 发送飞跃器控制与驱动单元重要数据 */
    boolu32 bCruSave;           /* 重要数据保存标志 */

    /* 发送飞跃器控制与驱动单元内存数据 */
    boolu32 bSendMemDwld;       /* 发送内存下传标志 */
} SSmuServReq;

/* --- 全局变量定义 --- */
SCrucialSave sCrucialSave;
SCrucialRest sCrucialRest;
SSmuServReq sSmuServReq;

/* --- 函数原型 --- */
void CruInit(boolu32 bCruRestore);

#endif // IP_CRUINIT_H