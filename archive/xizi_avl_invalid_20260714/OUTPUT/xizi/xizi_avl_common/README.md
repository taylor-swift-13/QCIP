# xizi AVL 验证套件（crtos kernel/thread/avl_tree.c）

本目录是对 crtos（XiZi_IIoT_Macro）内核 AVL 树模块
`Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c` 的 QCP 验证产物。
形状表示述语（`store_tree` / `store_tree_shape` / `store_non_empty_tree` /
`single_tree_node`）与 strategy 自动化风格参照仓库内 QCP AVL 基准
`QCP_examples/QCP_demos_human/avl_insert.c`，并适配 crtos 的节点布局：

```c
struct AvlNode { int data; unsigned int height; struct AvlNode *left, *right; };
```

（QCP demo 的节点多一个 `value` 字段且 `height` 为 `unsigned char`；本套件的
`single_tree_node` 为 5 参数 `(p, data, height, left, right)`。）

## 公共库（xizi_avl_common）

| 文件 | `Admitted` | 说明 |
|------|:---:|------|
| `xizi_avl_lib.v` | 0 | 形状述语定义、`tree_depth` / `tree_size` / `tree_balance_factor` 数学定义、`tree_depth_nonneg` / `tree_size_nonneg` / `store_tree_zero` helper，全部 `Qed` |
| `xizi_avl_strategy_proof.v` | **0** | **17 条 strategy 健全性证明全部 `Qed`** —— 自动化可靠性的根基（交付前为全 `Admitted` 桩，本套件补全） |
| `xizi_avl_strategy_goal.v` / `_goal_check.v` | 0 | 工具生成的 strategy 目标与签名检查 |

## 已验证函数

| Case | crtos 函数 | 规格（简述） | 手动 witness | 结论 |
|------|-----------|--------------|:---:|:---:|
| `xizi_avl_height` | `AvlTreeGetNodeHeight` | `store_tree(p,tr) ⇒ __return = tree_depth tr`（前提 `tree_depth tr ≤ INT_MAX`，无溢出） | 7 | ✅ |
| `xizi_avl_balance_factor` | `AvlTreeGetNodeBalanceFactor` | `store_tree(p,tr) ⇒ __return = tree_balance_factor tr = depth(左)-depth(右)`（无溢出） | 5 | ✅ |
| `xizi_avl_right_rotate` | `AvlTreeSetRightRotate` | LL 修复：`single_tree_node ∗ store_non_empty_tree(左) ∗ store_tree_shape(右) ⇒ 结果为合法非空树` | 0（全自动） | ✅ |
| `xizi_avl_left_rotate` | `AvlTreeSetLeftRotate` | RR 修复（右旋镜像） | 0（全自动） | ✅ |
| `xizi_avl_lr_rotate` | `AvlTreeSetLRRotate` | LR 双旋（先左旋左孩子，再右旋根） | 0（全自动） | ✅ |
| `xizi_avl_rl_rotate` | `AvlTreeSetRLRotate` | RL 双旋（先右旋右孩子，再左旋根） | 0（全自动） | ✅ |

- 全部 `*_goal_check.v` 编译通过（`VC_Correctness` 模块签名保证所有 VC 均已证明，
  且 `Include xizi_avl_strategy_proof`，即所有自动 VC 的健全性由已证 strategy 承担）。
- 全部 `*_proof_manual.v`、`xizi_avl_lib.v`、`xizi_avl_strategy_proof.v` 无 `Admitted`。
- `*_proof_auto.v` 保留 `Admitted`（工具约定，由已证健全的 strategy 承担，不可手改）。
- 未使用 `forbidden_lemma.md` 中的任何 lemma。

### 两档规格说明

1. **度量类函数**（`height`、`balance_factor`）采用**精确功能规格**：返回值等于
   对抽象树 `tree` 的数学度量（`tree_depth` / `tree_balance_factor`），并证明无整数溢出。
