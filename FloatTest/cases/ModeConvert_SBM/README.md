# ModeConvert_SBM

## Spec

[`spec.v`](spec.v) 以 binary64 先计算星时与参考时刻之差，再与轨道注入阈值比较并切换到模式 1。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/ModeConvert_SBM.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：30 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/ModeConvert_SBM/IP_ModeConvert_SBM.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`1e6c9f61002e6db864a6ea7a356729cb981e775785b65b5cd4e97f241b273f83`
- 当前 C SHA-256：`0fa3510b31852940de3690d89ef587af3ec284f6afb61c26608c96184bfa3733`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

覆盖完整 `ModeConvert_SBMFun`。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
