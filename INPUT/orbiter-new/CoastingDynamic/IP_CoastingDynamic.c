#include "IP_CoastingDynamic.h"

// =======================================================
// 函数实现
// =======================================================

void CoastingDynamic(float64 *pOutX, float64 *x)
{
    float64 tmpr[3];
    float64 tmpv[3];
    float64 tmpg[3];

    VectorEval3(&tmpr[0], &x[0]);
    VectorEval3(&tmpv[0], &x[3]);
    LG(&tmpg[0], &tmpr[0]);
    VectorEval3(&pOutX[0], &tmpv[0]);
    VectorEval3(&pOutX[3], &tmpg[0]);

    return;
}