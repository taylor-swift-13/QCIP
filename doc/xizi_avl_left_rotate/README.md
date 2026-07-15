# `xizi_avl_left_rotate` 完整验证归档

状态：已完成。controller run `xizi_avl_left_rotate-20260714130000` 已进入 `done`；唯一 manual witness 已证明，parent full check 和 final-check 均通过。

最终交付全集位于 `OUTPUT/xizi/xizi_avl_left_rotate/`：包含干净输入快照、annotated 验证源码、全部正式/诊断 Rocq 文件、controller round/group/final-check 报告、新鲜度证据和本 README。`doc/xizi_avl_left_rotate/` 保留同一 case 的文档归档。

## 文件边界

- `source/xizi_avl_left_rotate.c`：来自 `INPUT` 的干净 C，不含 QCP annotation。
- `source/xizi_avl_left_rotate_annotated.c`：位于 `Verification` 的正式 annotation source。
- `source/xizi_avl_def.h`：干净结构体定义。
- `rocq/`：地址标记树模型、递归空间谓词、生成文件、manual proof 和总检查文件。
- `reports/`：controller 时间线及完整 annotation/vc-checking/group-worker handoff。

在 `OUTPUT` 的 `source/` 中，`xizi_avl_left_rotate.c` 与 `xizi_avl_left_rotate_annotated.c` 均为正式 annotated 验证源码，`xizi_avl_left_rotate_input.c` 是无 annotation 的 `INPUT` 快照。

旧错误 OUTPUT、QCIPCases 以及旧弱 `QCIPLib/xizi/xizi_avl_common` 已移动到 `archieve/xizi_avl_invalid_20260714/`，不属于 active proof。

## 完整功能规格

新抽象树 `addr_avl_tree` 的每个非空节点记录物理地址、`data`、缓存 `height` 和完整左右子树。`store_addr_avl` 分离地拥有每个节点的四个字段以及所有递归子树。

规格精确描述：

```text
before = Node(root, d, h, A, Node(promoted, rd, rh, B, C))
after  = Node(promoted, rd, rh, Node(root, d, h, A, B), C)
return = promoted
```

因此证明覆盖原根和被提升节点的身份、两个节点的数据/缓存高度、`A/B/C` 三棵子树以及完整内存所有权。函数不分配、不释放，所有资源在后置条件中恰好出现一次。

注意：C 函数没有写 `height`，所以正确结论是缓存高度逐值保持，而不是声称已经刷新高度或恢复一般 AVL 平衡。若需要后两项性质，必须先修改实现。

## 验证结果

annotation 完成三轮 qcp-mcp、canonical symexec、case-lib/fixed goal 编译及 annotation-checking。VC checking 判定唯一 witness 可证；group-worker 显式构造 `avl_left_rotation` 的九个存在量词，并保留空间 frame，无 helper。parent verify 与 final-check 固定 `goal_check` 返回 0；额外隔离 symexec freshness 重跑确认 goal/auto 字节一致且 witness statement hash 一致；manual/case-lib 无 `Admitted`、额外 `Axiom`、forbidden lemma。

## 复现

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/Verification/xizi/xizi_avl_left_rotate/xizi_avl_left_rotate_goal.v \
  --proof-auto-file=SeparationLogic/examples/Verification/xizi/xizi_avl_left_rotate/xizi_avl_left_rotate_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/Verification/xizi/xizi_avl_left_rotate/xizi_avl_left_rotate_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=SimpleC.EE.Verification.xizi.xizi_avl_left_rotate \
  --input-file=Verification/xizi/xizi_avl_left_rotate/xizi_avl_left_rotate.c \
  --no-exec-info
```

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --target-file SeparationLogic/examples/Verification/xizi/xizi_avl_left_rotate/xizi_avl_left_rotate_goal_check.v \
  --target-kind check
```

维护时必须保持 `INPUT` 无 annotation。对验证 C 或 case lib 的任何修改都必须重新走 controller；不得把后置条件退化为 `store_non_empty_tree` 或 `store_tree_shape`。
