# IP_STSTransDataSave 形式化验证复现说明

本目录归档 `INPUT/IP/STSTransDataSave/IP_STSTransDataSave.c` 的 byte-copy direct proof 结果。

## 语义结论

已验证 `STSTransDataSave` 的条件式后状态：

- 若旧 `sSTSTran.ptr < 776`，函数将 `sSTSTran.dataBuf[0..247]` 拷贝到 SRAM packet window 中以旧 `ptr` 为偏移的 248 字节片段，并将 `sSTSTran.ptr` 更新为 `old_ptr + 248`。
- 若旧 `sSTSTran.ptr >= 776`，函数不执行拷贝，`sSTSTran.ptr` 和 1KB SRAM window 保持不变。
- 规格以 `STSTransDataSaveBytePost` 表达数学后状态关系；`Memcpyx` 通过外部函数规格消耗目标段 `old_dst` 并产生 `data_head`，没有在 Rocq 中镜像其实现算法。

## 目录

- `source/`：正式 C annotation 源码和必要头文件。
- `rocq/`：最终 Rocq 产物，包括 lib、goal、proof_auto、proof_manual、goal_check。
- `reports/`：case brief、witness ledger、final checklist、timing summary 和快照。

## 关键复现命令

从仓库根目录执行：

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_goal.v \
  --proof-auto-file=SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_proof_manual.v \
  --coq-logic-path=SimpleC.EE.LLM_bench.Engineering.STSTransDataSave \
  -slp QCP_examples/LLM_bench/ SimpleC.EE.LLM_bench \
  -IQCP_examples/LLM_bench/Engineering/STSTransDataSave \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=QCP_examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave.c \
  --no-exec-info
```

Rocq 编译顺序：

```sh
coqc $(tr -d '\r' < _CoqProject) SeparationLogic/examples/QCP_demos_LLM/char_array_strategy_goal.v
coqc $(tr -d '\r' < _CoqProject) SeparationLogic/examples/QCP_demos_LLM/char_array_strategy_proof.v
coqc $(tr -d '\r' < _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_lib.v
coqc $(tr -d '\r' < _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_goal.v
coqc $(tr -d '\r' < _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_proof_auto.v
coqc $(tr -d '\r' < _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_proof_manual.v
coqc $(tr -d '\r' < _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_goal_check.v
```
