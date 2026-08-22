#ifndef IP_AUTUPACKDATAFLOW_H
#define IP_AUTUPACKDATAFLOW_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
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
void AutuPackDataflow(unint08 * pBuf, AUTOPACK * pData, boolu32 * firstTime, unint32 lengthOfArray, unint32 lengthofAddress);

#endif // IP_AUTUPACKDATAFLOW_H