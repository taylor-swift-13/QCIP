#ifndef CS_TRGTATT_AMM_2NOSAR_DECLS_H
#define CS_TRGTATT_AMM_2NOSAR_DECLS_H

typedef struct { double dPsi_DA; } FloatTestDriftAngleData;
extern FloatTestDriftAngleData csDriftAngData;

void CS_TrgtAtt_AMM_Exp(void);
void XX_Track_Atti(void *p);
void QMulti(double *out, const double *p, const double *q);
void Q2C(double *out, const double *q);
void MatrixMulti333(double *out, const double *a, const double *b);
void MatrixMulti331(double *out, const double *a, const double *b);
void C2Q(double *out, const double *m);
void C2Angle123(double *out, const double *m);
void Angle2C321(double *out, double a1, double a2, double a3);

#endif
