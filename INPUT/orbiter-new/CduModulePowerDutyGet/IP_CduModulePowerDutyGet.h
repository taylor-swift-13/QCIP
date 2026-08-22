#ifndef IP_CDUMODULEPOWERDUTYGET_H
#define IP_CDUMODULEPOWERDUTYGET_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
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
typedef struct TAG_IMU_COMM
{
    polymor flgCommValidSend;       /* 串口通讯有效标志发送 */
    polymor flgCommValidRecv;       /* 串口通讯有效标志接收 */
    unint32 numerror;
    unint32 cntCommError;           /* 串口通讯错误累计计数 */
    unint32 cntCommErrorCnt;        /* 串口通讯错误连续计数 */

    boolu32 bCommValid;             /* 串口通讯有效性标志, TRUE32:当拍有通讯, FALSE32:当拍无通讯 */
    boolu32 bCommFault;             /* 串口通讯失效标志, TRUE32:通讯失效, FALSE32:通讯有效 */

    boolu32 bSendCmd;               /* 已发送指令, 等待接收返回的数据 */
    unint32 recvLenExp;             /* 期望返回数据长度 */

    unint08 sendBuf[256];           /* 发送数据缓冲区 */
    unint32 sendLen;                /* 发送数据长度 */
    unint08 recvBuf[256];           /* 接收数据缓冲区 */
    unint32 recvLen;                /* 预定接收数据长度 */
} SImuComm;
typedef struct TAG_STS_COMM
{
    polymor flgCommValidSend;       /* 串口通讯有效标志发送 */
    polymor flgCommValidRecv;       /* 串口通讯有效标志接收 */
    unint32 numerror;
    unint32 cntCommError;           /* 串口通讯错误累计计数 */
    unint32 cntCommErrorCnt;        /* 串口通讯错误连续计数 */

    boolu32 bCommValid;             /* 串口通讯有效性标志, TRUE32:当拍有通讯, FALSE32:当拍无通讯 */
    boolu32 bCommFault;             /* 串口通讯失效标志, TRUE32:通讯失效, FALSE32:通讯有效 */

    boolu32 bSendCmd;               /* 已发送指令, 等待接收返回的数据 */
    unint32 recvLenExp;             /* 期望返回数据长度 */

    unint08 sendBuf[256];           /* 发送数据缓冲区 */
    unint32 sendLen;                /* 发送数据长度 */
    unint08 recvBuf[256];           /* 接收数据缓冲区 */
    unint32 recvLen;                /* 预定接收数据长度 */

    float64 tStsSync0;              /* 记录发送时刻的星时ts0 */
    unint32 cntSendSync;            /* 星敏校时发送累计计数 */
} SStsComm;
typedef struct TAG_FTDI_COMM
{
    polymor flgCommValidSend;   /* 串口通讯有效标志发送 */
    polymor flgCommValidRecv;   /* 串口通讯有效标志接收 */
    unint32 numerror;
    unint32 cntCommError;       /* 串口通讯错误累计计数 */
    unint32 cntCommErrorCnt;    /* 串口通讯错误连续计数 */

    boolu32 bCommValid;         /* 串口通讯有效性标志, TRUE32:当拍有通讯, FALSE32:当拍无通讯 */

    boolu32 bSendCmd;           /* 已发送指令, 等待接收返回的数据 */
    unint32 recvLenExp;         /* 期望返回数据长度 */

    unint08 sendBuf[256];       /* 发送数据缓冲区 */
    unint32 sendLen;            /* 发送数据长度 */
    unint08 recvBuf[256];       /* 接收数据缓冲区 */
    unint32 recvLen;            /* 预定接收数据长度 */
} SFtdiComm;
typedef struct TAG_MRVS_COMM
{
    polymor flgCommValidSend;   /* 串口通讯有效标志发送 */
    polymor flgCommValidRecv;   /* 串口通讯有效标志接收 */
    unint32 numerror;
    unint32 cntCommError;       /* 串口通讯错误累计计数 */
    unint32 cntCommErrorCnt;    /* 串口通讯错误连续计数 */

    boolu32 bCommValid;         /* 串口通讯有效性标志, TRUE32:当拍有通讯, FALSE32:当拍无通讯 */
    boolu32 bCommFault;         /* 串口通讯失效标志, TRUE32:通讯失效, FALSE32:通讯有效 */

    boolu32 bSendCmd;           /* 已发送指令, 等待接收返回的数据 */
    unint32 recvLenExp;         /* 期望返回数据长度 */

    unint08 sendByte;           /* 发送指令 */
    unint32 sendLen;            /* 发送数据长度 */
    unint08 recvBuf[256];       /* 接收数据缓冲区 */
    unint32 recvLen;            /* 预定接收数据长度 */
} SMrvsComm;
typedef struct TAG_LTPS_COMM
{
    polymor flgCommValidSend;       /* 串口通讯有效标志发送 */
    polymor flgCommValidRecv;       /* 串口通讯有效标志接收 */
    unint32 numerror;
    unint32 cntCommError;           /* 串口通讯错误累计计数 */
    unint32 cntCommErrorCnt;        /* 串口通讯错误连续计数 */

    boolu32 bCommValid;             /* 串口通讯有效性标志, TRUE32:当拍有通讯, FALSE32:当拍无通讯 */

    boolu32 bSendCmd;               /* 已发送指令, 等待接收返回的数据 */
    unint32 recvLenExp;             /* 期望返回数据长度 */

    unint08 sendBuf[256];           /* 发送数据缓冲区 */
    unint32 sendLen;                /* 发送数据长度 */
    unint08 recvBuf[256];           /* 接收数据缓冲区 */
    unint32 recvLen;                /* 预定接收数据长度 */
} SLtpsComm;
typedef struct TAG_OTS_COMM
{
    polymor flgCommValidSend;       /* 串口通讯有效标志发送 */
    polymor flgCommValidRecv;       /* 串口通讯有效标志接收 */
    unint32 numerror;
    unint32 cntCommError;           /* 串口通讯错误累计计数 */
    unint32 cntCommErrorCnt;        /* 串口通讯错误连续计数 */

    boolu32 bCommValid;             /* 串口通讯有效性标志, TRUE32:当拍有通讯, FALSE32:当拍无通讯 */

    boolu32 bSendCmd;               /* 已发送指令, 等待接收返回的数据 */
    unint32 recvLenExp;             /* 期望返回数据长度 */

    unint08 sendBuf[256];           /* 发送数据缓冲区 */
    unint32 sendLen;                /* 发送数据长度 */
    unint08 recvBuf[256];           /* 接收数据缓冲区 */
    unint32 recvLen;                /* 预定接收数据长度 */
} SOtsComm;
typedef struct TAG_CDU_STATUS
{
    /* 当前单机标识: 000b-A机, 001b-B机, 010b-C机, 详见CDU_MODULE_A */
    unint32 CduModuleFlag;

    /* CDU三机强制当班状态, CDU_FORCE_DUTY_ON/CDU_FORCE_DUTY_OFF */
    unint32 CduOnDutyForce[3];

    /* CDU三机当班状态, CDU_DUTY_ON/CDU_DUTY_OFF */
    unint32 CduOnDuty[3];
    unint32 CduOnDutyOld[3];

    /* CDU三机加电状态, ‘1’为加电, ‘0’为未加电 */
    unint32 CduPowerOn[3];
} SCduStatus;
typedef unsigned int  U32;

/* --- 全局变量定义 --- */
SZlqCcuStatus sZlqCcuStatus;
SFtdiComm sFtdiComm;
SImuComm sImuComm[DEV_NUM_IMU];
SLtpsComm sLtpsComm;
SMrvsComm sMrvsComm[DEV_NUM_MRVS];
SOtsComm sOtsComm;
SStsComm sStsComm[DEV_NUM_STS];
SCduStatus sCduStatus;

/* --- 函数原型 --- */
void CduModulePowerDutyGet(void);
void DevCommInit(void);

#endif // IP_CDUMODULEPOWERDUTYGET_H