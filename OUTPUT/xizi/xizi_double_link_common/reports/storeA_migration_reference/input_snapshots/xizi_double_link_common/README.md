# xizi_double_link_common

这是 12 个 DLL 函数 case 与 2 个真实调用点（`init -> empty`、`init -> len`）共用的分离逻辑库交付副本。active source 位于
`QCIPLib/xizi/xizi_double_link_common/`；`crtosverify/lib/dll.v` 只作为设计来源，
当前交付不依赖也不修改 crtos 仓库。

- `source/xizi_double_link_def.h`：C 结构与 common import/谓词声明快照。
- `source/xizi_double_link.strategies`：共享展开、折叠与非空链表策略。
- `rocq/xizi_double_link_lib.v`：`DLL_LAYOUT`、可复用 `AddrDLL(Layout)`、
  xizi 布局实例、`xizi_dllseg`/`xizi_dll` 及基础代数引理。
- `rocq/xizi_double_link_strategy_goal.v`、`xizi_double_link_strategy_proof.v`：策略 VC 与证明。
- `reports/strict_refresh_comparison.json`：各 case accepted annotation round 的 canonical symexec / source-goal freshness 汇总。
- `reports/full_suite_check.json`：整套 fixed `coq_tooling.py check` 证据。
- `reports/final_structure_audit.json`：manual/case_lib 与 23 项 forbidden 规则审计。
- `reports/output_layout_audit.json`：14 个 case 的标准报告与输入/生成物快照完整性审计。
- `reports/checkpoint.json`、`reuse_packet.json`、`run_manifest.json`：收尾状态与复用入口。

设计先参考单链表的公开接口，再落实双链表的前后向 ownership。字段寻址使用真实
C tag `SysDoubleLinklistNode`；sentinel/head 显式非空；非空 segment 明确要求当前
节点非空且不等于 stop；新节点只要求可写的 undefined next/prev ownership。

本 common 已由真实 `init -> empty` 与 `init -> len` 调用点验证可调用性，再通过全部 14 个目标的
统一 fixed `coq_tooling.py check`。case 的实际依赖仍指向
`QCIPLib`；此目录是完整发布快照。
