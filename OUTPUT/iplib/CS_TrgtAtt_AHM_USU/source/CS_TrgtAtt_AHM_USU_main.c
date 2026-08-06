/* FloatTest 参考程序：CS_TrgtAtt_AHM_USU
 * 直接编译运行原始 IP_CS_TrgtAtt_AHM_USU.c（含 5.3.2.5.1 主函数、
 * XX_Track_Atti、XX_RateForeDiff、XX_RateForeHybridTrace、w2dEuler —
 * 后四个是本 case 文件内的真实代码，不是重建）。
 *
 * 组件库重建（仓库全库无实现，算法选择见 README"组件库重建与打桩声明"，
 * 与 rocq/spec.v 逐式同序对应）：
 *   - Angle2C123..321 / CS_Angle2C：与 CS_TrgtAtt_EIM 相同约定
 *     （主动右手元旋转，A<ijk> = Ai·Aj·Ak，参量序=轴号；default→321
 *     沿用 EIM case 内嵌 switch 包装器的仓库自身惯例）；
 *   - Q2C：四元数→DCM（q[3] 标量部，与 C2Q/Angle2C 同号约定，
 *     C = [1-2(q2²+q3²), 2(q1q2-q3q4), ...] 标准展开）；
 *   - C2Q：Shepperd 法（同 EIM）；sqrt 用 libm（IEEE 正确舍入，
 *     与 Coq 侧 fp64_sqrt = Bsqrt mode_NE 一致）；
 *   - MatrixMulti333/331、VectorNorm3：行主序累加（0.0 起、k 升序）。
 *
 * 打桩（asin/atan2 未移植，对应输出移出比较集）：
 *   - CS_C2Angle：把驱动注入的 a_ref_in 直接拷给 A_Ref（即 A_Ref 变为
 *     直接输入）；下游 w2dEuler/ddA_Ref/TorqRef 全部为真实计算；
 *   - C2Angle123：空操作（A_Ref_si 保持 0，不进比较集）。
 *
 * 裸全局（仓库源码无定义，见 decls.h 注释）：m_WorkMode、m_DeltaT、
 * csCtrlerData.Js_Use、csMnvData.e_xyz 由本驱动定义为全局并作为输入注入；
 * WKMD_AMM 用替身值 3（< 14，保证 Seq_AttD[wm] 不越界）。
 *
 * 用法: CS_TrgtAtt_AHM_USU_main.exe [n=1000] [seed]
 * 输出: 每行 148 列：
 *   输入(104): wm | seq[14] | fmn fs | psi dPsi | atr[3] cb[9] csib[9]
 *     cbsi[9] coi[9] w0i[3] wri_lst[3] wri2_lst[3] da_lst[3] da_init[3]
 *     | deltaT | a_ref_in[3] | dchi_init | mtrack[12] | e_xyz[3] js[9]
 *     | mdf mlf（前 17 列为整数，其余为 bits64）
 *   输出(44): Cro_si[9] wri_si[3] Cro[9] wri[3] qri[4] wro[3] dA_Ref[3]
 *     ddA_Ref[3] wri2[3] TorqRef[3] dChi_Ref2（bits64）
 *
 * 定向设计：6 转序、default 转序（w2dEuler 原样透传可观察）、
 * HybridTrace 全部 9 个分段、t_sinacc ≤ 1e-3 分支、外层 if 的
 * (wm==WKMD_AMM && F∈{1,2}) 真假组合、FS 0/1、TorqRef 限幅清零。
 * 全部输入有限值；DCM 输入由重建公式现场构造（物理 DCM）；a_ref_in
 * ∈ [-1.4,1.4] 使 w2dEuler 各转序的 cos 除数远离 0（|cos| ≥ 0.17）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "IP_CS_TrgtAtt_AHM_USU.h"

/* ---- 裸全局定义（decls.h 中 extern） ---- */
unsigned int m_WorkMode;
double m_DeltaT;
CsCtrlerData_Stub csCtrlerData;
CsMnvData_Stub csMnvData;

/* CS_C2Angle 打桩的注入点（见文件头注释） */
static double g_a_ref_in[3];

/* ---- 组件库 fp64 重建（与 spec.v 同式同序） ---- */

void MatrixMulti333(double *out, const double *a, const double *b)
{
	double temp[9] = {0};
	unsigned i, j, k;
	for (i = 0; i < 3u; ++i)
		for (j = 0; j < 3u; ++j)
			for (k = 0; k < 3u; ++k)
				temp[i * 3u + j] += a[i * 3u + k] * b[k * 3u + j];
	memcpy(out, temp, sizeof temp);
}

