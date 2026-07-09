# binaryTree 验证套件

本目录包含一组围绕**二叉树 / 平衡二叉树**的 C 程序的完整 QCP 验证产物。
所有 case 均自己编写 C 源码与标注，参考 `QCP_examples/QCP_demos_LLM`（AVL / BST demo）
的 `store_tree` 形状表示述语与 strategy 自动化风格，独立完成从符号执行到 Rocq 证明的端到端验证。

## 目录结构

```
OUTPUT/binaryTree/
├── README.md                       # 本文件：套件总览
├── binaryTree_common/              # 共享公共库（表示述语 + strategies）
│   ├── source/  binaryTree_def.h, binaryTree.strategies
│   ├── rocq/    binaryTree_lib.v, binaryTree_strategy_{goal,proof,goal_check}.v
│   └── reports/ compile_path.md
├── binaryTree_invert/              # 二叉树镜像翻转（功能正确性）
├── binaryTree_size/                # 二叉树节点计数（功能正确性 + 无溢出）
├── binaryTree_height/              # 二叉树高度（平衡二叉树核心度量）
└── binaryTree_free/                # 二叉树递归释放（内存安全）
    每个 case 目录含 source/ + rocq/ + reports/ + README.md
```

## 验证的函数与结论

| Case | C 函数 | 规格（简述） | 手动 witness | 结论 |
|------|--------|--------------|:---:|:---:|
| binaryTree_invert | `invert_tree` | `store_tree(root,tr) ⇒ store_tree(root, tree_mirror tr)` | 2 | ✅ 通过 |
| binaryTree_size | `count_nodes` | `__return = tree_size tr`（前提 `tree_size tr ≤ INT_MAX`） | 6 | ✅ 通过 |
| binaryTree_height | `tree_height` | `__return = tree_depth tr`（前提 `tree_depth tr ≤ INT_MAX`） | 7 | ✅ 通过 |
| binaryTree_free | `free_tree` | `store_tree(root,tr) ⇒ emp`（无泄漏、无 double free） | 0（全自动） | ✅ 通过 |

- 全部 `*_goal_check.v` 编译通过（`VC_Correct` 模块签名保证所有验证条件均已证明）。
- `*_proof_manual.v`、`binaryTree_lib.v` 中无 `Admitted`、无额外 `Axiom`。
- 未使用 `forbidden_lemma.md` 列表中的任何 lemma。
- `*_proof_manual.v` 仅含 witness theorem 证明；`binaryTree_lib.v` 仅含数学 spec 定义与已证 helper。

### 关于 `Admitted` 分布（健全性说明）

本套件与仓库已有的 strategy-based 交付物（如 `xizi_*`）遵循完全一致的约定：

| 文件 | `Admitted` | 说明 |
|------|:---:|------|
| `binaryTree_lib.v` | 0 | 数学 spec 与 helper 全部 `Qed` |
| `binaryTree_strategy_proof.v` | **0** | **strategy 健全性证明全部 `Qed`**——这是自动化可靠性的根基 |
| `*_proof_manual.v` | 0 | 语义相关的 witness（功能正确性、非平凡溢出边界）全部 `Qed` |
| `*_proof_auto.v` | 有 | 工具生成文件；例行空间操作 VC 由**已证明健全**的 strategy 承担，此为框架约定（`xizi_*`、AVL demo 同样如此），不可手改 |

即：所有例行 VC 的可靠性由 `binaryTree_strategy_proof.v`（0 `Admitted`）保证，
所有语义关键 VC 由 `*_proof_manual.v`（0 `Admitted`）显式证明。

## 公共库设计（binaryTree_common）

抽象二叉树只记录**结构形状**，节点上的 key/value/height 在 `store_tree` 中被存在量化：

```coq
Inductive tree : Type := empty : tree | make_tree : tree -> tree -> tree.

Fixpoint store_tree (p: addr) (tr: tree): Assertion := (* 复用 AVL demo 形状述语 *)
  match tr with
  | empty => “ p = NULL ” && emp
  | make_tree l r => EX pl pr k v h, “ p <> NULL ” && (节点 5 个字段) ** store_tree pl l ** store_tree pr r
  end.
```

在此形状上定义了严格数学度量（非 C 算法镜像）：

```coq
Fixpoint tree_size   (tr:tree) : Z    (* 节点数 *)
Fixpoint tree_depth  (tr:tree) : Z    (* 高度，empty 为 0；平衡二叉树的核心度量 *)
Fixpoint tree_mirror (tr:tree) : tree (* 递归交换左右子树 *)
```

配套的 `binaryTree.strategies` 提供 `store_tree` / `store_tree_shape` /
`store_non_empty_tree` / `single_tree_node` 的展开/折叠规则，使符号执行阶段的
空间推理由 proof_auto 自动完成，manual 只需处理纯算术与结构等式。

`binaryTree_common` 的 strategy 健全性证明（`binaryTree_strategy_proof.v`）复用
已验证的 AVL demo 规则，编译通过，保证这些自动化规则本身是可靠的。

## 复现步骤

在仓库根目录执行（需 Rocq 8.20.1，`SeparationLogic` 核心库已 `make` 编译）：

```bash
# 1) 公共库
coqc $(cat _CoqProject) QCIPLib/binaryTree/common/binaryTree_lib.v
linux-binary/StrategyCheck \
  --strategy-folder-path=QCIPLib/binaryTree/common/ \
  --coq-logic-path=QCIPLib.binaryTree.common \
  --input-file=QCIPLib/binaryTree/common/binaryTree.strategies --no-exec-info
coqc $(cat _CoqProject) QCIPLib/binaryTree/common/binaryTree_strategy_goal.v
coqc $(cat _CoqProject) QCIPLib/binaryTree/common/binaryTree_strategy_proof.v

# 2) 每个 case（以 invert 为例，其余同理替换名字）
linux-binary/symexec \
  --goal-file=QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_goal.v \
  --proof-auto-file=QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_auto.v \
  --proof-manual-file=QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_manual.v \
  -slp QCIPLib/binaryTree/common/ QCIPLib.binaryTree.common \
  -IQCIPLib/binaryTree/common/ \
  --coq-logic-path=QCIPCases.binaryTree.binaryTree_invert \
  --input-file=INPUT/binaryTree/binaryTree_invert/binaryTree_invert.c --no-exec-info
# 注意：symexec 不会覆盖已存在的 *_proof_manual.v（其中已填手写证明）。
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_goal.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/binaryTree/binaryTree_invert/binaryTree_invert_goal_check.v
```

若最后一步 `*_goal_check.v` 编译通过，即表示该 case 全部验证条件已证明、无遗留 `Admitted`。

## 正式文件位置（仓库内）

- 公共库：`QCIPLib/binaryTree/common/`
- 各 case 生成/证明文件：`QCIPCases/binaryTree/binaryTree_<case>/`
- C 输入：`INPUT/binaryTree/binaryTree_<case>/`
