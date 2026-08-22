#include "IP_CalRelativeDistSpeed.h"

// =======================================================
// 函数实现
// =======================================================

void CalRelativeDistSpeed(float64 *RelativeDist, float64 *RelativeSpeed, siint32 *LegDoubleTouchSignal, float64 *pf_m, float64 *vf_m, siint32 *touch_s_L)
{
    siint32 i;
    siint32 j;
    siint32 z;
    siint32 k;
    float64 tmpDis[3];
    float64 tmpSpeed[3];

    /* 初始化，全零矩阵 */
    VectorZero(RelativeDist, 15);
    VectorZero(RelativeSpeed, 15);
    VectorZeroSint32(LegDoubleTouchSignal, 15);

    z = 0;
    /* 计算触地 */
    for (i=0; i<5; i++)
    {
        for (j=i+1; j<6; j++)
        {
            if ((touch_s_L[i] == 1) && (touch_s_L[j] == 1))
            {
                LegDoubleTouchSignal[z] = 1;
            }

            for (k=0; k<3; k++)
            {
                tmpDis[k]   = pf_m[k*6 + i] - pf_m[k*6 + j];
                tmpSpeed[k] = vf_m[k*6 + i] - vf_m[k*6 + j];
            }

            RelativeDist[z]  = VectorNorm3(&tmpDis[0]);
            RelativeSpeed[z] = VectorNorm3(&tmpSpeed[0]);

            z = z + 1;
        }
    }

    return;
}