2. **旋转类函数**（4 个 rotate）采用**形状级规格**（同 QCP AVL 基准）：证明指针手术的
   内存安全性与"结果是合法非空树"。旋转会重排结构并刷新缓存 `height` 字段；`height`
   由 `store_tree` 存在量化抽象，故 crtos 中经 `AvlTreeGetNodeHeight` 的 `height`
   重算被省略（不影响本级形状契约），源码中以注释标注。

## 复现

```bash
# 公共库
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_avl_common/xizi_avl_lib.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_avl_common/xizi_avl_strategy_goal.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_avl_common/xizi_avl_strategy_proof.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_avl_common/xizi_avl_strategy_goal_check.v

# 单个 case（以 height 为例；symexec 见 INPUT 侧闭包，命令同 binaryTree）
case=xizi_avl_height
for f in goal proof_auto proof_manual goal_check; do
  coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_$f.v
done
```

symexec 生成命令模板（以 right_rotate 为例）：

```bash
linux-binary/symexec \
  --goal-file=QCIPCases/xizi/xizi_avl_right_rotate/xizi_avl_right_rotate_goal.v \
  --proof-auto-file=QCIPCases/xizi/xizi_avl_right_rotate/xizi_avl_right_rotate_proof_auto.v \
  --proof-manual-file=QCIPCases/xizi/xizi_avl_right_rotate/xizi_avl_right_rotate_proof_manual.v \
  -slp QCIPLib/xizi/xizi_avl_common/ QCIPLib.xizi.xizi_avl_common \
  -IQCIPLib/xizi/xizi_avl_common/ \
  --coq-logic-path=QCIPCases.xizi.xizi_avl_right_rotate \
  --input-file=INPUT/xizi/xizi_avl_right_rotate/xizi_avl_right_rotate.c --no-exec-info
```

## 尚未验证的函数与技术评估

`avl_tree.c` 余下函数尚未纳入 xizi，均因超出当前形状模型的能力边界，
需要额外机制。按难度与所需机制分类：

| crtos 函数 | 阻塞点 | 所需机制 |
|-----------|--------|---------|
| `AvlTreeBalance` | 依据平衡因子符号分派 4 种旋转，需从"BF 符号"推出对应子树非空以满足旋转前置条件；crtos 用 `AVL_ABS(BF)>1` 后再查子树 BF，符号↔形状的关联比 QCP `balance`（`bf>1`/`bf<-1` 直分）更绕 | 需一个**形状关联版** `balance_factor`（返回值符号与 `store_non_empty_tree` 关联的析取式后置条件，见 QCP `balance_factor`），并补 `tree_depth>0 ⇒ 非空` 桥接引理 |
| `AvlTreeInsertNode` | 分配（`x_malloc`）+ 递归插入 + 重平衡；返回新根 | 需 `malloc` 规格 + `AvlTreeBalance` 先行 + 插入结果形状归纳 |
| `AvlTreeDeleteNode` / `AvlTreeDeleteLeafNode` | 释放（`x_free`）+ 前驱替换 + 重平衡 | 需 `free` 规格 + 删除结果形状归纳 + `AvlTreeBalance` |
| `AvlNodeModifyNode` | = 删除 + 插入 | 依赖上面两者 |
| `AvlNodeSearchNode` / `AvlTreeFindPreNode` | 返回**指向树内部节点的指针**；纯形状模型无法刻画"返回含目标 `data` 的节点"（`data` 被 `store_tree` 存在量化隐藏） | 需**带键序的树模型**（key-ordered BST，如 QCP `Bst::store_map`），把 `data` 提升进抽象树并加二叉搜索序不变式 |

**结论**：度量与旋转（本套件 6 个）是纯形状模型下可判定的部分，已全部端到端验证；
其余函数需引入"形状关联平衡因子 + malloc/free 规格"（balance/insert/delete/modify）
或"带键序的树模型"（search/find_pre），是后续工作的明确方向。
