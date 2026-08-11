/* FloatTest 参考程序：CS_TrgtP2P_Ini
 * 直接编译运行原始 IP_CS_TrgtP2P_Ini.c（点对点机动的初始化）。
 *
 * 语义：dChimax[i] = dChimaxRWorCMGCtrlZR[i][F_P2PType]、
 * amax[i] = amaxRWorCMGCtrlZR[i][F_P2PType]（i=0..2，查表）；
 * m_WorkMode==WKMD_OAM → CS_TrgtP2P_OrbCtl_Ini()，
 * ==WKMD_AMM → CS_TrgtP2P_Tar_Init()，否则 f_Fun_Null()；
 * 然后 qro = C2Q(Cro)、qro0 = qro（透传拷贝）。
 *
 * 组件库重建与打桩（仓库全库无实现，约定详见 README）：
 *   C2Q 为 Shepperd 法 q[3] 标量部（与 EIM 同款，sqrt 用
 *   ported_sqrt.c musl 移植）；Memcpyx = memcpy 包装；
 *   CS_TrgtP2P_OrbCtl_Ini / CS_TrgtP2P_Tar_Init 打空操作桩（后者
 *   是独立的兄弟 case，其 Cro 生成逻辑在 CS_TrgtP2P_Tar_Init 题目
 *   内单独测试；本题 Cro 作为输入注入），f_Fun_Null 空操作。
 *   打桩使 m_WorkMode 不影响输出——spec 如实建模（wm 进签名但
 *   不参与计算），"wm 任意值输出相同"本身被 1000+ 条向量验证。
 *   裸全局 m_WorkMode（仓库源码无定义）由本驱动定义为输入注入；
 *   WKMD_OAM=0x55 / WKMD_AMM=0x44 为替身值（0x44 沿用
 *   ModeConvert_NWM 的既有替身）。
 *
 * 用法: CS_TrgtP2P_Ini_main.exe [n=1000] [seed]
 * 输出: 每行 61 列：
 *   输入(47): wm F_P2PType（2 整数） | dChimaxZR[18] amaxZR[18] Cro[9]（45×bits64）
 *   输出(14): dChimax[3] amax[3] qro[4] qro0[4]（bits64）
 *   stderr: 打桩 callee 调用计数（orbc/tar/nul），用于分支命中核验。
 *
 * 定向设计：全部输入有限值；F_P2PType 0..5 全覆盖（越界为 UB，不注入）；
 * wm ∈ {WKMD_OAM, WKMD_AMM, 其他} 三分支；Cro 注入 I/Rx(π)/Ry(π)/Rz(π)
 * 强制 C2Q 四分支；随机 Cro 由欧拉角经 Angle2C321 现场构造（物理 DCM）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "IP_CS_TrgtP2P_Ini.h"

/* ---- 裸全局（仓库源码无定义），decls.h 中 extern ---- */
unsigned int m_WorkMode;

/* ---- 打桩：mode callee 与空函数（计数到 stderr） ---- */
static unsigned n_orbc, n_tar, n_nul;

void CS_TrgtP2P_OrbCtl_Ini(void) { n_orbc++; }
void CS_TrgtP2P_Tar_Init(void) { n_tar++; }
void f_Fun_Null(void) { n_nul++; }

/* ---- 组件库 fp64 重建（与 spec.v 同式同序） ---- */

void Memcpyx(unint08 *destination, const unint08 *source, unint32 nbytes)
{
	memcpy(destination, source, nbytes);
}

/* Shepperd 法 DCM→四元数（q[3] 标量部）；与 EIM 同款 */
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
		out[2] = (m[5] + m[7]) / s;
		out[0] = (m[1] + m[4]) / s;
		out[3] = (m[2] - m[6]) / s;
	} else {
		s = sqrt(1.0 + m[8] - m[0] - m[4]) * 2.0;
		out[2] = 0.25 * s;
		out[0] = (m[2] + m[6]) / s;
		out[1] = (m[5] + m[7]) / s;
		out[3] = (m[3] - m[1]) / s;
	}
}

