#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_Ctrl_Att_Rate.h"

void Angle2C123(void) {}
void Angle2C132(void) {}
void Angle2C213(void) {}
void Angle2C231(void) {}
void Angle2C312(void) {}
void Angle2C321(void) {}
void C2Q(void) {}
void MatrixMulti331(void) {}
void MatrixMulti333(void) {}
float ModPNHP(float x, float halfperiod)
{ (void)halfperiod; return x; }
void Qdiv(void) {}

static uint64_t bits_of_double(double value)
{
    uint64_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

int main(int argc, char **argv)
{
    unsigned count = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 35u;
    for (unsigned n = 0; n < count; ++n) {
        CS_Ctrl_Att_Rate x = {0};
        x.m_WorkMode = n % 14u;
        x.csCtrlerOtherPara_FS_ModeProc[x.m_WorkMode] = 2u;
        for (unsigned i = 0; i < 3u; ++i) {
            x.csSGAttAcqData_A[i] =
                ((double)(int)(n * 7u + i * 3u) - 80.0) * 0.015625;
            x.csSGAttAcqData_dA[i] =
                ((double)(int)(n * 5u + i * 11u) - 70.0) * 0.0078125;
            x.csSGAttAcqData_w[i] =
                ((double)(int)(n * 13u + i * 2u) - 90.0) * 0.00390625;
        }
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csSGAttAcqData_A[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csSGAttAcqData_dA[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csSGAttAcqData_w[i]));
        CS_Ctrl_Att_RateFun(&x);
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_A_Clp[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_Rate_Clp[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_wbo_Clp[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_A_c[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu%c", (unsigned long long)bits_of_double(x.csAttCoreData_Rate_c[i]),
                   i == 2u ? '\n' : ' ');
    }
    return 0;
}
