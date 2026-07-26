# CS_TrgtAtt_NWM_USU

## Spec

[`spec.v`](spec.v) 以 binary64 描述零漂移角、单位矩阵下的 Cro_si、Cro、wri 和相对角速度。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_TrgtAtt_NWM_USU.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：36 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_TrgtAtt_NWM_USU/IP_CS_TrgtAtt_NWM_USU.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`3520a944e8b5a2efceb31e82f967d0520d43b1b0634fabeac8602fd6748b70fc`
- 当前 C SHA-256：`458bf73a6cc0343939a029c698d1cf3e0391498d0dc00ffc9c193fe25133e2d2`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

覆盖顶层单位矩阵路径，四元数和角度反解输出未纳入当前比较。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
