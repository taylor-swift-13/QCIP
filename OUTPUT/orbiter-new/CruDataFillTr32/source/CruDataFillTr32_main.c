#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CruPackFlyToWalk/IP_CruPackFlyToWalk.h"

static uint32_t tr_calls;
static uint32_t address_ok;
static uint32_t first_value;
static uint32_t last_value;
static uint64_t value_sum;

void Tr32UintValue(volatile uint32_t *a, volatile uint32_t *b,
                   volatile uint32_t *c, uint32_t value)
{
    uintptr_t offset = (uintptr_t)tr_calls * 4u;
    address_ok &= (uintptr_t)a == (uintptr_t)SOC_SRAM_TR32_CRUDATA_FIRST + offset &&
                  (uintptr_t)b == (uintptr_t)SOC_SRAM_TR32_CRUDATA_SECOND + offset &&
                  (uintptr_t)c == (uintptr_t)SOC_SRAM_TR32_CRUDATA_THIRD + offset;
    if (tr_calls == 0u) first_value = value;
    last_value = value;
    value_sum += value;
    ++tr_calls;
}

#include "../../../../INPUT/orbiter-new/CruDataFillTr32/IP_CruDataFillTr32.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint8_t base = row < 4u ? (uint8_t[]){0u, 255u, 0u, 255u}[row]
                                : (uint8_t)ft_prng_next(&state);
        uint8_t step = row < 4u ? (uint8_t[]){0u, 0u, 1u, 255u}[row]
                                : (uint8_t)ft_prng_next(&state);
        for (uint32_t i = 0; i < 512u; ++i)
            sCrucialSave.saveBuffLast[i] = (uint8_t)(base + i * step);
        tr_calls = first_value = last_value = 0;
        address_ok = 1;
        value_sum = 0;
        CruDataFillTr32();
        printf("%u %u %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu64 "\n",
               base, step, tr_calls, address_ok, first_value, last_value, value_sum);
    }
    return 0;
}
