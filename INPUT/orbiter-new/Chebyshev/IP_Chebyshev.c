#include "IP_Chebyshev.h"

// =======================================================
// 函数实现
// =======================================================

void Chebyshev(float64 *x, float64 tao, float64 *C, siint32 n)
{
    siint32 i;
    float64 Tn1;
    float64 Tn;
    float64 Tmp;

    *x = 0.0;

    /* 静态代码检查，为Tn和Tn1赋初值，对本段逻辑无影响 */
    Tn1 = 0.0;
    Tn = 0.0;

    for (i=0; i<=n; i++)
    {
        if (i==0)
        {
            Tn1 = 0.0;
            Tn = 1.0;
        }
        else if (i==1)
        {
            Tn1 = Tn;
            Tn = tao;
        }
        else
        {
            Tmp = 2.0 * tao * Tn-Tn1;
            Tn1 = Tn;
            Tn = Tmp;
        }

        *x = *x + C[i] * Tn;
    }

    return;
}