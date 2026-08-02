/* FloatTest 参考程序：CS_GyroData_Disposal
 * 直接编译运行原始 IP_CS_GyroData_Disposal.c。
 *
 * 本 case 的两个外部依赖处理（详见 README 备注）：
 *   - m_DeltaT：std_utils.h 声明的全局控制周期，本文件定义并每向量赋值；
 *   - MatrixTran / MatrixMulti / MatrixInv33 / LimitDouble：仓库无实现，
 *     下方按 SAM 批次 std_utils.c 的 fp32 同名函数算法重建为 fp64
 *     （原型由 -include 的 *_decls.h 注入，见 *_cflags.txt）。
 *
 * 用法: CS_GyroData_Disposal_main.exe [n=1000] [seed]
 * 输出: 每行 80 列：
 *   输入(70): noUseGroup fsAttD workMode | fpModeStopCtrl[14] | fuIng[9]
 *            | dgm[9](bits64) | vbs[27](bits64,行主序)
 *            | lstIn[3] wbiIn[3](bits64) | deltaT mlfw(bits64)
 *   输出(10): F_StopCtrl | deltag[3] wbi[3] deltag_Lst'[3](bits64)
 *
 * 定向设计：NaN/±Inf 只走历史值透传分支（mode 2）；矩阵与除法路径只用
 * 有限值（MatrixInv33 奇异回退用 det=0 的构造触发，不产生 0/0）。
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "IP_CS_GyroData_Disposal.h"

/* ---- 组件库 fp64 重建（算法与 SAM std_utils.c 的 fp32 版逐式对应） ---- */

float64 m_DeltaT;   /* std_utils.h: extern float64 m_DeltaT */

void MatrixTran(float64* tran, const float64* mat, unint08 nrow, unint08 ncol)
{
    unint08 i;
    unint08 j;
    for (i = 0; i < nrow; i++)
    {
        for (j = 0; j < ncol; j++)
        {
            *(tran + j * nrow + i) = *(mat + i * ncol + j);
        }
    }
    return;
}

void MatrixMulti(float64* product, const float64* faciend, const float64* multiplier,
                 unint08 nrow, unint08 nrc, unint08 ncol)
{
    unint08 ir;
    unint08 jc;
    unint08 nk;
    unint08 index;
    for (ir = 0; ir < nrow; ir++)
    {
        for (jc = 0; jc < ncol; jc++)
        {
            index = ir * ncol + jc;
            product[index] = 0.0;
            for (nk = 0; nk < nrc; nk++)
            {
                product[index] = product[index] + faciend[ir * nrc + nk] * multiplier[nk * ncol + jc];
            }
        }
    }
    return;
}

unint32 MatrixInv33(float64* inv, const float64* src)
{
    int i;
    float64 rank;
    unint32 bAbleInv = 0;
    inv[0] = src[4] * src[8] - src[5] * src[7];
    inv[1] = src[2] * src[7] - src[1] * src[8];
    inv[2] = src[1] * src[5] - src[2] * src[4];
    inv[3] = src[5] * src[6] - src[3] * src[8];
    inv[4] = src[0] * src[8] - src[2] * src[6];
    inv[5] = src[2] * src[3] - src[0] * src[5];
    inv[6] = src[3] * src[7] - src[4] * src[6];
    inv[7] = src[1] * src[6] - src[0] * src[7];
    inv[8] = src[0] * src[4] - src[1] * src[3];
    rank = src[0] * inv[0] + src[1] * inv[3] + src[2] * inv[6];
    if ((1.0e-6 < rank) || (rank < -1.0e-6))
    {
        bAbleInv = 1;
        for (i = 0; i < 9; i++)
        {
            inv[i] = inv[i] / rank;
        }
    }
    else
    {
        for (i = 0; i < 9; i++)
        {
            inv[i] = src[i];
        }
    }
    return bAbleInv;
}

float64 LimitDouble(float64 fin, float64 fbound)
{
    float64 fvalue;
    if (fin > fbound)
    {
        fvalue = fbound;
    }
    else if (fin < -fbound)
    {
        fvalue = -fbound;
    }
    else
    {
        fvalue = fin;
    }
    return fvalue;
}

/* ---- 向量生成 ---- */

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

#define NAN64  0x7FF8000000000000ULL
#define PINF64 0x7FF0000000000000ULL
#define NINF64 0xFFF0000000000000ULL
#define NZERO64 0x8000000000000000ULL

/* 从 idx[0..8] 中随机选 nv 个置 1 写入 fu，其余置 0；返回选中的下标 */
static void pick_valid(unint32 *fu, int nv, int *picked) {
    int idx[9];
    int i, j, t;
    for (i = 0; i < 9; i++) { idx[i] = i; fu[i] = 0; }
    for (i = 0; i < nv; i++) {                 /* 部分 Fisher-Yates */
        j = i + (int)(rnd() % (uint64_t)(9 - i));
        t = idx[i]; idx[i] = idx[j]; idx[j] = t;
        fu[idx[i]] = 1;
        picked[i] = idx[i];
    }
    /* picked 按下标升序（与 C 的“前 k 个”选择顺序一致，便于定向构造） */
    for (i = 0; i < nv; i++)
        for (j = i + 1; j < nv; j++)
            if (picked[j] < picked[i]) { t = picked[i]; picked[i] = picked[j]; picked[j] = t; }
}

