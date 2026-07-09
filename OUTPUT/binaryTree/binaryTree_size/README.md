# binaryTree_size — 二叉树节点计数

## 功能

`count_nodes(struct tree *root)`：递归统计二叉树的节点总数并返回。

## 规格（功能正确性 + 无溢出）

```
With tr
Require store_tree(root, tr) && tree_size(tr) <= INT_MAX
Ensure  store_tree(root, tr) && __return == tree_size(tr)
```

其中 `tree_size` 为公共库数学定义：

```coq
Fixpoint tree_size (tr:tree) : Z :=
  match tr with empty => 0 | make_tree l r => tree_size l + tree_size r + 1 end.
```

前提 `tree_size(tr) <= INT_MAX` 保证节点数可用 C `int` 表示，从而内部所有加法都不溢出。
这是**功能正确性**规格：返回值精确等于数学节点数。

## 证明说明

共 6 个手动 witness，全部 `Qed`：

- `safety_wit_3` / `safety_wit_4`：加法 `ls+rs+1`、`ls+rs` 的溢出/下溢边界。
  由 `tree_size (make_tree tr1 tr2) = tree_size tr1 + tree_size tr2 + 1`、
  `tree_size_nonneg` 与前提 `tree_size tr <= INT_MAX`，经 `lia` 判定。
- `return_wit_1`（非空分支）：纯等式 `ls+rs+1 = tree_size tr`，由定义 + `lia`。
- `return_wit_2`（空分支）：`root=0` ⇒ `tr=empty` ⇒ `tree_size tr = 0`，且保留 `store_tree`。
- `partial_solve_wit_2_pure` / `wit_3_pure`：两个递归调用的前提
  `tree_size tr1 <= INT_MAX`、`tree_size tr2 <= INT_MAX`，由子树规模不超过整树、`tree_size_nonneg` 与 `lia`。

关键 helper：`tree_size_nonneg`、`store_tree_zero`（均在公共库中已证）。

## 复现

```bash
linux-binary/symexec \
  --goal-file=QCIPCases/binaryTree/binaryTree_size/binaryTree_size_goal.v \
  --proof-auto-file=QCIPCases/binaryTree/binaryTree_size/binaryTree_size_proof_auto.v \
  --proof-manual-file=QCIPCases/binaryTree/binaryTree_size/binaryTree_size_proof_manual.v \
  -slp QCIPLib/binaryTree/common/ QCIPLib.binaryTree.common \
  -IQCIPLib/binaryTree/common/ \
  --coq-logic-path=QCIPCases.binaryTree.binaryTree_size \
  --input-file=INPUT/binaryTree/binaryTree_size/binaryTree_size.c --no-exec-info
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_size/binaryTree_size_goal.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_size/binaryTree_size_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_size/binaryTree_size_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_size/binaryTree_size_goal_check.v
```
