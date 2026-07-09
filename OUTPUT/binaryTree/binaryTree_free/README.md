# binaryTree_free — 二叉树递归释放（内存安全）

## 功能

`free_tree(struct tree *root)`：后序递归释放整棵二叉树的所有节点。
叶级原语 `free_tree_node` 释放单个节点（消费其 5 个字段，`Ensure emp`）。

## 规格（内存安全）

```
void free_tree_node(struct tree *p)
    With k v h l r
    Require single_tree_node(p, k, v, h, l, r)
    Ensure  emp
;

void free_tree(struct tree *root)
    With tr
    Require store_tree(root, tr)
    Ensure  emp
```

`store_tree(root, tr) ⇒ emp` 精确刻画了**无内存泄漏**（整棵树的资源被完全消费为空）
与**无 double free / 无悬垂访问**（分离逻辑保证每个节点资源恰好被释放一次）。

## 证明说明

无手动 witness——所有验证条件由 proof_auto + `binaryTree.strategies` 的
`store_tree` 展开/折叠规则全自动判定（`binaryTree_free_proof_manual.v` 无需填写证明）。

## 复现

```bash
linux-binary/symexec \
  --goal-file=QCIPCases/binaryTree/binaryTree_free/binaryTree_free_goal.v \
  --proof-auto-file=QCIPCases/binaryTree/binaryTree_free/binaryTree_free_proof_auto.v \
  --proof-manual-file=QCIPCases/binaryTree/binaryTree_free/binaryTree_free_proof_manual.v \
  -slp QCIPLib/binaryTree/common/ QCIPLib.binaryTree.common \
  -IQCIPLib/binaryTree/common/ \
  --coq-logic-path=QCIPCases.binaryTree.binaryTree_free \
  --input-file=INPUT/binaryTree/binaryTree_free/binaryTree_free.c --no-exec-info
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_free/binaryTree_free_goal.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_free/binaryTree_free_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_free/binaryTree_free_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_free/binaryTree_free_goal_check.v
```
