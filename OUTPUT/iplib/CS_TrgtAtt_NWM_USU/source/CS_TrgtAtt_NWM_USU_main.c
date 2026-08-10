/* FloatTest 参考程序：CS_TrgtAtt_NWM_USU
 * 直接编译运行原始 IP_CS_TrgtAtt_NWM_USU.c（含内嵌转序包装器
 * CS_Angle2CX_temp1——真实代码，default→321 是本 case 自己的实现，
 * 不是重建假设）。
 *
 * 语义：tmpCp = Angle2C<sv>(0,0,Psi_DA)（sv = Seq_AttD[m_WorkMode]）、
 * Cro_si = tmpCp * (Csib_DARot * Cbiasp)、wri_si = Cro_si*w0i (+[0;0;dPsi])、
 * Cro = Cbsi_DARot * Cro_si、wri = Cbsi * wri_si、qri = C2Q(Cro*coi)、
 * wro = wri - Cro*w0i。无 A_Trgt 输入（与 AHM_USU 不同）。
 *
 * 组件库重建（仓库全库无实现，约定与 CS_TrgtAtt_EIM 完全相同）：
 * Angle2C×6 主动右手元旋转/参量序=轴号，sin/cos 由 ported_trig.c
 * （musl 移植）提供；MatrixMulti333/331 行主序 0.0 起 k 升序；C2Q
 * Shepperd 法 q[3] 标量部，sqrt 用 libm（与 Coq fp64_sqrt 同为正确
 * 舍入）。
 *
 * 打桩：C2Angle123（内部是 asin/atan2，未移植）打空操作桩，
 * A_Ref_si 保持初值并移出比较集（下游无人读）。
 *
 * 用法: CS_TrgtAtt_NWM_USU_main.exe [n=1000] [seed]
 * 输出: 每行 87 列：
 *   输入(56): wm | seq[14] | psi dPsi | cb[9] csib[9] cbsi[9] coi[9]
 *     w0i[3]（前 15 列为整数，其余为 bits64）
 *   输出(31): Cro_si[9] wri_si[3] Cro[9] wri[3] qri[4] wro[3]（bits64）
 *
 * 定向设计：全部输入有限值；cb/csib/cbsi/coi 由随机欧拉角经重建公式
 * 现场构造（物理 DCM）；定向含 6 转序 × 3 组参数组合、恒等/绕轴 180°
 * 的 coi（强制 C2Q 四分支）、非法转序（default→321 真实分支）、
 * psi=dpsi=0 边界与非单位阵全链路。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "IP_CS_TrgtAtt_NWM_USU.h"

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

/* ---- 打桩（asin/atan2 未移植；A_Ref_si 移出比较集） ---- */

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

static void pbits(const double *x, int n)
{
	int i;
	for (i = 0; i < n; i++) printf(" %llu", (unsigned long long)dbits(x[i]));
}

static void run_one(uint32_t wm, const uint32_t *seq,
                    double psi, double dpsi,
                    const double *cb, const double *csib,
                    const double *cbsi, const double *coi,
                    const double *w0i)
{
	CS_TrgtAtt_NWM_USU ip;
	int i;
	memset(&ip, 0, sizeof ip);
	ip.m_WorkMode = wm;   /* 本 case 是结构体字段的真实使用 */
	for (i = 0; i < 14; i++) ip.csAttPara_Seq_AttD[i] = seq[i];
	ip.csDriftAngData_Psi_DA = psi;
	ip.csDriftAngData_dPsi_DA = dpsi;
	memcpy(&ip.csAttCoreData_Cbiasp[0][0], cb, 9 * sizeof(double));
	memcpy(&ip.csLoadAxisData_Csib_DARot[0][0], csib, 9 * sizeof(double));
	memcpy(&ip.csLoadAxisData_Cbsi_DARot[0][0], cbsi, 9 * sizeof(double));
	memcpy(&ip.csOrbData_coi[0][0], coi, 9 * sizeof(double));
	for (i = 0; i < 3; i++) ip.csOrbData_w0i[i] = w0i[i];

	CS_TrgtAtt_NWM_USUFun(&ip);

	printf("%u", (unsigned)wm);
	for (i = 0; i < 14; i++) printf(" %u", (unsigned)seq[i]);
	printf(" %llu", (unsigned long long)dbits(psi));
	printf(" %llu", (unsigned long long)dbits(dpsi));
	pbits(cb, 9); pbits(csib, 9); pbits(cbsi, 9); pbits(coi, 9);
	pbits(w0i, 3);
	pbits(&ip.csAttCoreData_Cro_si[0][0], 9);
	pbits(ip.csAttCoreData_wri_si, 3);
	pbits(&ip.csAttCoreData_Cro[0][0], 9);
	pbits(ip.csAttCoreData_wri, 3);
	pbits(ip.csAttCoreData_qri, 4);
	pbits(ip.csAttCoreData_wro, 3);
	printf("\n");
}

