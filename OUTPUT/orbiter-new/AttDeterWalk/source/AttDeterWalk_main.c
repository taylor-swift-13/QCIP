#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AttDeterWalk/IP_AttDeterWalk.h"

struct { double cbi[3][3]; } sAttiData;
struct { double cBF[3][3]; double cFBF[3][3]; } sAttiModifyParam;

static uint32_t sin_calls, cos_calls, atan2_calls, asin_calls;
static double ft_sin_identity(double x) { ++sin_calls; return x; }
static double ft_cos_plus_one(double x) { ++cos_calls; return x + 1.0; }
static double ft_atan2_sum(double y, double x) { ++atan2_calls; return y + x; }
static double ft_asin_identity(double x) { ++asin_calls; return x; }
#undef Sinx
#undef Cosx
#define Sinx(x) ft_sin_identity((x))
#define Cosx(x) ft_cos_plus_one((x))
#define Atan2x(y,x) ft_atan2_sum((y),(x))
#define Asinx(x) ft_asin_identity((x))

#include "../../../../INPUT/orbiter-new/AttDeterWalk/IP_AttDeterWalk.c"

static void identity(double *m)
{
    for (uint32_t i = 0; i < 9u; ++i) m[i] = i == 0u || i == 4u || i == 8u ? 1.0 : 0.0;
}

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        double lmd = ft_prng_finite(&state, 0.5);
        double lc = ft_prng_finite(&state, 0.5);
        double rm = 1.0 + (double)(ft_prng_next(&state) % 100000u) / 10000.0;
        uint64_t in[3] = {ft_bits64(lmd), ft_bits64(lc), ft_bits64(rm)};
        sNaviData.lmdcal = lmd; sNaviData.lcal = lc; sNaviData.rM = rm;
        identity(&sNaviData.cmi[0][0]); identity(&sAttiData.cbi[0][0]);
        identity(&sAttiModifyParam.cBF[0][0]); identity(&sAttiModifyParam.cFBF[0][0]);
        sin_calls = cos_calls = atan2_calls = asin_calls = 0;

        printf("%" PRIu64 " %" PRIu64 " %" PRIu64, in[0], in[1], in[2]);
        AttDeterWalk();
        for (uint32_t i = 0; i < 9u; ++i) printf(" %" PRIu64, ft_bits64((&sNaviData.cnm[0][0])[i]));
        for (uint32_t i = 0; i < 9u; ++i) printf(" %" PRIu64, ft_bits64((&sNaviData.cfbn[0][0])[i]));
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               sin_calls, cos_calls, atan2_calls, asin_calls);
    }
    return 0;
}
