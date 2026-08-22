#include "IP_ClearIntFromDsp.h"

// =======================================================
// 函数实现
// =======================================================

void ClearIntFromDsp(void)
{
    /* 清除来自DSP的HPI请求信号 */
    HPI_REQUEST_CLR();

    return;
}