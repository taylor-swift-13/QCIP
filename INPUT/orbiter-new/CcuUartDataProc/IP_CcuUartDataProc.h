#ifndef IP_CCUUARTDATAPROC_H
#define IP_CCUUARTDATAPROC_H

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
typedef struct TAG_ZLQ_CCU_STATUS
{
    polymor flgCommValidSend;   /* 串口通讯有效标志发送 */
    polymor flgCommValidRecv;   /* 串口通讯有效标志接收 */
    unint32 numerror;
    unint32 cntCommError;       /* 串口通讯错误累计计数 */
    unint32 cntCommErrorCnt;    /* 串口通讯错误连续计数 */

    boolu32 bCommValid;         /* 串口通讯有效性标志, TRUE32:当拍有通讯, FALSE32:当拍无通讯 */

    unint32 cntUnComm;          /* 累计串口无通讯计数 */
    unint32 cntCommSucc;        /* 累计串口通讯成功计数 */

    unint32 lenRecved;          /* 累计接收数据长度, 字节 */
    unint08 buf[200];           /* 数据缓存 */
} SZlqCcuStatus;
typedef struct TAG_ZLQ_CCU_RECV_DATA
{
    boolu32 bDataValid;         /* 数据包有效标志 */
    polymor flgAbnormal;        /* 数据包解析错误码 */

    float64 Zt;                 /* 当拍绝对星时, s */
    float64 ZtNJSum;            /* 不喷气累积时间, s */

    float64 ZtSA;               /* 着陆器星敏A测量时刻对应绝对星时 */
    float64 ZtSB;               /* 着陆器星敏B测量时刻对应绝对星时 */
    float64 ZtSC;               /* 着陆器星敏C测量时刻对应绝对星时 */

    float64 tmTimezql;          /* 当前星时与着陆器绝对星时的差 */

    unint32 ZZT4;               /* 着陆器星敏使用状态标志 */
    unint32 ZBZ4;               /* 着陆器星敏使用状态标志 */
} SZlqCcuRecvData;
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

/* --- 全局变量定义 --- */
STime sTime;
SZlqCcuStatus sZlqCcuStatus;
SZlqCcuRecvData sZlqCcuRecvData;
SStsRaw sStsRaw[DEV_NUM_STS_ALL];

/* --- 函数原型 --- */
boolu32 CcuUartDataProc(unint08 *buffer08);

#endif // IP_CCUUARTDATAPROC_H