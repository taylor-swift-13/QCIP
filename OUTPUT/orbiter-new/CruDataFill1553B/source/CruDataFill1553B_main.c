#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CruPackFlyToWalk/IP_CruPackFlyToWalk.h"

#define RT_SA10 10u
#define B1553_RT_TRAN 1u

static uint32_t copy_calls;
static uint32_t write_calls;
static uint32_t copy_ok;
static uint32_t write_ok;
static uint16_t first_words[8];
static uint16_t last_words[8];
static uint16_t *last_copy_dst;

void BufferCopy08to16(uint16_t *dst, uint8_t *src, uint32_t length)
{
    uint32_t i = copy_calls;
    copy_ok &= i < 8u && src == &sCrucialSave.saveBuff[i * 64u] && length == 64u;
    for (uint32_t j = 0; j < length / 2u; ++j)
        dst[j] = UI16_MAKE(src[j * 2u], src[j * 2u + 1u]);
    last_copy_dst = dst;
    ++copy_calls;
}

void B1553RtSaWrite(uint32_t sub_addr, uint32_t direction, uint16_t *data,
                    uint32_t length, uint32_t instance)
{
    uint32_t i = write_calls;
    write_ok &= i < 8u && sub_addr == 10u + i && direction == 1u &&
                data == last_copy_dst && length == 32u && instance == 0u;
    if (i < 8u) {
        first_words[i] = data[0];
        last_words[i] = data[31];
    }
    ++write_calls;
}

#include "../../../../INPUT/orbiter-new/CruDataFill1553B/IP_CruDataFill1553B.c"

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
            sCrucialSave.saveBuff[i] = (uint8_t)(base + i * step);
        copy_calls = write_calls = 0;
        copy_ok = write_ok = 1;
        last_copy_dst = NULL;

        CruDataFill1553B();

        printf("%u %u %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               base, step, copy_calls, write_calls, copy_ok, write_ok);
        for (uint32_t i = 0; i < 8u; ++i) printf(" %u", first_words[i]);
        for (uint32_t i = 0; i < 8u; ++i) printf(" %u", last_words[i]);
        putchar('\n');
    }
    return 0;
}
