#ifndef FLOATTEST_CS_CTRL_ATT_RATE_DECLS_H
#define FLOATTEST_CS_CTRL_ATT_RATE_DECLS_H

void Angle2C123(double *, double, double, double);
void Angle2C132(double *, double, double, double);
void Angle2C213(double *, double, double, double);
void Angle2C231(double *, double, double, double);
void Angle2C312(double *, double, double, double);
void Angle2C321(double *, double, double, double);
void MatrixMulti331(double *, const double *, const double *);
void MatrixMulti333(double *, const double *, const double *);
void C2Q(double *, const double *);
void Qdiv(double *, const double *, const double *);
float ModPNHP(float, float);

#endif
