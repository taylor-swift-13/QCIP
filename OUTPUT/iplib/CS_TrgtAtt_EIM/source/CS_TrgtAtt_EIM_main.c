/* FloatTest 参考程序：CS_TrgtAtt_EIM
 * 直接编译运行原始 IP_CS_TrgtAtt_EIM.c。
 *
 * 组件库重建（仓库全库无实现，算法选择见 README 备注；与 rocq/spec.v
 * 逐式同序对应）：
 *   - Angle2C123/132/213/231/312/321：欧拉角→DCM，主动右手元旋转
 *     A1/A2/A3 按转序名顺序相乘（A<ijk> = Ai(a_i)·Aj(a_j)·A_k(a_k)，
 *     参量序 = 轴号），sin/cos 由 ported_trig.c（musl 移植）提供；
 *   - C2Q：Shepperd 法 DCM→四元数（q[3] 为标量部），sqrt 用 libm
 *     （IEEE 正确舍入，与 Coq 侧 fp64_sqrt = Bsqrt mode_NE 一致）；
 *   - MatrixMulti333/331：行主序累加（0.0 起、k 升序），沿用
 *     FloatTest/ref 旧 harness 的重建版本。
 *
 * 用法: CS_TrgtAtt_EIM_main.exe [n=1000] [seed]
 * 输出: 每行 58 列：
 *   输入(39): wm | seq[14] | atr[3] cb[9] coi[9] w0i[3]（后 36 列为 bits64）
 *   输出(19): Cro[9] wri[3] qri[4] wro[3]（bits64）
 *
 * 定向设计：全部输入有限值；cb/coi 由随机欧拉角经重建公式现场构造
 * （物理 DCM，保证 C2Q 的 sqrt 参数非负）；定向含 6 种转序 × 6 组姿态角、
 * 恒等/绕轴 180° 的 coi（强制 C2Q 四个分支）与非法转序（default 分支）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "IP_CS_TrgtAtt_EIM.h"

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

/* 主动右手元旋转（README 附录给出完整约定）：
 * A1(a)=[1 0 0; 0 ca -sa; 0 sa ca]，A2/A3 同理；
 * Angle2C<ijk> = A_i(a_i)·A_j(a_j)·A_k(a_k)，ai 为绕第 i 轴角。 */

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

#define PIO2 0x1.921fb54442d18p-1
#undef PI
#define PI   0x1.921fb54442d18p+1

static const uint32_t seq_pool[6] = { 123, 132, 213, 231, 312, 321 };

