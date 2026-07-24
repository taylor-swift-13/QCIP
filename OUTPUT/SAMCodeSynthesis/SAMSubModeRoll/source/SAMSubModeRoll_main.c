/* FloatTest 参考程序：SAMSubModeRoll
 * 直接编译运行原始 IP_SAMSubModeRoll.c，对随机输入打印输入/输出，
 * 作为 Coq spec 差分测试的标准答案。
 *
 * 用法: SAMSubModeRoll_main.exe [n=1000] [seed]
 * 输出: 每行 14 列：
 *   输入(8): royaw(bits) curMode flgSP countMode countPublic up0 up1 up2(bits)
 *   输出(6): workMode countMode' countPublic' outUp0' outUp1' outUp2'(bits)
 * 计数器/模式字为 unint32，按 %u 打印；浮点按 IEEE bits 打印。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_SAMSubModeRoll.h"

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
        SAMSubModeRoll ip;
        unint32 curMode, flgSP;
        float32 royaw_v;
        float up_in[3];

        royaw_v = rand_float(-2.0f, 3.0f);          /* 跨过阈值 1.0f */
        flgSP = rand_u32(0, 1);
        curMode = rand_u32(0, 0x4F);                /* 覆盖 0x00/0x11/0x22/0x33/0x44 */
        ip.m_countMode = rand_u32(0, 8000);         /* 跨过 6250 */
        ip.m_countPublic = rand_u32(0, 20);         /* 跨过 12 */
        for (int i = 0; i < 3; i++) up_in[i] = rand_float(-2.0f, 2.0f);

        /* 定向边界与路径覆盖 */
        int mode = k % 12;
        if (mode == 1) { royaw_v = 1.0f; flgSP = 1; }                 /* 阈值上（不触发） */
        if (mode == 2) { royaw_v = 2.0f; flgSP = 1; ip.m_countPublic = 11; } /* cp->12：清 outUp */
        if (mode == 3) { royaw_v = 2.0f; flgSP = 1; ip.m_countPublic = 12; } /* cp->13：转巡航 */
        if (mode == 4) { flgSP = 0; ip.m_countMode = 6250; }          /* 超时触发 */
        if (mode == 5) { flgSP = 0; ip.m_countMode = 6249; }          /* 超时不触发 */
        if (mode == 6) { flgSP = 2; royaw_v = 2.0f; ip.m_countPublic = 5; }  /* 非 TRUE：清零 */
        if (mode == 7) { flgSP = 1; royaw_v = 2.0f;                   /* 竞争：巡航重置优先 */
                         ip.m_countPublic = 12; ip.m_countMode = 6250; }
        if (mode == 8) { flgSP = 1; royaw_v = b2f(0x7FC00000u);       /* NaN：比较为 false */
                         ip.m_countPublic = 5; }
        if (mode == 9) { flgSP = 1; royaw_v = b2f(0x7F800000u);       /* +Inf：比较为 true */
                         ip.m_countPublic = 5; }
        if (mode == 10) { flgSP = 0; ip.m_countMode = 0xFFFFFFFFu; }  /* countMode 回绕到 0 */
        if (mode == 11) { flgSP = 1; royaw_v = 2.0f;                  /* countPublic 回绕到 0 */
                          ip.m_countPublic = 0xFFFFFFFFu; }
        /* mode 0：纯随机 */

        ip.m_curMode = &curMode;
        ip.flgSP = &flgSP;
        ip.royaw = &royaw_v;
        for (int i = 0; i < 3; i++) ip.outUp[i] = up_in[i];

        unint32 cm_in = ip.m_countMode;
        unint32 cp_in = ip.m_countPublic;

        SAMSubModeRollFun(&ip);

        printf("%u %u %u %u %u %u %u %u %u %u %u %u %u %u\n",
               f2b(royaw_v), curMode, flgSP, cm_in, cp_in,
               f2b(up_in[0]), f2b(up_in[1]), f2b(up_in[2]),
               ip.m_workMode, ip.m_countMode, ip.m_countPublic,
               f2b(ip.outUp[0]), f2b(ip.outUp[1]), f2b(ip.outUp[2]));
    }
    return 0;
}
