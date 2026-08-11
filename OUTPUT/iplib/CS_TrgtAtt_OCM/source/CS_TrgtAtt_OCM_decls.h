#ifndef CS_TRGTATT_OCM_DECLS_H
#define CS_TRGTATT_OCM_DECLS_H

extern unsigned int m_WorkMode;
void CS_Angle2C(double *out, const double *angles, unsigned int seq);
void MatrixMulti333(double *out, const double *a, const double *b);
void MatrixMulti331(double *out, const double *a, const double *b);
void C2Q(double *out, const double *matrix);
void CS_Track_Atti(void);

#endif
