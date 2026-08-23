#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/ConstDiagSignInt/IP_ConstDiagSignInt.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);

    for (unsigned long row = 0; row < count; ++row) {
        int32_t values[8];
        int32_t old_values[8];
        int32_t cnt = (int32_t)(ft_prng_next(&state) % 21u) - 10;
        int32_t max_count = (int32_t)(ft_prng_next(&state) % 13u) - 3;
        int32_t size = (int32_t)(ft_prng_next(&state) % 9u);
        for (int i = 0; i < 8; ++i) {
            values[i] = (int32_t)(ft_prng_next(&state) % 41u) - 20;
            old_values[i] = values[i];
        }
        if (row % 4u == 1u && size > 0) old_values[size - 1] += 1;
        if (row % 4u == 2u) size = 0;
        if (row % 4u == 3u && size > 0) old_values[0] -= 1;

        int32_t cnt_before = cnt;
        uint32_t result = ConstDiagSignInt(&cnt, values, old_values, size, max_count);
        printf("%" PRId32 " %" PRId32 " %" PRId32, cnt_before, max_count, size);
        for (int i = 0; i < 8; ++i) printf(" %" PRId32, values[i]);
        for (int i = 0; i < 8; ++i) printf(" %" PRId32, old_values[i]);
        printf(" %" PRId32 " %" PRIu32 "\n", cnt, result);
    }
    return 0;
}
