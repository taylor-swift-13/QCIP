# ModeConvert_EIM 验证结果

本目录包含 `INPUT/iplib/ModeConvert_EIM/source/IP_ModeConvert_EIM.c` 的
Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。

## 功能

`ModeConvert_EIMFun` 模式切换判断：

```c
if (ModeObject_Timer_Mode[m_WorkMode] > csModePara_dt_END_EIM)
    m_WorkMode = WKMD_NWM;
// 否则 m_WorkMode 不变
```

`ModeObject_Timer_Mode` 是 float64[14]，以当前模式字 `m_WorkMode`
（unint32）为下标读取；一次 fp64 严格 `>` 比较（恰等不触发，NaN 为
false）。

## 目录结构

```
OUTPUT/iplib/ModeConvert_EIM/
├── source/
│   ├── ModeConvert_EIM_main.c       # 参考驱动（gcc 编译原始 C）
│   └── ModeConvert_EIM_cflags.txt   # -DWKMD_NWM=0x22（替身值，见备注）
├── rocq/
│   ├── spec.v                       # Coq spec：14 路 fp64 + 阈值 + workMode → workMode'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 覆盖统计与阴性自检记录
```

## 复现步骤

```bash
bash FloatTest/tools/run_tests.sh ModeConvert_EIM 1000
# 输出 PASS: ModeConvert_EIM (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**。
- 路径覆盖：触发 430、保持 570；下标 0..13 全覆盖；定向各 125：
  恰等不触发（下标 0 与 13 两组）、元素 NaN、阈值 NaN、+Inf 触发、
  顶下标触发。
- 阴性自检：故意改错 t_0001 的期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- **下标越界是 UB**：`m_WorkMode >= 14` 时 C 越界读。驱动保证
  `m_WorkMode ∈ [0,13]`；spec 对越界输入按"保持不变"定义（不建模 UB），
  README 特此声明。
- `WKMD_NWM` 为替身值 0x22（cflags 与 spec 一致，详见
  ModeConvert_SBM 的备注惯例）。
