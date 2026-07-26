# cfg_target 浮点测试经验

## 2026-07-25 纠偏：必须测试实际 spec

用户明确要求严格遵循 `FloatTest/cases/PseudoRate` 和
`FloatTest/cases/ThreeAxisController` 的结构。C/Python differential runner
即使有很多 suite，也不能据此声称 Rocq spec 已完成；只有存在实际 `spec.v`，
由当前 C 生成位模式 vectors，再由 `tests.v` 调用 spec 并通过
`vm_compute` 的题目才计为完成。

本轮为 `INPUT/cfg_target` 的 12 个目录分别建立同名 case，合计 431 条正例和
12 条错误期望负例。`FloatTest/cases/CfgTarget_all_tests.v` 通过固定
`coq_tooling.py check` 聚合编译。每个 README 必须明确依赖桩和路径覆盖边界，
不得把路径级有限向量证明写成完整算法的全称证明。

## 本轮约束

用户要求参考 `FloatTest` 继续测试 `/home/yangfp/QCIP/INPUT/cfg_target` 中的浮点题，测试数量控制在几十级别。

## 选择与结果

`cfg_target` 的公共头文件只提供 `std_utils.h` 声明，目录中没有对应的 `std_utils.c`；许多顶层函数还依赖姿态、矩阵和四元数公共实现。直接编译这些顶层函数会把链接缺件与算法错误混在一起。因此本轮选择 `CS_AttCtrl_Propel` 中可独立调用的两个确实涉及 `float64` 的函数：

