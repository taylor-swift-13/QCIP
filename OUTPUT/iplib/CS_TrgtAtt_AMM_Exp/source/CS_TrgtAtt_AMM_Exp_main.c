/* FloatTest 参考程序：CS_TrgtAtt_AMM_Exp
 * 直接编译运行原始 IP_CS_TrgtAtt_AMM_Exp.c。
 *
 * 外部依赖处理（详见 README 备注）：
 *   - csMnvTrgtHook.Track_Plan_hook()：应用层钩子（真实类型不在本 case
 *     源码内）。真实系统里它执行 5.3.1.4 轨迹规划算法并产出
 *     Chi_Ref/dChi_Ref；差分测试把这两个量当作直接输入，钩子置空操作
 *     （hook_calls 计数，确认每次调用都触发），类型由 -include 的
 *     *_decls.h 注入最小桩；
 *   - Sinx/Cosx：std_basal.h 宏 → libm sin/cos，由
 *     FloatTest/ref/ported_trig.c（musl 确定化移植）在链接时 shadow；
 *     全部 TU 编译 -fno-builtin-sin -fno-builtin-cos（见 *_cflags.txt），
 *     与 Coq 侧 FloatTest/lib/FloatTrig.v 同算法逐比特一致。
 *
 * 用法: CS_TrgtAtt_AMM_Exp_main.exe [n=1000] [seed]
 * 输出: 每行 25 列：
 *   输入(14): F_Init | e_xyz[0..2] chi dchi | tm1p tm2p tm3p tm_xin
 *             | tm1i tm2i tm3i tmnvi（F_Init==0 时的透传初值）
 *   输出(11): qrb0[0..3] wrb0[0..2] | tm1 tm2 tm3 tMnv
 *   除首列 F_Init 为十进制整数外，全部打印十进制 bits64。
 *
 * 定向设计：全部输入为有限值（三角/乘加路径不造 NaN）；chi 定向覆盖
 * [-4π,4π]，使 tmpF=chi/2 ∈ [-2π,2π] 命中 kernel、small-rem 各分支与
 * pi/2、3pi/2、2pi 的 goto-medium 相消点（自测已覆盖 medium 全域）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_TrgtAtt_AMM_Exp.h"

/* ---- 应用层钩子最小桩 ---- */
static unsigned long hook_calls;
static void track_plan_noop(void) { hook_calls++; }
SMnvTrgtHook_Stub csMnvTrgtHook = { track_plan_noop };

static uint64_t dbits(double x) { uint64_t b; memcpy(&b, &x, 8); return b; }
static double dbl(uint64_t b) { double x; memcpy(&x, &b, 8); return x; }

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

#define PIO2 0x1.921fb54442d18p-1
#define PI   0x1.921fb54442d18p+1

/* chi 定向池：k*(pi/2)，使 tmpF=chi/2 覆盖 kernel/small-rem 全分支 */
static const int chi_ks[] = { -8, -7, -6, -5, -4, -3, -2, -1,
                              0, 1, 2, 3, 4, 5, 6, 7, 8 };

