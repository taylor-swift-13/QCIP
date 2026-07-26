# CS_Gyro_Att_Predict

## Spec

[`spec.v`](spec.v) 以 binary64 描述角增量除法、漂移扣除、角速度限幅，以及非法姿态序列清零角速率的路径。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_Gyro_Att_Predict.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：36 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_Gyro_Att_Predict/IP_CS_Gyro_Att_Predict.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`ec1ac625212643dd775bef788b6bc3bc8ec6064ece0ced9942c31df4ff74940b`
- 当前 C SHA-256：`8bb447b2bdfffc373acb2087c150010c1b3ea6693d79a8724bf66e01034bb64a`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

姿态矩阵与角速度转换依赖使用明确的单位矩阵/零速率桩。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
