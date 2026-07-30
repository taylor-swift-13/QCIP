/* FloatTest 参考程序：ModeConvert_SBM
 * 直接编译运行原始 IP_ModeConvert_SBM.c（WKMD_EIM 由 -D 注入，见
 * ModeConvert_SBM_cflags.txt——原项目全局模式常量在仓库源中无定义，
 * 取替身值 0x11，与 spec 的 WKMD_EIM_Z 一致）。
 *
 * 用法: ModeConvert_SBM_main.exe [n=1000] [seed]
 * 输出: 每行 5 列：
 *   输入(4): m_starTime(bits64) t0(bits64) dt(bits64) workMode
 *   输出(1): workMode'
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_ModeConvert_SBM.h"

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
        ModeConvert_SBM ip;
        double starTime, t0, dt;

        starTime = rand_double(-1.0e6, 1.0e6);
        t0       = rand_double(-1.0e6, 1.0e6);
        dt       = rand_double(-100.0, 1.0e4);
        ip.m_WorkMode = rand_u32(0, 0x4F);

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { t0 = 100.0; dt = 50.0; starTime = 150.0; }   /* diff == dt：恰触发 */
        if (mode == 2) { starTime = t0; dt = 1.0; }                   /* diff=0 < dt：不触发 */
        if (mode == 3) { starTime = b2f64(0x7FF8000000000000ULL); }   /* starTime NaN：不触发 */
        if (mode == 4) { dt = b2f64(0x7FF8000000000000ULL); }         /* dt NaN：不触发 */
        if (mode == 5) { starTime = b2f64(0x7FF0000000000000ULL);     /* starTime +Inf：触发 */
                         t0 = 1.0; dt = 1.0e6; }
        if (mode == 6) { starTime = b2f64(0x7FEFFFFFFFFFFFFFULL);     /* diff 溢出为 +Inf */
                         t0 = b2f64(0xFFEFFFFFFFFFFFFFULL); dt = 1.0; }
        if (mode == 7) { t0 = b2f64(0x7FF8000000000000ULL); }         /* t0 NaN：不触发 */
        /* mode 0：纯随机 */

        ip.m_starTime = starTime;
        ip.csOrb19_Para_I_t0 = t0;
        ip.csModePara_dt_OrbitInject = dt;

        unint32 wm_in = ip.m_WorkMode;

        ModeConvert_SBMFun(&ip);

        printf("%llu %llu %llu %u %u\n",
               (unsigned long long)f2b64(starTime),
               (unsigned long long)f2b64(t0),
               (unsigned long long)f2b64(dt),
               wm_in, ip.m_WorkMode);
    }
    return 0;
}
