# ModeConvert_AHM 验证结果

本目录包含 `INPUT/iplib/ModeConvert_AHM/source/IP_ModeConvert_AHM.c` 活跃
部分的 Coq 差分测试产物（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`ModeConvert_AHMFun` 模式切换判断（文件头部的旧实现整段被注释，不参与
编译、不在被测范围）：

```c
if (ModeObject_Timer_Mode[m_WorkMode] > LmtT_AHM)
    m_WorkMode = 0x04u;   // 转入机动模式（C 字面量，非宏）
// 否则 m_WorkMode 不变
```

与 ModeConvert_EIM 同构：float64[14] 数组以模式字为下标读取，一次
fp64 严格 `>` 比较。目标模式是字面量 `0x04`，无需宏替身。
结构体里的 `m_starTime` / `csOrb19_Para_I_t0` / `csModePara_dt_OrbitInject`
字段属于被注释的旧实现，活跃代码不读（驱动任意初始化、不打印）。

## 目录结构

```
OUTPUT/iplib/ModeConvert_AHM/
├── source/
│   └── ModeConvert_AHM_main.c       # 参考驱动（gcc 编译原始 C）
├── rocq/
│   ├── spec.v                       # Coq spec：14 路 fp64 + 阈值 + workMode → workMode'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 覆盖统计与阴性自检记录
```

## 复现步骤

```bash
bash FloatTest/tools/run_tests.sh ModeConvert_AHM 1000
# 输出 PASS: ModeConvert_AHM (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**。
- 路径覆盖：触发 444、保持 586；下标 0..13 全覆盖；定向各 125：
  恰等不触发（两组）、元素 NaN、阈值 NaN、+Inf 触发、顶下标触发。
- 阴性自检：故意改错 t_0001 的期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- 下标越界（`m_WorkMode >= 14`）是 UB，不在被测范围；驱动保证界内，
  spec 对越界输入按"保持不变"定义。
