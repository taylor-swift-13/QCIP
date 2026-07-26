# CS_AttCtrl_Propel

## Spec

[`spec.v`](spec.v) 以 binary64 实现 `CS_ThrParamCfgX` 的工作模式、时间门限、姿态捕获、喷气回退和卸载分支。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_AttCtrl_Propel.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：60 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_AttCtrl_Propel/IP_CS_AttCtrl_Propel.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`f38f76d35871a0846a9e66931ed3011e5217e290b89c397dd8d29f1a09b87725`
- 当前 C SHA-256：`59ba3fa84108de1ba1553dfbbe223128c0d3099cd48791b10dfc681afd9c30b8`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

当前覆盖可独立调用的相平面参数选择函数；顶层喷气分配的其他路径仍由后续 spec 扩展。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
