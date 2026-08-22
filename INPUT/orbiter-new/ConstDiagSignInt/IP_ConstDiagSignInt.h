#ifndef IP_CONSTDIAGSIGNINT_H
#define IP_CONSTDIAGSIGNINT_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */

/* --- 全局变量定义 --- */

/* --- 函数原型 --- */
boolu32 ConstDiagSignInt(siint32 *cntConst, const siint32 *var, const siint32 *oldVar, siint32 sizeVar, siint32 numConstMax);

#endif // IP_CONSTDIAGSIGNINT_H