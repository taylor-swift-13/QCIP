#ifndef CS_TRGTP2P_TAR_INIT_DECLS_H
#define CS_TRGTP2P_TAR_INIT_DECLS_H

extern unsigned int m_WorkMode;
void MatrixIdentity33(double *out);
void CS_Angle2C(double *out, const double *angles, unsigned int seq);
void Memcpyx(unsigned char *destination, const unsigned char *source,
             unsigned int nbytes);
void CS_TrgtP2P_Ini_Sub(void);
void f_Fun_Null(void);

#endif
