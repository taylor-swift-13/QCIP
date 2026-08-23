#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CalRelativeDistSpeed/IP_CalRelativeDistSpeed.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        double positions[18], speeds[18];
        int32_t touch[6];
        double distances[15], relative_speeds[15];
        int32_t double_touch[15];
        for (int i = 0; i < 18; ++i) {
            positions[i] = ft_prng_finite(&state, 100.0);
            speeds[i] = ft_prng_finite(&state, 10.0);
        }
        for (int i = 0; i < 6; ++i) touch[i] = (int32_t)(ft_prng_next(&state) & 1u);
        if (row == 0u) for (int i = 0; i < 6; ++i) touch[i] = 0;
        if (row == 1u) for (int i = 0; i < 6; ++i) touch[i] = 1;
        if (row == 2u) {
            for (int i = 0; i < 18; ++i) positions[i] = speeds[i] = 0.0;
        }

        CalRelativeDistSpeed(distances, relative_speeds, double_touch,
                             positions, speeds, touch);
        printf("%" PRIu64, ft_bits64(positions[0]));
        for (int i = 1; i < 18; ++i) printf(" %" PRIu64, ft_bits64(positions[i]));
        for (int i = 0; i < 18; ++i) printf(" %" PRIu64, ft_bits64(speeds[i]));
        for (int i = 0; i < 6; ++i) printf(" %" PRId32, touch[i]);
        for (int i = 0; i < 15; ++i) printf(" %" PRIu64, ft_bits64(distances[i]));
        for (int i = 0; i < 15; ++i) printf(" %" PRIu64, ft_bits64(relative_speeds[i]));
        for (int i = 0; i < 15; ++i) printf(" %" PRId32, double_touch[i]);
        putchar('\n');
    }
    return 0;
}
