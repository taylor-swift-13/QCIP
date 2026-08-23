#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/Avv/IP_Avv.c"

static void random_pair(uint64_t *state, double *a, double *b)
{
    do {
        for (int i = 0; i < 3; ++i) {
            a[i] = ft_prng_finite(state, 2.0);
            b[i] = ft_prng_finite(state, 2.0);
        }
        double cross[3];
        VectorCross3(cross, a, b);
        if (VectorNorm3(cross) > 0.05) return;
    } while (1);
}

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        double x1i[3], x2i[3], x1b[3], x2b[3], out[9];
        random_pair(&state, x1i, x2i);
        random_pair(&state, x1b, x2b);
        if (row == 0u) {
            double directed[12] = {1,0,0, 0,1,0, 1,0,0, 0,1,0};
            memcpy(x1i, directed, 3 * sizeof(double));
            memcpy(x2i, directed + 3, 3 * sizeof(double));
            memcpy(x1b, directed + 6, 3 * sizeof(double));
            memcpy(x2b, directed + 9, 3 * sizeof(double));
        }
        Avv(out, x1i, x2i, x1b, x2b);
        double *groups[4] = {x1i, x2i, x1b, x2b};
        printf("%" PRIu64, ft_bits64(groups[0][0]));
        for (int g = 0; g < 4; ++g)
            for (int i = (g == 0 ? 1 : 0); i < 3; ++i)
                printf(" %" PRIu64, ft_bits64(groups[g][i]));
        for (int i = 0; i < 9; ++i) printf(" %" PRIu64, ft_bits64(out[i]));
        putchar('\n');
    }
    return 0;
}
