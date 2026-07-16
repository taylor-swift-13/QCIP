# Timing Summary — CheckCal08

| 阶段 | 主要内容 | 耗时（约） |
|---|---|---|
| 目录与 spec 准备 | 创建 `QCIPLib/QCIPCases` 目录，编写 `IP_CheckCal08_lib.v` | 较短 |
| C annotation | 为 `IP_CheckCal08.c` 添加 QCP annotation | 较短 |
| 符号执行 | 运行 `symexec` 生成 goal / auto / manual | 较短 |
| 文件迁移 | 将证明产物放入标准位置，更新 `_CoqProject` | 较短 |
| Manual 证明 | 完成 safety / entail / return 全部 witness 证明 | 主要耗时 |
| final-check | 编译 `goal_check.v`，检查无 `Admitted` | 较短 |

## Manual 证明细分

| 目标 | 难点 | 解决方式 |
|---|---|---|
| `safety_wit_3_split_goal_1/2` | 从 `UCharArray.full` 提取元素上界，避免 `entailer!` 找 witness 失败 | 使用 `prop_apply valid_store_uchar` + `Intros` + `derivable1s_coq_prop_r`，显式展开 `Byte.max_unsigned` |
| `entail_wit_2_split_goal_1` | 需要 `Zlength pkv = len` | 增强 `CheckCal08Inv` 包含数组长度 |
| `return_wit_1` | 原始生成目标中 `pIp_pre` 与 `pIp` 不一致 | 修正 `goal.v` 中 postcondition 指针，使用 `Exists chksum` + `CheckCal08Inv_implies_post` |

## 编译命令

```bash
COQOPTS=$(cat _CoqProject)
coqc $COQOPTS QCIPLib/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_lib.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_goal.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_proof_auto.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_proof_manual.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_goal_check.v
```

以上五步均编译通过。
