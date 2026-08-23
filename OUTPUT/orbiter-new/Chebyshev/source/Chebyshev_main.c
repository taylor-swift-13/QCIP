#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/Chebyshev/IP_Chebyshev.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        int32_t n = row < 6u ? (int32_t)row : (int32_t)(ft_prng_next(&state) % 6u);
        double tao;
        if (row == 0u) tao = 0.0;
        else if (row == 1u) tao = 1.0;
        else if (row == 2u) tao = -1.0;
        else tao = ft_prng_finite(&state, 1.25);
        double coeffs[6];
        for (int i = 0; i < 6; ++i) coeffs[i] = ft_prng_finite(&state, 4.0);
        double result;
        Chebyshev(&result, tao, coeffs, n);
        printf("%" PRId32 " %" PRIu64, n, ft_bits64(tao));
        for (int i = 0; i < 6; ++i) printf(" %" PRIu64, ft_bits64(coeffs[i]));
        printf(" %" PRIu64 "\n", ft_bits64(result));
    }
    return 0;
}
