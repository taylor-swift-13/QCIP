#if !defined(__B_TCPROCESS_H__)
#define __B_TCPROCESS_H__

#include "IP.h"

void B_TcProcessFun(void *p);

/* 模式切换指令处理 */
typedef struct __B_TcProcess
{
    /* 接口函数 */
    Fun     fun;
    /* 输入端口 */
    unint32 uartno;         /* 串口号 */
    /* 输出端口 */
    unint32* workMode;      /* 模式字变量指针 */
    unint32 bSucc;
    /* 输入输出端口 */
    /* 状态变量 */
    /* 参数变量 */
} B_TcProcess;

#endif // __B_TCPROCESS_H__