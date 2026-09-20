# crtos AVL input inventory

The source module contains 13 functions.  All 13 now have an individual input
directory under `INPUT/xizi`; each directory contains one target C function, a
minimal `xizi_avl_def.h`, and a syntax-check script.

## Formal model

New insert/delete/search/balance verification should use
`QCIPLib/xizi/xizi_avl_common/xizi_avl_graph_lib.v` together with
`xizi_avl_graph_def.h`.  This model follows the repository's BST graph model:
an AVL state contains a `BinarySearchTreeType addr` plus a cached-height map.
Its validity separately states BST ordering, exact cached-height equations and
the AVL balance bound.  Its `avl_tree_store` owns the four concrete fields of
every graph vertex through `iter_sepcon`.

The earlier address-labelled recursive model remains available for the six
already verified cases.  Keeping both models during migration avoids making
their accepted proofs stale; new mutating cases should use only the graph
model.

The graph lib passes the repository fixed `coq_tooling.py check` with Coq
8.20.1.  Its header has also been loaded by canonical symbolic execution, and
all 13 AVL input syntax-check scripts pass after the seven new cases were
switched to this shared header.

| Upstream function | QCIP input |
| --- | --- |
| `AvlTreeGetNodeHeight` | `xizi_avl_height` |
| `AvlTreeGetNodeBalanceFactor` | `xizi_avl_balance_factor` |
| `AvlTreeSetRightRotate` | `xizi_avl_right_rotate` |
| `AvlTreeSetLeftRotate` | `xizi_avl_left_rotate` |
| `AvlTreeSetLRRotate` | `xizi_avl_lr_rotate` |
| `AvlTreeSetRLRotate` | `xizi_avl_rl_rotate` |
| `AvlTreeBalance` | `xizi_avl_balance` |
| `AvlTreeInsertNode` | `xizi_avl_insert` |
| `AvlTreeFindPreNode` | `xizi_avl_find_pre_node` |
| `AvlTreeDeleteLeafNode` | `xizi_avl_delete_leaf_node` |
| `AvlTreeDeleteNode` | `xizi_avl_delete` |
| `AvlNodeModifyNode` | `xizi_avl_modify` |
| `AvlNodeSearchNode` | `xizi_avl_search` |

`xizi_avl_upstream/` contains the unmodified source/header snapshot and exact
provenance.  The first six cases predated this inventory and already have QCIP
verification artifacts.  The final seven are organized inputs only; they are
not represented as verified cases.

Two upstream behaviors are intentionally kept for later verification rather
than silently repaired:

- `AvlTreeBalance` may return `NULL` when an imbalanced node reaches none of
  its four strict child-balance-factor branches.
- `AvlTreeDeleteLeafNode` assigns a pointer field (or the local root pointer)
  to `NULL` before passing it to `x_free`, so the detached allocation is not
  actually freed.
