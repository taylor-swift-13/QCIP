/* FloatTest 参考程序：ThreeAxisController
 * 直接编译运行原始 IP_ThreeAxisController.c（+ std_utils.c 的 LimitFloat），
 * 对随机输入打印输入/输出的 IEEE 单精度 bit pattern，
 * 作为 Coq spec 差分测试的标准答案。
 *
 * 用法: ThreeAxisController_main.exe [n=1000] [seed]
 * 输出: 每行 24 列（十进制 uint32 bit pattern）：
 *   输入(12): pa0 pa1 pr0 pr1 pr2 dr0 dr1 kp0 kp1 kd0 kd1 kd2
 *   输出(12): up0 up1 up2 ud0 ud1 ud2 fy0 fy1 fy2 u0 u1 u2
 * 注：pAngle[2]、destRate[2]、CTRL_PARAM_SAM[2].Kp 不被 C 代码读取，
 *     不打印（参考侧置 0）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_ThreeAxisController.h"

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
        ThreeAxisController ip;
        float pa[3], pr[3], dr[3], kp[3], kd[3];

        pa[0] = rand_float(-16.0f, 16.0f);   /* 角度：跨过 ±8 限幅 */
        pa[1] = rand_float(-16.0f, 16.0f);
        pa[2] = 0.0f;                        /* 未被读取 */
        for (int i = 0; i < 3; i++) {
            pr[i] = rand_float(-2.4f, 2.4f); /* 角速度：使 pr-dr 跨过 ±1.2 */
            dr[i] = rand_float(-1.0f, 1.0f);
            kp[i] = rand_float(-2.0f, 2.0f);
            kd[i] = rand_float(-2.0f, 2.0f);
        }
        dr[2] = 0.0f;                        /* 未被读取 */
        kp[2] = 0.0f;                        /* 未被读取 */

        /* 定向边界与路径覆盖 */
        int mode = k % 8;
        if (mode == 1) { pa[0] = 8.0f; pa[1] = -8.0f; }            /* Up 恰取限幅值 */
        if (mode == 2) { pr[0] = dr[0] + 1.2f; pr[1] = dr[1] - 1.2f; } /* Ud 恰取限幅值 */
        if (mode == 3) { pr[2] = 1.2f; }                           /* Z 轴 Ud 边界 */
        if (mode == 4) {                                           /* 全零 */
            pa[0] = pa[1] = 0.0f;
            pr[0] = pr[1] = pr[2] = 0.0f;
            dr[0] = dr[1] = 0.0f;
        }
        if (mode == 5) {                                           /* 小信号：全不饱和支路 */
            pa[0] = rand_float(-1.0f, 1.0f);
            pa[1] = rand_float(-1.0f, 1.0f);
            pr[0] = dr[0] + rand_float(-0.5f, 0.5f);
            pr[1] = dr[1] + rand_float(-0.5f, 0.5f);
            pr[2] = rand_float(-0.5f, 0.5f);
            for (int i = 0; i < 3; i++) {
                kp[i] = rand_float(0.0f, 0.1f);
                kd[i] = rand_float(0.0f, 0.1f);
            }
            kp[2] = 0.0f;
        }
        if (mode == 6) { kp[0] = 100.0f; kp[1] = -100.0f; kd[2] = 100.0f; } /* u 强制饱和 */
        /* mode 0, 7：纯随机 */

        ip.pAngle = pa;
        ip.pRate = pr;
        ip.destRate = dr;
        for (int i = 0; i < 3; i++) {
            ip.CTRL_PARAM_SAM[i].Kp = kp[i];
            ip.CTRL_PARAM_SAM[i].Kd = kd[i];
        }

        ThreeAxisControllerFun(&ip);

        printf("%u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u %u\n",
               f2b(pa[0]), f2b(pa[1]),
               f2b(pr[0]), f2b(pr[1]), f2b(pr[2]),
               f2b(dr[0]), f2b(dr[1]),
               f2b(kp[0]), f2b(kp[1]),
               f2b(kd[0]), f2b(kd[1]), f2b(kd[2]),
               f2b(ip.mController[0].Up), f2b(ip.mController[1].Up), f2b(ip.mController[2].Up),
               f2b(ip.mController[0].Ud), f2b(ip.mController[1].Ud), f2b(ip.mController[2].Ud),
               f2b(ip.mController[0].fy), f2b(ip.mController[1].fy), f2b(ip.mController[2].fy),
               f2b(ip.u[0]), f2b(ip.u[1]), f2b(ip.u[2]));
    }
    return 0;
}
