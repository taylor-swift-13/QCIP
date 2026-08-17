#ifndef CS_GYRO_ATT_PREDICT_DECLS_H
#define CS_GYRO_ATT_PREDICT_DECLS_H

double LimitDouble(double value, double bound);
float ModPNHP(float value, float halfperiod);
void MatrixMulti(double *out, const double *a, const double *b,
                 unsigned int rows, unsigned int inner, unsigned int cols);
void Angle2C123(double *, double, double, double);
void Angle2C132(double *, double, double, double);
void Angle2C213(double *, double, double, double);
void Angle2C231(double *, double, double, double);
void Angle2C312(double *, double, double, double);
void Angle2C321(double *, double, double, double);
void w2dAngle123(double *, const double *, const double *);
void w2dAngle132(double *, const double *, const double *);
void w2dAngle213(double *, const double *, const double *);
void w2dAngle231(double *, const double *, const double *);
void w2dAngle312(double *, const double *, const double *);
void w2dAngle321(double *, const double *, const double *);

#endif