void MatrixMulti331(double *out, const double *a, const double *b)
{
	double temp[3] = {0};
	unsigned i, k;
	for (i = 0; i < 3u; ++i)
		for (k = 0; k < 3u; ++k)
			temp[i] += a[i * 3u + k] * b[k];
	memcpy(out, temp, sizeof temp);
}

double VectorNorm3(const double *v)
{
	return sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
}

/* 主动右手元旋转（约定与 CS_TrgtAtt_EIM 相同） */
void Angle2C123(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = -c2 * s3;              o[2] = s2;
	o[3] = c1 * s3 - s1 * s2 * c3; o[4] = c1 * c3 + s1 * s2 * s3; o[5] = s1 * c2;
	o[6] = -s1 * s3 - c1 * s2 * c3; o[7] = c1 * s2 * s3 - s1 * c3; o[8] = c1 * c2;
}

void Angle2C132(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = -s3;                   o[2] = s2 * c3;
	o[3] = c1 * s3 * c2 - s1 * s2; o[4] = c1 * c3;              o[5] = c1 * s2 * s3 + s1 * c2;
	o[6] = -s1 * s3 * c2 - c1 * s2; o[7] = -s1 * c3;            o[8] = c1 * c2 - s1 * s2 * s3;
}

void Angle2C213(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3 - s1 * s2 * s3; o[1] = -c2 * s3 - s1 * s2 * c3; o[2] = s2 * c1;
	o[3] = c1 * s3;               o[4] = c1 * c3;               o[5] = s1;
	o[6] = -s2 * c3 - c2 * s1 * s3; o[7] = s2 * s3 - c2 * s1 * c3; o[8] = c2 * c1;
}

void Angle2C231(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = s2 * s1 - c2 * s3 * c1; o[2] = s2 * c1 + c2 * s3 * s1;
	o[3] = s3;                    o[4] = c3 * c1;               o[5] = -c3 * s1;
	o[6] = -s2 * c3;              o[7] = c2 * s1 + s2 * s3 * c1; o[8] = c2 * c1 - s2 * s3 * s1;
}

void Angle2C312(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3 + s1 * s2 * s3; o[1] = -c1 * s3;             o[2] = s2 * c3 - s1 * c2 * s3;
	o[3] = c2 * s3 - s1 * s2 * c3; o[4] = c1 * c3;              o[5] = s2 * s3 + s1 * c2 * c3;
	o[6] = -c1 * s2;              o[7] = -s1;                   o[8] = c1 * c2;
}

void Angle2C321(double *o, double a1, double a2, double a3)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = s1 * s2 * c3 - c1 * s3; o[2] = c1 * s2 * c3 + s1 * s3;
	o[3] = c2 * s3;               o[4] = s1 * s2 * s3 + c1 * c3; o[5] = c1 * s2 * s3 - s1 * c3;
	o[6] = -s2;                   o[7] = s1 * c2;               o[8] = c1 * c2;
}

/* 转序分发（重建；default→321 沿用 EIM case 内嵌包装器的仓库惯例） */
void CS_Angle2C(double *out, const double *att, unsigned int seq)
{
	switch (seq) {
	case 123: Angle2C123(out, att[0], att[1], att[2]); break;
	case 132: Angle2C132(out, att[0], att[1], att[2]); break;
	case 213: Angle2C213(out, att[0], att[1], att[2]); break;
	case 231: Angle2C231(out, att[0], att[1], att[2]); break;
	case 312: Angle2C312(out, att[0], att[1], att[2]); break;
	case 321: Angle2C321(out, att[0], att[1], att[2]); break;
	default:  Angle2C321(out, att[0], att[1], att[2]); break;
	}
}

