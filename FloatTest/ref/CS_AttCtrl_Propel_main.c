#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_AttCtrl_Propel.h"

uint32_t CS_ThrParamCfgX(uint32_t, double *, double, uint32_t, uint32_t,
                        uint32_t, uint32_t, uint32_t *, uint32_t, uint32_t);

static uint64_t bits_of_double(double value)
{
    uint64_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

int main(int argc, char **argv)
{
    unsigned count = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 60u;
    for (unsigned n = 0; n < count; ++n) {
        double timers[14] = {0};
        uint32_t rw[14] = {0};
        uint32_t mode = (n * 7u) % 14u;
        double timer = -2.0 + (double)(n % 9u) * 0.5;
        double start = (double)(n % 5u) * 0.5;
        uint32_t earth = n & 1u;
        uint32_t yaw = (n >> 1) & 1u;
        uint32_t jet_back = (n >> 2) & 1u;
        uint32_t scan_mode = (n * 3u) % 12u;
        uint32_t sub_mode = n % 4u == 0 ? 2u : n % 5u;
        uint32_t unload = (n >> 3) & 1u;
        rw[8] = (n >> 4) & 1u;
        timers[mode] = timer;
        uint32_t result = CS_ThrParamCfgX(
            mode, timers, start, earth, yaw, jet_back, scan_mode,
            rw, sub_mode, unload);
        printf("%u %llu %llu %u %u %u %u %u %u %u %u\n",
               mode,
               (unsigned long long)bits_of_double(timer),
               (unsigned long long)bits_of_double(start),
               earth, yaw, jet_back, scan_mode, rw[8], sub_mode, unload,
               result);
    }
    return 0;
}
