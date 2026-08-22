#include "IP_Avv.h"

// =======================================================
// 函数实现
// =======================================================

void Avv(float64 *mat33, const float64 *X1I, const float64 *X2I, const float64 *X1b, const float64 *X2b)
{
    float64 V2I[3];     /*  */
    float64 V2b[3];     /*  */
    float64 V3I[3];     /*  */
    float64 V3b[3];     /*  */
    unint32 i;          /*  */
    unint32 j;          /*  */
    unint32 u;          /*  */

    VectorCross3(&V2I[0], X1I, X2I);        /* 三维向量叉乘 */
    VectorUnit3(&V2I[0]);                   /* 归一化 */
    VectorCross3(&V3I[0], X1I, &V2I[0]);    /* 三维向量叉乘 */

    VectorCross3(&V2b[0], X1b, X2b);        /* 三维向量叉乘 */
    VectorUnit3(&V2b[0]);                    /* 归一化 */
    VectorCross3(&V3b[0], X1b, &V2b[0]);    /* 三维向量叉乘 */

    for (i=0; i<3; i++)
    {
        for (j=0; j<3; j++)
        {
            u = i*3 + j;
            mat33[u] = X1b[i] * X1I[j] + V2b[i] * V2I[j] + V3b[i] * V3I[j];
        }
    }

    return;
}