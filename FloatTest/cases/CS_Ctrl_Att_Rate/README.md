# CS_Ctrl_Att_Rate

## Spec

[`spec.v`](spec.v) 描述 `FS_ModeProc=2` 时太阳/地球捕获姿态、角速率和控制量的五组直接复制结果。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_Ctrl_Att_Rate.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：35 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_Ctrl_Att_Rate/IP_CS_Ctrl_Att_Rate.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`5b5614292012d10ce0420b2f3e23f118ecc088585ad63901a1f59eebdf350e68`
- 当前 C SHA-256：`d17dea20a500ce4328d60aac942884c23353baab0a250128b3c23006acb7acdd`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

覆盖顶层 `CS_Ctrl_Att_RateFun` 的 ModeProc=2 路径。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
