#include "../../../../FloatTest/ref/orbiter_support.h"

static double constant_g[3];
static double last_r[3];
static uint32_t lg_calls;

void LG(double *out, const double *r)
{
    ++lg_calls;
    VectorEval3(last_r, r);
    VectorEval3(out, constant_g);
}

#include "../../../../INPUT/orbiter-new/CoastingDynamic/IP_CoastingDynamic.c"
#include "../../../../INPUT/orbiter-new/CoastingTrajectory/IP_CoastingTrajectory.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        double r[3], v[3], out[6];
        for (int i = 0; i < 3; ++i) {
            r[i] = ft_prng_finite(&state, 100.0);
            v[i] = ft_prng_finite(&state, 10.0);
            constant_g[i] = ft_prng_finite(&state, 2.0);
        }
        double t = row == 0u ? 0.0 : ft_prng_finite(&state, 4.0);
        uint32_t n = 1u + (uint32_t)(row % 4u);
        lg_calls = 0;
        CoastingTrajectory(out, r, v, t, n);

        printf("%" PRIu64, ft_bits64(r[0]));
        for (int i = 1; i < 3; ++i) printf(" %" PRIu64, ft_bits64(r[i]));
        for (int i = 0; i < 3; ++i) printf(" %" PRIu64, ft_bits64(v[i]));
        printf(" %" PRIu64 " %" PRIu32, ft_bits64(t), n);
        for (int i = 0; i < 3; ++i) printf(" %" PRIu64, ft_bits64(constant_g[i]));
        for (int i = 0; i < 6; ++i) printf(" %" PRIu64, ft_bits64(out[i]));
        printf(" %" PRIu32, lg_calls);
        for (int i = 0; i < 3; ++i) printf(" %" PRIu64, ft_bits64(last_r[i]));
        putchar('\n');
    }
    return 0;
}
