# CS_TrgtP2P_Tar_Init 差分测试

本目录验证原始 `IP_CS_TrgtP2P_Tar_Init.c`。C 参考执行与 Rocq spec
使用相同的 musl binary64 `sin/cos` 移植，对输出按 64 位 bit pattern
比较；测试入口、组件重建约定见 `FloatTest/README.md`。

## 被测语义

- `F_MnvNextMode=1`：`Cro` 置单位矩阵，调用 `CS_TrgtP2P_Ini_Sub`。
- `=2`：按全局 `m_WorkMode` 选择 `Seq_AttD`，执行六种
  `CS_Angle2C`（非法转序走 321），再调用上述子过程。
- `=3`：复制 `Cso` 到 `Cro`，再调用子过程。
- 其他值：保持 `Cro`，调用 `f_Fun_Null`。

仓库没有 `CS_Angle2C`、`MatrixIdentity33`、`Memcpyx` 的组件实现，测试
使用 `FloatTest/ref/iplib_attitude_helpers.c` 中的显式重建；两个无参下游
函数使用计数桩，调用次数也作为输出比较。因此结论覆盖原始分支与数据
变换，但不宣称重建 helper 与未知组件原件等价。

## 产物与复现

- `source/`：参考驱动、原型注入、额外 C/Rocq 依赖清单。
- `rocq/spec.v`：纯函数 fp64 spec；`rocq/tests.v`：自动生成定理。
- `reports/vectors.txt`：5011 条标准答案；`final_checklist.md`：验收记录。

在仓库根目录执行：

```bash
COQ=$(command -v coqc) bash FloatTest/tools/run_tests.sh CS_TrgtP2P_Tar_Init 5000 0x8f3b21d49a765c01
```

结果为 **5011/5011**（11 定向 + 5000 随机）逐位一致。该结果是采样
差分测试，不是所有输入上的全称证明，也不覆盖内存安全。
