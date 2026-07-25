# SAMSubModePitch 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/SAMSubModePitch/IP_SAMSubModePitch.c`
的 Coq 差分测试产物。浮点 IP 不走 QCP 全链路（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`SAMSubModePitchFun` SAM 俯仰搜索方式的模式逻辑，与 SAMSubModeRoll 同构，
差别：太阳角判断取绝对值（`Fabsx(piyaw) > 1.0f`），超时阈值 5625（720s），
超时目标是 `SAM_ROLL(0x22)`：

1. `m_workMode = *m_curMode`；`m_countMode++`（unint32，模 2^32 回绕）。
2. 若 `*flgSP == TRUE(1)` 且 `Fabsx(*piyaw) > 1.0f`：`m_countPublic++`；
   若自增后的值 `> 12`：转 `SAM_CRUISE(0x33)`、清双计数器（**outUp 不动**）；
   否则清 `outUp[0..2] = 0.0f`。`Fabsx <= 1.0f` 时什么都不做。
3. 若 `*flgSP != TRUE`：`m_countPublic = 0`。
4. 最后若 `m_countMode > 5625`（用可能被巡航分支重置后的值）：
   转 `SAM_ROLL(0x22)`、清双计数器。

`Fabsx`（`std_basal.h` 宏）：`fabs((float64)x)`——对 float32 输入即"清符号位"
（double 转换与 double fabs 均精确），与 1.0 的 double 比较等价于 fp32 比较。

## 目录结构

```
OUTPUT/SAMCodeSynthesis/SAMSubModePitch/
├── source/
│   └── SAMSubModePitch_main.c       # 参考驱动（gcc 编译原始 C，打印输入/输出）
├── rocq/
│   ├── spec.v                       # Coq spec：piyaw + 4 个 unint32 + outUp[3] → 模式字/计数器/outUp
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh SAMSubModePitch 1000
# 输出 PASS: SAMSubModePitch (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条向量是一条 `vm_compute; reflexivity`
  判定的精确 Coq 定理）。
- 路径覆盖（1000 条）：转巡航 175、超时转滚动 188、模式字透传 663、
  清 outUp 250、countMode/countPublic 回绕各 77、NaN/-Inf/负边界
  各约 77（详见 reports/final_checklist.md）。
- 阴性自检：故意改错一个期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- 计数器按 unint32 真实语义建模（spec 的 `u32_inc` 自增模 2^32），
  回绕边界直接进向量验证（mode 10/11）。
- `Fabsx` 在 spec 中按位清符号实现（`Z.land bits 0x7FFFFFFF`），
  与 C 的 `fabs((double)x)` 逐位一致，包括 `-0.0 → +0.0`、NaN 清符号；
  mode 12 定向验证负边界 `piyaw = -1.0f`（`|x| = 1` 不触发）。
- 分支顺序与 Roll 相同的两处敏感点：`> 12` 比较自增后的值；超时判断
  用可能被巡航分支重置后的 `m_countMode`（mode 7 验证"巡航重置优先"）。
- 转巡航分支不清 outUp（只有"继续计数"分支才清）。
