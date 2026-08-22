#include "IP_CoorConvert.h"

// =======================================================
// 函数实现
// =======================================================

void CoorConvert(float64 *posb, float64 x, float64 y, float64 x0, float64 y0, float64 a, float64 b)
{
    float64 xt;
    float64 yt;
    float64 sinA;
    float64 cosA;
    float64 sinB;
    float64 cosB;

    sinA = Sinx(a);
    cosA = Cosx(a);
    sinB = Sinx(b);
    cosB = Cosx(b);

    xt      = cosA * x  + sinA * y - x0;
    yt      =-sinA * x  + cosA * y - y0;
    posb[0] = cosB * xt + sinB * yt;
    posb[1] =-sinB * xt + cosB * yt;

    return;
}