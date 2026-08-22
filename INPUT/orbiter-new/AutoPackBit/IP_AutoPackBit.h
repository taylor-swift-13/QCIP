#ifndef IP_AUTOPACKBIT_H
#define IP_AUTOPACKBIT_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef struct TAG_TCMD_DATACONVERTE
{
    unint16 ui16;               /* 16位无符号整型 */
    unint32 ui32;               /* 32位无符号整型 */
    float32 fl32;               /* 32位浮点数 */
    float64 fl64;               /* 64位浮点数 */
} STcmdDataConverte;
typedef struct TAG_AUTOPACK
{
    unint32 Stop;               /* 打包停止标志 */
    unint32 byteID;             /* 目标字节号   */
    void    *pSrc;              /* 打包数据来源 */
    unint32 type;               /* 打包类型     */
    float64 eq;                 /* 打包当量     */
    unint32 bitPara;            /* 位操作位置与条件 */
} AUTOPACK;
typedef struct TAG_AUTOPACK_FIRST_SHIFT
{
    unint32 byteIndex;          /* 字节偏移量 */
    unint32 bitIndex;           /* 比特偏移量 */
} SPackShift;

/* --- 全局变量定义 --- */
SPackShift sPackShift;

/* --- 函数原型 --- */
void AutoPackBit(unint08 * pBuf, AUTOPACK * pData, boolu32 * firstTime, unint32 lengthofAddress);

#endif // IP_AUTOPACKBIT_H