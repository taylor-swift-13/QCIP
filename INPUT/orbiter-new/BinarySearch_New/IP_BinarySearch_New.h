#ifndef IP_BINARYSEARCH_NEW_H
#define IP_BINARYSEARCH_NEW_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef struct TAG_TCMD_PARAM_MODIFY
{
    unint32 paraID;             /* 参数编码 */

    void *ptrVar;               /* 数据指针 */
    unint32 ptrFunc;            /* 函数指针 */
} STcmdParamModify;

/* --- 全局变量定义 --- */

/* --- 函数原型 --- */
siint32 BinarySearch_New(unint32 id, siint32 iniIndx, siint32 endIndx, const STcmdParamModify *paraTab);

#endif // IP_BINARYSEARCH_NEW_H