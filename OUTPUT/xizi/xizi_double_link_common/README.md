# xizi_double_link_common

这是 DLL case 共用的分离逻辑库交付副本。active source 位于 `QCIPLib/xizi/xizi_double_link_common/`。

- `source/xizi_double_link_def.h`：C 结构与 common import/谓词声明快照。
- `source/xizi_double_link.strategies`：共享展开、折叠与非空链表策略。
- `rocq/xizi_double_link_lib_core.v`：参数化 DLL segment/head 基础定义。
- `rocq/xizi_double_link_lib.v`：`xizi_dllseg`、`xizi_dll` 及 nil/cons/append 等引理。
- `rocq/xizi_double_link_strategy_goal.v`、`xizi_double_link_strategy_proof.v`：策略 VC 与证明。

本 common 已通过 fixed `coq_tooling.py check`。case 的实际依赖仍指向 `QCIPLib`；此目录是完整发布快照。

