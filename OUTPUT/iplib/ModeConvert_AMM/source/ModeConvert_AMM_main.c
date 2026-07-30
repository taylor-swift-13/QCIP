/* FloatTest 参考程序：ModeConvert_AMM
 * 直接编译运行原始 IP_ModeConvert_AMM.c（目标模式为 C 字面量，无需宏注入）。
 * 三个顺序执行的 if（非 else-if，后者覆盖前者）。
 *
 * 用法: ModeConvert_AMM_main.exe [n=1000] [seed]
 * 输出: 每行 8 列：
 *   输入(7): starTime t0 dt tm3 lmt(bits64 ×5) F_MnvNextMode workMode
 *   输出(1): workMode'
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_ModeConvert_AMM.h"

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

static uint32_t rand_u32(uint32_t lo, uint32_t hi) {
    return lo + (uint32_t)(rnd() % (uint64_t)(hi - lo + 1));
}

int main(int argc, char **argv) {
    int n = (argc > 1) ? atoi(argv[1]) : 1000;
    s_state = (argc > 2) ? strtoull(argv[2], NULL, 0) : 0x9E3779B97F4A7C15ULL;
    if (s_state == 0) s_state = 0x9E3779B97F4A7C15ULL;

    for (int k = 0; k < n; k++) {
        ModeConvert_AMM ip;
        double starTime, t0, dt, tm3, lmt;

        starTime = rand_double(-1.0e6, 1.0e6);
        t0       = rand_double(-1.0e6, 1.0e6);
        dt       = rand_double(-100.0, 1.0e4);
        tm3      = rand_double(-1.0e6, 1.0e6);
        lmt      = rand_double(0.0, 1000.0);
        ip.csMnvData_F_MnvNextMode = rand_u32(0, 3);
        ip.m_WorkMode = rand_u32(0, 0x4F);

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { t0 = 100.0; dt = 50.0; starTime = 150.0;    /* 仅第一个 if 触发 → 1 */
                         tm3 = 1.0e9; lmt = 50.0; ip.csMnvData_F_MnvNextMode = 0; }
        if (mode == 2) { starTime = t0 = 200.0; dt = 1.0;            /* F=2 → 5 */
                         tm3 = 0.0; lmt = 50.0; ip.csMnvData_F_MnvNextMode = 2; }
        if (mode == 3) { starTime = t0 = 200.0; dt = 1.0;            /* F=1 → 2 */
                         tm3 = 0.0; lmt = 50.0; ip.csMnvData_F_MnvNextMode = 1; }
        if (mode == 4) { t0 = 100.0; dt = 50.0; starTime = 150.0;    /* 先 1 后 5：覆盖 */
                         tm3 = 0.0; lmt = 50.0; ip.csMnvData_F_MnvNextMode = 2; }
        if (mode == 5) { starTime = t0 = 200.0; dt = 1.0;            /* 时间未到：均不触发 */
                         tm3 = 1.0e9; lmt = 50.0; ip.csMnvData_F_MnvNextMode = 2; }
        if (mode == 6) { starTime = b2f64(0x7FF8000000000000ULL);    /* NaN：均不触发 */
                         ip.csMnvData_F_MnvNextMode = 2; }
        if (mode == 7) { t0 = 100.0; dt = 50.0; starTime = 150.0;    /* F=3：只有第一个 if */
                         tm3 = 0.0; lmt = 50.0; ip.csMnvData_F_MnvNextMode = 3; }
        /* mode 0：纯随机 */

        ip.m_starTime = starTime;
        ip.csOrb19_Para_I_t0 = t0;
        ip.csModePara_dt_OrbitInject = dt;
        ip.tm3 = tm3;
        ip.LmtT_ModeSwitch_AMM = lmt;

        unint32 wm_in = ip.m_WorkMode;

        ModeConvert_AMMFun(&ip);

        printf("%llu %llu %llu %llu %llu %u %u %u\n",
               (unsigned long long)f2b64(starTime),
               (unsigned long long)f2b64(t0),
               (unsigned long long)f2b64(dt),
               (unsigned long long)f2b64(tm3),
               (unsigned long long)f2b64(lmt),
               ip.csMnvData_F_MnvNextMode, wm_in, ip.m_WorkMode);
    }
    return 0;
}