/* 输入生成用：由欧拉角构造物理 DCM（主动右手元旋转，仅作输入） */
static void build_dcm(double a1, double a2, double a3, double *o)
{
	double s1 = sin(a1), c1 = cos(a1);
	double s2 = sin(a2), c2 = cos(a2);
	double s3 = sin(a3), c3 = cos(a3);
	o[0] = c2 * c3;               o[1] = s1 * s2 * c3 - c1 * s3; o[2] = c1 * s2 * c3 + s1 * s3;
	o[3] = c2 * s3;               o[4] = s1 * s2 * s3 + c1 * c3; o[5] = c1 * s2 * s3 - s1 * c3;
	o[6] = -s2;                   o[7] = s1 * c2;                o[8] = c1 * c2;
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

#undef PI
#define PI   0x1.921fb54442d18p+1

static void pbits(const double *x, int n)
{
	int i;
	for (i = 0; i < n; i++) printf(" %llu", (unsigned long long)dbits(x[i]));
}

static void run_one(unsigned wm, int ftype,
                    const double *dchizr, const double *amaxzr,
                    const double *cro)
{
	CS_TrgtP2P_Ini ip;
	int i, j;
	memset(&ip, 0, sizeof ip);
	m_WorkMode = wm;
	ip.csMnvData_F_P2PType = ftype;
	for (i = 0; i < 3; i++)
		for (j = 0; j < 6; j++) {
			ip.csMnvPara_dChimax_RWorCMGCtrlZR[i][j] = dchizr[i * 6 + j];
			ip.csMnvPara_amax_RWorCMGCtrlZR[i][j] = amaxzr[i * 6 + j];
		}
	memcpy(&ip.csAttCoreData_Cro[0][0], cro, 9 * sizeof(double));

	CS_TrgtP2P_IniFun(&ip);

	printf("%u %d", wm, ftype);
	pbits(dchizr, 18);
	pbits(amaxzr, 18);
	pbits(cro, 9);
	pbits(ip.csMnvData_dChimax_RWorCMGCtrl, 3);
	pbits(ip.csMnvData_amax_RWorCMGCtrl, 3);
	pbits(ip.csAttCoreData_qro, 4);
	pbits(ip.csAttCoreData_qro0, 4);
	printf("\n");
}

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : 0x9E3779B97F4A7C15ULL;
	double dchizr[18], amaxzr[18], cro[9];
	double ident[9] = { 1, 0, 0, 0, 1, 0, 0, 0, 1 };
	long i;
	int j;

	rs_state = seed ? seed : 1;

	for (j = 0; j < 18; j++) {
		dchizr[j] = 0.1 + 0.01 * j;
		amaxzr[j] = 0.2 - 0.005 * j;
	}

	/* ---- 定向 1：F_P2PType 0..5 全覆盖（wm = WKMD_AMM，Cro = I） ---- */
	for (j = 0; j < 6; j++)
		run_one(WKMD_AMM, j, dchizr, amaxzr, ident);

	/* ---- 定向 2：wm 三分支（OAM / AMM / 其他→f_Fun_Null） ---- */
	run_one(WKMD_OAM, 2, dchizr, amaxzr, ident);
	run_one(WKMD_AMM, 2, dchizr, amaxzr, ident);
	run_one(0x33, 2, dchizr, amaxzr, ident);          /* 其他（如 WKMD_OCM 值） */
	run_one(0x7FFF, 2, dchizr, amaxzr, ident);        /* 任意非 OAM/AMM 值 */

	/* ---- 定向 3：Cro ∈ {I, Rx(π), Ry(π), Rz(π)}，强制 C2Q 四分支 ---- */
	build_dcm(PI, 0.0, 0.0, cro);
	run_one(WKMD_AMM, 0, dchizr, amaxzr, cro);        /* m0 主导 */
	build_dcm(0.0, PI, 0.0, cro);
	run_one(WKMD_AMM, 0, dchizr, amaxzr, cro);        /* m4>m8 */
	build_dcm(0.0, 0.0, PI, cro);
	run_one(WKMD_AMM, 0, dchizr, amaxzr, cro);        /* else（m8） */
	/* tr>0 已由定向 1/2 的 Cro=I 覆盖 */

	/* ---- 随机 ---- */
	for (i = 0; i < n; i++) {
		unsigned wm;
		int ftype = (int)(rs() % 6);
		uint64_t r = rs() % 10;
		if (r < 4) wm = WKMD_AMM;
		else if (r < 6) wm = WKMD_OAM;
		else {
			wm = (unsigned)(rs() % 0x10000);
			if (wm == WKMD_AMM || wm == WKMD_OAM) wm ^= 0x8000u;  /* 保持"其他"语义 */
		}
		for (j = 0; j < 18; j++) {
			dchizr[j] = rrange(-1.0, 1.0);
			amaxzr[j] = rrange(-1.0, 1.0);
		}
		build_dcm(rrange(-PI, PI), rrange(-PI, PI), rrange(-PI, PI), cro);
		run_one(wm, ftype, dchizr, amaxzr, cro);
	}

	fprintf(stderr, "orbc=%u tar=%u nul=%u\n", n_orbc, n_tar, n_nul);
	return 0;
}
