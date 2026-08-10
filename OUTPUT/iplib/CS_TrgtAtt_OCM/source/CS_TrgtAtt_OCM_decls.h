/* CS_TrgtAtt_OCM_decls.h — 组件库函数原型与裸全局声明注入
 *
 * IP_CS_TrgtAtt_OCM.c 调用的 CS_Angle2C、MatrixMulti333/331、C2Q 是
 * 组件库函数，本 case 头文件没有声明（C11 下隐式调用是错误）；代码
 * 使用裸全局 m_WorkMode（仓库源码无定义）；CS_Track_Atti() 是应用层
 * 装配函数（仓库内对应物是 CS_Track_Atti 案例的 CS_Track_AttiFun，
 * 原名无定义），按无参调用点声明为 void(void) 并在驱动里打空操作桩。
 *
 * 注意：本文件由 -include 注入到每个 TU 的最前面，std_basal.h 的
 * typedef（unint32/float64）此时尚不可见，故只用内建类型。
 */
#ifndef CS_TRGTATT_OCM_DECLS_H
#define CS_TRGTATT_OCM_DECLS_H

extern unsigned int m_WorkMode;   /* 代码用裸全局而非 pIp->m_WorkMode */

void CS_Angle2C(double *out, const double *att, unsigned int seq);
void MatrixMulti333(double *out, const double *a, const double *b);
void MatrixMulti331(double *out, const double *a, const double *b);
void C2Q(double *out, const double *matrix);
void CS_Track_Atti(void);

#endif
