# ModeConvert_NWM 验证结果

本目录包含 `INPUT/iplib/ModeConvert_NWM/source/IP_ModeConvert_NWM.c` 活跃
部分（前 21 行）的 Coq 差分测试产物（路线 B，方案与边界声明见
`FloatTest/README.md`）。文件后 ~190 行是被注释的旧版本，不参与编译、
不在被测范围。

## 功能

`ModeConvert_NWMFun` 正常模式下的模式切换判断，两个**顺序执行**的 if：

```c
/* a.轨控不调姿：开区间时间窗 */
if ((m_starTime > csOrbitCtrlData_tpi_OC) &&
    (m_starTime < csOrbitCtrlData_tpi_OC + csOrbitCtrlPara_LmtT_Ahead_OCM))
    m_WorkMode = WKMD_OCM;

/* c.姿态机动 */
if ((m_starTime > csMnvData_tm_xin) && (csMnvData_F_MnvNextMode == 2))
    m_WorkMode = WKMD_AMM;
```

后者覆盖前者（两条件同真时最终为 WKMD_AMM）。注意第一个是**开区间**：
`starTime` 恰等于 `tpi` 或 `tpi + ahead` 都不触发；`ahead <= 0` 时窗口
为空、永不触发。全部浮点为 float64。

## 目录结构

```
OUTPUT/iplib/ModeConvert_NWM/
├── source/
│   ├── ModeConvert_NWM_main.c       # 参考驱动（gcc 编译原始 C）
│   └── ModeConvert_NWM_cflags.txt   # -DWKMD_OCM=0x33 -DWKMD_AMM=0x44（替身值）
├── rocq/
│   ├── spec.v                       # Coq spec：4 个 fp64 + F + workMode → workMode'
│   └── tests.v                      # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                  # 1000 条输入/输出标准答案
    └── final_checklist.md           # 覆盖统计与阴性自检记录
```

## 复现步骤

```bash
bash FloatTest/tools/run_tests.sh ModeConvert_NWM 1000
# 输出 PASS: ModeConvert_NWM (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**。
- 路径覆盖：转 OCM 130、转 AMM 271、保持原值 622；定向各 125：
  窗口内触发、左端恰等不触发、右端恰等不触发、**先 OCM 后 AMM 的顺序
  覆盖**、仅 AMM、NaN 不触发、空窗口（`ahead < 0`）不触发。
- 阴性自检：故意改错 t_0001 的期望 workMode，coqc 正确报错。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- `WKMD_OCM` / `WKMD_AMM` 为替身值 0x33 / 0x44（仓库源中无定义），
  cflags 与 spec 一致；拿到真实值后需同步替换。
