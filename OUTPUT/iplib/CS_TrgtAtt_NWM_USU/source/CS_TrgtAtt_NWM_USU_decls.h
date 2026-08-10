/* CS_TrgtAtt_NWM_USU_decls.h — 组件库函数原型注入
 *
 * IP_CS_TrgtAtt_NWM_USU.c（及其内嵌包装器 CS_Angle2CX_temp1）调用的
 * Angle2C123/132/213/231/312/321、MatrixMulti333/331、C2Angle123、C2Q
 * 是组件库函数，本 case 头文件没有声明（C11 下隐式调用是错误）。
 * 参考驱动按与 CS_TrgtAtt_EIM 相同的约定重建（C2Angle123 打桩为
 * 空操作，A_Ref_si 移出比较集；见 README"组件库重建与打桩声明"），
 * 此处注入其原型。本 case 的 m_WorkMode 是结构体字段的真实使用
 * （pIp->m_WorkMode），不需要裸全局注入。
 */
#ifndef CS_TRGTATT_NWM_USU_DECLS_H
#define CS_TRGTATT_NWM_USU_DECLS_H

void Angle2C123(double *out, double a1, double a2, double a3);
void Angle2C132(double *out, double a1, double a2, double a3);
void Angle2C213(double *out, double a1, double a2, double a3);
void Angle2C231(double *out, double a1, double a2, double a3);
void Angle2C312(double *out, double a1, double a2, double a3);
void Angle2C321(double *out, double a1, double a2, double a3);
void MatrixMulti333(double *out, const double *a, const double *b);
void MatrixMulti331(double *out, const double *a, const double *b);
void C2Angle123(double *out, const double *m);
void C2Q(double *out, const double *matrix);

#endif
