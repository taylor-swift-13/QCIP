# ModeConvert_OCM 验证结果

本目录包含 `INPUT/iplib/ModeConvert_OCM/source/IP_ModeConvert_OCM.c` 的
Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。

## 功能

`ModeConvert_OCMFun` 模式切换判断（全部输入为 float64）：

```c
if (m_starTime > (csOrbitCtrlData_tpi_OC + csJPCData_dtp_OCAdj))
    m_WorkMode = WKMD_NWM;
// 否则 m_WorkMode 不变
```

一处 fp64 加法（最近舍入）+ 一次 fp64 严格 `>` 比较（恰等**不**触发，
NaN 为 false）。

## 目录结构

```
OUTPUT/iplib/ModeConvert_OCM/
├── source/
│   ├── ModeConvert_OCM_main.c       # 参考驱动（gcc 编译原始 C）
│   └── ModeConvert_OCM_cflags.txt   # -DWKMD_NWM=0x22（替身值，见备注）
├── rocq/
│   ├── spec.v                       # Coq spec：3 个 fp64 + workMode → workMode'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 覆盖统计与阴性自检记录
```

## 复现步骤

```bash
bash FloatTest/tools/run_tests.sh ModeConvert_OCM 1000
# 输出 PASS: ModeConvert_OCM (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**。
- 路径覆盖：触发置 WKMD_NWM 322、保持原值 694（含原值即目标值的 16 条
  交集）；定向各 125：恰等边界（不触发）、三个输入分别 NaN、+Inf 触发、
  全零不触发。
- 阴性自检：故意改错 t_0001 的期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- `WKMD_NWM` 为替身值（仓库源中无定义）：驱动 `-DWKMD_NWM=0x22` 注入，
  spec 取同一值 34（`WKMD_NWM_Z`）。拿到真实值后需同步替换。
