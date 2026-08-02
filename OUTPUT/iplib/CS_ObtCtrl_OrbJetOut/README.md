# CS_ObtCtrl_OrbJetOut 验证结果

本目录包含 `INPUT/iplib/CS_ObtCtrl_OrbJetOut/source/IP_CS_ObtCtrl_OrbJetOut.c`
的 Coq 差分测试产物（路线 B，方案与边界声明见 `FloatTest/README.md`）。
这是 iplib 批次 CS 系列的第一题。

## 功能

`CS_ObtCtrl_OrbJetOutFun` 轨控脉宽分配（全部浮点输入为 float64）：

```c
if (m_starTime >= csOrbitCtrlData_tpi_OC)        // 到达轨控开机时刻
    for (i = 0; i < NUM_THRGR_OC; i++)           // = 4（见备注）
        CS_Jet_ObtOut_t_OC[i] = CS_Jet_ObtOut_FS_OC[i] * m_DeltaT;
else
    csOrbitCtrlData_dto_OC = 0.0;                // 本周期脉宽清零
```

源文件下半部分是大段注释掉的旧版本，不参与测试。语义只有一处 fp64
`>=` 比较（NaN 为 false）和 4 次 fp64 乘法（IEEE 双精度最近舍入）；
`dto` / `t_OC` 在未被执行的分支下原值透传（spec 把它们建模为输入）。

## 目录结构

```
OUTPUT/iplib/CS_ObtCtrl_OrbJetOut/
├── source/
│   ├── CS_ObtCtrl_OrbJetOut_main.c       # 参考驱动（gcc 编译原始 C）
│   └── CS_ObtCtrl_OrbJetOut_cflags.txt   # 额外编译参数：-DNUM_THRGR_OC=4（见备注）
├── rocq/
│   ├── spec.v                            # Coq spec：4 标量 + 2×4 数组 fp64 → (tOut[4], dto')
│   └── tests.v                           # 1000 条 vm_compute 差分定理（工具生成，请勿手改）
└── reports/
    ├── vectors.txt                       # 1000 条输入/输出标准答案
    └── final_checklist.md                # 路径覆盖统计与阴性自检记录
```

## 复现步骤

在仓库根目录下执行：

```bash
bash FloatTest/tools/run_tests.sh CS_ObtCtrl_OrbJetOut 1000
# 输出 PASS: CS_ObtCtrl_OrbJetOut (1000 vectors)
```

## 验证结论

- **1000/1000 条向量逐位一致**（每条向量是一条 `vm_compute; reflexivity`
  判定的精确 Coq 定理）。
- 路径覆盖：if（分配脉宽）568、else（脉宽清零）432；定向各 125：
  `starTime == tpi` 恰等边界、else 分支 NaN/±Inf 透传、starTime/tpi
  分别 NaN（比较为 false）、乘法符号边界（`+0/-0/±Inf × 2.0`、
  `有限 × ±0 = ±0`、负 deltaT）（详见 reports/final_checklist.md）。
- 阴性自检：故意改错 t_0007 的期望 dto'，coqc 正确报错；恢复后重新通过。
- 边界声明：这是采样验证，不是全称证明；不覆盖内存安全。

## 备注

- **NUM_THRGR_OC 是替身值**：原项目宏在本仓库源中无定义（结构体数组
  为定长 `[4]`），驱动以 `-DNUM_THRGR_OC=4` 注入，spec 按定长 4 列表
  建模。若后续拿到真实值且不为 4，需同步改 cflags、spec 与发射器列数。
- **NaN 定向只走比较/透传路径**：C 的 NaN payload 经乘法传播后与 Flocq
  规范 NaN 的 bits 不同，因此乘法路径的定向用例只用有限值或
  `±Inf×正常数`、`有限×±0` 这类 IEEE 精确组合；透传路径是逐位拷贝，
  NaN/Inf 任意携带。
- 函数不读取的字段（`dremain_OC`、`sumDtp`、`dGap_OC`、`m_WorkMode`）
  不进 spec，参考侧置 0 不打印。
- iplib 头文件为 GBK 编码（阅读用 `iconv -f GBK -t UTF-8`）。
