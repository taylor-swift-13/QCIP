#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_IRES_Attitude.h"

double LimitDouble(double x, double b) { return x > b ? b : (x < -b ? -b : x); }
void MatrixMulti331(double *o, const double *a, const double *b)
{ (void)o; (void)a; (void)b; }
void MatrixTran(double *o, const double *a, unsigned r, unsigned c)
{ (void)o; (void)a; (void)r; (void)c; }
void Memcpyx(unsigned char *d, const unsigned char *s, unsigned n)
{ memcpy(d, s, n); }

int main(int argc, char **argv)
{
    unsigned count = argc > 1 ? (unsigned)strtoul(argv[1], 0, 0) : 30u;
    for (unsigned n = 0; n < count; ++n) {
        CS_IRES_Attitude x;
        memset(&x, 0, sizeof(x));
        x.csIresPara_FS[0] = 0u;
        x.csIresPara_FS[1] = 0u;
        x.csIresDiagData_FV[0] = 1u + n % 3u;
        x.csIresDiagData_FV[1] = 4u + n % 3u;
        x.csIresDiagData_FU[0] = 7u + n % 3u;
        x.csIresDiagData_FU[1] = 10u + n % 3u;
        printf("%u %u %u %u %u %u ",
               x.csIresPara_FS[0], x.csIresPara_FS[1],
               x.csIresDiagData_FV[0], x.csIresDiagData_FV[1],
               x.csIresDiagData_FU[0], x.csIresDiagData_FU[1]);
        CS_IRES_AttitudeFun(&x);
        printf("%u %u %u %u\n",
               x.csIresDiagData_FV[0], x.csIresDiagData_FV[1],
               x.csIresDiagData_FU[0], x.csIresDiagData_FU[1]);
    }
    return 0;
}
