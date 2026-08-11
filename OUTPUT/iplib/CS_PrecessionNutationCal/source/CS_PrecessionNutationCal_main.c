/* FloatTest 参考程序：CS_PrecessionNutationCal
 * 直接编译运行原始 IP_CS_PrecessionNutationCal.c（岁差章动矩阵计算）。
 *
 * 语义：F_qJDerr=0；FS_CPNCal==1 时 tJ2000 = tmpT+I_UTC0+tGPS0+dT_UTC2TDT，
 * 走 CPNCalc（IAU1976 岁差 + 1980 章动多项式，Cp=Rz(-Zp)Ry(θp)Rz(-ζp)、
 * Cn=Rx(-(εm+Δε))Rz(-Δψ)Rx(εm)，CPN = Cpᵀ·Cnᵀ）；否则
 * TripleFabsMax(qd[0..2])<0.05 时 qd[3]=sqrt(1-Σqd²)、CPN=Q2C(qd)，
 * 否则 CPN=单位阵、F_qJDerr=1。
 *
 * 组件库重建（仓库全库无实现，含宏；约定详见 README）：
 *   CPN_POLY1/CPN_POLY3 多项式求值（朴素逐项、0 起升序），**输出乘
 *   ARC2RAD 角秒转弧度**——原代码把结果直接送 Sinx/Cosx/Rx/Ry/Rz
 *   （弧度域），物理上（IAU 系数均为角秒）必须有此转换，转换只可能
 *   在被裁掉的宏定义里，此为重建约定中最重要的一条；
 *   Rx/Ry/Rz = Vallado/IAU 被动元旋转（与 EIM 重建中 1 轴元旋转一致）；
 *   Q2C 与 AHM_USU 同款标准展开（q[3] 标量部）；
 *   MatrixMulti333 行主序 0.0 起 k 升序；MatrixTran33/MatrixIdentity33/
 *   TripleFabsMax 直白。sin/cos 由 ported_trig.c（musl 移植）提供，
 *   sqrt 由 ported_sqrt.c（musl 移植）提供。
 *
 * 用法: CS_PrecessionNutationCal_main.exe [n=1000] [seed]
 * 输出: 每行 19 列：
 *   输入(8): FS（整数） | tmpT qd[4] I_UTC0 dT_UTC2TDT tGPS0（7×bits64）
 *   输出(11): F_qJDerr（整数） | CPN[9] qd[3] 终值（10×bits64）
 *
 * 定向设计：全部输入有限值；FS=1 覆盖 Tc 网格（含 Tc=0、正负、大
 * Tc）；FS=0 覆盖 qd 全零（→qd3=1）、小矢量（Q2C 分支）、超阈值
 * （单位阵+F_qJDerr=1）、阈值 0.05 两侧恰等（严格 < 判定）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "IP_CS_PrecessionNutationCal.h"

/* ---- 组件库 fp64 重建（与 spec.v 同式同序） ----
 * CPN_POLY1/CPN_POLY3/ARC2RAD 宏由 decls.h 注入（含角秒→弧度转换，
 * 重建约定中最重要的声明，见 README）。
 */

/* Vallado/IAU 被动元旋转（与 EIM 重建中 1 轴元旋转一致） */
void Rx(double *o, double a)
{
	double s = sin(a), c = cos(a);
	o[0] = 1.0; o[1] = 0.0; o[2] = 0.0;
	o[3] = 0.0; o[4] = c;   o[5] = s;
	o[6] = 0.0; o[7] = -s;  o[8] = c;
}

void Ry(double *o, double a)
{
	double s = sin(a), c = cos(a);
	o[0] = c;   o[1] = 0.0; o[2] = -s;
	o[3] = 0.0; o[4] = 1.0; o[5] = 0.0;
	o[6] = s;   o[7] = 0.0; o[8] = c;
}

void Rz(double *o, double a)
{
	double s = sin(a), c = cos(a);
	o[0] = c;   o[1] = s;   o[2] = 0.0;
	o[3] = -s;  o[4] = c;   o[5] = 0.0;
	o[6] = 0.0; o[7] = 0.0; o[8] = 1.0;
}

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

void MatrixTran33(double *out, const double *a)
{
	double temp[9];
	unsigned i, j;
	for (i = 0; i < 3u; ++i)
		for (j = 0; j < 3u; ++j)
			temp[i * 3u + j] = a[j * 3u + i];
	memcpy(out, temp, sizeof temp);
}

void MatrixIdentity33(double *out)
{
	unsigned i, j;
	for (i = 0; i < 3u; ++i)
		for (j = 0; j < 3u; ++j)
			out[i * 3u + j] = (i == j) ? 1.0 : 0.0;
}

/* 四元数→DCM（q[3] 标量部，标准展开式，与 AHM_USU 同款） */
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

/* TripleFabsMax：max(|a|,|b|,|c|)，左到右两两取大 */
double TripleFabsMax(double a, double b, double c)
{
	double m = fabs(a);
	if (fabs(b) > m) m = fabs(b);
	if (fabs(c) > m) m = fabs(c);
	return m;
}

static uint64_t dbits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }

/* xorshift64* */
static uint64_t rs_state;
static uint64_t rs(void)
{
	uint64_t x = rs_state;
	x ^= x >> 12; x ^= x << 25; x ^= x >> 27;
	rs_state = x;
	return x * 2685821657736338717ULL;
}
static double urand(void) { return (double)(rs() >> 11) * 0x1.0p-53; } /* [0,1) */
static double rrange(double lo, double hi) { return lo + (hi - lo) * urand(); }

static void pbits(const double *x, int n)
{
	int i;
	for (i = 0; i < n; i++) printf(" %llu", (unsigned long long)dbits(x[i]));
}

