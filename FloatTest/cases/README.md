# FloatTest cases

`INPUT/cfg_target` 下的 12 道题与本目录一一对应。每道题都包含实际
Rocq `spec.v`、由 C reference bits 生成的 `tests.v`、正例和一个故意改错
期望值的负例，以及绑定输入与生成链的 `spec_snapshot.json`。

| 输入题目 | Rocq case | 正例 | 负例 | 覆盖边界 |
|---|---|---:|---:|---|
| `CS_AttCtrl_Propel` | [CS_AttCtrl_Propel](CS_AttCtrl_Propel/) | 60 | 1 | `CS_ThrParamCfgX` 完整函数 |
| `CS_Ctrl_Att_Rate` | [CS_Ctrl_Att_Rate](CS_Ctrl_Att_Rate/) | 35 | 1 | 顶层 `FS_ModeProc=2` 复制路径 |
| `CS_GyroData_Disposal` | [CS_GyroData_Disposal](CS_GyroData_Disposal/) | 36 | 1 | 顶层历史回退路径 |
| `CS_Gyro_Att_Predict` | [CS_Gyro_Att_Predict](CS_Gyro_Att_Predict/) | 36 | 1 | 顶层非法序列回退路径，依赖桩隔离 |
| `CS_IRES_Attitude` | [CS_IRES_Attitude](CS_IRES_Attitude/) | 30 | 1 | 顶层无传感器路径 |
| `CS_OrbitComputation` | [CS_OrbitComputation](CS_OrbitComputation/) | 30 | 1 | 顶层控制逻辑，轨道/太阳算法桩隔离 |
| `CS_PrecessionNutationCal` | [CS_PrecessionNutationCal](CS_PrecessionNutationCal/) | 36 | 1 | 顶层非法 `qJD` 回退路径 |
| `CS_Track_Atti` | [CS_Track_Atti](CS_Track_Atti/) | 36 | 1 | 顶层零转换、单位惯量路径 |
| `CS_TrgtAtt_EIM` | [CS_TrgtAtt_EIM](CS_TrgtAtt_EIM/) | 36 | 1 | 顶层零目标、单位矩阵路径 |
| `CS_TrgtAtt_NWM_USU` | [CS_TrgtAtt_NWM_USU](CS_TrgtAtt_NWM_USU/) | 36 | 1 | 顶层零漂移、单位矩阵路径 |
| `ModeConvert_EIM` | [ModeConvert_EIM](ModeConvert_EIM/) | 30 | 1 | 目标函数完整 spec |
| `ModeConvert_SBM` | [ModeConvert_SBM](ModeConvert_SBM/) | 30 | 1 | 目标函数完整 spec |

合计：431 条正例、12 条负例。统一复现：

```bash
bash FloatTest/tools/run_all_cfg_target_coq_specs.sh
```

聚合 Rocq 编译入口为 `CfgTarget_all_tests.v`。这里的“通过”只指 Rocq 对
`spec.v` 求值后与当前 C reference 输出逐位一致；路径型 case 的 README
明确列出 dependency stub 和未覆盖路径，不把采样测试表述为全称证明。

本目录原有的 `PseudoRate` 和 `ThreeAxisController` 属于
`INPUT/SAMCodeSynthesis`，不计入上述 12 道 `cfg_target` 题。
