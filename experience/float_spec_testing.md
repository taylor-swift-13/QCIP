# FloatTest spec 差分测试经验

## 结论

测试浮点 IP 时，目标是 `cases/<Case>/spec.v`，不是仅测试外部 harness。可靠流程是：

1. 原始 C 驱动输出 IEEE-754 single 的 bit pattern；
2. Coq spec 用 `f32` 注入输入，输出统一转成 `bits_of_b32`；
3. 每个向量生成一个 `vm_compute; reflexivity` 定理；
4. `coqc` 全部通过才报告该批样本通过。

## ThreeAxisController

参考驱动必须把 `CTRL_PARAM_SAM[].Kp/Kd` 写入结构体；只生成 `kp/kd` 局部数组而不写入结构体，会导致 C 输出没有真正使用测试参数。

本次 30 条向量覆盖角度限幅、速率差限幅、零输入和控制量限幅，命令为：

```sh
bash FloatTest/tools/run_three_axis_tests.sh 30
```

结果为 30 条 Coq bit-pattern 定理全部通过。

## iplib 姿态题：把确定性基础运算提成共享层

2026-08-13 完成 `CS_Gyro_Att_Predict` 和 `CS_TrgtAtt_AMM_2NoSAR` 后，
可复用的做法是把姿态基础运算集中在两侧共享层：C 侧
`FloatTest/ref/iplib_attitude_helpers.c`，Rocq 侧
`FloatTest/lib/FloatAttitude.v`。共享内容包括六种 `Angle2C`、矩阵乘法、
六种 `w2dEuler`、QMulti、Q2C 和 C2Q；每个 case 的 spec 只保留自己的
数据流与分支。这样能避免从旧 case 复制展开式后出现符号或矩阵下标漂移。

sin/cos/sqrt 继续固定为 musl C 移植与 Rocq 可执行模型，不能拿宿主 libm
作为真值，否则平台或 x87 双舍入会破坏逐位复现。binary64 实参传入
`float ModPNHP(float,float)` 时还必须显式建模两次转换；
`fp64_to_fp32_ne`、`fp32_to_fp64_exact` 和 `fp64_via_fp32` 已加入
`FloatTestCommon.v`。若只验证无周期回绕域，生成器和 README 都必须明确
这个前提，不能把转换模型误写成完整 ModPNHP 规格。

## 残缺上游头文件的处理

`CS_TrgtAtt_AMM_2NoSAR` 的原头文件既是 ISO-8859-1，又重复声明同一结构体
成员。不要修改输入快照来“修好”它；应在 OUTPUT case 中写最小 clean
header，只声明函数真实访问的字段，再用单独 wrapper translation unit
屏蔽原 header 声明并包含原始 C 函数体。`run_tests.sh` 的 per-case
`*_ip_source.txt` 用来选择这个 wrapper，相关偏差必须在中文 README 中置顶
说明。

## 固定 Rocq 检查与证据

正式结果只接受 `.agents/skills/vc-proving/scripts/coq_tooling.py check` 在
独立 build workspace 中产生的固定 argv 检查。因为测试文件位于
`OUTPUT/iplib`，工具的固定映射必须包含 `-Q OUTPUT/iplib OUTPUT.iplib`；
证据 JSON 应保存 source_goal_version、输入摘要、实际 argv、返回码和耗时。
共享 `.v` 修改后，即使 `tests.v` 未变，也要重新运行所有受影响 case，避免
留下指向旧依赖摘要的“通过”记录。
