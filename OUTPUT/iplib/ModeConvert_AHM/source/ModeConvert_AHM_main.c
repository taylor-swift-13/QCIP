/* FloatTest 参考程序：ModeConvert_AHM
 * 直接编译运行原始 IP_ModeConvert_AHM.c（活跃部分；目标模式是 C 字面量
 * 0x04u，无需宏注入）。注意：结构体里 m_starTime/t0/dt 字段属于被注释的
 * 旧实现，活跃代码不读，驱动任意初始化、不打印。
 *
 * 下标语义：ModeObject_Timer_Mode[m_WorkMode]，数组长 14；驱动保证
 * m_WorkMode ∈ [0,13]（越界读是 UB，不在被测行为范围内）。
 *
 * 用法: ModeConvert_AHM_main.exe [n=1000] [seed]
 * 输出: 每行 17 列：
 *   输入(16): ModeObject_Timer_Mode[0..13](bits64) LmtT_AHM(bits64) workMode
 *   输出(1): workMode'
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_ModeConvert_AHM.h"

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
        ModeConvert_AHM ip;
        double arr[14];
        double lmt;

        for (int i = 0; i < 14; i++) arr[i] = rand_double(-100.0, 100.0);
        lmt = rand_double(-50.0, 50.0);
        ip.m_WorkMode = rand_u32(0, 13);

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { ip.m_WorkMode = 0; arr[0] = 200.0; lmt = 100.0; } /* 触发 */
        if (mode == 2) { ip.m_WorkMode = 13; arr[13] = lmt; }              /* 恰等：不触发 */
        if (mode == 3) { ip.m_WorkMode = 7; arr[7] = b2f64(0x7FF8000000000000ULL); } /* 元素 NaN */
        if (mode == 4) { lmt = b2f64(0x7FF8000000000000ULL); }             /* lmt NaN */
        if (mode == 5) { arr[ip.m_WorkMode] = b2f64(0x7FF0000000000000ULL); } /* +Inf：触发 */
        if (mode == 6) { ip.m_WorkMode = 13; arr[13] = 200.0; lmt = 100.0; } /* 顶下标触发 */
        if (mode == 7) { ip.m_WorkMode = 0; arr[0] = lmt; }                /* 恰等：不触发 */
        /* mode 0：纯随机 */

        for (int i = 0; i < 14; i++) ip.ModeObject_Timer_Mode[i] = arr[i];
        ip.LmtT_AHM = lmt;
        ip.m_starTime = 0.0;                 /* 活跃代码不读，任意初始化 */
        ip.csOrb19_Para_I_t0 = 0.0;
        ip.csModePara_dt_OrbitInject = 0.0;

        unint32 wm_in = ip.m_WorkMode;

        ModeConvert_AHMFun(&ip);

        printf("%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %u %u\n",
               (unsigned long long)f2b64(arr[0]), (unsigned long long)f2b64(arr[1]),
               (unsigned long long)f2b64(arr[2]), (unsigned long long)f2b64(arr[3]),
               (unsigned long long)f2b64(arr[4]), (unsigned long long)f2b64(arr[5]),
               (unsigned long long)f2b64(arr[6]), (unsigned long long)f2b64(arr[7]),
               (unsigned long long)f2b64(arr[8]), (unsigned long long)f2b64(arr[9]),
               (unsigned long long)f2b64(arr[10]), (unsigned long long)f2b64(arr[11]),
               (unsigned long long)f2b64(arr[12]), (unsigned long long)f2b64(arr[13]),
               (unsigned long long)f2b64(lmt),
               wm_in, ip.m_WorkMode);
    }
    return 0;
}
