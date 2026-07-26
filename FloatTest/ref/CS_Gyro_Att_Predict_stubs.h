#ifndef FLOATTEST_CS_GYRO_ATT_PREDICT_STUBS_H
#define FLOATTEST_CS_GYRO_ATT_PREDICT_STUBS_H
#include <stdint.h>
double LimitDouble(double, double);
void MatrixMulti(double *, const double *, const double *,
                 uint32_t, uint32_t, uint32_t);
float ModPNHP(float, float);
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
