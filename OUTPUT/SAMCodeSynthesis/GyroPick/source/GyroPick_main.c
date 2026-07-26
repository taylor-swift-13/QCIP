/* FloatTest 参考程序：GyroPick
 * 直接编译运行原始 IP_GyroPick.c，对随机输入打印输入/输出，
 * 作为 Coq spec 差分测试的标准答案。
 *
 * 用法: GyroPick_main.exe [n=1000] [seed]
 * 输出: 每行 56 列：
 *   输入(29): wa[0..8](bits) wal[0..8](bits) waThr(bits) pickThr countPick[0..8]
 *   输出(27): wa_out[0..8](bits) wal'[0..8](bits) countPick'[0..8]
 * countPick/pickThr 为 unint08，按 %u 打印；浮点按 IEEE bits 打印。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_GyroPick.h"

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
        GyroPick ip;
        float wa_in[9], wal_in[9];
        unint32 cnt_in[9];

        for (int i = 0; i < 9; i++) {
            wa_in[i] = rand_float(-5.0f, 5.0f);
            wal_in[i] = rand_float(-5.0f, 5.0f);
            cnt_in[i] = rand_u32(0, 8);
        }
        ip.waThr = rand_float(0.0f, 4.0f);
        ip.pickThr = (unint08)rand_u32(1, 5);

        /* 定向边界与路径覆盖（除注明外作用于全部 9 路） */
        int mode = k % 10;
        if (mode == 1) { for (int i = 0; i < 9; i++) wal_in[i] = wa_in[i]; }   /* d=0：不剔 */
        if (mode == 2) { ip.pickThr = 3;                          /* 超限但未连续：沿用旧值 */
                         for (int i = 0; i < 9; i++) { wal_in[i] = 0.0f; wa_in[i] = 2.0f * ip.waThr; cnt_in[i] = 1; } }
        if (mode == 3) { ip.pickThr = 3;                          /* 连续野值：采纳新值 */
                         for (int i = 0; i < 9; i++) { wal_in[i] = 0.0f; wa_in[i] = 2.0f * ip.waThr; cnt_in[i] = 2; } }
        if (mode == 4) { for (int i = 0; i < 9; i++) { wal_in[i] = 0.0f; wa_in[i] = ip.waThr; } } /* |d|==thr：不剔 */
        if (mode == 5) { wa_in[4] = b2f(0x7FC00000u); }             /* 单路 NaN：被直接采纳 */
        if (mode == 6) { ip.waThr = b2f(0x7FC00000u); }             /* thr NaN：全部不剔 */
        if (mode == 7) { for (int i = 0; i < 9; i++) wa_in[i] = b2f(0x7F800000u); } /* +Inf：超限 */
        if (mode == 8) { for (int i = 0; i < 9; i++) {              /* cnt 回绕：255+1=0 < pthr */
                         wal_in[i] = 0.0f; wa_in[i] = 2.0f * ip.waThr; cnt_in[i] = 255; } }
        if (mode == 9) { ip.pickThr = 0;                            /* pthr=0：超限必采纳 */
                         for (int i = 0; i < 9; i++) { wal_in[i] = 0.0f; wa_in[i] = 2.0f * ip.waThr; } }
        /* mode 0：纯随机 */

        for (int i = 0; i < 9; i++) {
            ip.wal[i] = wal_in[i];
            ip.countPick[i] = (unint08)cnt_in[i];
        }
        ip.wa = wa_in;

        GyroPickFun(&ip);

        printf("%u %u %u %u %u %u %u %u %u "
               "%u %u %u %u %u %u %u %u %u "
               "%u %u "
               "%u %u %u %u %u %u %u %u %u "
               "%u %u %u %u %u %u %u %u %u "
               "%u %u %u %u %u %u %u %u %u "
               "%u %u %u %u %u %u %u %u %u\n",
               f2b(wa_in[0]), f2b(wa_in[1]), f2b(wa_in[2]), f2b(wa_in[3]), f2b(wa_in[4]),
               f2b(wa_in[5]), f2b(wa_in[6]), f2b(wa_in[7]), f2b(wa_in[8]),
               f2b(wal_in[0]), f2b(wal_in[1]), f2b(wal_in[2]), f2b(wal_in[3]), f2b(wal_in[4]),
               f2b(wal_in[5]), f2b(wal_in[6]), f2b(wal_in[7]), f2b(wal_in[8]),
               f2b(ip.waThr), (unint32)ip.pickThr,
               cnt_in[0], cnt_in[1], cnt_in[2], cnt_in[3], cnt_in[4],
               cnt_in[5], cnt_in[6], cnt_in[7], cnt_in[8],
               f2b(ip.wa_out[0]), f2b(ip.wa_out[1]), f2b(ip.wa_out[2]),
               f2b(ip.wa_out[3]), f2b(ip.wa_out[4]), f2b(ip.wa_out[5]),
               f2b(ip.wa_out[6]), f2b(ip.wa_out[7]), f2b(ip.wa_out[8]),
               f2b(ip.wal[0]), f2b(ip.wal[1]), f2b(ip.wal[2]),
               f2b(ip.wal[3]), f2b(ip.wal[4]), f2b(ip.wal[5]),
               f2b(ip.wal[6]), f2b(ip.wal[7]), f2b(ip.wal[8]),
               (unint32)ip.countPick[0], (unint32)ip.countPick[1], (unint32)ip.countPick[2],
               (unint32)ip.countPick[3], (unint32)ip.countPick[4], (unint32)ip.countPick[5],
               (unint32)ip.countPick[6], (unint32)ip.countPick[7], (unint32)ip.countPick[8]);
    }
    return 0;
}
