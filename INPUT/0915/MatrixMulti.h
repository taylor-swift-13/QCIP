#ifndef SIPEX_H_MatrixMulti
#define SIPEX_H_MatrixMulti

#include "IP.h"

#ifndef SIPEX_DT_float32
#define SIPEX_DT_float32
typedef float           float32;
#endif

#ifndef SIPEX_DT_unint08
#define SIPEX_DT_unint08
typedef unsigned char   unint08;
#endif


typedef struct __MatrixMulti {
    Fun fun;
    const float32 * faciend;
    const float32 * multiplier;
    unint08 ncol;
    unint08 nrc;
    unint08 nrow;
    float32 * product;
} MatrixMulti;


void MatrixMultiFun(void *sip_ip_arg);

#endif /* SIPEX_H_MatrixMulti */