static void run_one(uint32_t fi, double e0, double e1, double e2,
                    double chi, double dchi,
                    double tm1p, double tm2p, double tm3p, double tmxin,
                    double tm1i, double tm2i, double tm3i, double tmnvi)
{
	CS_TrgtAtt_AMM_Exp ip;
	memset(&ip, 0, sizeof ip);
	ip.csMnvData_F_Init_tm3 = fi;
	ip.csMnvData_e_xyz[0] = e0;
	ip.csMnvData_e_xyz[1] = e1;
	ip.csMnvData_e_xyz[2] = e2;
	ip.csMnvData_mTrack_Chi_Ref = chi;
	ip.csMnvData_mTrack_dChi_Ref = dchi;
	ip.csMnvData_mTrack_tm1p = tm1p;
	ip.csMnvData_mTrack_tm2p = tm2p;
	ip.csMnvData_mTrack_tm3p = tm3p;
	ip.csMnvData_tm_xin = tmxin;
	ip.csMnvData_tm1 = tm1i;
	ip.csMnvData_tm2 = tm2i;
	ip.csMnvData_tm3 = tm3i;
	ip.csMnvData_tMnv = tmnvi;

	CS_TrgtAtt_AMM_ExpFun(&ip);

	printf("%u %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
	       " %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu\n",
	       (unsigned)fi,
	       (unsigned long long)dbits(e0),
	       (unsigned long long)dbits(e1),
	       (unsigned long long)dbits(e2),
	       (unsigned long long)dbits(chi),
	       (unsigned long long)dbits(dchi),
	       (unsigned long long)dbits(tm1p),
	       (unsigned long long)dbits(tm2p),
	       (unsigned long long)dbits(tm3p),
	       (unsigned long long)dbits(tmxin),
	       (unsigned long long)dbits(tm1i),
	       (unsigned long long)dbits(tm2i),
	       (unsigned long long)dbits(tm3i),
	       (unsigned long long)dbits(tmnvi),
	       (unsigned long long)dbits(ip.csMnvData_qrb0[0]),
	       (unsigned long long)dbits(ip.csMnvData_qrb0[1]),
	       (unsigned long long)dbits(ip.csMnvData_qrb0[2]),
	       (unsigned long long)dbits(ip.csMnvData_qrb0[3]),
	       (unsigned long long)dbits(ip.csMnvData_wrb0[0]),
	       (unsigned long long)dbits(ip.csMnvData_wrb0[1]),
	       (unsigned long long)dbits(ip.csMnvData_wrb0[2]),
	       (unsigned long long)dbits(ip.csMnvData_tm1),
	       (unsigned long long)dbits(ip.csMnvData_tm2),
	       (unsigned long long)dbits(ip.csMnvData_tm3),
	       (unsigned long long)dbits(ip.csMnvData_tMnv));
}

static double rrange(double lo, double hi) { return lo + urand() * (hi - lo); }

int main(int argc, char **argv)
{
	long n = argc > 1 ? atol(argv[1]) : 1000;
	uint64_t seed = argc > 2 ? strtoull(argv[2], 0, 0) : 0x9E3779B97F4A7C15ULL;
	long i;
	size_t j;

	rs_state = seed ? seed : 1;

	/* ---- 定向：chi 取 k*(pi/2) 网格（含 tmpF 的 pi/2、3pi/2、2pi 相消点），
	 * 并穿插 tmpF 边界 ±1ulp；F_Init 交替覆盖 0/1 ---- */
	for (j = 0; j < sizeof(chi_ks) / sizeof(chi_ks[0]); j++) {
		double chi = (double)chi_ks[j] * PIO2;
		uint64_t cb = dbits(chi);
		run_one((uint32_t)(j & 1), 1.0, 0.0, 0.0, chi,
		        0.1, 1.0, 2.0, 3.0, 100.0, 7.0, 8.0, 9.0, 10.0);
		/* tmpF 边界 ±1ulp（chi ±2ulp，除 2 后仍保持边界邻域）。
		 * chi==0 时 raw bits 加减会落入 NaN 模式，跳过（NaN 纪律）。 */
		if (chi_ks[j] == 0)
			continue;
		run_one((uint32_t)((j + 1) & 1), 0.0, 1.0, 0.0, dbl(cb + 2),
		        -0.2, 0.5, 1.5, 2.5, 50.0, 0.0, 0.0, 0.0, 0.0);
		run_one((uint32_t)(j & 1), 0.0, 0.0, 1.0, dbl(cb - 2),
		        0.3, 3.0, 2.0, 1.0, 25.0, 5.0, 6.0, 7.0, 8.0);
	}

	/* ---- 随机：chi ∈ [-4π, 4π]，其余字段常规范围 ---- */
	for (i = 0; i < n; i++) {
		run_one((uint32_t)(rs() & 1),
		        rrange(-1.5, 1.5), rrange(-1.5, 1.5), rrange(-1.5, 1.5),
		        rrange(-4.0 * PI, 4.0 * PI),
		        rrange(-2.0, 2.0),
		        rrange(0.0, 1e5), rrange(0.0, 1e5), rrange(0.0, 1e5),
		        rrange(0.0, 1e6),
		        rrange(0.0, 1e5), rrange(0.0, 1e5), rrange(0.0, 1e5),
		        rrange(0.0, 1e5));
	}

	fprintf(stderr, "hook_calls=%lu\n", hook_calls);
	return 0;
}
