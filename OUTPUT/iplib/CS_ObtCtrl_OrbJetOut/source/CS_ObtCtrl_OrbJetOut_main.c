/* FloatTest 参考程序：CS_ObtCtrl_OrbJetOut
 * 直接编译运行原始 IP_CS_ObtCtrl_OrbJetOut.c（NUM_THRGR_OC 由 -D 注入，见
 * CS_ObtCtrl_OrbJetOut_cflags.txt——原项目宏在仓库源中无定义，
 * 结构体数组为定长 [4]，取替身值 4，与 spec 的定长列表一致）。
 *
 * 用法: CS_ObtCtrl_OrbJetOut_main.exe [n=1000] [seed]
 * 输出: 每行 17 列（十进制 uint64 bit pattern）：
 *   输入(12): starTime tpi dto deltaT  fs0..fs3  t0..t3
 *   输出(5):  t0'..t3' dto'
 *
 * 定向设计：
 *   - NaN 只走比较分支（starTime/tpi）或透传分支（tIn/dto），
 *     不进入乘法——C 的 NaN payload 传播与 Flocq 规范 NaN 不同，
 *     乘法路径只允许有限值或 非NaN×非零 的组合（±Inf×正常数、有限×±0
 *     都是 IEEE 精确结果，两侧逐位一致）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_ObtCtrl_OrbJetOut.h"

static uint64_t f2b64(double f) { uint64_t u; memcpy(&u, &f, 8); return u; }
static double b2f64(uint64_t u) { double f; memcpy(&f, &u, 8); return f; }

static uint64_t s_state;
static uint64_t rnd(void) {
    s_state ^= s_state << 13;
    s_state ^= s_state >> 7;
    s_state ^= s_state << 17;
    return s_state;
}

static double rand_double(double lo, double hi) {
    double t = (double)(rnd() >> 11) * (1.0 / 9007199254740992.0);
    return lo + t * (hi - lo);
}

#define NAN64 0x7FF8000000000000ULL
#define PINF64 0x7FF0000000000000ULL
#define NINF64 0xFFF0000000000000ULL
#define NZERO64 0x8000000000000000ULL

int main(int argc, char **argv) {
    int n = (argc > 1) ? atoi(argv[1]) : 1000;
    s_state = (argc > 2) ? strtoull(argv[2], NULL, 0) : 0x9E3779B97F4A7C15ULL;
    if (s_state == 0) s_state = 0x9E3779B97F4A7C15ULL;

    for (int k = 0; k < n; k++) {
        CS_ObtCtrl_OrbJetOut ip;
        double starTime, tpi, dto_in, deltaT, fs[4], t_in[4];

        starTime = rand_double(-1.0e6, 1.0e6);
        tpi      = rand_double(-1.0e6, 1.0e6);
        dto_in   = rand_double(-10.0, 10.0);
        deltaT   = rand_double(-1.0, 1.0);
        for (int i = 0; i < 4; i++) {
            fs[i]   = rand_double(-2.0, 2.0);
            t_in[i] = rand_double(-10.0, 10.0);
        }

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { tpi = 50.0; starTime = 50.0;            /* 恰等：触发 if */
                         dto_in = b2f64(NAN64); }                 /* dto NaN 透传 */
        if (mode == 2) { tpi = 50.0; starTime = 25.0;            /* else 分支 */
                         t_in[0] = b2f64(NAN64);                  /* tIn NaN 透传 */
                         t_in[1] = b2f64(PINF64);
                         t_in[2] = b2f64(NINF64); }
        if (mode == 3) { starTime = b2f64(NAN64); }               /* else：NaN 比较为 false */
        if (mode == 4) { tpi = b2f64(NAN64); }                    /* else：同上 */
        if (mode == 5) { tpi = 50.0; starTime = 75.0;            /* if：乘法符号/Inf 边界 */
                         fs[0] = 0.0; fs[1] = b2f64(NZERO64);
                         fs[2] = b2f64(PINF64); fs[3] = b2f64(NINF64);
                         deltaT = 2.0; }
        if (mode == 6) { tpi = 50.0; starTime = 75.0;            /* if：有限 × ±0 = ±0 */
                         deltaT = 0.0; }
        if (mode == 7) { tpi = 50.0; starTime = 75.0;            /* if：负 deltaT + 标志值 */
                         fs[0] = 1.0; fs[1] = 0.0; fs[2] = -1.0; fs[3] = 2.0;
                         deltaT = -rand_double(0.001, 1.0); }
        /* mode 0：纯随机 */

        ip.m_starTime = starTime;
        ip.csOrbitCtrlData_tpi_OC = tpi;
        ip.csOrbitCtrlData_dremain_OC = 0.0;    /* 不被读取 */
        ip.csOrbitCtrlData_sumDtp = 0.0;        /* 不被读取 */
        ip.csOrbitCtrlData_dto_OC = dto_in;
        ip.m_WorkMode = 0;                      /* 不被读取 */
        ip.m_DeltaT = deltaT;
        ip.csOrbitCtrlData_dGap_OC = 0.0;       /* 不被读取 */
        for (int i = 0; i < 4; i++) {
            ip.CS_Jet_ObtOut_FS_OC[i] = fs[i];
            ip.CS_Jet_ObtOut_t_OC[i] = t_in[i];
        }

        CS_ObtCtrl_OrbJetOutFun(&ip);

        printf("%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu\n",
               (unsigned long long)f2b64(starTime),
               (unsigned long long)f2b64(tpi),
               (unsigned long long)f2b64(dto_in),
               (unsigned long long)f2b64(deltaT),
               (unsigned long long)f2b64(fs[0]), (unsigned long long)f2b64(fs[1]),
               (unsigned long long)f2b64(fs[2]), (unsigned long long)f2b64(fs[3]),
               (unsigned long long)f2b64(t_in[0]), (unsigned long long)f2b64(t_in[1]),
               (unsigned long long)f2b64(t_in[2]), (unsigned long long)f2b64(t_in[3]),
               (unsigned long long)f2b64(ip.CS_Jet_ObtOut_t_OC[0]),
               (unsigned long long)f2b64(ip.CS_Jet_ObtOut_t_OC[1]),
               (unsigned long long)f2b64(ip.CS_Jet_ObtOut_t_OC[2]),
               (unsigned long long)f2b64(ip.CS_Jet_ObtOut_t_OC[3]),
               (unsigned long long)f2b64(ip.csOrbitCtrlData_dto_OC));
    }
    return 0;
}