static void run_one(uint32_t fs, double tmpT, const double *qd,
                    double i_utc0, double dt_utc2tdt, double tgps0)
{
	CS_PrecessionNutationCal ip;
	memset(&ip, 0, sizeof ip);
	ip.tmpT = tmpT;
	ip.csOrbOtherPara_FS_CPNCal = fs;
	ip.csOrb19_qd[0] = qd[0]; ip.csOrb19_qd[1] = qd[1];
	ip.csOrb19_qd[2] = qd[2]; ip.csOrb19_qd[3] = qd[3];
	ip.csOrb19_Para_I_UTC0 = i_utc0;
	ip.csGpsPara_dT_UTC2TDT = dt_utc2tdt;
	ip.csGpsPara_tGPS0 = tgps0;

	CS_PrecessionNutationCalFun(&ip);

	printf("%u", (unsigned)fs);
	pbits(&tmpT, 1);
	pbits(qd, 4);
	pbits(&i_utc0, 1);
	pbits(&dt_utc2tdt, 1);
	pbits(&tgps0, 1);
	printf(" %u", (unsigned)ip.csOrbDataOther_F_qJDerr);
	pbits(&ip.CPN[0][0], 9);
	pbits(&ip.csOrb19_qd[3], 1);
	printf("\n");
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : 0x9E3779B97F4A7C15ULL;
	static const double day_cy = 86400.0 * 36525.0;   /* 1 儒略世纪秒数 */
	double qd[4];
	long i;
	int j;

	rs_state = seed ? seed : 1;

	/* ---- 定向 1：FS=1，Tc 网格（tJ2000 = Tc*day_cy，经 tmpT 注入） ---- */
	{
		static const double tcs[] = { 0.0, 0.26, 0.5, 1.0, -0.2, 2.0, -1.5 };
		qd[0] = 0.01; qd[1] = -0.02; qd[2] = 0.03; qd[3] = 0.999;
		for (j = 0; j < 7; j++)
			run_one(1, tcs[j] * day_cy, qd, 0.0, 32.184, 0.0);
	}
	/* FS=1：非零四分量叠加（tmpT/I_UTC0/tGPS0/dT 同号异号各一） */
	run_one(1, 0.3 * day_cy, qd, 100.0, 32.184, -50.0);
	run_one(1, -0.1 * day_cy, qd, -2048.5, 32.184, 1024.25);

	/* ---- 定向 2：FS=0，qd 全零 → qd3 = sqrt(1-0) = 1，CPN = I ---- */
	qd[0] = 0.0; qd[1] = 0.0; qd[2] = 0.0; qd[3] = 0.777;   /* qd3 输入被覆写 */
	run_one(0, 0.0, qd, 0.0, 32.184, 0.0);

	/* ---- 定向 3：FS=0，小矢量（Q2C 分支，qd3 输入任意） ---- */
	qd[0] = 0.01; qd[1] = -0.02; qd[2] = 0.03; qd[3] = 0.5;
	run_one(0, 0.0, qd, 0.0, 32.184, 0.0);

	/* ---- 定向 4：FS=0，阈值两侧恰等（严格 < 判定） ---- */
	qd[0] = 0.049999; qd[1] = 0.0; qd[2] = 0.0; qd[3] = 0.0;
	run_one(0, 0.0, qd, 0.0, 32.184, 0.0);                   /* < 0.05 → Q2C */
	qd[0] = 0.05;
	run_one(0, 0.0, qd, 0.0, 32.184, 0.0);                   /* = 0.05 → 单位阵+err */

	/* ---- 定向 5：FS=0，明显超阈值 → CPN = I、F_qJDerr = 1、qd3 透传 ---- */
	qd[0] = 0.3; qd[1] = -0.2; qd[2] = 0.1; qd[3] = 0.926;
	run_one(0, 0.0, qd, 0.0, 32.184, 0.0);

	/* ---- 定向 6：FS=0，阈值由第二/第三分量触发 ---- */
	qd[0] = 0.0; qd[1] = 0.0500001; qd[2] = 0.0; qd[3] = 0.0;
	run_one(0, 0.0, qd, 0.0, 32.184, 0.0);
	qd[0] = 0.0; qd[1] = 0.0; qd[2] = -0.051; qd[3] = 0.0;
	run_one(0, 0.0, qd, 0.0, 32.184, 0.0);

	/* ---- 随机 ---- */
	for (i = 0; i < n; i++) {
		if (rs() % 2 == 0) {
			/* FS=1：tmpT ~ ±2 世纪，偏移量小扰动 */
			qd[0] = rrange(-0.4, 0.4); qd[1] = rrange(-0.4, 0.4);
			qd[2] = rrange(-0.4, 0.4); qd[3] = rrange(-1.0, 1.0);
			run_one(1, rrange(-2.0, 2.0) * day_cy, qd,
			        rrange(-1000.0, 1000.0), 32.184 + rrange(-1.0, 1.0),
			        rrange(-1000.0, 1000.0));
		} else {
			/* FS=0：qd 矢量部混合小/超阈值（50% 贴近阈值带） */
			if (rs() % 2 == 0) {
				qd[0] = rrange(-0.06, 0.06);
				qd[1] = rrange(-0.06, 0.06);
				qd[2] = rrange(-0.06, 0.06);
			} else {
				qd[0] = rrange(-0.4, 0.4);
				qd[1] = rrange(-0.4, 0.4);
				qd[2] = rrange(-0.4, 0.4);
			}
			qd[3] = rrange(-1.0, 1.0);
			run_one(0, rrange(-1.0, 1.0) * day_cy, qd,
			        rrange(-1000.0, 1000.0), 32.184 + rrange(-1.0, 1.0),
			        rrange(-1000.0, 1000.0));
		}
	}
	return 0;
}
