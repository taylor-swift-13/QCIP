/* FloatTest 参考程序：GyroStateGet
 * 直接编译运行原始 IP_GyroStateGet.c，UART 用 stub 注入测试帧，
 * 打印输入/输出，作为 Coq spec 差分测试的标准答案。
 *
 * stub 建模选择同 DSSDataGet：UartRecv 总是把向量字节填入接收缓冲
 * 并返回给定的 bSucc；驱动保证 NumGyro ∈ [0,9]（越界写是 UB，不在
 * 被测行为范围内）。
 *
 * 用法: GyroStateGet_main.exe [n=1000] [seed]
 * 输出: 每行 89 列：
 *   输入(69): bSucc b[0..47] numGyro wa_in[0..8](bits) sf_in[0..8] errCnt
 *   输出(20): wa'[0..8](bits) stateFlag'[0..8] errCode errCnt'
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_GyroStateGet.h"

/* ---- UART / 系统函数 stub ---- */
static unint08 g_recv[64];
static unint32 g_bSucc;

unint32 UartRecv(unint32 uartno, unint08 *buf, unint32 *len, unint32 *numerror) {
    unint32 n = *len;
    (void)uartno;
    if (n > sizeof(g_recv)) n = sizeof(g_recv);
    memcpy(buf, g_recv, n);
    *numerror = 0;
    return g_bSucc;
}

void UartSend(unint32 uartno, unint08 *buf, unint32 len) {
    (void)uartno; (void)buf; (void)len;
}

void SYS_Delay(unint32 us) { (void)us; }

/* ---- 测试驱动 ---- */
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

static uint32_t rand_u32(uint32_t lo, uint32_t hi) {
    return lo + (uint32_t)(rnd() % (uint64_t)(hi - lo + 1));
}

static void split_be(uint32_t bits, unint08 *b) {
    b[0] = (unint08)(bits >> 24);
    b[1] = (unint08)(bits >> 16);
    b[2] = (unint08)(bits >> 8);
    b[3] = (unint08)(bits);
}

int main(int argc, char **argv) {
    int n = (argc > 1) ? atoi(argv[1]) : 1000;
    s_state = (argc > 2) ? strtoull(argv[2], NULL, 0) : 0x9E3779B97F4A7C15ULL;
    if (s_state == 0) s_state = 0x9E3779B97F4A7C15ULL;

    for (int k = 0; k < n; k++) {
        GyroStateGet ip;
        unint08 b[48];
        unint32 bSucc, numGyro, errCnt_in;
        uint32_t wa_in[9];
        unint32 sf_in[9];

        /* 帧内容：b0/b1 随机；9 路 float 大端字节进 b[2..37]；
           状态字节进 b[38..46] */
        b[0] = (unint08)rand_u32(0, 255);
        b[1] = (unint08)rand_u32(0, 255);
        for (int i = 0; i < 9; i++) {
            split_be(f2b(rand_float(-10.0f, 10.0f)), &b[2 + 4 * i]);
            b[38 + i] = (unint08)((rnd() % 4 == 3) ? 0xFF : rand_u32(0, 2));
        }
        /* 校验和：一半概率正确，一半概率破坏 */
        unint32 sum = 0;
        for (int i = 0; i < 47; i++) sum += b[i];
        b[47] = (unint08)(sum & 0xFF);
        if (rand_u32(0, 1) == 1) b[47] = (unint08)(b[47] + 1 + rand_u32(0, 254));
        bSucc = (rand_u32(0, 3) == 3) ? 1 : 0;
        numGyro = rand_u32(0, 9);
        errCnt_in = rand_u32(0, 10);
        for (int i = 0; i < 9; i++) {
            wa_in[i] = f2b(rand_float(-10.0f, 10.0f));
            sf_in[i] = rand_u32(0, 255);
        }

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { /* 完好帧，9 路全收 */
            sum = 0; for (int i = 0; i < 47; i++) sum += b[i];
            b[47] = (unint08)(sum & 0xFF); bSucc = 0; numGyro = 9;
        }
        if (mode == 2) { bSucc = 0; b[47] = (unint08)(b[47] + 1); }  /* 校验错 */
        if (mode == 3) { bSucc = 1; }                                /* 通讯失败 */
        if (mode == 4) { numGyro = 0; bSucc = 0; }                   /* 不写任何元素 */
        if (mode == 5) { numGyro = 3; bSucc = 0; }                   /* 部分更新 */
        if (mode == 6) { numGyro = 9; bSucc = 0;                     /* 状态字节全 0xFF */
                         for (int i = 0; i < 9; i++) b[38 + i] = 0xFF; }
        if (mode == 7) { errCnt_in = 0xFFFFFFFFu; bSucc = 1; }       /* errCnt 回绕 */
        /* mode 0：纯随机 */

        for (int i = 0; i < 48; i++) g_recv[i] = b[i];
        g_bSucc = bSucc;
        ip.NumGyro = numGyro;
        debugGyro.ErrCnt = errCnt_in;
        for (int i = 0; i < 9; i++) {
            uint32_t u = wa_in[i]; float f; memcpy(&f, &u, 4);
            ip.wa[i] = f;
            ip.stateFlag[i] = sf_in[i];
        }

        GyroStateGetFun(&ip);

        printf("%u ", bSucc);
        for (int i = 0; i < 48; i++) printf("%u ", (unint32)b[i]);
        printf("%u ", numGyro);
        for (int i = 0; i < 9; i++) printf("%u ", wa_in[i]);
        for (int i = 0; i < 9; i++) printf("%u ", sf_in[i]);
        printf("%u ", errCnt_in);
        for (int i = 0; i < 9; i++) printf("%u ", f2b(ip.wa[i]));
        for (int i = 0; i < 9; i++) printf("%u ", ip.stateFlag[i]);
        printf("%u %u\n", debugGyro.ErrCode, debugGyro.ErrCnt);
    }
    return 0;
}
