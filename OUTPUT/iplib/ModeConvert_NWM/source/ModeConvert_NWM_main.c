/* FloatTest 参考程序：ModeConvert_NWM
 * 直接编译运行原始 IP_ModeConvert_NWM.c 的活跃部分（文件后 ~190 行被注释
 * 的旧版本不参与编译；WKMD_OCM / WKMD_AMM 由 -D 注入，见
 * ModeConvert_NWM_cflags.txt——原项目全局模式常量在仓库源中无定义，
 * 取替身值 0x33 / 0x44，与 spec 的 WKMD_OCM_Z / WKMD_AMM_Z 一致）。
 *
 * 用法: ModeConvert_NWM_main.exe [n=1000] [seed]
 * 输出: 每行 7 列：
 *   输入(6): starTime tpi_OC LmtT_Ahead_OCM tm_xin(bits64 ×4) F_MnvNextMode workMode
 *   输出(1): workMode'
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_ModeConvert_NWM.h"

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
        ModeConvert_NWM ip;
        double starTime, tpi, ahead, tmXin;

        starTime = rand_double(-1.0e6, 1.0e6);
        tpi      = rand_double(-1.0e6, 1.0e6);
        ahead    = rand_double(-100.0, 1.0e4);
        tmXin    = rand_double(-1.0e6, 1.0e6);
        ip.csMnvData_F_MnvNextMode = rand_u32(0, 3);
        ip.m_WorkMode = rand_u32(0, 0x4F);

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { tpi = 100.0; ahead = 50.0; starTime = 120.0;  /* 窗口内 → OCM */
                         tmXin = 1.0e9; ip.csMnvData_F_MnvNextMode = 0; }
        if (mode == 2) { tpi = 100.0; ahead = 50.0; starTime = 100.0;  /* 左端恰等：不触发 */
                         tmXin = 1.0e9; ip.csMnvData_F_MnvNextMode = 0; }
        if (mode == 3) { tpi = 100.0; ahead = 50.0; starTime = 150.0;  /* 右端恰等：不触发 */
                         tmXin = 1.0e9; ip.csMnvData_F_MnvNextMode = 0; }
        if (mode == 4) { tpi = 100.0; ahead = 500.0; starTime = 200.0; /* 先 OCM 后 AMM：覆盖 */
                         tmXin = 0.0; ip.csMnvData_F_MnvNextMode = 2; }
        if (mode == 5) { tpi = 1000.0; ahead = 10.0; starTime = 200.0; /* 仅 AMM */
                         tmXin = 0.0; ip.csMnvData_F_MnvNextMode = 2; }
        if (mode == 6) { starTime = b2f64(0x7FF8000000000000ULL);      /* NaN：均不触发 */
                         ip.csMnvData_F_MnvNextMode = 2; }
        if (mode == 7) { tpi = 100.0; ahead = -10.0; starTime = 200.0; /* 空窗口：不触发 */
                         tmXin = 1.0e9; ip.csMnvData_F_MnvNextMode = 0; }
        /* mode 0：纯随机 */

        ip.m_starTime = starTime;
        ip.csOrbitCtrlData_tpi_OC = tpi;
        ip.csOrbitCtrlPara_LmtT_Ahead_OCM = ahead;
        ip.csMnvData_tm_xin = tmXin;

        unint32 wm_in = ip.m_WorkMode;

        ModeConvert_NWMFun(&ip);

        printf("%llu %llu %llu %llu %u %u %u\n",
               (unsigned long long)f2b64(starTime),
               (unsigned long long)f2b64(tpi),
               (unsigned long long)f2b64(ahead),
               (unsigned long long)f2b64(tmXin),
               ip.csMnvData_F_MnvNextMode, wm_in, ip.m_WorkMode);
    }
    return 0;
}
