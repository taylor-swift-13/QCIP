#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/BinarySearch_New/IP_BinarySearch_New.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);

    for (unsigned long row = 0; row < count; ++row) {
        STcmdParamModify table[8] = {0};
        uint32_t base = 10u + (uint32_t)(ft_prng_next(&state) % 1000u);
        for (int i = 0; i < 8; ++i) {
            base += 1u + (uint32_t)(ft_prng_next(&state) % 9u);
            table[i].paraID = base;
        }

        int32_t lo = (int32_t)(ft_prng_next(&state) % 5u);
        int32_t hi = lo + (int32_t)(ft_prng_next(&state) % (uint64_t)(8 - lo));
        uint32_t id;
        switch (row % 6u) {
        case 0: lo = 0; hi = 7; id = table[0].paraID; break;
        case 1: lo = 0; hi = 7; id = table[7].paraID; break;
        case 2: lo = 0; hi = 7; id = table[3].paraID; break;
        case 3: id = table[lo].paraID; break;
        case 4: id = table[hi].paraID + 1u; break;
        default: id = table[lo].paraID - 1u; break;
        }

        int32_t result = BinarySearch_New(id, lo, hi, table);
        printf("%" PRIu32, id);
        for (int i = 0; i < 8; ++i) printf(" %" PRIu32, table[i].paraID);
        printf(" %" PRId32 " %" PRId32 " %" PRId32 "\n", lo, hi, result);
    }
    return 0;
}
