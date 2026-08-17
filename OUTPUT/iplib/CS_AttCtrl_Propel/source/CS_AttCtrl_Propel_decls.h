#ifndef FLOATTEST_CS_ATTCTRL_PROPEL_DECLS_H
#define FLOATTEST_CS_ATTCTRL_PROPEL_DECLS_H

#include "IP_CS_AttCtrl_Propel.h"

double LimitDouble(double, double);
void Memsetx(unsigned char *, unsigned int, unsigned int);
int Sgn2(double);
unsigned int CS_ThrParamCfgX(unsigned int, double *, double,
    unsigned int, unsigned int, unsigned int, unsigned int,
    unsigned int *, unsigned int, unsigned int);
void CS_AttCtrl_JetCrossCtrl(void *);
void CS_FindMinMaxPos(unsigned int *, unsigned int *, const double *,
    unsigned int);

#endif