- `CS_ThrParamCfgX`：60 条确定性输入，独立 Python oracle 覆盖时间阈值和模式分支，全部通过。
- `CS_FindMinMaxPos`：60 条确定性数组输入，覆盖零值、负值、重复最大值和长度变化，全部通过。
- `CS_Track_Atti/w2dEuler_temp1`：48 条确定性输入，覆盖六种旋转序列和多组角度/角速度，全部通过。
- `CS_Track_Atti/full-state-torque`：36 条输入，覆盖姿态角速度差分、惯量矩阵乘法、力矩缩放、力矩范数限幅和历史状态回写，全部通过；使用单位姿态矩阵隔离外部 DCM 反解。
- `CS_GyroData_Disposal/history`：36 条输入，覆盖停控条件与有效数据不足时的历史值回退路径，全部通过。
- `CS_GyroData_Disposal/valid-3sensor`：30 条输入，覆盖三路有效数据、单位标定矩阵路径、deltag 求解和 `wbi` 限幅，全部通过；非单位矩阵求逆仍未覆盖。
- `ModeConvert_EIM`：30 条输入，覆盖模式计时器相对结束阈值的小于、等于和大于边界，全部通过。
- `ModeConvert_SBM`：30 条输入，覆盖注入时刻相对轨道参考时间的浮点差值边界，全部通过。
- `CS_IRES_Attitude/StaticIresConvert`：36 条输入，覆盖静态误差向量补 z、置换标定矩阵、`atan2`/`asin` 补偿和连续误差计数，全部通过。
- `CS_IRES_Attitude/CS_IRES_Modify`：30 条输入，覆盖 IRES 角度偏差限幅、偏航余弦增益修正、陀螺常值/漂移偏置更新和最终限幅，全部通过；测试前修正了循环索引笔误。
- `CS_IRES_Attitude/CS_IRES_ValidCheck_Convert`：30 条输入，覆盖周期触发、有效/无效传感器、静态误差转换、姿态融合、速率滤波和输出限幅，全部通过。
- `CS_AttCtrl_Propel/CS_AttCtrl_Jet12Dis`：30 条输入，覆盖两路喷气分配、剩余时间截断、选择索引切换、轴向加速度和力矩累积，全部通过。
- `CS_OrbitComputation/OrbitCalculate`：24 条输入，覆盖平根数更新、偏心迭代、摄动修正、角速度异常回退、坐标矩阵、位置和速度计算，全部通过；`ModPNHP` 按 cfg_target 的 `float32` 调用边界建模。
- `CS_AttCtrl_Propel/PhasePlaneJetControl`：60 条输入，覆盖 6 个相平面区域及喷气状态/脉冲时间计算，全部通过。
- `CS_OrbitComputation/SunEphemerisCalculate`：40 条输入，覆盖太阳平近点角、太阳方向向量和轨道系向量，全部通过。
- `CS_IRES_Attitude/IRES_DataProcess`：45 条输入，覆盖 0、1、2 个有效传感器、角度融合、误差向量和速率限幅，全部通过。
- `CS_PrecessionNutationCal/invalid-qJD`：36 条输入，覆盖异常四元数分量阈值、单位矩阵回退和错误标志，全部通过；未声称覆盖 `CPNCalc` 天文计算路径。
- `CS_PrecessionNutationCal/CPNCalc`：20 条输入，覆盖岁差矩阵、章动多项式、旋转矩阵转置和最终 CPN 矩阵计算，全部通过；harness 明确实现角秒到弧度转换和标准 3×3 矩阵运算。
- `CS_Ctrl_Att_Rate/CS_Angle2CX_temp2`：35 条输入，覆盖六种角度序列及默认序列分派、标准轴旋转和 DCM 矩阵乘法，全部通过；旋转函数由 harness 独立实现，未把外部姿态库的实现细节冒充为已验证。
- `CS_AttCtrl_Propel/CS_AttCtrl_JetCrossSub`：54 条输入，覆盖浮点乘积阈值、喷嘴优先级和等值竞争分支，全部通过。
- `CS_AttCtrl_Propel/CS_AttCtrl_JetCrossCtrl`：36 条输入，覆盖 XY、XZ、YZ 三种轴对冲突选择及默认不动作分支，全部通过。
- `CS_AttCtrl_Propel/CS_Chose_Switching_Line`：30 条输入，覆盖 R0 与正/负 R11 的角度单位换算、死区阈值、符号处理、喷气标志和时间后处理，全部通过。
- `CS_AttCtrl_Propel/CS_AttCtrl_PropelFun-stop`：30 条输入，覆盖完整停控入口、喷气参数 `DEG2RAD` 换算、模式/相平面调用和喷气时间状态清零，全部通过。
- `CS_AttCtrl_Propel/CS_AttCtrl_JetPulseCalc`：30 条输入，覆盖工作模式选择、地球/偏航捕获条件、卸载条件、切换线浮点换算和相平面结果后处理，全部通过；相平面输出由固定桩提供，断言集中于入口控制与切换线逻辑。
- `CS_AttCtrl_Propel/CS_AttCtrl_PropelFun-normal`：30 条输入，覆盖非停控入口的 `DEG2RAD` 转换、喷气脉冲/交叉/分配调用链和 `t_AC` 回写，全部通过；三个下游控制函数由固定桩隔离，断言集中于顶层浮点转换、分支和状态复制。
- `CS_IRES_Attitude/CS_IRES_AttitudeFun-dispatch`：36 条输入，覆盖无传感器失效回退、EIM 时间门限、`FS_AttD=3/4`、AHM 和太阳模式条件下的顶层调用分支及浮点状态回写，全部通过；IRES 子函数由调用标记桩隔离，未将本项解释为子函数数学实现的重复验证。
- `CS_GyroData_Disposal/valid-4sensor`：30 条输入，覆盖四传感器非单位标定矩阵的最小二乘融合、角速度除法和限幅，全部通过；`MatrixTran`、`MatrixMulti`、`MatrixInv33` 由 harness 独立实现，oracle 使用独立的 `AᵀA` 求解，未把公共矩阵库实现细节冒充为已验证。
- `CS_Ctrl_Att_Rate/non-BMC-path`：35 条输入，覆盖非 BMC 模式下不同 `FS_AttD` 的姿态/速率源选择、`ModPNHP` 单精度角度归一化和速率差分，全部通过；姿态/四元数转换由固定桩隔离，`ModPNHP` 的 binary32 边界由 oracle 显式建模。
- `CS_Ctrl_Att_Rate/antenna-history`：30 条输入，覆盖天线历史速率缓存 `0..20` 长度边界、倒序搬移和当前样本写回，全部通过；本项聚焦浮点历史状态复制与 BMC 回写，姿态/四元数转换由固定桩隔离。
- `CS_AttCtrl_Propel/CS_AttCtrl_PropelFun-FU0`：30 条输入，覆盖 `FU==0` 回退分支、喷气参数 `DEG2RAD` 转换以及相位时间清零，全部通过；三个下游喷气函数由固定桩隔离。
- `CS_Track_Atti/nonzero-C2Angle`：30 条输入，覆盖非零角度转换桩与六种 `w2dEuler` 序列、角加速度和力矩限幅的联动，全部通过；角度转换本身由桩隔离，oracle 独立复算后续浮点公式。
- `CS_Track_Atti/C2AngleX-dispatch`：36 条输入，覆盖六种角度序列及默认分支的外部 `C2Angle` 选择和浮点结果传递，全部通过；角度反解实现由桩隔离，本项只验证 cfg_target 的分派边界。
- `CS_TrgtAtt_EIM/default-sequence`：30 条输入，覆盖非法姿态序列回退到 321、目标矩阵组合和轨道角速度传播，全部通过；角度矩阵函数由 harness 独立实现，输入生成显式使用有符号索引，避免无符号下溢污染 oracle。
- `CS_TrgtAtt_NWM_USU/default-sequence`：30 条输入，覆盖非法姿态序列回退到 321、漂移角矩阵和漂移/相对角速度传播，全部通过；角度矩阵、四元数和角度反解由固定桩或独立矩阵实现隔离。
- `CS_OrbitComputation/CS_OrbitComputationFun-control`：30 条输入，覆盖轨道有效性阈值、无轨道计数、太阳区回退、AAM 转向标志、`w0` 和地固系角度更新，全部通过；核心 `OrbitCalculate` / `SunEphemerisCalculate` 由临时编译副本中的桩隔离，未把轨道核心数学重复计入本项。
- `CS_Gyro_Att_Predict/invalid-sequence`：36 条输入，覆盖角速度限幅、`float32 ModPNHP` 角度归一化和非法序列速率清零，全部通过；合法姿态转换路径仍依赖外部库。
- `CS_Gyro_Att_Predict/legal-sequence`：36 条输入，覆盖六种合法姿态序列的角速度限幅、姿态预测、`w2dAngle` 转换、`float32 ModPNHP` 角度归一化和 DCM 输出，全部通过；harness 使用标准轴旋转实现，未把公共姿态库本身纳入结论。
- `CS_Ctrl_Att_Rate/FS_ModeProc2`：30 条输入，覆盖传感器姿态、角速度和控制偏置数据的浮点选择/复制路径，全部通过。
- `CS_Ctrl_Att_Rate/FS_AttD-modes`：35 条输入，覆盖 `FS_AttD=0..4` 的姿态源、速率源、偏置源选择和 BMC 模式下 z 轴清零，全部通过；四元数/姿态转换依赖由桩隔离。
- `CS_TrgtAtt_EIM/zero-target-matrix`：36 条输入，覆盖六种序列选择下的矩阵-向量计算、目标系角速度和零差值结果，全部通过；四元数转换由桩隔离且未计入断言。
- `CS_TrgtAtt_EIM/nonzero-angle-matrix`：36 条输入，覆盖六种序列的非零目标角度、偏置矩阵与轨道矩阵组合、角速度传播和相对角速度计算，全部通过；四元数转换仍由桩隔离。
- `CS_TrgtAtt_NWM_USU/zero-drift-matrix`：30 条输入，覆盖六种序列选择下的矩阵组合、漂移角速度传播和相对角速度计算，全部通过；四元数和角度反解由桩隔离且未计入断言。
- `CS_TrgtAtt_NWM_USU/nonzero-drift-matrix`：36 条输入，覆盖六种序列的非零漂移角、漂移角速度、姿态矩阵组合和相对角速度传播，全部通过；四元数和角度反解仍由桩隔离。

