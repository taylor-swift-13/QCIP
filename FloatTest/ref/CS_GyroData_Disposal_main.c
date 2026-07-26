#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_GyroData_Disposal.h"

double m_DeltaT = 0.25;

double LimitDouble(double value, double bound)
{
    return value > bound ? bound : (value < -bound ? -bound : value);
}

void MatrixTran(double *out, const double *in, unsigned rows, unsigned cols)
{ (void)out; (void)in; (void)rows; (void)cols; }
void MatrixMulti(double *out, const double *a, const double *b,
                 unsigned rows, unsigned inner, unsigned cols)
{ (void)out; (void)a; (void)b; (void)rows; (void)inner; (void)cols; }
void MatrixInv33(double *out, const double *in)
{ (void)out; (void)in; }

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
        CS_GyroData_Disposal x = {0};
        x.m_WorkMode = n % 14u;
        x.csGyroDiagData_F_NoUseGroup = n & 1u;
        x.csAttPara_FS_AttD = n % 5u;
        x.csGyroDiagPara_FP_ModeStopCtrl[x.m_WorkMode] = (n >> 1) & 1u;
        unsigned valid_count = n % 3u; /* Deliberately invalid: 0, 1, or 2. */
        for (unsigned i = 0; i < valid_count; ++i)
            x.csGyroDiagData_FU_ing[i] = 1u;
        for (unsigned i = 0; i < 3u; ++i) {
            x.csGyroData_deltag_Lst[i] =
                ((double)(int)(n * 5u + i * 7u) - 80.0) * 0.03125;
            x.csGyroData_deltag[i] = 100.0 + (double)i;
        }
        uint64_t history[3], current[3];
        for (unsigned i = 0; i < 3u; ++i) {
            history[i] = bits_of_double(x.csGyroData_deltag_Lst[i]);
            current[i] = bits_of_double(x.csGyroData_deltag[i]);
        }
        CS_GyroData_DisposalFun(&x);
        printf("%u %u %u %u", x.csGyroDiagData_F_NoUseGroup,
               x.csAttPara_FS_AttD,
               x.csGyroDiagPara_FP_ModeStopCtrl[x.m_WorkMode],
               valid_count);
        for (unsigned i = 0; i < 3u; ++i)
            printf(" %llu", (unsigned long long)history[i]);
        for (unsigned i = 0; i < 3u; ++i)
            printf(" %llu", (unsigned long long)current[i]);
        printf(" %u", x.csModeData_F_StopCtrl);
        for (unsigned i = 0; i < 3u; ++i)
            printf(" %llu",
                   (unsigned long long)bits_of_double(x.csGyroData_deltag[i]));
        putchar('\n');
    }
    return 0;
}
