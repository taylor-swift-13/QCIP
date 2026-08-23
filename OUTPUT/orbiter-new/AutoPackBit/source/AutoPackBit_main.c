#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AutoPackBit/IP_AutoPackBit.h"

#define ADDR_READ(p) (*(uint32_t *)(p))
#include "../../../../INPUT/orbiter-new/AutoPackBit/IP_AutoPackBit.c"

static uint32_t kind_width(uint32_t kind)
{
    if (kind >= ORIGIN_1BIT && kind <= ORIGIN_7BIT) return kind - ORIGIN_1BIT + 1u;
    return 1u;
}

int main(int argc, char **argv)
{
    static const uint32_t kinds[10] = {ORIGIN_1BIT_NULL, ORIGIN_1BIT, ORIGIN_2BIT,
        ORIGIN_3BIT, ORIGIN_4BIT, ORIGIN_5BIT, ORIGIN_6BIT, ORIGIN_7BIT,
        LOG_UI32_TF, LOG_UI08_TF};
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t kind = kinds[row % 10u];
        uint32_t width = kind_width(kind);
        uint32_t first = (uint32_t)((row / 10u) & 1u);
        uint32_t shift_byte = (uint32_t)(ft_prng_next(&state) % 10u);
        uint32_t shift_bit = (uint32_t)(ft_prng_next(&state) % (9u - width));
        uint32_t byte_id = (uint32_t)(ft_prng_next(&state) % 12u);
        uint32_t stored_pos = (uint32_t)(ft_prng_next(&state) % (9u - width));
        uint8_t background = (uint8_t)ft_prng_next(&state);
        uint32_t source32 = (uint32_t)ft_prng_next(&state);
        uint8_t source8 = (uint8_t)source32;
        uint32_t bit_para = (uint32_t)ft_prng_next(&state);
        uint8_t buffer[12];
        memset(buffer, background, sizeof buffer);
        AUTOPACK data = {0};
        data.byteID = byte_id;
        data.pSrc = kind == LOG_UI32_TF ? (void *)&source32 : (void *)&source8;
        data.type = UI32_MAKE16(kind, stored_pos);
        data.bitPara = bit_para;
        sPackShift.byteIndex = shift_byte; sPackShift.bitIndex = shift_bit;

        printf("%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %u %" PRIu32 " %" PRIu32,
               kind, first, shift_byte, shift_bit, byte_id, stored_pos,
               background, source32, bit_para);
        AutoPackBit(buffer, &data, &first, 12u);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32,
               first, data.byteID, data.type, sPackShift.byteIndex, sPackShift.bitIndex);
        for (uint32_t i = 0; i < 12u; ++i) printf(" %u", buffer[i]);
        putchar('\n');
    }
    return 0;
}
