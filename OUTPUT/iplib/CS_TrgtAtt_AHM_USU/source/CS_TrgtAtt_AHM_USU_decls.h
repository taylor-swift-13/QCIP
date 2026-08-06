/* CS_TrgtAtt_AHM_USU_decls.h — 组件库函数原型与裸全局声明注入
 *
 * IP_CS_TrgtAtt_AHM_USU.c 调用的 CS_Angle2C、MatrixMulti333/331、
 * C2Angle123、C2Q、CS_C2Angle、Q2C、VectorNorm3 是组件库函数，
 * 本 case 头文件没有声明（C11 下隐式调用是错误）；同时代码使用
 * 裸全局 m_WorkMode / m_DeltaT / csCtrlerData.Js_Use / csMnvData.e_xyz
 * 与宏 WKMD_AMM，仓库源码中均无定义。此处统一注入声明，定义在
 * 参考驱动 *_main.c 中（重建/打桩约定见 README"组件库重建与打桩声明"）。
 *
 * 注意：本文件由 -include 注入到每个 TU 的最前面，std_basal.h 的
 * typedef（unint32/float64）此时尚不可见，故只用内建类型。
 */
#ifndef CS_TRGTATT_AHM_USU_DECLS_H
#define CS_TRGTATT_AHM_USU_DECLS_H

/* ---- 裸全局（类型 = unint32/float64 的内建等价物） ---- */
extern unsigned int m_WorkMode;   /* 代码用裸全局而非 pIp->m_WorkMode */
extern double m_DeltaT;

typedef struct { double Js_Use[3][3]; } CsCtrlerData_Stub;
typedef struct { double e_xyz[3]; } CsMnvData_Stub;
extern CsCtrlerData_Stub csCtrlerData;
extern CsMnvData_Stub csMnvData;

/* WKMD_AMM 仓库无定义，本 case 用替身值 3（< 14，使 Seq_AttD[wm] 不越界；
 * ModeConvert_NWM 用 0x44 是因为该 case 不按模式索引数组） */
#define WKMD_AMM 0x03u

/* ---- 组件库函数原型 ---- */
void CS_Angle2C(double *out, const double *att, unsigned int seq);
void MatrixMulti333(double *out, const double *a, const double *b);
void MatrixMulti331(double *out, const double *a, const double *b);
void C2Angle123(double *out, const double *m);
void C2Q(double *out, const double *matrix);
void CS_C2Angle(double *out, const double *m, unsigned int seq);
void Q2C(double *out, const double *q);
double VectorNorm3(const double *v);

#endif
