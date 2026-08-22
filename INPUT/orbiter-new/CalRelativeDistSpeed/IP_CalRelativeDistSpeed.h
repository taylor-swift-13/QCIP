#ifndef IP_CALRELATIVEDISTSPEED_H
#define IP_CALRELATIVEDISTSPEED_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */

/* --- 全局变量定义 --- */

/* --- 函数原型 --- */
void CalRelativeDistSpeed(float64 *RelativeDist, float64 *RelativeSpeed, siint32 *LegDoubleTouchSignal, float64 *pf_m, float64 *vf_m, siint32 *touch_s_L);

#endif // IP_CALRELATIVEDISTSPEED_H