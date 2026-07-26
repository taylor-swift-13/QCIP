# CS_PrecessionNutationCal

## Spec

[`spec.v`](spec.v) 以 binary64 描述 qJD 向量分量越过 0.05 阈值时的错误标志和 3×3 单位矩阵回退。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_PrecessionNutationCal.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：36 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_PrecessionNutationCal/IP_CS_PrecessionNutationCal.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`9fb64e75399815f06c94ac9b74df5ea2b6e3ad6e8b8a856ac0ea4ec22798cd70`
- 当前 C SHA-256：`dd3642f76f0cd4bbf8027b4a006c1b18e182133dc3b88c0e0ea0503c99719efc`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

覆盖顶层非法 qJD 路径；CPN 天文多项式路径不在本 case 的 Rocq spec 范围内。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
