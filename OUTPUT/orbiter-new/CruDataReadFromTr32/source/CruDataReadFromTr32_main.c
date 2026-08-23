#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CruPackFlyToWalk/IP_CruPackFlyToWalk.h"

static uint32_t tr_calls;
static uint32_t address_ok;
static uint32_t stub_base;
static uint32_t stub_step;

uint32_t Tr32Uint(volatile uint32_t *a, volatile uint32_t *b, volatile uint32_t *c)
{
    uintptr_t offset = (uintptr_t)tr_calls * 4u;
    address_ok &= (uintptr_t)a == (uintptr_t)SOC_SRAM_TR32_CRUDATA_FIRST + offset &&
                  (uintptr_t)b == (uintptr_t)SOC_SRAM_TR32_CRUDATA_SECOND + offset &&
                  (uintptr_t)c == (uintptr_t)SOC_SRAM_TR32_CRUDATA_THIRD + offset;
    return stub_base + stub_step * tr_calls++;
}

#include "../../../../INPUT/orbiter-new/CruDataReadFromTr32/IP_CruDataReadFromTr32.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        stub_base = row == 0u ? 0u : row == 1u ? UINT32_MAX : (uint32_t)ft_prng_next(&state);
        stub_step = row < 2u ? (uint32_t)row : (uint32_t)ft_prng_next(&state);
        memset(sCrucialRest.tr32Buff, 0xa5, sizeof sCrucialRest.tr32Buff);
        tr_calls = 0;
        address_ok = 1;
        CruDataReadFromTr32();
        uint64_t sum = 0;
        for (uint32_t i = 0; i < 512u; ++i) sum += sCrucialRest.tr32Buff[i];
        printf("%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               stub_base, stub_step, tr_calls, address_ok);
        for (uint32_t i = 0; i < 4u; ++i) printf(" %u", sCrucialRest.tr32Buff[i]);
        for (uint32_t i = 508u; i < 512u; ++i) printf(" %u", sCrucialRest.tr32Buff[i]);
        printf(" %" PRIu64 "\n", sum);
    }
    return 0;
}
