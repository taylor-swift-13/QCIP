#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_Track_Atti.h"

#define C2ANGLE_STUB(name) \
    void name(double *out, const double *matrix) \
    { (void)matrix; out[0] = out[1] = out[2] = 0.0; }
C2ANGLE_STUB(C2Angle123)
C2ANGLE_STUB(C2Angle132)
C2ANGLE_STUB(C2Angle213)
C2ANGLE_STUB(C2Angle231)
C2ANGLE_STUB(C2Angle312)
C2ANGLE_STUB(C2Angle321)

void MatrixMulti331(double *out, const double *matrix, const double *vector)
{
    for (unsigned i = 0; i < 3u; ++i) {
        out[i] = 0.0;
        for (unsigned j = 0; j < 3u; ++j)
            out[i] += matrix[i * 3u + j] * vector[j];
    }
}
double VectorNorm3(const double *value)
{ (void)value; return 0.0; }
void Memcpyx(unsigned char *destination, const unsigned char *source,
             unsigned count)
{ memcpy(destination, source, count); }

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
        CS_Track_Atti x = {0};
        x.m_WorkMode = n % 14u;
        x.csAttPara_Seq_AttD[x.m_WorkMode] = 123u;
        x.m_DeltaT = 0.125 + (double)(n % 5u) * 0.0625;
        x.csCtrlerOtherPara_Mdf_TorqRef =
            0.25 + (double)(n % 4u) * 0.125;
        x.csCtrlerOtherPara_Mlf_TorqRef = 1.0e100;
        for (unsigned i = 0; i < 3u; ++i) {
            x.csMnvData_dA_Ref_Lst[i] =
                ((double)(int)(n * 3u + i * 7u) - 50.0) * 0.0078125;
            x.csAttCoreData_wri[i] =
                ((double)(int)(n * 11u + i * 5u) - 80.0) * 0.00390625;
            x.csAttCoreData_wri_Lst[i] =
                ((double)(int)(n * 5u + i * 13u) - 70.0) * 0.00390625;
            x.csCtrlerData_Js_Use[i][i] = 1.0;
        }
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csMnvData_dA_Ref_Lst[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_wri[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csAttCoreData_wri_Lst[i]));
        printf("%llu %llu ",
               (unsigned long long)bits_of_double(x.m_DeltaT),
               (unsigned long long)bits_of_double(x.csCtrlerOtherPara_Mdf_TorqRef));
        CS_Track_AttiFun(&x);
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csMnvData_ddA_Ref[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csMnvData_TorqRef[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csMnvData_A_Ref[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu ", (unsigned long long)bits_of_double(x.csMnvData_dA_Ref[i]));
        for (unsigned i = 0; i < 3u; ++i)
            printf("%llu%c", (unsigned long long)bits_of_double(x.csAttCoreData_wri_Lst[i]),
                   i == 2u ? '\n' : ' ');
    }
    return 0;
}
