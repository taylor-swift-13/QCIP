#include "IP_CoastingTrajectory.h"

// =======================================================
// 函数实现
// =======================================================

void CoastingTrajectory(float64 *pOutX, const float64 *rc1, const float64 *vc1, float64 t, unint32 n)
{
    unint32 i, j;
    float64 tempT;
    float64 tmpx1[6], tmpx2[6], tmpx3[6], tmpx4[6];
    float64 tmpk1[6], tmpk2[6], tmpk3[6], tmpk4[6];

    tempT = t / (float64)n;
    VectorEval3(&tmpx1[0], &rc1[0]);
    VectorEval3(&tmpx1[3], &vc1[0]);

    for (i=0; i<n; i++)
    {
        CoastingDynamic(&tmpk1[0], &tmpx1[0]);
        VectorScalar(&tmpk1[0], &tmpk1[0], tempT, 6);

        VectorAddCoef(&tmpx2[0], &tmpx1[0], &tmpk1[0], 0.5, 6);
        CoastingDynamic(&tmpk2[0], &tmpx2[0]);
        VectorScalar(&tmpk2[0], &tmpk2[0], tempT, 6);

        VectorAddCoef(&tmpx3[0], &tmpx1[0], &tmpk2[0], 0.5, 6);
        CoastingDynamic(&tmpk3[0], &tmpx3[0]);
        VectorScalar(&tmpk3[0], &tmpk3[0], tempT, 6);

        VectorAdd(&tmpx4[0], &tmpx1[0], &tmpk3[0], 6);
        CoastingDynamic(&tmpk4[0], &tmpx4[0]);
        VectorScalar(&tmpk4[0], &tmpk4[0], tempT, 6);

        for (j=0; j<6; j++)
        {
            tmpx1[j] = tmpx1[j] + (tmpk1[j] + 2.0 * tmpk2[j] + 2.0 * tmpk3[j] + tmpk4[j]) / 6.0;
        }
    }

    VectorEval(&pOutX[0], &tmpx1[0], 6);

    return;
}