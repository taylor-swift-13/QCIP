/* CS_TrgtAtt_EIM_decls.h — 原项目组件库函数的原型注入
 *
 * IP_CS_TrgtAtt_EIM.c 调用的 Angle2C123/132/213/231/312/321、
 * MatrixMulti333/331、C2Q 是组件库函数，本 case 头文件没有声明
 * （C11 下隐式调用是错误）。参考驱动按标准公式重建了这些函数
 * （见 *_main.c 头部注释与 README 备注），此处注入其原型。
 */
#ifndef CS_TRGTATT_EIM_DECLS_H
#define CS_TRGTATT_EIM_DECLS_H

void Angle2C123(double *out, double a1, double a2, double a3);
void Angle2C132(double *out, double a1, double a2, double a3);
void Angle2C213(double *out, double a1, double a2, double a3);
void Angle2C231(double *out, double a1, double a2, double a3);
void Angle2C312(double *out, double a1, double a2, double a3);
void Angle2C321(double *out, double a1, double a2, double a3);
void MatrixMulti333(double *out, const double *a, const double *b);
void MatrixMulti331(double *out, const double *a, const double *b);
void C2Q(double *out, const double *matrix);

#endif
