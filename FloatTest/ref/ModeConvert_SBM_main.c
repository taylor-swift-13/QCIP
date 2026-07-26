#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_ModeConvert_SBM.h"

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
        ModeConvert_SBM x = {0};
        uint32_t initial = 7u + n % 4u;
        x.m_WorkMode = initial;
        x.csOrb19_Para_I_t0 = -3.0 + (double)n * 0.17;
        x.csModePara_dt_OrbitInject = -1.3 + (double)(n % 7u) * 0.11;
        double delta = x.csModePara_dt_OrbitInject +
                       ((double)(n % 5u) - 2.0) * 0.07;
        x.m_starTime = x.csOrb19_Para_I_t0 + delta;
        uint64_t star_bits = bits_of_double(x.m_starTime);
        uint64_t reference_bits = bits_of_double(x.csOrb19_Para_I_t0);
        uint64_t inject_bits = bits_of_double(x.csModePara_dt_OrbitInject);
        ModeConvert_SBMFun(&x);
        printf("%llu %llu %llu %u %u\n",
               (unsigned long long)star_bits,
               (unsigned long long)reference_bits,
               (unsigned long long)inject_bits,
               initial, x.m_WorkMode);
    }
    return 0;
}
