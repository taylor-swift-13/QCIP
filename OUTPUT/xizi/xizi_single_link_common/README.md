# xizi_single_link_common

这是 XiZi 单链表 case 共用分离逻辑库的 OUTPUT 交付。active source
位于 `QCIPLib/xizi/xizi_single_link_common/`；当前不修改或同步
`crtosverify`。

- `source/`：共享 C 结构定义和 strategy 源文件。
- `rocq/xizi_single_link_lib.v`：唯一 public lib，同时包含通用
  `generic_sll*`、`SLL_LAYOUT` / `SLLLib`、XiZi 具体实例和既有引理。
- `rocq/xizi_single_link_strategy_goal.v` 与
  `xizi_single_link_strategy_proof.v`：strategy VC 及证明。
- `reports/`：布局分析、编译路径和兼容性证据。

本次改造只合并原 `core` 文件，保留全部公开符号名和数学语义。
9 个现有单链表 `goal_check` 均通过 fixed `coq_tooling.py check`，
无需修改旧 manual proof。
