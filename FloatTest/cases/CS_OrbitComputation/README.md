# CS_OrbitComputation

## Spec

[`spec.v`](spec.v) 以 binary64 描述顶层轨道时间有效性、未注入标志、无轨道计数、w0i 和地固系经度更新。

输入和输出均由 C reference driver 以 IEEE-754 binary64 位模式写入
`FloatTest/vectors/CS_OrbitComputation.txt`；[`tests.v`](tests.v) 再把位模式注入 Flocq
`fp64`，实际计算 spec 并与当前 C 输出逐位比较。

## 正例与负例

- 正例：30 条 `Example t_XXXX`，期望值来自当前
  `INPUT/cfg_target/CS_OrbitComputation/IP_CS_OrbitComputation.c` 的 reference run。
- 负例：1 条 `negative_control_wrong_expected`，故意翻转首条 C 输出的一位，
  并证明 spec 结果不等于错误期望。

## 为什么通过

固定 `coq_tooling.py check` 已编译全部定理；正例使用
`vm_compute; reflexivity`，负例使用 `vm_compute; discriminate`。这意味着
Rocq 确实计算了本文件中的算法 spec，而不是读取 Python 的 passed 状态。

当前生成物绑定：

- `tests.v` SHA-256：`11bbf0ec1b7f82643806f840e7aebd87c4a480d53e4b484d3bb8b1bf876d5d69`
- 当前 C SHA-256：`03ce570e833f94541713ed0482079757dd6513f82269d231d582f10848c1e7ad`
- 固定 flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`

## 覆盖边界

OrbitCalculate/SunEphemerisCalculate 作为依赖隔离；被测顶层函数体从当前 C 文件确定性抽取。

这是明确路径和有限向量上的位级计算证明，不冒充任意输入上的全称定理。
