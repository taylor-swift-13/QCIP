# orbiter-new FloatTest 交付

`INPUT/orbiter-new` 的 35 个目录现已全部建立 FloatTest 交付，目录覆盖率为 35/35。每个 case 使用固定种子 `0x9E3779B97F4A7C15` 生成 1000 条向量，共 35000 条正例定理和 35 条故意改错期望值的 negative control；所有 `tests.v` 均通过固定 `coq_tooling.py check`。

每个 case 都包含 `source/`、`rocq/`、`reports/` 和中文 README。`reports/vector_freshness.json` 记录从全新临时可执行文件重放后与归档向量逐字节一致，`reports/timing_summary.json` 记录编译、向量生成和固定 Coq 检查耗时，集合审计见 `coverage_inventory.json`。

## 复现

单个 case：

```bash
bash FloatTest/tools/run_tests.sh <case> 1000 0x9E3779B97F4A7C15
```

全量向量新鲜度与工件审计：

```bash
python3 FloatTest/tools/record_vector_freshness.py --collection orbiter-new
python3 .agents/skills/floattest-iplib-testing/scripts/audit_iplib.py \
  --collection orbiter-new --all-cases --require-evidence
```

## 边界

34 个 case 直接包含并编译原始目标 C；`AttDeterWalkMode` 因输入快照是含大量无关函数且缺失声明的扁平 translation unit，机械提取原文件 3873--3933 行的完整目标函数。快照缺失的外部组件使用确定性重建或可观察桩时，调用次数、派发、参数或指针身份进入比较输出；每个 case README 分别声明受限输入域、桩和未覆盖分支。

这些结果证明 35000 个具体样本上的 C/Rocq 位级一致性，不是对任意输入、硬件副作用或被桩替代组件的全称证明。

## Case 清单

AttDeterStsGyro、AttDeterWalk、AttDeterWalkMode、AttProcWalk、AttiCtrlCmd、AttiErrCalc、AutoPackBit、AutoPackByte、AutuPackDataflow、AvoidanceCalc、Avv、BinarySearch_New、CDUToSMUAlign、CMICalculate、CalRelativeDistSpeed、CcuUartComm、CcuUartDataProc、CduModuleInfoGet、CduModulePowerDutyGet、CduToSmuFrameDataPack、CduToSmuFramePack、CentroidAndInertiaEst、Chebyshev、ClearIntFromDsp、CoastingDynamic、CoastingTrajectory、ConstDiagSignInt、CoorConvert、CruDataFill1553B、CruDataFillTr32、CruDataFlyUnpackQ、CruDataReadFromTr32、CruInit、CruPack、CruPackFlyToWalk。
