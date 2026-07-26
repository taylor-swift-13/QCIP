# PseudoRate

## Spec

[`spec.v`](spec.v) 将原 C 的三轴计算写成纯 `fp32` 函数：

- `pseudoRate_step` 计算 `d = pu - r`；
- `d > h1` 时输出 `(Yp, Yn) = (0, 15)`，并计算
  `r' = 0.9231f * r + 0.07688f`；
- `d < -h1` 时输出 `(15, 0)`，并计算
  `r' = 0.9231f * r - 0.07688f`；
- 其余情况输出 `(0, 0)` 和 `r' = 0.9231f * r`。

所有常量和输入均以 IEEE-754 binary32 位模式注入，输出 `r'` 也转回位模式，
因此测试比较的是单精度计算结果，而不是十进制近似值。

## 生成产物

- 当前 C：`INPUT/SAMCodeSynthesis/PseudoRate/IP_PseudoRate.c`
- C 向量驱动：`FloatTest/ref/PseudoRate_main.c`
- 输入/期望位模式：`FloatTest/vectors/PseudoRate.txt`
- Coq spec：`FloatTest/cases/PseudoRate/spec.v`
- 生成器：`FloatTest/tools/emit_tests.py`
- 生成定理：`FloatTest/cases/PseudoRate/tests.v`

`tests.v` 已由当前向量重新生成，生成前后 SHA-256 均为
`439ad860ad184c77cb44aa711710ca71868b02af97e0192f4437430542029d3f`，
说明落盘产物与当前生成器及向量一致。

## 为什么通过

`tests.v` 包含 1000 条 `Example t_XXXX`。每条定理把一组 C 产生的输入位模式
代入 `pseudoRate_fun`，并要求结果等于同组 C 输出位模式；证明统一为
`vm_compute; reflexivity`。

文件末尾另有负例 `negative_control_wrong_expected`：它把首条向量的一个输出位
故意翻转，并用 `vm_compute; discriminate` 证明真实 spec 结果不等于错误期望。

通过固定入口 `coq_tooling.py check` 的隔离检查结果为 `passed`、return code 0，
Coq 8.20.1 实际计算并核验了 1000 条正例等式及 1 条负例不等式。固定 flags hash 为
`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`。

这证明 1000 个明确采样点上 Coq spec 与 C 输出逐位一致；它不是对所有
binary32 输入的全称定理。
