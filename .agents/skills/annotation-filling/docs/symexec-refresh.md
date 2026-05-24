# 刷新 symexec 生成文件

本文件只用于主 agent 在正式文件上刷新生成物。
`annotation-subagent` 在 scratch 上用 `qcp-mcp` 完成交互检查，并通过 `annotation-checking` 后，主 agent 需要先把被接受的 `annotation_scratch_lib` spec 变更回填到 `common_case_formal_lib`，刷新 `Case Brief` 中的 lib frozen prefix；再把被接受的 C annotation 回填到正式 `.c`，最后用 symexec 二进制完整执行一次，以刷新 Rocq 产物。

## 常规目录模板

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/QCP_demos_LLM/<name>_goal.v \
  --proof-auto-file=SeparationLogic/examples/QCP_demos_LLM/<name>_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/QCP_demos_LLM/<name>_proof_manual.v \
  --coq-logic-path=SimpleC.EE.QCP_demos_LLM \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=QCP_examples/QCP_demos_LLM/<name>.c \
  --no-exec-info
```

## 子目录模板

如果目标文件位于子目录，例如 `simple_arith/add.c`，对应路径需要整体带上子目录：

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/QCP_demos_LLM/simple_arith/add_goal.v \
  --proof-auto-file=SeparationLogic/examples/QCP_demos_LLM/simple_arith/add_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/QCP_demos_LLM/simple_arith/add_proof_manual.v \
  --coq-logic-path=SimpleC.EE.QCP_demos_LLM.simple_arith \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=QCP_examples/QCP_demos_LLM/simple_arith/add.c \
  --no-exec-info
```

## 刷新后的判断标准

- `*_goal.v` 和当前 C 文件一致。
- `*_proof_auto.v` 已更新。
- `*_proof_manual.v` 仍保留已有手动证明内容，可继续补写。
- `*_goal_check.v` 可用于后续统一编译检查。
- 如果本轮有 `annotation_scratch_lib` spec 变更，`common_case_formal_lib` 已由 main 回填，且 `Case Brief.lib_frozen_prefix_*` 已刷新。
- annotation C scratch 和 `annotation_scratch_lib` 不应继续保留到下一个 phase。