实际命令：`bash FloatTest/cfg_target/run_all_cfg_target_tests.sh`。脚本用 `gcc -std=c11 -O0` 编译原始 C 文件与测试 harness，并用 `-ffunction-sections -Wl,--gc-sections` 只保留被测辅助函数，避免无关顶层依赖干扰。

## 后续注意

这批是 C 实现与独立 oracle 的差分测试，不是旧 FloatTest `fp32`/Flocq 的 Coq 位级证明。要扩展到 `CS_TrgtAtt_EIM`、`CS_Gyro_Att_Predict` 等顶层题，必须先补齐并固定其 double 数学公共库和可复现输入驱动，再分别记录公共库依赖是否通过。

特别注意：`CS_OrbitComputation/std_utils.h` 将 `ModPNHP` 声明为 `float32`；即使调用方变量为 `float64`，C 仍会先将参数转换为单精度并将返回值提升。因此 orbit sun oracle 使用 IEEE binary32 舍入建模该边界，而不是简单的全 double 计算。

## 正例、负例与产物对齐

用户进一步要求每个测试同时有正例和负例，并为每例说明 spec 与通过原因。
当前 43 个 cfg_target suite 的正例仍由各 `run_*_tests.py` 对当前 C harness
输出执行独立 oracle 断言；负例由 `run_negative_control.py` 故意篡改一行
harness 输出，只有原 runner 拒绝该输出才记录 `NEGATIVE-PASS`。

`generate_suite_docs.py --refresh/--check` 为每个 suite 维护独立 README 和
`spec_snapshot.json`，摘要绑定当前 `INPUT/cfg_target` 源码、头文件、harness
与 executable spec。`function_coverage.json` 覆盖当前 12 个组件的 33 个 C
函数；源码新增函数而没有 suite 映射时检查失败。

恢复历史测试产物时不能依据总 README 反推代码。本轮从本机可审计 session 的
成功 `patch_apply_end` 记录恢复了 99 个丢失文件，再以当前源码运行全部测试。
同时发现 `run_ires_modify_tests.py` 的断言因缩进只检查最后一条向量，已修正为
逐条检查 30 条向量；mutation negative control 随后确认错误首条输出会被拒绝。

审查 `CS_IRES_Modify` 时发现其 `for (k = 0; k < 2; k++)` 循环内部误用未初始化的 `i` 访问 `devangle[i]`；已将两个访问修正为循环索引 `k`，随后用 30 条向量验证角度偏差限幅、偏航余弦增益、偏置更新和最终限幅。

`CS_GyroData_Disposal/valid-3sensor` 的 harness 使用单位标定矩阵，因此可以稳定隔离验证三路有效数据路径、矩阵组合和速率限幅；不要将该结果解释为一般非单位 `MatrixInv33` 的覆盖。
