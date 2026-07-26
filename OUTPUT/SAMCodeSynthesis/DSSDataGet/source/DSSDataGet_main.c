/* FloatTest 参考程序：DSSDataGet
 * 直接编译运行原始 IP_DSSDataGet.c，UART 用 stub 注入测试帧，
 * 打印输入/输出，作为 Coq spec 差分测试的标准答案。
 *
 * stub 建模选择：UartRecv 总是把向量字节填入接收缓冲（11 字节）并返回
 * 给定的 bSucc——因为 IP 代码无论通讯成败都会对缓冲字节做浮点重组，
 * 我们测试的是"给定缓冲内容时 IP 逻辑的行为"。
 *
 * 用法: DSSDataGet_main.exe [n=1000] [seed]
 * 输出: 每行 18 列：
 *   输入(13): bSucc b[0..10] errCnt
 *   输出(5):  royaw(bits) piyaw(bits) flgSP errCode errCnt'
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_DSSDataGet.h"

/* ---- UART / 系统函数 stub（真实实现在驱动层，此处注入测试数据） ---- */
static unint08 g_recv[16];
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

/* 把 float bits 按大端序拆进 4 个字节（b0 = MSB，与 USED_WORD 重组一致） */
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
        DSSDataGet ip;
        unint08 b[11];
        unint32 bSucc, errCnt_in;

        /* 帧内容：b0..b7 为两个真实 float 的大端字节，b8/b9 太阳标志 */
        split_be(f2b(rand_float(-180.0f, 180.0f)), &b[0]);
        split_be(f2b(rand_float(-180.0f, 180.0f)), &b[4]);
        b[8] = (unint08)rand_u32(0, 2);
        b[9] = (unint08)rand_u32(0, 2);
        /* 校验和：一半概率正确，一半概率破坏 */
        unint32 sum = 0;
        for (int i = 0; i < 10; i++) sum += b[i];
        b[10] = (unint08)(sum & 0xFF);
        if (rand_u32(0, 1) == 1) b[10] = (unint08)(b[10] + 1 + rand_u32(0, 254));
        bSucc = (rand_u32(0, 3) == 3) ? 1 : 0;      /* 1/4 通讯失败 */
        errCnt_in = rand_u32(0, 10);

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { /* 完好帧 */
            sum = 0; for (int i = 0; i < 10; i++) sum += b[i];
            b[10] = (unint08)(sum & 0xFF); bSucc = 0;
        }
        if (mode == 2) { bSucc = 0; b[10] = (unint08)(b[10] + 1); } /* 校验错 */
        if (mode == 3) { bSucc = 1; }                               /* 通讯失败 */
        if (mode == 4) { b[8] = 1; bSucc = 0; }                     /* flgSP 经 b8 */
        if (mode == 5) { b[9] = 1; bSucc = 0; }                     /* flgSP 经 b9 */
        if (mode == 6) { b[8] = 2; b[9] = 0; bSucc = 0; }           /* 非 1：flgSP=0 */
        if (mode == 7) { errCnt_in = 0xFFFFFFFFu; bSucc = 1; }      /* errCnt 回绕 */
        /* mode 0：纯随机 */

        for (int i = 0; i < 11; i++) g_recv[i] = b[i];
        g_bSucc = bSucc;
        debugDss.ErrCnt = errCnt_in;

        DSSDataGetFun(&ip);

        printf("%u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u\n",
               bSucc,
               (unint32)b[0], (unint32)b[1], (unint32)b[2], (unint32)b[3],
               (unint32)b[4], (unint32)b[5], (unint32)b[6], (unint32)b[7],
               (unint32)b[8], (unint32)b[9], (unint32)b[10],
               errCnt_in,
               f2b(ip.royaw), f2b(ip.piyaw), ip.flgSP,
               debugDss.ErrCode, debugDss.ErrCnt);
    }
    return 0;
}
