#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_TrgtAtt_NWM_USU.h"

static void identity(double *out)
{
    for (unsigned i = 0; i < 9u; ++i)
        out[i] = i % 4u == 0 ? 1.0 : 0.0;
}
#define ANGLE_STUB(name) \
    void name(double *out, double a, double b, double c) \
    { (void)a; (void)b; (void)c; identity(out); }
ANGLE_STUB(Angle2C123)
ANGLE_STUB(Angle2C132)
ANGLE_STUB(Angle2C213)
ANGLE_STUB(Angle2C231)
ANGLE_STUB(Angle2C312)
ANGLE_STUB(Angle2C321)

void MatrixMulti333(double *out, const double *a, const double *b)
{
    double temp[9] = {0};
    for (unsigned i = 0; i < 3u; ++i)
        for (unsigned j = 0; j < 3u; ++j)
            for (unsigned k = 0; k < 3u; ++k)
                temp[i * 3u + j] += a[i * 3u + k] * b[k * 3u + j];
    memcpy(out, temp, sizeof(temp));
}
void MatrixMulti331(double *out, const double *a, const double *b)
{
    double temp[3] = {0};
    for (unsigned i = 0; i < 3u; ++i)
        for (unsigned k = 0; k < 3u; ++k)
            temp[i] += a[i * 3u + k] * b[k];
    memcpy(out, temp, sizeof(temp));
}
void C2Angle123(double *out, const double *matrix)
{ (void)matrix; out[0] = out[1] = out[2] = 0.0; }
void C2Q(double *out, const double *matrix)
{ (void)matrix; out[0] = out[1] = out[2] = 0.0; out[3] = 1.0; }

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
        CS_TrgtAtt_NWM_USU x = {0};
        x.m_WorkMode = n % 14u;
        x.csAttPara_Seq_AttD[x.m_WorkMode] =
            (uint32_t[]){123,132,213,231,312,321}[n % 6u];
        x.csDriftAngData_Psi_DA = 0.0;
        x.csDriftAngData_dPsi_DA =
            ((double)(int)(n % 11u) - 5.0) * 0.0009765625;
        identity(&x.csAttCoreData_Cbiasp[0][0]);
        identity(&x.csLoadAxisData_Cbsi_DARot[0][0]);
        identity(&x.csLoadAxisData_Csib_DARot[0][0]);
        identity(&x.csOrbData_coi[0][0]);
        for (unsigned i = 0; i < 3u; ++i)
            x.csOrbData_w0i[i] =
                ((double)(int)(n * 7u + i * 5u) - 90.0) * 0.015625;
        uint64_t input[4];
        for (unsigned i = 0; i < 3u; ++i)
            input[i] = bits_of_double(x.csOrbData_w0i[i]);
        input[3] = bits_of_double(x.csDriftAngData_dPsi_DA);
        CS_TrgtAtt_NWM_USUFun(&x);
        for (unsigned i = 0; i < 4u; ++i)
            printf("%llu ", (unsigned long long)input[i]);
        for (unsigned i = 0; i < 9u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_Cro_si[0][i]));
        for (unsigned i = 0; i < 9u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_Cro[0][i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_wri[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu%c", (unsigned long long)bits_of_double(x.csAttCoreData_wro[i]),
                   i == 2u ? '\n' : ' ');
    }
    return 0;
}
