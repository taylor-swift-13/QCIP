#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CMICalculate/IP_CMICalculate.h"

static uint32_t sin_calls, cos_calls, qmulti_calls, q2c_calls, pointer_ok;
static double ft_sin_identity(double x) { ++sin_calls; return x; }
static double ft_cos_plus_one(double x) { ++cos_calls; return x + 1.0; }
#undef Sinx
#undef Cosx
#define Sinx(x) ft_sin_identity((x))
#define Cosx(x) ft_cos_plus_one((x))

void QMulti(double *out, const double *a, const double *b)
{
    ++qmulti_calls; pointer_ok &= a == &sNaviParam.qME[0];
    for (uint32_t i = 0; i < 4u; ++i) out[i] = a[i] + b[i];
}
void Q2C(double *out, const double *q)
{
    ++q2c_calls;
    for (uint32_t i = 0; i < 9u; ++i) out[i] = q[i % 4u];
}

#include "../../../../INPUT/orbiter-new/CMICalculate/IP_CMICalculate.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t reset = (uint32_t)(row & 1u);
        uint64_t bits[7];
        for (uint32_t i = 0; i < 7u; ++i) bits[i] = ft_bits64(ft_prng_finite(&state, 4.0));
        sNaviFlag.WalkReNaviFlg = reset;
        sTime.sstime = ft_from_bits64(bits[0]); sNaviParam.tME = ft_from_bits64(bits[1]);
        sNaviParam.wM = ft_from_bits64(bits[2]);
        for (uint32_t i = 0; i < 4u; ++i) sNaviParam.qME[i] = ft_from_bits64(bits[3+i]);
        sin_calls = cos_calls = qmulti_calls = q2c_calls = 0; pointer_ok = 1;

        printf("%" PRIu32, reset); for (uint32_t i = 0; i < 7u; ++i) printf(" %" PRIu64, bits[i]);
        CMICalculate();
        printf(" %" PRIu32 " %" PRIu64, sNaviFlag.WalkReNaviFlg, ft_bits64(sNaviParam.tME));
        for (uint32_t i = 0; i < 9u; ++i) printf(" %" PRIu64, ft_bits64((&sNaviData.cmi[0][0])[i]));
        for (uint32_t i = 0; i < 9u; ++i) printf(" %" PRIu64, ft_bits64((&sNaviData.cim[0][0])[i]));
        for (uint32_t i = 0; i < 3u; ++i) printf(" %" PRIu64, ft_bits64(sNaviData.wmi[i]));
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               sin_calls, cos_calls, qmulti_calls, q2c_calls, pointer_ok);
    }
    return 0;
}
