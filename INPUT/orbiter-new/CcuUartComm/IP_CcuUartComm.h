#ifndef IP_CCUUARTCOMM_H
#define IP_CCUUARTCOMM_H

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
typedef unsigned int  U32;

/* --- 全局变量定义 --- */
SZlqCcuStatus sZlqCcuStatus;

/* --- 函数原型 --- */
void CcuUartComm(void);

#endif // IP_CCUUARTCOMM_H