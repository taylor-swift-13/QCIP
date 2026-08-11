/* CS_PrecessionNutationCal_decl.h — 由 -include 注入（*_cflags.txt）。
 *
 * 原仓库全库无以下定义（连声明都没有）：CPN_POLY1/CPN_POLY3 宏、
 * Rx/Ry/Rz、Q2C、MatrixMulti333、MatrixTran33、MatrixIdentity33、
 * TripleFabsMax。原型在此注入，实现在 CS_PrecessionNutationCal_main.c，
 * 重建约定见 README"组件库重建声明"。 */
#ifndef CS_PRECESSIONNUTATIONCAL_DECLS_H
#define CS_PRECESSIONNUTATIONCAL_DECLS_H

#define ARC2RAD 0x1.455a5b2ff8f9dp-18   /* π/648000，角秒→弧度 */
#define CPN_POLY1(a0, a1, T) \
	((((a0) + (a1) * (T))) * ARC2RAD)
#define CPN_POLY3(a0, a1, a2, a3, T) \
	((((((a0) + (a1) * (T)) + (a2) * (T) * (T)) + (a3) * (T) * (T) * (T))) * ARC2RAD)

void Rx(double *o, double a);
void Ry(double *o, double a);
void Rz(double *o, double a);
void Q2C(double *o, const double *q);
void MatrixMulti333(double *out, const double *a, const double *b);
void MatrixTran33(double *out, const double *a);
void MatrixIdentity33(double *out);
double TripleFabsMax(double a, double b, double c);

#endif