/* 输入生成用：由欧拉角构造物理 DCM（Angle2C321 公式，仅作输入） */
static void build_dcm(double rx, double ry, double rz, double *o)
{
	Angle2C321(o, rx, ry, rz);
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : 0x9E3779B97F4A7C15ULL;
	double ident[9] = { 1, 0, 0, 0, 1, 0, 0, 0, 1 };
	uint32_t seq[14];
	double cb[9], csib[9], cbsi[9], coi[9], w0i[3] = { 0.001, -0.0005, 0.0008 };
	long i;
	int j, k;

	rs_state = seed ? seed : 1;

	/* ---- 定向 1：6 转序 × 3 组 (psi, cb) 组合，csib=cbsi=coi=I ---- */
	for (j = 0; j < 6; j++) {
		for (i = 0; i < 14; i++) seq[i] = seq_pool[(j + 1) % 6];
		seq[j] = seq_pool[j];
		for (k = 0; k < 3; k++) {
			double psi = 0.1 * (j + 1) - 0.2 * k;
			build_dcm(0.1 * k, -0.05 * j, 0.02 * (j + k), cb);
			run_one((uint32_t)j, seq, psi, 0.001 * (k + 1),
			        cb, ident, ident, ident, w0i);
		}
	}

	/* ---- 定向 2：coi ∈ {I, Rx(π), Ry(π), Rz(π)}，强制 C2Q 四分支 ---- */
	for (i = 0; i < 14; i++) seq[i] = 321;
	build_dcm(0.2, -0.1, 0.15, cb);
	build_dcm(-0.1, 0.2, -0.05, csib);
	build_dcm(0.05, 0.1, -0.2, cbsi);
	run_one(0, seq, 0.15, 0.002, cb, csib, cbsi, ident, w0i);   /* tr>0 */
	build_dcm(PI, 0.0, 0.0, coi);
	run_one(0, seq, 0.15, 0.002, cb, csib, cbsi, coi, w0i);     /* m0 主导 */
	build_dcm(0.0, PI, 0.0, coi);
	run_one(0, seq, 0.15, 0.002, cb, csib, cbsi, coi, w0i);     /* m4>m8 */
	build_dcm(0.0, 0.0, PI, coi);
	run_one(0, seq, 0.15, 0.002, cb, csib, cbsi, coi, w0i);     /* else */

	/* ---- 定向 3：非法转序 → default（Angle2C321，真实分支） ---- */
	for (i = 0; i < 14; i++) seq[i] = 0;
	run_one(0, seq, 0.15, 0.002, cb, csib, cbsi, ident, w0i);
	for (i = 0; i < 14; i++) seq[i] = 999;
	run_one(0, seq, 0.15, 0.002, cb, csib, cbsi, ident, w0i);

	/* ---- 定向 4：psi=dpsi=0 边界 ---- */
	for (i = 0; i < 14; i++) seq[i] = 213;
	run_one(0, seq, 0.0, 0.0, ident, ident, ident, ident, w0i);

	/* ---- 随机 ---- */
	for (i = 0; i < n; i++) {
		uint32_t wm = (uint32_t)(rs() % 14);
		double psi, dpsi;
		for (j = 0; j < 14; j++) {
			uint32_t r = (uint32_t)(rs() % 25);
			seq[j] = r < 6 ? seq_pool[r] : 321;
		}
		seq[wm] = (rs() % 40 == 0) ? 0u : seq_pool[rs() % 6];
		psi = rrange(-0.5, 0.5);
		dpsi = rrange(-0.05, 0.05);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), cb);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), csib);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), cbsi);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), coi);
		w0i[0] = rrange(-0.01, 0.01);
		w0i[1] = rrange(-0.01, 0.01);
		w0i[2] = rrange(-0.01, 0.01);
		run_one(wm, seq, psi, dpsi, cb, csib, cbsi, coi, w0i);
	}
	return 0;
}
