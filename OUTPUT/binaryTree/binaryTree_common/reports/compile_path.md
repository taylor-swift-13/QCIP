# 编译路径记录 — binaryTree_common

- repository: `/home/yangfp/QCIP`
- 公共库正式文件：
  - `QCIPLib/binaryTree/common/binaryTree_lib.v`（表示述语 + 数学度量 + 已证 helper）
  - `QCIPLib/binaryTree/common/binaryTree.strategies`（strategy 源）
  - `QCIPLib/binaryTree/common/binaryTree_strategy_goal.v`（StrategyCheck 生成）
  - `QCIPLib/binaryTree/common/binaryTree_strategy_proof.v`（StrategyCheck 生成，健全性证明）
  - `QCIPLib/binaryTree/common/binaryTree_def.h`（C 端 Extern Coq 绑定 + include strategies + import lib）
- logical path：
  - `QCIPLib.binaryTree.common.binaryTree_lib`
  - `QCIPLib.binaryTree.common.binaryTree_strategy_goal`
  - `QCIPLib.binaryTree.common.binaryTree_strategy_proof`
- path rule：`_CoqProject` 中 `-R QCIPLib QCIPLib`
- 设计来源：形状述语 `store_tree` 复用 `QCP_examples/QCP_demos_LLM/avl_shape.v` /
  `avl.strategies`（已验证 AVL demo），保证 strategy 规则本身健全；在其上新增
  `tree_size` / `tree_depth` / `tree_mirror` 三个纯数学度量与 `store_tree_zero` helper。
- compile status: passed（`binaryTree_strategy_goal_check.v` 编译通过）

```sh
coqc $(cat _CoqProject) QCIPLib/binaryTree/common/binaryTree_lib.v
linux-binary/StrategyCheck \
  --strategy-folder-path=QCIPLib/binaryTree/common/ \
  --coq-logic-path=QCIPLib.binaryTree.common \
  --input-file=QCIPLib/binaryTree/common/binaryTree.strategies --no-exec-info
coqc $(cat _CoqProject) QCIPLib/binaryTree/common/binaryTree_strategy_goal.v
coqc $(cat _CoqProject) QCIPLib/binaryTree/common/binaryTree_strategy_proof.v
coqc $(cat _CoqProject) QCIPLib/binaryTree/common/binaryTree_strategy_goal_check.v
```