/* Shepperd 法 DCM→四元数（q[3] 标量部）；输入为物理 DCM，sqrt 参数非负 */
void C2Q(double *out, const double *m)
{
	double tr = m[0] + m[4] + m[8];
	double s;
	if (tr > 0.0) {
		s = sqrt(tr + 1.0) * 2.0;
		out[3] = 0.25 * s;
		out[0] = (m[7] - m[5]) / s;
		out[1] = (m[2] - m[6]) / s;
		out[2] = (m[3] - m[1]) / s;
	} else if (m[0] > m[4] && m[0] > m[8]) {
		s = sqrt(1.0 + m[0] - m[4] - m[8]) * 2.0;
		out[0] = 0.25 * s;
		out[1] = (m[1] + m[4]) / s;
		out[2] = (m[2] + m[6]) / s;
		out[3] = (m[7] - m[5]) / s;
	} else if (m[4] > m[8]) {
		s = sqrt(1.0 + m[4] - m[0] - m[8]) * 2.0;
		out[1] = 0.25 * s;
		out[0] = (m[1] + m[4]) / s;
		out[2] = (m[5] + m[7]) / s;
		out[3] = (m[2] - m[6]) / s;
	} else {
		s = sqrt(1.0 + m[8] - m[0] - m[4]) * 2.0;
		out[2] = 0.25 * s;
		out[0] = (m[2] + m[6]) / s;
		out[1] = (m[5] + m[7]) / s;
		out[3] = (m[3] - m[1]) / s;
	}
}

/* 四元数→DCM（q[3] 标量部；与 C2Q/Angle2C 同号约定，标准展开式） */
void Q2C(double *o, const double *q)
{
	double q1 = q[0], q2 = q[1], q3 = q[2], q4 = q[3];
	o[0] = 1.0 - 2.0 * (q2 * q2 + q3 * q3);
	o[1] = 2.0 * (q1 * q2 - q3 * q4);
	o[2] = 2.0 * (q1 * q3 + q2 * q4);
	o[3] = 2.0 * (q1 * q2 + q3 * q4);
	o[4] = 1.0 - 2.0 * (q1 * q1 + q3 * q3);
	o[5] = 2.0 * (q2 * q3 - q1 * q4);
	o[6] = 2.0 * (q1 * q3 - q2 * q4);
	o[7] = 2.0 * (q2 * q3 + q1 * q4);
	o[8] = 1.0 - 2.0 * (q1 * q1 + q2 * q2);
}

/* ---- 打桩（asin/atan2 未移植；见文件头注释与 README） ---- */

void CS_C2Angle(double *out, const double *m, unsigned int seq)
{
	(void)m; (void)seq;
	out[0] = g_a_ref_in[0];
	out[1] = g_a_ref_in[1];
	out[2] = g_a_ref_in[2];
}

void C2Angle123(double *out, const double *m)
{
	(void)out; (void)m;   /* 空操作：A_Ref_si 保持初值，不进比较集 */
}

/* ---- 向量发生 ---- */

static uint64_t dbits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }

static uint64_t rs_state;
static uint64_t rs(void)
{
	uint64_t x = rs_state;
	x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
	rs_state = x;
	return x * 2685821657736338717ULL;
}
static double urand(void) { return (double)(rs() >> 11) * 0x1.0p-53; }
static double rrange(double lo, double hi) { return lo + urand() * (hi - lo); }

#undef PI
#define PI   0x1.921fb54442d18p+1

static const uint32_t seq_pool[6] = { 123, 132, 213, 231, 312, 321 };

typedef struct {
	uint32_t wm, seq[14], fmn, fs;
	double psi, dpsi, atr[3], cb[9], csib[9], cbsi[9], coi[9], w0i[3];
	double wri_lst[3], wri2_lst[3], da_lst[3], da_init[3];
	double deltaT, a_ref_in[3], dchi_init, mtrack[12], e_xyz[3], js[9];
	double mdf, mlf;
} Vec;

static void pbits(const double *x, int n)
{
	int i;
	for (i = 0; i < n; i++) printf(" %llu", (unsigned long long)dbits(x[i]));
}

