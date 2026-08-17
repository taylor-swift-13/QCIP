#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_AttCtrl_Propel.h"

double LimitDouble(double x, double bound)
{
    if (x > bound) return bound;
    if (x < -bound) return -bound;
    return x;
}

void Memsetx(unsigned char *p, unsigned int value, unsigned int n)
{
    memset(p, (int)(value & 0xffu), n);
}

int Sgn2(double x) { return (x > 0.0) - (x < 0.0); }

static uint64_t rng_state;
static uint64_t rng64(void)
{
    uint64_t x = rng_state;
    x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
    rng_state = x;
    return x * UINT64_C(2685821657736338717);
}
static double unit(void) { return (double)(rng64() >> 11) * 0x1.0p-53; }
static double range(double lo, double hi) { return lo + unit() * (hi - lo); }
static uint64_t bits(double x)
{
    uint64_t b; memcpy(&b, &x, sizeof b); return b;
}

static void run_one(unsigned int kind, unsigned int selector,
    double timer, double start, const unsigned int flags[7],
    const double times_in[3], const unsigned int jets_in[3],
    const unsigned int states_in[3], const double values[6])
{
    double times[3], mode_timer[14] = {0};
    unsigned int jets[3], states[3], rw[14] = {0};
    unsigned int mode = 0, min_pos = 91, max_pos = 92, i;

    memcpy(times, times_in, sizeof times);
    memcpy(jets, jets_in, sizeof jets);
    memcpy(states, states_in, sizeof states);
    mode_timer[selector % 14u] = timer;
    rw[8] = flags[4];

    printf("%u %u %llu %llu", kind, selector,
        (unsigned long long)bits(timer), (unsigned long long)bits(start));
    for (i = 0; i < 7; ++i) printf(" %u", flags[i]);
    for (i = 0; i < 3; ++i) printf(" %llu", (unsigned long long)bits(times[i]));
    for (i = 0; i < 3; ++i) printf(" %u", jets[i]);
    for (i = 0; i < 3; ++i) printf(" %u", states[i]);
    for (i = 0; i < 6; ++i) printf(" %llu", (unsigned long long)bits(values[i]));

    if (kind == 0) {
        mode = CS_ThrParamCfgX(selector, mode_timer, start,
            flags[0], flags[1], flags[2], flags[3], rw, flags[5], flags[6]);
    } else if (kind == 1) {
        CS_AttCtrl_Propel ip;
        memset(&ip, 0, sizeof ip);
        ip.csJPCPara_FP_FJXYZ = selector;
        memcpy(ip.csJPCData_mPhase_T, times, sizeof times);
        memcpy(ip.csJPCData_F_Jet, jets, sizeof jets);
        memcpy(ip.csJPCData_FJ, states, sizeof states);
        CS_AttCtrl_JetCrossCtrl(&ip);
        memcpy(times, ip.csJPCData_mPhase_T, sizeof times);
        memcpy(jets, ip.csJPCData_F_Jet, sizeof jets);
        memcpy(states, ip.csJPCData_FJ, sizeof states);
    } else {
        CS_FindMinMaxPos(&min_pos, &max_pos, values, selector);
    }

    printf(" %u", mode);
    for (i = 0; i < 3; ++i) printf(" %llu", (unsigned long long)bits(times[i]));
    for (i = 0; i < 3; ++i) printf(" %u", jets[i]);
    for (i = 0; i < 3; ++i) printf(" %u", states[i]);
    printf(" %u %u\n", min_pos, max_pos);
}

static void directed(void)
{
    const unsigned int f0[7] = {0,0,0,0,1,0,0};
    const unsigned int f1[7] = {1,0,0,0,1,0,0};
    const unsigned int f2[7] = {0,0,0,0,0,2,0};
    const unsigned int f3[7] = {0,0,0,0,1,0,1};
    const double ta[3] = {0.01,0.01,0.02};
    const double tb[3] = {0.001,0.001,0.001};
    const double tc[3] = {-0.01,-0.01,0.02};
    const unsigned int ja[3] = {1,2,3};
    const unsigned int jb[3] = {2,2,1};
    const unsigned int sa[3] = {0,0,0};
    const unsigned int sb[3] = {1,1,1};
    const double va[6] = {0,4,-2,4,0,1};
    const double vz[6] = {0,0,0,0,0,0};

    run_one(0,1,0.5,1.0,f0,ta,ja,sa,va);
    run_one(0,6,2.0,1.0,f0,ta,ja,sa,va);
    run_one(0,8,2.0,1.0,f1,ta,ja,sa,va);
    run_one(0,8,2.0,1.0,f2,ta,ja,sa,va);
    run_one(0,5,2.0,1.0,f3,ta,ja,sa,va);
    run_one(1,1,0,0,f0,ta,ja,sa,va);
    run_one(1,2,0,0,f0,ta,jb,sa,va);
    run_one(1,3,0,0,f0,tb,jb,sa,va);
    run_one(1,1,0,0,f0,tc,jb,sb,va);
    run_one(1,0,0,0,f0,ta,jb,sa,va);
    run_one(2,6,0,0,f0,ta,ja,sa,va);
    run_one(2,6,0,0,f0,ta,ja,sa,vz);
    run_one(2,0,0,0,f0,ta,ja,sa,va);
    run_one(2,4,0,0,f0,ta,ja,sa,va);
}

int main(int argc, char **argv)
{
    long n = argc > 1 ? strtol(argv[1], 0, 0) : 1000;
    uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0)
        : UINT64_C(0x13198a2e03707344);
    long k; unsigned int i;
    rng_state = seed ? seed : 1;
    directed();
    for (k = 0; k < n; ++k) {
        unsigned int kind = (unsigned int)(rng64() % 3);
        unsigned int selector;
        unsigned int flags[7], jets[3], states[3];
        double times[3], values[6];
        if (kind == 0) selector = (unsigned int)(rng64() % 14);
        else if (kind == 1) selector = (unsigned int)(rng64() % 5);
        else selector = (unsigned int)(rng64() % 7);
        for (i = 0; i < 7; ++i) flags[i] = (unsigned int)(rng64() % (i == 3 ? 12 : 3));
        for (i = 0; i < 3; ++i) {
            times[i] = range(-0.03,0.03);
            jets[i] = (unsigned int)(rng64() % 5);
            states[i] = (unsigned int)(rng64() & 1);
        }
        for (i = 0; i < 6; ++i)
            values[i] = ((rng64() & 7) == 0) ? 0.0 : range(-100.0,100.0);
        run_one(kind, selector, range(-2.0,3.0), range(-2.0,3.0),
            flags, times, jets, states, values);
    }
    return 0;
}
