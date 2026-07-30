# ModeConvert_SBM 验证结果

本目录包含 `INPUT/iplib/ModeConvert_SBM/source/IP_ModeConvert_SBM.c` 的
Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
这是 iplib 批次的第一题。

## 功能

`ModeConvert_SBMFun` 模式切换判断（全部输入为 float64）：

```c
if ((m_starTime - csOrb19_Para_I_t0) >= csModePara_dt_OrbitInject)
    m_WorkMode = WKMD_EIM;
// 否则 m_WorkMode 不变
```

即：当前时刻超过入轨参考时刻达到门限时，转入 EIM 模式。语义只有一处
fp64 减法（IEEE 双精度最近舍入）和一次 fp64 `>=` 比较（NaN 为 false）。

## 目录结构

```
OUTPUT/iplib/ModeConvert_SBM/
├── source/
│   ├── ModeConvert_SBM_main.c       # 参考驱动（gcc 编译原始 C）
│   └── ModeConvert_SBM_cflags.txt   # 额外编译参数：-DWKMD_EIM=0x11（见备注）
├── rocq/
│   ├── spec.v                       # Coq spec：3 个 fp64 + workMode → workMode'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh ModeConvert_SBM 1000
# 输出 PASS: ModeConvert_SBM (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条向量是一条 `vm_compute; reflexivity`
  判定的精确 Coq 定理）。
- 路径覆盖：触发置 WKMD_EIM 442、保持原值 568；定向各 125：
  `diff == dt` 恰等边界、starTime/t0/dt 分别 NaN、starTime +Inf、
  减法溢出为 +Inf（DBL_MAX - (-DBL_MAX)）（详见 reports/final_checklist.md）。
- 阴性自检：故意改错一个期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- **WKMD_EIM 是替身值**：原项目全局模式常量在本仓库源中无定义（iplib
  头文件未包含），驱动以 `-DWKMD_EIM=0x11` 注入，spec 取同一值 17
  （`WKMD_EIM_Z`）。常量具体取值不影响被测关系（条件为真则置该常量），
  但若后续拿到真实值，应同步替换 cflags 与 spec。
- 本题为 iplib 批次补了一次性基础：`FloatTestCommon.v` 新增 fp64
  helper（`f64`、`c_ge64` 等，与 fp32 版同构，`Bcompare 53 1024`）；
  `run_tests.sh` 支持 `INPUT/iplib/<case>/source` 源码布局与
  per-case `*_cflags.txt` 额外编译参数。
- iplib 头文件为 GBK 编码（本 case 源码注释含乱码字节属原始文件如此）。