static void run_one(const Vec *v)
{
	CS_TrgtAtt_AHM_USU ip;
	int i;
	memset(&ip, 0, sizeof ip);

	m_WorkMode = v->wm;
	m_DeltaT = v->deltaT;
	memcpy(csMnvData.e_xyz, v->e_xyz, sizeof v->e_xyz);
	memcpy(csCtrlerData.Js_Use, v->js, sizeof v->js);
	memcpy(g_a_ref_in, v->a_ref_in, sizeof v->a_ref_in);

	ip.m_WorkMode = v->wm;   /* 代码用裸全局；字段仅保持一致，无人读 */
	for (i = 0; i < 14; i++) ip.csAttPara_Seq_AttD[i] = v->seq[i];
	ip.csMnvData_F_MnvNextMode = v->fmn;
	ip.csMnvPara_FS_MnvTraceStyle = v->fs;
	ip.csDriftAngData_Psi_DA = v->psi;
	ip.csDriftAngData_dPsi_DA = v->dpsi;
	for (i = 0; i < 3; i++) {
		ip.csMnvData_A_Trgt[i] = v->atr[i];
		ip.csOrbData_w0i[i] = v->w0i[i];
		ip.csAttCoreData_wri_Lst[i] = v->wri_lst[i];
		ip.xxAttCoreData_wri2_Lst[i] = v->wri2_lst[i];
		ip.csMnvData_dA_Ref_Lst[i] = v->da_lst[i];
		ip.csMnvData_dA_Ref[i] = v->da_init[i];
	}
	memcpy(&ip.csAttCoreData_Cbiasp[0][0], v->cb, sizeof v->cb);
	memcpy(&ip.csLoadAxisData_Csib_DARot[0][0], v->csib, sizeof v->csib);
	memcpy(&ip.csLoadAxisData_Cbsi_DARot[0][0], v->cbsi, sizeof v->cbsi);
	memcpy(&ip.csOrbData_coi[0][0], v->coi, sizeof v->coi);
	ip.xxAttCoreData_dChi_Ref2 = v->dchi_init;
	ip.xxAttCoreData_dt_TorqRef2 = v->mtrack[0];
	ip.csMnvData_mTrack_amax = v->mtrack[1];
	ip.csMnvData_mTrack_t_sinacc = v->mtrack[2];
	ip.csMnvData_mTrack_t_conacc = v->mtrack[3];
	ip.csMnvData_mTrack_t_m1a = v->mtrack[4];
	ip.csMnvData_mTrack_t_m1b = v->mtrack[5];
	ip.csMnvData_mTrack_tm1p = v->mtrack[6];
	ip.csMnvData_mTrack_tm2p = v->mtrack[7];
	ip.csMnvData_mTrack_t_m3a = v->mtrack[8];
	ip.csMnvData_mTrack_t_m3b = v->mtrack[9];
	ip.csMnvData_mTrack_tm3p = v->mtrack[10];
	ip.csMnvData_mTrack_tmA = v->mtrack[11];
	ip.csCtrlerOtherPara_Mdf_TorqRef = v->mdf;
	ip.csCtrlerOtherPara_Mlf_TorqRef = v->mlf;

	CS_TrgtAtt_AHM_USUFun(&ip);

	printf("%u", (unsigned)v->wm);
	for (i = 0; i < 14; i++) printf(" %u", (unsigned)v->seq[i]);
	printf(" %u %u", (unsigned)v->fmn, (unsigned)v->fs);
	printf(" %llu", (unsigned long long)dbits(v->psi));
	printf(" %llu", (unsigned long long)dbits(v->dpsi));
	pbits(v->atr, 3); pbits(v->cb, 9); pbits(v->csib, 9);
	pbits(v->cbsi, 9); pbits(v->coi, 9); pbits(v->w0i, 3);
	pbits(v->wri_lst, 3); pbits(v->wri2_lst, 3);
	pbits(v->da_lst, 3); pbits(v->da_init, 3);
	printf(" %llu", (unsigned long long)dbits(v->deltaT));
	pbits(v->a_ref_in, 3);
	printf(" %llu", (unsigned long long)dbits(v->dchi_init));
	pbits(v->mtrack, 12); pbits(v->e_xyz, 3); pbits(v->js, 9);
	printf(" %llu", (unsigned long long)dbits(v->mdf));
	printf(" %llu", (unsigned long long)dbits(v->mlf));
	pbits(&ip.csAttCoreData_Cro_si[0][0], 9);
	pbits(ip.csAttCoreData_wri_si, 3);
	pbits(&ip.csAttCoreData_Cro[0][0], 9);
	pbits(ip.csAttCoreData_wri, 3);
	pbits(ip.csAttCoreData_qri, 4);
	pbits(ip.csAttCoreData_wro, 3);
	pbits(ip.csMnvData_dA_Ref, 3);
	pbits(ip.csMnvData_ddA_Ref, 3);
	pbits(ip.xxAttCoreData_wri2, 3);
	pbits(ip.csMnvData_TorqRef, 3);
	printf(" %llu\n", (unsigned long long)dbits(ip.xxAttCoreData_dChi_Ref2));
}

/* 由欧拉角构造物理 DCM（仅作输入生成） */
static void build_dcm(double rx, double ry, double rz, double *o)
{
	Angle2C321(o, rx, ry, rz);
}

