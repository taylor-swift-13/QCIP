#ifndef CS_TRACK_ATTI_DECLS_H
#define CS_TRACK_ATTI_DECLS_H

void C2Angle123(double *out, const double *matrix);
void C2Angle132(double *out, const double *matrix);
void C2Angle213(double *out, const double *matrix);
void C2Angle231(double *out, const double *matrix);
void C2Angle312(double *out, const double *matrix);
void C2Angle321(double *out, const double *matrix);
void MatrixMulti331(double *out, const double *a, const double *b);
double VectorNorm3(const double *v);
void Memcpyx(unsigned char *destination, const unsigned char *source,
             unsigned int nbytes);

#endif
