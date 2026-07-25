# SAMSubModeDamp 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/SAMSubModeDamp/IP_SAMSubModeDamp.c`
的 Coq 差分测试产物。浮点 IP 不走 QCP 全链路（路线 B，方案与边界声明见
`FloatTest/README.md`）。

## 功能

`SAMSubModeDampFun` SAM 速率阻尼方式的模式逻辑：

1. `m_workMode = *m_curMode`；`m_countMode++`（unint32，模 2^32 回绕）。
2. `fabsmax = TripleFabsMaxF(pRate[0], pRate[1], pRate[2])`（三轴角速度
   绝对值的最大值，`std_utils.c`）；若 `fabsmax < 0.15f` 则
   `m_countPublic++`。
3. 若 `m_countPublic > time_D2P` 或 `m_countMode > time_D2P_overtime`
   （两个阈值都是结构体输入参数）：转 `SAM_PITCH(0x11)`、清双计数器。

`TripleFabsMaxF` 是手工 abs + 两次 max 比较，其 **NaN 行为**：含 NaN 的
比较全为 false，NaN 会被 else 支"丢弃"——单个 NaN 输入不影响其余两轴的
结果；只有三个输入全是 NaN 时结果才是 NaN（此时 `< 0.15f` 为 false，
计数器不自增）。spec 用同一比较结构逐项复刻。

## 目录结构

```
OUTPUT/SAMCodeSynthesis/SAMSubModeDamp/
├── source/
│   └── SAMSubModeDamp_main.c        # 参考驱动（gcc 编译原始 C + std_utils.c）
├── rocq/
│   ├── spec.v                       # Coq spec：pRate[3] + 5 个 unint32 → 模式字/双计数器
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh SAMSubModeDamp 1000
# 输出 PASS: SAMSubModeDamp (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条向量是一条 `vm_compute; reflexivity`
  判定的精确 Coq 定理）。
- 路径覆盖（1000 条）：转俯仰 483、模式字透传 526、计数器自增（未转移）
  92、`0.15f` 恰阈值/回绕/单 NaN/全 NaN 定向各 77
  （详见 reports/final_checklist.md）。
- 阴性自检：故意改错一个期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- 计数器按 unint32 真实语义建模（spec 的 `u32_inc` 自增模 2^32），
  回绕边界直接进向量验证（mode 10/11）。
- 转移条件用的是**自增后**的 `m_countPublic` / `m_countMode`
  （mode 4/6 验证"自增后越线即转"，mode 5/7 验证"恰好相等不转"）；
  mode 12 验证"转移前已越线"与自增无关的路径。
- 两个转移条件（稳定计数越线 / 超时）或的关系、且转移后两个计数器
  同时清零，由同一分支处理，spec 结构与之一致。
