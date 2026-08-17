# CS_Gyro_Att_Predict 浮点差分验证

## 结果

`1013/1013` 条二进制浮点向量通过固定 `coq_tooling.py check`：

- 13 条定向向量：六种合法欧拉转序、非法转序，以及六个近奇异保护分支；
- 1000 条固定种子随机向量：覆盖角速度与最终姿态角限幅；
- 每条向量比较 21 个 binary64 输出，即 `w`、`wbo`、`Rate`、最终姿态角和 `Cbo`；
- 阴性对照翻转第一个输出位，已证明与真实结果不等。

权威检查记录在 `reports/coqc_check_evidence.json`，输入/输出原始位模式在
`reports/vectors.txt`，生成的 1013 个正向定理和 1 个阴性定理在
`rocq/tests.v`。

## 建模边界

核心 `CS_Gyro_Att_PredictFun` 使用仓库原始 C。仓库缺失的姿态组件函数按
已有 FloatTest 姿态题已经审计的相同公式重建：六种 `Angle2C`、六种
`w2dAngle`、矩阵乘法和 `LimitDouble`。`sin/cos` 使用 C/Rocq 两侧一致的
确定性 musl 移植。

`ModPNHP` 使用仓库 `std_utils.c` 的真实算法和 `float` 函数签名。生成器把
输入限制在无需周期回绕的范围，因此 Rocq 侧精确建模本题实际发生的
binary64 → binary32 → binary64 转换；本结论不覆盖发生周期回绕的输入。
近奇异分支会把相应欧拉角增加 `0.001`，六种转序均有定向样本。

## 复现

在仓库根目录执行：

```sh
bash FloatTest/tools/run_tests.sh CS_Gyro_Att_Predict 1000 0x6a09e667f3bcc909
```

固定 Rocq 检查等价于：创建独立 build workspace，然后对
`OUTPUT/iplib/CS_Gyro_Att_Predict/rocq/tests.v` 调用
`.agents/skills/vc-proving/scripts/coq_tooling.py check`。正式运行的完整参数、
固定 `-Q/-R` 映射、源码摘要和耗时均保存在 evidence JSON 中。
