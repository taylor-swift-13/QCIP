/* FloatTest 参考程序：PseudoRate
 * 直接编译运行原始 IP_PseudoRate.c，对随机输入打印输入/输出的
 * IEEE 单精度 bit pattern，作为 Coq spec 差分测试的标准答案。
 *
 * 用法: PseudoRate_main.exe [n=1000] [seed]
 * 输出: 每行 18 列（十进制 uint32 / int）：
 *   pu0 pu1 pu2 r0 r1 r2 h10 h11 h12  yp0 yp1 yp2  yn0 yn1 yn2  rb0 rb1 rb2
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_PseudoRate.h"

static uint32_t f2b(float f) { uint32_t u; memcpy(&u, &f, 4); return u; }

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

int main(int argc, char **argv) {
    int n = (argc > 1) ? atoi(argv[1]) : 1000;
    s_state = (argc > 2) ? strtoull(argv[2], NULL, 0) : 0x9E3779B97F4A7C15ULL;
    if (s_state == 0) s_state = 0x9E3779B97F4A7C15ULL;

    for (int k = 0; k < n; k++) {
        PseudoRate ip;
        float pu[3];
        float r_in[3], h1_in[3];

        for (int i = 0; i < 3; i++) {
            pu[i]   = rand_float(-2.0f, 2.0f);
            r_in[i] = rand_float(-2.0f, 2.0f);
            h1_in[i] = rand_float(0.0f, 1.0f);
        }
        /* 定向边界：h1 = 0；pu-r 恰好落在阈值上/下 */
        int mode = k % 8;
        if (mode == 1) { h1_in[0] = 0.0f; }
        if (mode == 2) { pu[0] = r_in[0] + h1_in[0]; }
        if (mode == 3) { pu[0] = r_in[0] - h1_in[0]; }
        if (mode == 4) { h1_in[0] = h1_in[1] = h1_in[2] = 0.0f; }
        if (mode == 5) { pu[0] = r_in[0]; pu[1] = r_in[1]; pu[2] = r_in[2]; }
        if (mode == 6) { r_in[0] = 0.0f; r_in[1] = 0.0f; r_in[2] = 0.0f; }
        if (mode == 7) { pu[0] = 0.0f; pu[1] = 0.0f; pu[2] = 0.0f; }

        for (int i = 0; i < 3; i++) ip.r[i] = r_in[i];
        for (int i = 0; i < 3; i++) ip.h1[i] = h1_in[i];
        ip.pu = pu;

        PseudoRateFun(&ip);

        printf("%u %u %u %u %u %u %u %u %u %d %d %d %d %d %d %u %u %u\n",
               f2b(pu[0]), f2b(pu[1]), f2b(pu[2]),
               f2b(r_in[0]), f2b(r_in[1]), f2b(r_in[2]),
               f2b(h1_in[0]), f2b(h1_in[1]), f2b(h1_in[2]),
               (int)ip.Yp[0], (int)ip.Yp[1], (int)ip.Yp[2],
               (int)ip.Yn[0], (int)ip.Yn[1], (int)ip.Yn[2],
               f2b(ip.r[0]), f2b(ip.r[1]), f2b(ip.r[2]));
    }
    return 0;
}
