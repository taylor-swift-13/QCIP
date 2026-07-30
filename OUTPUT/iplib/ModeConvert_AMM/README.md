# ModeConvert_AMM 验证结果

本目录包含 `INPUT/iplib/ModeConvert_AMM/source/IP_ModeConvert_AMM.c` 的
Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。

## 功能

`ModeConvert_AMMFun` 模式切换判断，**三个顺序执行的 if**（非 else-if，
后者覆盖前者）：

```c
if ((m_starTime - csOrb19_Para_I_t0) >= csModePara_dt_OrbitInject)
    m_WorkMode = 0x01u;
if ((m_starTime > tm3 + LmtT_ModeSwitch_AMM) && (csMnvData_F_MnvNextMode == 2))
    m_WorkMode = 0x05u;
if ((m_starTime > tm3 + LmtT_ModeSwitch_AMM) && (csMnvData_F_MnvNextMode == 1))
    m_WorkMode = 0x02u;
```

后两个 if 时间条件相同、标志互斥（`==2` 与 `==1` 不同时成立），故最终
结果：时间到且 F==2 → 5；时间到且 F==1 → 2；否则保留第一个 if 的结果
（1 或原值）。全部浮点为 float64；目标模式是 C 字面量，无需宏替身。

## 目录结构

```
OUTPUT/iplib/ModeConvert_AMM/
├── source/
│   └── ModeConvert_AMM_main.c       # 参考驱动（gcc 编译原始 C）
├── rocq/
│   ├── spec.v                       # Coq spec：5 个 fp64 + F + workMode → workMode'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 覆盖统计与阴性自检记录
```

## 复现步骤

```bash
bash FloatTest/tools/run_tests.sh ModeConvert_AMM 1000
# 输出 PASS: ModeConvert_AMM (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**。
- 路径覆盖：结果为 1 的有 312、为 2 的 140、为 5 的 267、保持原值 305；
  定向各 125：恰等触发（`>=`）、F=2 得 5、F=1 得 2、**先 1 后 5 的顺序
  覆盖**、时间未到不触发、NaN 不触发、F=3 只有第一个 if。
- 阴性自检：故意改错 t_0001 的期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- mode 4 专门验证顺序覆盖语义：第一个 if 先把 workMode 置 1，随后
  第二个 if 覆盖为 5——这是"顺序 if 而非 else-if"的直接证据。
