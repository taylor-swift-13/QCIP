# xizi_single_link_remove_node 验证交付

本目录交付 `xizi_single_link_remove_node` 的 C annotation、Rocq 证明和可复现检查摘要。函数实现与 ABI 未改动；验证保留精确的 `strong_spec`，并由它导出三个常用客户端规格。

## 四个规格如何选

- `strong_spec`：证明函数本体时使用。它给出精确分解 `l = l1 ++ node :: l2`、删除后的 `l1 ++ l2`、原 `node_next` 值和返回头指针。
- `remove_member_spec`：一般调用默认使用。调用方只需知道节点属于链表；后置条件用 `xizi_sll_remove_first` 删除第一次出现，并取回 detached node 的 `node_next` 字段所有权。
- `remove_front_spec`：已知待删节点是首节点时使用。
- `remove_tail_spec`：已知待删节点是尾节点时使用。

`xizi_sll_remove_first` 是 case-local 纯列表函数：遇到第一次相等立即返回 suffix，因此不会像 remove-all 算子那样删除重复节点的后续出现。

## 关键 annotation 修复

循环不变量显式保存：

```c
linklist == linklist@pre &&
linklist_node == linklist_node@pre
```

这两个等式把循环中的 current 地址资源桥接回函数入口 snapshot。缺少它们时，循环返回 VC 的前提允许 current/snapshot 是四个不同地址，而后置条件却要求入口地址上的资源，因而存在具体反例。补上等式后，generated return VC 中的地址统一，矛盾来源被消除。

## 证明结果

- source goal version：`9675b89a1c82e0e65105714364653bd81b00896e0d47a5cc425701378a2788de`
- 8 个 manual witnesses：全部 `Qed`
- `*_goal_check.v`：fixed `coq_tooling.py check` 通过
- `proof_manual` / case lib：无 `Admitted.`、无额外 `Axiom`
- forbidden lemma：23 个名称全部零命中
- case helper：`xizi_sll_remove_first_split__spec_derivations_direct`

## 复现

在仓库根目录 `/home/yangfp/QCIP` 执行：

```bash
linux-binary/symexec \
  --goal-file=/tmp/xizi_single_link_remove_node_goal.v \
  --proof-auto-file=/tmp/xizi_single_link_remove_node_proof_auto.v \
  --proof-manual-file=/tmp/xizi_single_link_remove_node_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source \
  --input-file=OUTPUT/xizi/xizi_single_link_remove_node/source/xizi_single_link_remove_node.c \
  --no-exec-info
```

正式 Coq 检查只通过固定入口：

```bash
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --build-workspace /tmp/xizi_single_link_remove_node-final-check \
  --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_single_link_remove_node/source/xizi_single_link_remove_node_goal_check.v \
  --target-kind check \
  --source-goal-version 9675b89a1c82e0e65105714364653bd81b00896e0d47a5cc425701378a2788de
```

## 目录

- `source/`：已验证 C 源码与所需头文件。
- `rocq/`：goal、auto/manual proof、goal check、case lib 和 diagnostics snapshot。
- `reports/`：final checklist、freshness、witness ledger、checkpoint、reuse packet 与 timing 摘要。

