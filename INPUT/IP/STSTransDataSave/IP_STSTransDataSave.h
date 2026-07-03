#ifndef IP_STSTRANSDATASAVE_H
#define IP_STSTRANSDATASAVE_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef unsigned char       unint08;
typedef unsigned int        unint32;
typedef struct TAG_STS_TRAN
{
    unint32 lenTotal;
    unint32 len;
    unint32 no;
    unint32 ptr;
    unint32 start;

    unint08 paraBuf[14];
    unint08 dataBuf[256];
}STS_TRAN;

/* --- 全局变量定义 --- */
STS_TRAN sSTSTran;

/* --- 函数原型 --- */
void STSTransDataSave( void );

#endif // IP_STSTRANSDATASAVE_H