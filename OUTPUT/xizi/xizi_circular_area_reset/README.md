# xizi_circular_area_reset 验证交付

`CircularAreaReset` 已按 idmanager 风格的统一资源模型重新验证。run `xizi_circular_area_reset-20260902224500` 已进入 `done`；`source_version=15a2a5b033e66fc8e731a9fe74303e05797c804a2ab0059105fb8eaee1448ed0`，`source_goal_version=3141c87f6ed81899c0588879ca2b34e2a5f7efaeb632c3b8e9d188193ee59137`。

## 语义与规格

Reset 保留 descriptor、capacity、backing allocation、operations pointer 和物理 `mixed_full` 字节；将 `readidx`、`writeidx`、`b_status` 设为 0，并将逻辑 FIFO 置空。公开 contract 只有一个状态：

```c
With (state : circular_area_state)
Require store_circular_area(state, circular_area)
Ensure store_circular_area(
  Build_circular_area_state(ca_capacity(state), nil),
  circular_area)
```

实现层的 pointer、index、status 和 physical option list 只在函数体内部 `Assert` 中展开，不是调用者要管理的公开资源。Init 的成功输出可直接供 Reset 消费。

## 目录

- `source/`：最终 annotation C。
- `rocq/`：case lib、generated goals、auto/manual proofs 和 `goal_check`。
- `reports/`：当前 run 的 controller、phase/group report、snapshot、checkpoint 和 reuse packet。

## 复现

在仓库根目录执行 canonical symbolic execution：

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_reset/source/xizi_circular_area_reset_goal.v \
  --proof-auto-file=SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_reset/source/xizi_circular_area_reset_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_reset/source/xizi_circular_area_reset_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source \
  --input-file=OUTPUT/xizi/xizi_circular_area_reset/source/xizi_circular_area_reset.c \
  --no-exec-info
```

对已保留 manual proof 的正式终态，使用固定 Coq 入口检查：

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --build-workspace /tmp/xizi-reset-coq-build \
  --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_reset/source/xizi_circular_area_reset_goal_check.v \
  --target-kind check \
  --source-goal-version 3141c87f6ed81899c0588879ca2b34e2a5f7efaeb632c3b8e9d188193ee59137
```

## 结果与维护

2 个 manual witness 全部完成；group-check、parent full check 和 final fixed `goal_check` 均通过，无新增 helper/import，manual/case lib 无 `Admitted`、额外 `Axiom` 或 forbidden lemma。controller final-check 的严格隔离 freshness replay 因当前仓库布局未配置而记录为 `skipped`，不得误报为 passed。后续 Read/Write 应直接消费同一 `store_circular_area`，不再引入并行 descriptor/backing 谓词。
