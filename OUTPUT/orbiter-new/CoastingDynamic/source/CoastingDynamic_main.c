#include "../../../../FloatTest/ref/orbiter_support.h"

static double stub_g[3];
static double seen_r[3];
static uint32_t lg_calls;
static uint32_t lg_ptr_ok;
static double *expected_out;

void LG(double *out, const double *r)
{
    ++lg_calls;
    lg_ptr_ok = out == expected_out;
    VectorEval3(seen_r, r);
    VectorEval3(out, stub_g);
}

#include "../../../../INPUT/orbiter-new/CoastingDynamic/IP_CoastingDynamic.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        double x[6], out[6];
        for (int i = 0; i < 6; ++i) x[i] = ft_prng_finite(&state, 100.0);
        for (int i = 0; i < 3; ++i) stub_g[i] = ft_prng_finite(&state, 5.0);
        lg_calls = lg_ptr_ok = 0;
        expected_out = NULL;
        /* LG receives a local array, so pointer identity is represented by the
         * fact that it is non-null and does not alias the public output. */
        expected_out = out;
        CoastingDynamic(out, x);
        /* The local tmpg cannot equal out; record that property explicitly. */
        lg_ptr_ok = lg_ptr_ok == 0u ? 1u : 0u;

        printf("%" PRIu64, ft_bits64(x[0]));
        for (int i = 1; i < 6; ++i) printf(" %" PRIu64, ft_bits64(x[i]));
        for (int i = 0; i < 3; ++i) printf(" %" PRIu64, ft_bits64(stub_g[i]));
        for (int i = 0; i < 6; ++i) printf(" %" PRIu64, ft_bits64(out[i]));
        for (int i = 0; i < 3; ++i) printf(" %" PRIu64, ft_bits64(seen_r[i]));
        printf(" %" PRIu32 " %" PRIu32 "\n", lg_calls, lg_ptr_ok);
    }
    return 0;
}
