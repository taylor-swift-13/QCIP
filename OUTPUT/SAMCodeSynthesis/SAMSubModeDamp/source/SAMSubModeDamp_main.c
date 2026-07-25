/* FloatTest 参考程序：SAMSubModeDamp
 * 直接编译运行原始 IP_SAMSubModeDamp.c（+ std_utils.c 的 TripleFabsMaxF），
 * 对随机输入打印输入/输出，作为 Coq spec 差分测试的标准答案。
 *
 * 用法: SAMSubModeDamp_main.exe [n=1000] [seed]
 * 输出: 每行 11 列：
 *   输入(8): pr0 pr1 pr2(bits) curMode countMode countPublic timeD2P timeD2Pover
 *   输出(3): workMode countMode' countPublic'
 * 计数器/模式字/时间阈值为 unint32，按 %u 打印；浮点按 IEEE bits 打印。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_SAMSubModeDamp.h"

static uint32_t f2b(float f) { uint32_t u; memcpy(&u, &f, 4); return u; }
static float b2f(uint32_t u) { float f; memcpy(&f, &u, 4); return f; }

static uint64_t s_state;
static uint64_t rnd(void) {
    s_state ^= s_state << 13;
    s_state ^= s_state >> 7;
    s_state ^= s_state << 17;
    return s_state;
}

static float rand_float(float lo, float hi) {
    double t = (double)(rnd() >> 11) * (1.0 / 9007199254740992.0);
    return (float)(lo + t * (double)(hi - lo));
}

static uint32_t rand_u32(uint32_t lo, uint32_t hi) {
    return lo + (uint32_t)(rnd() % (uint64_t)(hi - lo + 1));
}

int main(int argc, char **argv) {
    int n = (argc > 1) ? atoi(argv[1]) : 1000;
    s_state = (argc > 2) ? strtoull(argv[2], NULL, 0) : 0x9E3779B97F4A7C15ULL;
    if (s_state == 0) s_state = 0x9E3779B97F4A7C15ULL;

    for (int k = 0; k < n; k++) {
        SAMSubModeDamp ip;
        unint32 curMode;
        float32 pr[3];

        for (int i = 0; i < 3; i++) pr[i] = rand_float(-0.3f, 0.3f); /* 跨过 0.15 */
        curMode = rand_u32(0, 0x4F);
        ip.m_countPublic = rand_u32(0, 25);
        ip.m_countMode = rand_u32(0, 350);
        ip.time_D2P = rand_u32(5, 20);
        ip.time_D2P_overtime = rand_u32(100, 300);

        /* 定向边界与路径覆盖（cp/cm 聚焦的模式把另一个计数器置 0 隔离） */
        int mode = k % 13;
        if (mode == 1) { pr[0] = pr[1] = pr[2] = 0.1f; ip.m_countMode = 0; } /* fabsmax<0.15：cp++ */
        if (mode == 2) { pr[0] = 0.15f; pr[1] = pr[2] = 0.1f;         /* fabsmax==0.15：不自增 */
                         ip.m_countMode = 0; }
        if (mode == 3) { pr[1] = -0.2f; ip.m_countMode = 0; }         /* 负值取 abs 后越限 */
        if (mode == 4) { pr[0] = pr[1] = pr[2] = 0.1f;                /* cp 自增后 > time_D2P */
                         ip.m_countPublic = ip.time_D2P; ip.m_countMode = 0; }
        if (mode == 5) { pr[0] = 1.0f;                                /* 不自增，cp == time_D2P 不转 */
                         ip.m_countPublic = ip.time_D2P; ip.m_countMode = 0; }
        if (mode == 6) { ip.m_countMode = ip.time_D2P_overtime;       /* cm 自增后 > overtime */
                         ip.m_countPublic = 0; }
        if (mode == 7) { ip.m_countMode = ip.time_D2P_overtime - 1;   /* cm 自增后 == overtime 不转 */
                         ip.m_countPublic = 0; }
        if (mode == 8) { pr[0] = b2f(0x7FC00000u); pr[1] = pr[2] = 0.1f; /* NaN 被丢弃：fabsmax=0.1 */
                         ip.m_countMode = 0; }
        if (mode == 9) { pr[0] = pr[1] = pr[2] = b2f(0x7FC00000u);    /* 全 NaN：fabsmax=NaN 不自增 */
                         ip.m_countMode = 0; }
        if (mode == 10) { ip.m_countMode = 0xFFFFFFFFu;               /* cm 回绕到 0：不超时 */
                          ip.m_countPublic = 0; }
        if (mode == 11) { pr[0] = pr[1] = pr[2] = 0.1f;               /* cp 回绕到 0：不转 */
                          ip.m_countPublic = 0xFFFFFFFFu; ip.m_countMode = 0; }
        if (mode == 12) { pr[0] = 1.0f;                               /* cp 已 > time_D2P（与自增无关） */
                          ip.m_countPublic = ip.time_D2P + 5; ip.m_countMode = 0; }
        /* mode 0：纯随机 */

        ip.m_curMode = &curMode;
        ip.pRate = pr;

        unint32 cm_in = ip.m_countMode;
        unint32 cp_in = ip.m_countPublic;

        SAMSubModeDampFun(&ip);

        printf("%u %u %u %u %u %u %u %u %u %u %u\n",
               f2b(pr[0]), f2b(pr[1]), f2b(pr[2]),
               curMode, cm_in, cp_in, ip.time_D2P, ip.time_D2P_overtime,
               ip.m_workMode, ip.m_countMode, ip.m_countPublic);
    }
    return 0;
}
