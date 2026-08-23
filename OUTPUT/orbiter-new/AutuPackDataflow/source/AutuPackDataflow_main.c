#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/AutuPackDataflow/IP_AutuPackDataflow.h"

static AUTOPACK *active_data;
static uint8_t *active_buffer;
static uint32_t active_first_initial;
static uint32_t bit_calls, byte_calls, total_calls, sequence_code, sequence_factor;
static uint32_t pointer_ok, argument_ok;

void AutoPackBit(uint8_t *buf, AUTOPACK *data, uint32_t *first, uint32_t length)
{
    pointer_ok &= buf == active_buffer && data == &active_data[total_calls];
    argument_ok &= *first == active_first_initial && length == 31u;
    ++bit_calls; sequence_code += sequence_factor; sequence_factor *= 3u; ++total_calls;
}
void AutoPackByte(uint8_t *buf, AUTOPACK *data, uint32_t *first, uint32_t length)
{
    pointer_ok &= buf == active_buffer && data == &active_data[total_calls];
    argument_ok &= *first == active_first_initial && length == 31u;
    ++byte_calls; sequence_code += 2u * sequence_factor; sequence_factor *= 3u; ++total_calls;
}

#include "../../../../INPUT/orbiter-new/AutuPackDataflow/IP_AutuPackDataflow.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t first = (uint32_t)(row & 1u);
        uint32_t length = (uint32_t)(ft_prng_next(&state) % 6u);
        uint32_t stop = (uint32_t)(ft_prng_next(&state) % 6u);
        uint32_t pattern = (uint32_t)(ft_prng_next(&state) & 31u);
        uint32_t shift_byte = (uint32_t)(ft_prng_next(&state) % 32u);
        uint32_t shift_bit = (uint32_t)(ft_prng_next(&state) % 8u);
        uint8_t buffer[32] = {0};
        AUTOPACK data[6] = {{0}};
        for (uint32_t i = 0; i < 6u; ++i) {
            data[i].Stop = i == stop;
            data[i].type = (pattern & (1u << i)) ? UINT32_C(0x80010000) : 1u;
        }
        active_data = data; active_buffer = buffer; active_first_initial = first;
        sPackShift.byteIndex = shift_byte; sPackShift.bitIndex = shift_bit;
        bit_calls = byte_calls = total_calls = sequence_code = 0;
        sequence_factor = pointer_ok = argument_ok = 1;

        printf("%" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32, first, length, stop, pattern, shift_byte, shift_bit);
        AutuPackDataflow(buffer, data, &first, length, 31u);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               first, sPackShift.byteIndex, sPackShift.bitIndex, bit_calls, byte_calls,
               total_calls, sequence_code, pointer_ok, argument_ok);
    }
    return 0;
}
