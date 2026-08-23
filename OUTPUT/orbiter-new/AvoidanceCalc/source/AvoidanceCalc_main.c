#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AvoidanceCalc/IP_AvoidanceCalc.h"

struct { uint32_t ZT6, ZT9; } sGncCtrlFlag;
struct { double mass, pgoF[3]; } sBodyData;
struct { double angleErr[3]; } sAttiCtrl;
struct { double w[3]; } sGyroData;
struct { double hHover; } sGuideTransData;
struct { double wM; } sNaviParam;
struct { double pFTDI[3]; uint32_t flgResult; } sFtdiSafePointRecv;
struct { double cBF[3][3]; } sAttiModifyParam;

#define IN_RANGE_LCUO(v, lo, hi) ((v) >= (lo) && (v) < (hi))
static uint32_t math_calls;
void DivNorm(double *dst, const double *src, uint32_t n)
{ ++math_calls; VectorEval(dst, src, n); }
void VectorRotation(double *dst, const double *v, const double *axis, double a)
{ (void)axis; (void)a; ++math_calls; VectorEval3(dst, v); }
void Q2C(double *dst, const double *q)
{ (void)q; ++math_calls; for (uint32_t i=0;i<9u;++i) dst[i]=(i==0u||i==4u||i==8u)?1.0:0.0; }

#include "../../../../INPUT/orbiter-new/AvoidanceCalc/IP_AvoidanceCalc.c"

int main(int argc, char **argv)
{
    static const double heights[3] = {25.0, 75.0, 125.0};
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t x[9];
        x[0] = (uint32_t)(ft_prng_next(&state) & 7u);
        x[1] = (uint32_t)(ft_prng_next(&state) & 3u);
        x[2] = (uint32_t)(ft_prng_next(&state) & 1u);
        x[3] = (uint32_t)(row % 3u);
        x[4] = (uint32_t)(ft_prng_next(&state) % 5u);
        x[5] = (uint32_t)(ft_prng_next(&state) % 5u);
        x[6] = (uint32_t)ft_prng_next(&state);
        x[7] = (uint32_t)ft_prng_next(&state);
        x[8] = (uint32_t)ft_prng_next(&state);
        sGncCtrlFlag.ZT6 = x[0]; sGncCtrlFlag.ZT9 = x[1] << 30;
        sGuideData.bHoverFlg = x[2]; sNaviData.height = heights[x[3]];
        sGuideTransData.hHover = 60.0;
        sAvoidData.flgFTDI = x[4]; sAvoidData.flgFTDIOld = x[5];
        sFtdiCtrl.flgSafePointSeq = x[6]; sFtdiCtrl.cycleSafePtSeq = x[7];
        sFtdiSafeLandData.FTDIVldFlg = x[8]; sFtdiSafeLandData.FTDIUseFlg = 0;
        sModeProcess.Sub7Flg = 99; math_calls = 0;

        for (uint32_t i=0;i<9u;++i) printf(i ? " %" PRIu32 : "%" PRIu32, x[i]);
        AvoidanceCalc();
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               sAvoidData.flgFTDI, sAvoidData.flgFTDIOld,
               sFtdiCtrl.flgSafePointSeq, sFtdiCtrl.cycleSafePtSeq,
               sFtdiSafeLandData.FTDIVldFlg, sModeProcess.Sub7Flg, math_calls);
    }
    return 0;
}