/* 填充一组正常默认值：单位 DCM、小角速度、标准 mtrack 剖面 */
static void mkbase(Vec *v)
{
	static const double ident[9] = { 1, 0, 0, 0, 1, 0, 0, 0, 1 };
	static const double mt[12] = { 0.05, 0.01, 2.0, 1.0, 1.0, 2.0, 3.0,
	                               4.0, 5.0, 6.0, 7.0, -0.55 };
	int i;
	memset(v, 0, sizeof *v);
	for (i = 0; i < 14; i++) v->seq[i] = 321;
	memcpy(v->cb, ident, sizeof ident);
	memcpy(v->csib, ident, sizeof ident);
	memcpy(v->cbsi, ident, sizeof ident);
	memcpy(v->coi, ident, sizeof ident);
	v->w0i[0] = 0.001; v->w0i[1] = -0.0005; v->w0i[2] = 0.0008;
	v->wri_lst[0] = 0.001; v->wri_lst[1] = -0.001; v->wri_lst[2] = 0.0005;
	v->wri2_lst[0] = 0.001; v->wri2_lst[1] = -0.001; v->wri2_lst[2] = 0.0005;
	v->da_lst[0] = 0.0002; v->da_lst[1] = -0.0003; v->da_lst[2] = 0.0001;
	v->deltaT = 0.05;
	v->a_ref_in[0] = 0.3; v->a_ref_in[1] = -0.2; v->a_ref_in[2] = 0.1;
	v->dchi_init = 0.0123;
	memcpy(v->mtrack, mt, sizeof mt);
	v->e_xyz[0] = 1.0;
	for (i = 0; i < 9; i++) v->js[i] = ident[i];
	v->js[0] = 0.5; v->js[4] = 0.6; v->js[8] = 0.7;
	v->mdf = 1.0;
	v->mlf = 5.0;
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : 0x9E3779B97F4A7C15ULL;
	static const double reg_mid[9] = { -0.5, 0.5, 1.5, 2.5, 3.5,
	                                   4.5, 5.5, 6.5, 7.5 };
	Vec v;
	int j;
	long i;

	rs_state = seed ? seed : 1;

	/* ---- 定向 1：6 转序（wm=j, seq[j]=pool[j]），else 路径 ---- */
	for (j = 0; j < 6; j++) {
		mkbase(&v);
		v.wm = (uint32_t)j;
		v.seq[j] = seq_pool[j];
		v.atr[0] = 0.2 * (j + 1) - 0.5;
		v.atr[1] = -0.1 * j;
		v.atr[2] = 0.05 * j;
		v.psi = 0.02 * (j + 1);
		v.dpsi = 0.001 * (j + 1);
		v.fmn = 0; v.fs = 0;
		run_one(&v);
	}

	/* ---- 定向 2：非法转序 → w2dEuler 原样透传 dA_Ref_init ---- */
	mkbase(&v);
	v.wm = 0;
	for (j = 0; j < 14; j++) v.seq[j] = 0;
	v.da_init[0] = 0.11; v.da_init[1] = -0.22; v.da_init[2] = 0.33;
	run_one(&v);

	/* ---- 定向 3：HybridTrace 全部 9 个分段 ---- */
	for (j = 0; j < 9; j++) {
		mkbase(&v);
		v.wm = WKMD_AMM;
		v.seq[WKMD_AMM] = 321;
		v.fmn = 1; v.fs = 0;
		v.mtrack[11] = reg_mid[j] - v.mtrack[0];  /* tmA = 段中点 - dt */
		run_one(&v);
	}

	/* ---- 定向 4：t_sinacc ≤ 1e-3 → w_ping = 0.5·PI·1000 分支 ---- */
	mkbase(&v);
	v.wm = WKMD_AMM; v.seq[WKMD_AMM] = 321; v.fmn = 1; v.fs = 0;
	v.mtrack[2] = 0.0005;
	v.mtrack[11] = 2.45;   /* sin 分段，w_ping 大参数 */
	run_one(&v);

	/* ---- 定向 5：F=2 / FS=1 / 外层 else 三种组合 ---- */
	mkbase(&v);
	v.wm = WKMD_AMM; v.seq[WKMD_AMM] = 321; v.fmn = 2; v.fs = 0;
	run_one(&v);
	mkbase(&v);
	v.wm = WKMD_AMM; v.seq[WKMD_AMM] = 321; v.fmn = 1; v.fs = 1;
	run_one(&v);
	mkbase(&v);
	v.wm = WKMD_AMM; v.seq[WKMD_AMM] = 321; v.fmn = 0; v.fs = 0;
	run_one(&v);
	mkbase(&v);
	v.wm = 5; v.seq[5] = 312; v.fmn = 1; v.fs = 0;   /* wm≠WKMD_AMM → else */
	run_one(&v);

	/* ---- 定向 6：TorqRef 限幅清零（mlf 极小） ---- */
	mkbase(&v);
	v.wm = 0; v.fmn = 0; v.mlf = 1e-9;
	v.wri_lst[0] = -0.02; v.wri_lst[1] = 0.02; v.wri_lst[2] = -0.02;
	run_one(&v);

	/* ---- 定向 7：非单位 DCM 全链路（cb/csib/cbsi/coi 各不同） ---- */
	mkbase(&v);
	v.wm = WKMD_AMM; v.seq[WKMD_AMM] = 213; v.fmn = 1; v.fs = 0;
	v.psi = 0.15; v.dpsi = 0.002;
	v.atr[0] = 0.4; v.atr[1] = -0.3; v.atr[2] = 0.2;
	build_dcm(0.3, -0.2, 0.1, v.cb);
	build_dcm(-0.1, 0.25, -0.15, v.csib);
	build_dcm(0.05, 0.1, -0.2, v.cbsi);
	build_dcm(0.2, 0.15, 0.1, v.coi);
	v.mtrack[11] = 0.45;
	run_one(&v);

	/* ---- 随机 ---- */
	for (i = 0; i < n; i++) {
		double g[3], gn;
		mkbase(&v);
		v.wm = (rs() % 3 == 0) ? WKMD_AMM : (uint32_t)(rs() % 14);
		for (j = 0; j < 14; j++) {
			uint32_t r = (uint32_t)(rs() % 25);
			v.seq[j] = r < 6 ? seq_pool[r] : 321;
		}
		v.seq[v.wm] = (rs() % 40 == 0) ? 0u : seq_pool[rs() % 6];
		v.fmn = (rs() % 2 == 0) ? (uint32_t)(1 + rs() % 2) : (uint32_t)(rs() % 4);
		v.fs = (rs() % 4 == 0) ? 1u : 0u;
		v.psi = rrange(-0.2, 0.2);
		v.dpsi = rrange(-0.02, 0.02);
		for (j = 0; j < 3; j++) {
			v.atr[j] = rrange(-PI, PI);
			v.w0i[j] = rrange(-0.01, 0.01);
			v.wri_lst[j] = rrange(-0.02, 0.02);
			v.wri2_lst[j] = rrange(-0.02, 0.02);
			v.da_lst[j] = rrange(-0.05, 0.05);
			v.da_init[j] = rrange(-0.05, 0.05);
			v.a_ref_in[j] = rrange(-1.4, 1.4);
		}
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), v.cb);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), v.csib);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), v.cbsi);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), v.coi);
		v.deltaT = rrange(0.05, 0.2);
		v.dchi_init = rrange(-0.05, 0.05);
		v.mtrack[0] = rrange(0.05, 0.2);          /* dt_TorqRef2 */
		v.mtrack[1] = rrange(0.005, 0.05);        /* amax */
		v.mtrack[2] = (rs() % 20 == 0) ? 0.0005 : rrange(0.5, 5.0); /* t_sinacc */
		v.mtrack[3] = rrange(0.5, 2.0);           /* t_conacc */
		for (j = 0; j < 7; j++)
			v.mtrack[4 + j] = 0.5 + (j + 1) * 1.0 + urand() * 0.5; /* t_m1a..tm3p 有序 */
		v.mtrack[11] = rrange(-1.0, v.mtrack[10] + 1.5);           /* tmA */
		do {
			for (j = 0; j < 3; j++) g[j] = rrange(-1.0, 1.0);
			gn = sqrt(g[0] * g[0] + g[1] * g[1] + g[2] * g[2]);
		} while (gn < 0.2);
		for (j = 0; j < 3; j++) v.e_xyz[j] = g[j] / gn;
		for (j = 0; j < 3; j++) {
			v.js[j * 3 + j] = rrange(0.1, 1.0);
			v.js[0 * 3 + 1] = v.js[1 * 3 + 0] = rrange(-0.05, 0.05);
			v.js[0 * 3 + 2] = v.js[2 * 3 + 0] = rrange(-0.05, 0.05);
			v.js[1 * 3 + 2] = v.js[2 * 3 + 1] = rrange(-0.05, 0.05);
		}
		v.mdf = rrange(0.5, 1.5);
		v.mlf = (rs() % 12 == 0) ? 1e-6 : rrange(1.0, 10.0);
		run_one(&v);
	}
	return 0;
}
