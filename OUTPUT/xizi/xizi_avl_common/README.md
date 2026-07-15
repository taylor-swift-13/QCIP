# xizi_avl_common

这是 AVL case 共用的分离逻辑库交付副本。active source 位于 `QCIPLib/xizi/xizi_avl_common/`。

- `source/xizi_avl_def.h`：AVL 结构、共享谓词与策略导入。
- `source/xizi_avl.strategies`：`store_addr_avl`、node fields、shape 的展开/折叠策略。
- `rocq/xizi_avl_lib_core.v`：带节点地址、data、cached height 和左右子树的数学模型，以及精确旋转关系。
- `rocq/xizi_avl_lib.v`：具体内存谓词及 fold/unfold 引理。
- `rocq/xizi_avl_strategy_goal.v`、`xizi_avl_strategy_proof.v`、`xizi_avl_strategy_goal_check.v`：策略 VC、证明与检查入口。

策略模式变量已避开 QCP lexer 的 `left/right` 关键字。common 已通过 fixed Rocq 编译和实际 QCP strategy parser 加载；case 的实际依赖仍指向 `QCIPLib`，此目录是发布快照。

