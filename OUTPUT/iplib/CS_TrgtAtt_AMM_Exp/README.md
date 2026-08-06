# CS_TrgtAtt_AMM_Exp 验证结果

本目录包含 `INPUT/iplib/CS_TrgtAtt_AMM_Exp/source/IP_CS_TrgtAtt_AMM_Exp.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
这是 iplib 批次三角依赖题目中的第一题，也是 **musl sin/cos 移植方案
（`FloatTest/ref/ported_trig.c` + `FloatTest/lib/FloatTrig.v`）的首次实战
应用**；移植本身的独立自测见 `FloatTest/tools/trig_selftest/`。

## 功能

`CS_TrgtAtt_AMM_ExpFun` 点对点机动期望轨迹（全部浮点输入为 float64）：

```c
csMnvTrgtHook.Track_Plan_hook();        // 应用层钩子（见备注 1）
if (F_Init_tm3 == 1) {                  // 相对机动时刻转绝对星时
    F_Init_tm3 = 0;
    tm1 = tm1p + tm_xin;  tm2 = tm2p + tm_xin;  tm3 = tm3p + tm_xin;
    tMnv = tm3;
}
tmpF   = Chi_Ref / 2.0;
tmpSin = Sinx(tmpF);                    // std_basal.h 宏 → sin/cos（见备注 2）
qrb0[0..2] = e_xyz[0..2] * tmpSin;
qrb0[3]    = Cosx(tmpF);
wrb0[0..2] = e_xyz[0..2] * dChi_Ref;
```

语义构成：一次 fp64 除 2.0（精确）、6 次 fp64 乘法、分支内 3 次 fp64
加法，外加 `sin(tmpF)`、`cos(tmpF)` 各一次；`F_Init==0` 时 tm1/tm2/tm3/
tMnv 原值透传（spec 建模为输入初值）。

## 目录结构

```
OUTPUT/iplib/CS_TrgtAtt_AMM_Exp/
├── source/
│   ├── CS_TrgtAtt_AMM_Exp_main.c          # 参考驱动（gcc 编译原始 C）
│   ├── CS_TrgtAtt_AMM_Exp_cflags.txt      # -fno-builtin-sin/-cos + -include decls.h
│   ├── CS_TrgtAtt_AMM_Exp_extra_srcs.txt  # 追加源文件：FloatTest/ref/ported_trig.c
│   └── CS_TrgtAtt_AMM_Exp_decls.h         # csMnvTrgtHook 最小桩类型（见备注 1）
├── rocq/
│   ├── spec.v                             # Coq spec：1 整数 + 13 fp64 → 11 个输出 bits
│   └── tests.v                            # 1049 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                        # 1049 条输入/输出标准答案
    └── final_checklist.md                 # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_TrgtAtt_AMM_Exp 1000
# 输出 PASS: CS_TrgtAtt_AMM_Exp (1000 vectors)
```

（`run_tests.sh` 已支持 `*_extra_srcs.txt`：每行一个仓库相对路径的额外
源文件；本题用它把 `ported_trig.c` 链进参考程序。）

## 验证结论

- **1049/1049 条向量逐位一致**（49 定向 + 1000 随机；每条向量是一条
  `vm_compute; reflexivity` 判定的精确 Coq 定理）。
- 路径覆盖：`F_Init==0` 530、`F_Init==1` 519；`tmpF=chi/2` 覆盖
  kernel（<π/4）143、small-rem（π/4..2π）906，定向网格命中
  ±(0..8)·π/4 全部 small-rem 分支与 π/2、3π/2、2π 的 goto-medium
  相消点及其 ±1ulp 邻域（详见 reports/final_checklist.md）。
- 阴性自检：故意改错 t_0500 的期望 qrb0[0] 最低位，coqc 正确报错；
  恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

1. **Track_Plan_hook 是空操作桩**：`csMnvTrgtHook` 的类型不在本 case
   任何头文件内（应用层装配代码，全仓库无定义）。真实系统里该钩子
   执行 5.3.1.4 轨迹规划算法并产出 Chi_Ref/dChi_Ref；差分测试把这两
   个量作为直接输入，钩子体置空操作（驱动里 `hook_calls` 计数确认
   每次调用都触发）。桩类型由 `-include` 的 `*_decls.h` 注入。
2. **sin/cos 是 musl 确定化移植，不是平台 libm**：参考程序链接
   `FloatTest/ref/ported_trig.c`（链接顺序先于 `-lm`，shadow 同名符号；
   全部 TU 加 `-fno-builtin-sin -fno-builtin-cos`），Coq spec 用
   `FloatTest/lib/FloatTrig.v` 的同算法复刻，两侧逐比特一致由构造保证。
   移植输入域为 |x| < 2²⁰·(π/2)（small+medium 约减，无 Payne-Hanek）；
   本题 `tmpF ∈ [-2π, 2π]`，远在域内。移植与平台 libm 的末位 ulp 可能
   不同（IEEE 不强制三角正确舍入），因此**测试真值是“原始 IP + musl
   移植三角”**，README 的复现命令固定使用同一移植，结论可复现。
3. 函数不读取的字段（`fun` 指针、`F_Init_tm3` 清零回写）不进 spec；
   `F_Init_tm3` 的 0/1 两值在向量中交替覆盖。
4. 全部输入为有限值（三角/乘加路径不造 NaN）：C 的 NaN payload 传播
   与 Flocq 规范 NaN bits 不同，这是全 FloatTest 的统一纪律。
5. iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
