#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_PrecessionNutationCal.h"

int TripleFabsMax(double x, double y, double z)
{
    double value = fmax(fabs(x), fmax(fabs(y), fabs(z)));
    return value < 0.05 ? 0 : 1;
}
void MatrixIdentity33(double *out)
{
    for (unsigned i = 0; i < 9u; ++i)
        out[i] = i % 4u == 0 ? 1.0 : 0.0;
}
void Q2C(double *out, const double *q) { (void)out; (void)q; }
double CPN_POLY1(double a, double b, double x) { return a + b * x; }
double CPN_POLY3(double a, double b, double c, double d, double x)
{ return a + x * (b + x * (c + x * d)); }
void Rx(double *out, double x) { (void)out; (void)x; }
void Ry(double *out, double x) { (void)out; (void)x; }
void Rz(double *out, double x) { (void)out; (void)x; }
void MatrixMulti333(double *out, const double *a, const double *b)
{ (void)out; (void)a; (void)b; }
void MatrixTran33(double *out, const double *in) { (void)out; (void)in; }

static uint64_t bits_of_double(double value)
{
    uint64_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

int main(int argc, char **argv)
{
    unsigned count = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 36u;
    for (unsigned n = 0; n < count; ++n) {
        CS_PrecessionNutationCal x = {0};
        x.csOrbOtherPara_FS_CPNCal = 0u;
        for (unsigned i = 0; i < 3u; ++i) {
            int raw = (int)((n * 11u + i * 7u) % 19u) - 9;
            x.csOrb19_qd[i] = (double)raw * 0.03125;
        }
        /* Guarantee the tested invalid-qJD branch. */
        x.csOrb19_qd[n % 3u] = (n & 1u) ? 0.0625 : -0.09375;
        uint64_t qbits[3];
        for (unsigned i = 0; i < 3u; ++i)
            qbits[i] = bits_of_double(x.csOrb19_qd[i]);
        CS_PrecessionNutationCalFun(&x);
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)qbits[i]);
        printf("%u", x.csOrbDataOther_F_qJDerr);
        for (unsigned i = 0; i < 9u; ++i)
            printf(" %llu", (unsigned long long)bits_of_double(x.CPN[0][i]));
        putchar('\n');
    }
    return 0;
}
