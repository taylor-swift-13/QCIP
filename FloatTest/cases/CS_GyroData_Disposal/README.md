# CS_GyroData_Disposal

## Spec

[`spec.v`](spec.v) 描述停控标志计算以及有效陀螺数量不是 3/4 时，从历史 `deltag` 回退的状态转换。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_GyroData_Disposal.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：36 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_GyroData_Disposal/IP_CS_GyroData_Disposal.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`bcf2f33381314fc12b35050162a6b77738e2c77bd4cbeac5eca177f448b3ad9f`
- 当前 C SHA-256：`34b8787adfa3f33e4cd73d9c60026f0f33b44d9d637b1749372620b6b5d49718`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

覆盖顶层历史回退路径；矩阵求逆融合路径不在本 case 的 Rocq spec 范围内。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
