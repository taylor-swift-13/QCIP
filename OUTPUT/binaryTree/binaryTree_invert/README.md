# binaryTree_invert — 二叉树镜像翻转

## 功能

`invert_tree(struct tree *root)`：原地递归交换每个节点的左右孩子，得到整棵树的镜像。
即经典的 "invert a binary tree"。

## 规格（功能正确性）

```
With tr
Require store_tree(root, tr)
Ensure  store_tree(root, tree_mirror(tr))
```

其中 `tree_mirror` 为公共库中的数学定义：

```coq
Fixpoint tree_mirror (tr:tree) : tree :=
  match tr with
  | empty => empty
  | make_tree l r => make_tree (tree_mirror r) (tree_mirror l)
  end.
```

这是**功能正确性**规格（不仅是内存安全）：证明输出恰好是输入的镜像树。

## 证明说明

- `invert_tree_return_wit_1`（`root == NULL` 分支）：由 `store_tree root tr`（root=0）推出
  `tr = empty`（helper `store_tree_zero`），而 `tree_mirror empty = empty`，故成立。
- `invert_tree_return_wit_2`（`root != NULL` 分支）：核心纯等式
  `tree_mirror (make_tree tr1 tr2) = make_tree (tree_mirror tr2) (tree_mirror tr1)`，
  由 `tree_mirror` 定义直接成立；空间部分的 `store_tree` 折叠由 strategy 自动完成。

手动 witness：2 个，均 `Qed`，无 `Admitted`。

## 复现

```bash
linux-binary/symexec \
  --goal-file=QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_goal.v \
  --proof-auto-file=QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_auto.v \
  --proof-manual-file=QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_manual.v \
  -slp QCIPLib/binaryTree/common/ QCIPLib.binaryTree.common \
  -IQCIPLib/binaryTree/common/ \
  --coq-logic-path=QCIPCases.binaryTree.binaryTree_invert \
  --input-file=INPUT/binaryTree/binaryTree_invert/binaryTree_invert.c --no-exec-info
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_goal.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_goal_check.v
```

`binaryTree_invert_goal_check.v` 编译通过 ⇒ 全部验证条件成立。
