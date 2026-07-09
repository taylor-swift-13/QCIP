# binaryTree_height — 二叉树高度（平衡二叉树核心度量）

## 功能

`tree_height(struct tree *root)`：递归计算二叉树的高度（空树高度为 0），
返回 `max(左子树高, 右子树高) + 1`。

树高是**平衡二叉树**的核心量：一棵树height-balanced当且仅当每个节点的两个子树高度差不超过 1。
本 case 严格证明了高度计算函数的功能正确性，是平衡二叉树相关验证的基础构件。

## 规格（功能正确性 + 无溢出）

```
With tr
Require store_tree(root, tr) && tree_depth(tr) <= INT_MAX
Ensure  store_tree(root, tr) && __return == tree_depth(tr)
```

其中 `tree_depth` 为公共库数学定义：

```coq
Fixpoint tree_depth (tr:tree) : Z :=
  match tr with empty => 0 | make_tree l r => Z.max (tree_depth l) (tree_depth r) + 1 end.
```

## 证明说明

共 7 个手动 witness，全部 `Qed`：

- `safety_wit_3` / `safety_wit_5`：`lh+1`、`rh+1` 的溢出/下溢边界。
- `return_wit_1`（`lh <= rh` 分支）：`rh+1 = tree_depth tr`；
  `return_wit_2`（`lh > rh` 分支）：`lh+1 = tree_depth tr`。
  两者由 `tree_depth (make_tree tr1 tr2) = Z.max (tree_depth tr1)(tree_depth tr2) + 1`
  与分支条件，经 `lia`（内置 `Z.max` 支持）判定。
- `return_wit_3`（空分支）：`root=0` ⇒ `tr=empty` ⇒ `tree_depth tr = 0`，保留 `store_tree`。
- `partial_solve_wit_2_pure` / `wit_3_pure`：两个递归调用的前提
  `tree_depth tr1 <= INT_MAX`、`tree_depth tr2 <= INT_MAX`（子树高度不超过整树高度）。

关键 helper：`tree_depth_nonneg`、`store_tree_zero`（公共库已证）。

## 复现

```bash
linux-binary/symexec \
  --goal-file=QCIPCases/binaryTree/binaryTree_height/binaryTree_height_goal.v \
  --proof-auto-file=QCIPCases/binaryTree/binaryTree_height/binaryTree_height_proof_auto.v \
  --proof-manual-file=QCIPCases/binaryTree/binaryTree_height/binaryTree_height_proof_manual.v \
  -slp QCIPLib/binaryTree/common/ QCIPLib.binaryTree.common \
  -IQCIPLib/binaryTree/common/ \
  --coq-logic-path=QCIPCases.binaryTree.binaryTree_height \
  --input-file=INPUT/binaryTree/binaryTree_height/binaryTree_height.c --no-exec-info
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_height/binaryTree_height_goal.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_height/binaryTree_height_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_height/binaryTree_height_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_height/binaryTree_height_goal_check.v
```
