#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AutoPackByte/IP_AutoPackByte.h"
#include "../../../../INPUT/orbiter-new/AutoPackByte/IP_AutoPackByte.c"

int main(int argc, char **argv)
{
    static const uint32_t types[6] =
        {ORIGIN_NULL, ORIGIN_BYTE, ORIGIN_WORD, ORIGIN_3BYTE, ORIGIN_DWORD, ORIGIN_8BYTE};
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t type = types[row % 6u];
        uint32_t first = (uint32_t)((row / 6u) & 1u);
        uint32_t shift_byte = (uint32_t)(ft_prng_next(&state) % 8u);
        uint32_t shift_bit = (uint32_t)(ft_prng_next(&state) % 8u);
        uint32_t byte_id = (uint32_t)(ft_prng_next(&state) % 8u);
        uint8_t background = (uint8_t)ft_prng_next(&state);
        uint64_t value = ft_prng_next(&state);
        uint8_t source[8];
        uint8_t buffer[16];
        for (uint32_t i = 0; i < 8u; ++i) source[i] = (uint8_t)(value >> (8u * i));
        memset(buffer, background, sizeof buffer);
        AUTOPACK data = {0};
        data.byteID = byte_id; data.pSrc = source; data.type = type;
        sPackShift.byteIndex = shift_byte; sPackShift.bitIndex = shift_bit;

        printf("%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %u %" PRIu64,
               type, first, shift_byte, shift_bit, byte_id, background, value);
        AutoPackByte(buffer, &data, &first, 16u);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               first, data.byteID, sPackShift.byteIndex, sPackShift.bitIndex);
        for (uint32_t i = 0; i < 16u; ++i) printf(" %u", buffer[i]);
        putchar('\n');
    }
    return 0;
}
