#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CoorConvert/IP_CoorConvert.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        double x = ft_prng_finite(&state, 1000.0);
        double y = ft_prng_finite(&state, 1000.0);
        double x0 = ft_prng_finite(&state, 100.0);
        double y0 = ft_prng_finite(&state, 100.0);
        double a = row == 0u ? 0.0 : (row == 1u ? 0x1.921fb54442d18p+0
                                                : ft_prng_finite(&state, 12.0));
        double b = row == 2u ? -0x1.921fb54442d18p+0 : ft_prng_finite(&state, 12.0);
        double out[2];
        CoorConvert(out, x, y, x0, y0, a, b);
        printf("%" PRIu64 " %" PRIu64 " %" PRIu64 " %" PRIu64
               " %" PRIu64 " %" PRIu64 " %" PRIu64 " %" PRIu64 "\n",
               ft_bits64(x), ft_bits64(y), ft_bits64(x0), ft_bits64(y0),
               ft_bits64(a), ft_bits64(b), ft_bits64(out[0]), ft_bits64(out[1]));
    }
    return 0;
}
