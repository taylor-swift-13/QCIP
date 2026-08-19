# 公共双链表库编译证据

- 入口：`.agents/skills/vc-proving/scripts/coq_tooling.py check`
- Coq：8.20.1
- fixed flags hash：`599d9322d6e5a5d67fc5d91252359c8343507d4c6861dede3304f496e050f2de`
- 最终套件目标：`SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_suite_goal_check.v`
- 调用点导入：`SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_empty.source`、`SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source`
- source goal version：`double-link-suite-single-align-20260809`
- target kind：`check`
- 状态：passed
- 完整套件耗时：259.243 秒

固定入口覆盖公共定义、strategy 与 14 个当前 goal-check；未直接调用 `coqc`、未手写 Coq flags、未使用 Dune 或 Rocq MCP。
