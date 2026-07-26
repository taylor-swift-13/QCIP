# CS_TrgtAtt_EIM

## Spec

[`spec.v`](spec.v) 以 binary64 描述零目标角和单位偏置/轨道矩阵下的 Cro、wri 与 wro 计算。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_TrgtAtt_EIM.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：36 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_TrgtAtt_EIM/IP_CS_TrgtAtt_EIM.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`a339beb3b2b344c1622788a29dc90898ef084644932c85def9f5df174ea7dbb8`
- 当前 C SHA-256：`f786702a030eacaa7efe11829f17f40a0f94a41b2eb7f7188e0413789637ee67`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

覆盖顶层单位矩阵路径，C2Q 输出未纳入当前比较。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
