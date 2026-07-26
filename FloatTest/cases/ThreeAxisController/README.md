# ThreeAxisController

## Spec

[`spec.v`](spec.v) 以 Flocq binary32 描述三轴控制器：

- `Up = clamp(pAngle, ±8.0f)`，其中 z 轴按 C 实现固定为 0；
- `Ud = clamp(pRate - destRate, ±1.2f)`，z 轴使用 `pRate[2]`；
- `fy = Up * Kp + Ud * Kd`；
- `u = clamp(fy, ±1.3f)`。

`limit_f`、加减乘和所有常量均使用 `fp32` 运算，四组输出都转成位模式比较。

## 生成产物

- 当前 C：`INPUT/SAMCodeSynthesis/ThreeAxisController/IP_ThreeAxisController.c`
- C 向量驱动：`FloatTest/ref/ThreeAxisController_main.c`
- 输入/期望位模式：`FloatTest/vectors/ThreeAxisController.txt`
- Coq spec：`FloatTest/cases/ThreeAxisController/spec.v`
- 生成器：`FloatTest/tools/emit_three_axis_tests.py`
- 生成定理：`FloatTest/cases/ThreeAxisController/tests.v`

`tests.v` 已由当前向量重新生成，生成前后 SHA-256 均为
`4eddbf9be8681fd753fa5164fa58c57b0c8b12d94b4e7d3049834ddbc433aef4`。

## 为什么通过

30 条 `Example t_XXXX` 分别把 C 驱动产生的 15 个输入位模式代入
`threeAxisController_fun`，并用 `vm_compute; reflexivity` 检查 `Up`、`Ud`、
`fy`、`u` 共 12 个输出位模式。

负例 `negative_control_wrong_expected` 故意翻转首条向量的一个 `Up` 输出位，
并由 `vm_compute; discriminate` 证明该错误期望不可能等于当前 spec 结果。

通过固定入口 `coq_tooling.py check` 的隔离检查结果为 `passed`、return code 0，
Coq 8.20.1 已计算并核验全部定理。固定 flags hash 为
`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`。

这些结论覆盖当前 30 组确定性输入，是位级计算定理，但不是任意输入上的全称证明。
