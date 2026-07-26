#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_ModeConvert_EIM.h"

static uint64_t bits_of_double(double value)
{
    uint64_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

int main(int argc, char **argv)
{
    unsigned count = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 30u;
    for (unsigned n = 0; n < count; ++n) {
        ModeConvert_EIM x = {0};
        uint32_t initial = 3u + n % 3u;
        x.m_WorkMode = initial;
        x.csModePara_dt_END_EIM = -1.25 + (double)n * 0.17;
        x.ModeObject_Timer_Mode[initial] =
            x.csModePara_dt_END_EIM + ((double)(n % 5u) - 2.0) * 0.25;
        uint64_t timer_bits =
            bits_of_double(x.ModeObject_Timer_Mode[initial]);
        uint64_t end_bits = bits_of_double(x.csModePara_dt_END_EIM);
        ModeConvert_EIMFun(&x);
        printf("%llu %llu %u %u\n",
               (unsigned long long)timer_bits,
               (unsigned long long)end_bits,
               initial, x.m_WorkMode);
    }
    return 0;
}
