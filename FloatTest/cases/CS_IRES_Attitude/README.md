# CS_IRES_Attitude

## Spec

[`spec.v`](spec.v) 描述两个 IRES 均未配置时，顶层函数把两路 FV/FU 有效标志清零的状态转换。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_IRES_Attitude.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：30 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_IRES_Attitude/IP_CS_IRES_Attitude.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`15f065a46c1f1ea96bb45213beae17531c86537363b0e57a01360a44f277506d`
- 当前 C SHA-256：`cb3a156f3376fd72ba5930c2e58c130ed719d544e747de161ec97d0ecaab71dd`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

覆盖顶层无传感器分支。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