int main(int argc, char **argv) {
    int n = (argc > 1) ? atoi(argv[1]) : 1000;
    s_state = (argc > 2) ? strtoull(argv[2], NULL, 0) : 0x9E3779B97F4A7C15ULL;
    if (s_state == 0) s_state = 0x9E3779B97F4A7C15ULL;

    for (int k = 0; k < n; k++) {
        CS_GyroData_Disposal ip;
        unint32 noUseGroup, fsAttD, wm, fp[14], fu[9];
        double dgm[9], vbs[9][3], lstIn[3], wbiIn[3], deltaT, mlfw;
        int picked[9];
        int mode = k % 8;
        int nvalid = 4;
        int i, j;

        if (mode == 1 || mode == 5) nvalid = 3;
        if (mode == 3) nvalid = 5;

        noUseGroup = 0;
        fsAttD = rand_u32(0, 4);
        wm = rand_u32(0, 13);
        for (i = 0; i < 14; i++) fp[i] = rand_u32(0, 1);
        pick_valid(fu, nvalid, picked);
        for (i = 0; i < 9; i++) {
            dgm[i] = rand_double(-1.0e-3, 1.0e-3);
            for (j = 0; j < 3; j++) vbs[i][j] = rand_double(-1.0, 1.0);
        }
        for (i = 0; i < 3; i++) {
            lstIn[i] = rand_double(-1.0e-2, 1.0e-2);
            wbiIn[i] = rand_double(-1.0e-2, 1.0e-2);
        }
        deltaT = rand_double(0.05, 0.5);
        mlfw = rand_double(0.5, 5.0);

        /* 定向边界与路径覆盖 */
        if (mode == 2) {                       /* 停控历史分支 + 透传特殊值 */
            noUseGroup = 1;
            fsAttD = (unint32)(k & 1);         /* 0/1 交替 */
            fp[wm] = 1;
            lstIn[0] = b2f64(NAN64);
            lstIn[2] = b2f64(NINF64);
            wbiIn[1] = b2f64(PINF64);
        }
        if (mode == 3) {                       /* n=5 历史分支；fu==2 不计数 */
            for (i = 0; i < 9; i++)
                if (fu[i] == 0) { fu[i] = 2; break; }
        }
        if (mode == 4) {                       /* 强限幅：微小 deltaT + 小 mlfw */
            deltaT = 1.0e-9;
            mlfw = 0.01;
        }
        if (mode == 5) {                       /* n=3 且矩阵奇异：前两行相同 → det=0 回退 */
            for (j = 0; j < 3; j++) vbs[picked[1]][j] = vbs[picked[0]][j];
        }
        if (mode == 6) {                       /* ±0 增量与负 deltaT */
            for (i = 0; i < 9; i++) dgm[i] = (i & 1) ? b2f64(NZERO64) : 0.0;
            deltaT = -0.128;
        }
        if (mode == 7) {                       /* noUseGroup=1 但 fsAttD=2 → 不停控 */
            noUseGroup = 1;
            fsAttD = 2;
            wm = 13;
        }
        /* mode 0/1：n=4 / n=3 主路径纯随机 */

        ip.csGyroDiagData_F_NoUseGroup = noUseGroup;
        ip.csAttPara_FS_AttD = fsAttD;
        for (i = 0; i < 14; i++) ip.csGyroDiagPara_FP_ModeStopCtrl[i] = fp[i];
        for (i = 0; i < 9; i++) {
            ip.csGyroDiagData_FU_ing[i] = fu[i];
            ip.csGyroData_deltagm[i] = dgm[i];
            for (j = 0; j < 3; j++) ip.csGyroPara_Vbs[i][j] = vbs[i][j];
        }
        ip.m_WorkMode = wm;
        for (i = 0; i < 3; i++) {
            ip.csGyroData_deltag_Lst[i] = lstIn[i];
            ip.csGyroData_wbi[i] = wbiIn[i];
        }
        ip.csGyroPara_Mlfw = mlfw;
        m_DeltaT = deltaT;

        CS_GyroData_DisposalFun(&ip);

        printf("%u %u %u ", noUseGroup, fsAttD, wm);
        for (i = 0; i < 14; i++) printf("%u ", fp[i]);
        for (i = 0; i < 9; i++) printf("%u ", fu[i]);
        for (i = 0; i < 9; i++) printf("%llu ", (unsigned long long)f2b64(dgm[i]));
        for (i = 0; i < 9; i++)
            for (j = 0; j < 3; j++)
                printf("%llu ", (unsigned long long)f2b64(vbs[i][j]));
        for (i = 0; i < 3; i++) printf("%llu ", (unsigned long long)f2b64(lstIn[i]));
        for (i = 0; i < 3; i++) printf("%llu ", (unsigned long long)f2b64(wbiIn[i]));
        printf("%llu %llu ", (unsigned long long)f2b64(deltaT),
               (unsigned long long)f2b64(mlfw));
        printf("%u ", ip.csModeData_F_StopCtrl);
        for (i = 0; i < 3; i++) printf("%llu ", (unsigned long long)f2b64(ip.csGyroData_deltag[i]));
        for (i = 0; i < 3; i++) printf("%llu ", (unsigned long long)f2b64(ip.csGyroData_wbi[i]));
        for (i = 0; i < 3; i++)
            printf("%llu%s", (unsigned long long)f2b64(ip.csGyroData_deltag_Lst[i]),
                   (i == 2) ? "\n" : " ");
    }
    return 0;
}
