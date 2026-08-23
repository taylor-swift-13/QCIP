#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CcuUartDataProc/IP_CcuUartDataProc.h"

#define MEM_TO_FLT32(p) ft_from_bits32(*(const volatile uint32_t *)(p))
#define MEM_TO_FLT64(p) ft_from_bits64(*(const volatile uint64_t *)(p))
#define POW_2E_N30 0x1p-30

uint8_t CheckSumAdd08(const uint8_t *data, uint32_t length)
{
    uint32_t sum = 0;
    for (uint32_t i = 0; i < length; ++i) sum += data[i];
    return (uint8_t)sum;
}

#include "../../../../INPUT/orbiter-new/CcuUartDataProc/IP_CcuUartDataProc.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint8_t base = (uint8_t)ft_prng_next(&state);
        uint8_t step = (uint8_t)ft_prng_next(&state);
        uint32_t mode = (uint32_t)(row % 5u);
        uint32_t valid_mask = (uint32_t)(ft_prng_next(&state) & 7u);
        int32_t sentinel32 = (int32_t)ft_prng_next(&state);
        uint64_t sentinel64 = ft_prng_next(&state);
        uint8_t buffer[ZLQ_CCU_RECV_DATA_LEN];
        for (uint32_t i = 0; i < ZLQ_CCU_RECV_DATA_LEN; ++i)
            buffer[i] = (uint8_t)(base + i * step);
        buffer[0] = (mode == 1u || mode == 4u) ? 0u : 0xEBu;
        buffer[1] = 0x90u;
        buffer[16] = (valid_mask & 1u) ? 5u : 0u;
        buffer[17] = (valid_mask & 2u) ? 5u : 0u;
        buffer[18] = (valid_mask & 4u) ? 5u : 0u;
        buffer[91] = CheckSumAdd08(buffer, 91u);
        if (mode == 3u || mode == 4u) buffer[91] ^= 1u;
        sZlqCcuStatus.flgCommValidRecv = (mode == 2u || mode == 4u) ? 1u : 0u;
        sZlqCcuRecvData.bDataValid = (uint32_t)sentinel32;
        sZlqCcuRecvData.flgAbnormal = (uint32_t)sentinel32;
        sZlqCcuRecvData.ZZT4 = (uint32_t)sentinel32;
        sZlqCcuRecvData.ZBZ4 = (uint32_t)sentinel32;
        for (uint32_t h = 2; h < 5; ++h) {
            sStsRaw[h].bDataValid = (uint32_t)sentinel32;
            for (uint32_t q = 0; q < 4; ++q) sStsRaw[h].attQuat[q] = sentinel32;
            sStsRaw[h].tS = ft_from_bits64(sentinel64);
        }
        sTime.sstime = 1234.5;

        printf("%u %u %" PRIu32 " %" PRIu32 " %" PRId32 " %" PRIu64,
               base, step, mode, valid_mask, sentinel32, sentinel64);
        uint32_t result = CcuUartDataProc(buffer);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               result, sZlqCcuRecvData.bDataValid, sZlqCcuRecvData.flgAbnormal,
               sZlqCcuRecvData.ZZT4, sZlqCcuRecvData.ZBZ4);
        for (uint32_t h = 2; h < 5; ++h) printf(" %" PRIu32, sStsRaw[h].bDataValid);
        for (uint32_t h = 2; h < 5; ++h)
            for (uint32_t q = 0; q < 4; ++q) printf(" %" PRId32, sStsRaw[h].attQuat[q]);
        for (uint32_t h = 2; h < 5; ++h) printf(" %" PRIu64, ft_bits64(sStsRaw[h].tS));
        putchar('\n');
    }
    return 0;
}
