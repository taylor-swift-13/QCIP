#ifndef IP_COASTINGTRAJECTORY_H
#define IP_COASTINGTRAJECTORY_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */

/* --- 全局变量定义 --- */

/* --- 函数原型 --- */
void CoastingTrajectory(float64 *pOutX, const float64 *rc1, const float64 *vc1, float64 t, unint32 n);

#endif // IP_COASTINGTRAJECTORY_H