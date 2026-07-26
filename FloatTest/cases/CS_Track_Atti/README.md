# CS_Track_Atti

## Spec

[`spec.v`](spec.v) 以 binary64 描述零姿态转换、角加速度差分、单位惯量矩阵前馈力矩和历史状态更新。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_Track_Atti.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：36 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_Track_Atti/IP_CS_Track_Atti.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`a85439daf53fb042005eeba5d90a90acc3dcd491bb1b7c47217185e9c46ea55a`
- 当前 C SHA-256：`866a892092b4115d269488d232615537c7a06609449dd7b834a28d4e9744d788`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

DCM 反解与 w2dEuler 的外部结果固定为零，以隔离顶层差分和力矩公式。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