static void run_one(uint32_t wm, const uint32_t *seq,
                    const double *atr, const double *cb,
                    const double *coi, const double *w0i)
{
	CS_TrgtAtt_EIM ip;
	int i;
	memset(&ip, 0, sizeof ip);
	ip.m_WorkMode = wm;
	for (i = 0; i < 14; i++) ip.csAttPara_Seq_AttD[i] = seq[i];
	for (i = 0; i < 3; i++) {
		ip.csMnvData_A_Trgt[i] = atr[i];
		ip.csOrbData_w0i[i] = w0i[i];
	}
	memcpy(&ip.csAttCoreData_Cbiasp[0][0], cb, 9 * sizeof(double));
	memcpy(&ip.csOrbData_coi[0][0], coi, 9 * sizeof(double));

	CS_TrgtAtt_EIMFun(&ip);

	printf("%u", (unsigned)wm);
	for (i = 0; i < 14; i++) printf(" %u", (unsigned)seq[i]);
	for (i = 0; i < 3; i++) printf(" %llu", (unsigned long long)dbits(atr[i]));
	for (i = 0; i < 9; i++) printf(" %llu", (unsigned long long)dbits(cb[i]));
	for (i = 0; i < 9; i++) printf(" %llu", (unsigned long long)dbits(coi[i]));
	for (i = 0; i < 3; i++) printf(" %llu", (unsigned long long)dbits(w0i[i]));
	for (i = 0; i < 9; i++)
		printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_Cro[0][i]));
	for (i = 0; i < 3; i++)
		printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_wri[i]));
	for (i = 0; i < 4; i++)
		printf(" %llu", (unsigned long long)dbits(ip.csAttCoreData_qri[i]));
	for (i = 0; i < 3; i++)
		printf(" %llu%c", (unsigned long long)dbits(ip.csAttCoreData_wro[i]),
		       i == 2 ? '\n' : ' ');
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
	static const double atr_pool[6][3] = {
		{ 0.0, 0.0, 0.0 },
		{ PIO2, 0.0, 0.0 },
		{ 0.0, PIO2, 0.0 },
		{ 0.0, 0.0, PIO2 },
		{ PI, PI, PI },
		{ 0.7853981633974483, -1.0471975511965976, 0.5235987755982989 }
	};
	double ident[9] = { 1, 0, 0, 0, 1, 0, 0, 0, 1 };
	uint32_t seq[14];
	double atr[3], cb[9], coi[9], w0i[3];
	long i;
	int j, k;

	rs_state = seed ? seed : 1;

	/* ---- 定向 1：6 转序 × 6 组姿态角，cb=coi=I ---- */
	for (j = 0; j < 6; j++) {
		for (i = 0; i < 14; i++) seq[i] = seq_pool[(j + 1) % 6];
		seq[j] = seq_pool[j];                  /* wm=j 处放当前转序 */
		for (k = 0; k < 6; k++) {
			atr[0] = atr_pool[k][0];
			atr[1] = atr_pool[k][1];
			atr[2] = atr_pool[k][2];
			w0i[0] = 0.001; w0i[1] = -0.0005; w0i[2] = 0.0008;
			run_one((uint32_t)j, seq, atr, ident, ident, w0i);
		}
	}

	/* ---- 定向 2：coi ∈ {I, Rx(π), Ry(π), Rz(π)}，强制 C2Q 四分支 ---- */
	for (i = 0; i < 14; i++) seq[i] = 321;
	atr[0] = 0.3; atr[1] = -0.2; atr[2] = 0.1;
	w0i[0] = 0.001; w0i[1] = 0.0; w0i[2] = -0.001;
	build_dcm(0.0, 0.0, 0.0, cb);
	run_one(0, seq, atr, cb, ident, w0i);          /* tr>0 分支 */
	build_dcm(PI, 0.0, 0.0, coi);
	run_one(0, seq, atr, cb, coi, w0i);            /* m0 主导分支 */
	build_dcm(0.0, PI, 0.0, coi);
	run_one(0, seq, atr, cb, coi, w0i);            /* m4>m8 分支 */
	build_dcm(0.0, 0.0, PI, coi);
	run_one(0, seq, atr, cb, coi, w0i);            /* else 分支 */

	/* ---- 定向 3：非法转序 → default（Angle2C321） ---- */
	for (i = 0; i < 14; i++) seq[i] = 0;
	run_one(0, seq, atr, ident, ident, w0i);
	for (i = 0; i < 14; i++) seq[i] = 999;
	run_one(0, seq, atr, ident, ident, w0i);

	/* ---- 随机：atr ∈ [-π,π]，cb/coi 为随机物理 DCM，w0i ∈ [-0.1,0.1] ---- */
	for (i = 0; i < n; i++) {
		uint32_t wm = (uint32_t)(rs() % 14);
		for (j = 0; j < 14; j++) {
			uint32_t r = (uint32_t)(rs() % 25);
			seq[j] = r < 6 ? seq_pool[r] : 321;
		}
		seq[wm] = (rs() % 40 == 0) ? 0u : seq_pool[rs() % 6];
		atr[0] = rrange(-PI, PI);
		atr[1] = rrange(-PI, PI);
		atr[2] = rrange(-PI, PI);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), cb);
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), coi);
		w0i[0] = rrange(-0.1, 0.1);
		w0i[1] = rrange(-0.1, 0.1);
		w0i[2] = rrange(-0.1, 0.1);
		run_one(wm, seq, atr, cb, coi, w0i);
	}
	return 0;
}
