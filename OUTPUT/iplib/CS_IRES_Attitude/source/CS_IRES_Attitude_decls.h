#ifndef FLOATTEST_CS_IRES_ATTITUDE_DECLS_H
#define FLOATTEST_CS_IRES_ATTITUDE_DECLS_H

double LimitDouble(double, double);
void MatrixMulti331(double *, const double *, const double *);
void MatrixTran(double *, const double *, unsigned int, unsigned int);
void Memcpyx(unsigned char *, const unsigned char *, unsigned int);
void IRES_DataProcess(void *);

#endif
