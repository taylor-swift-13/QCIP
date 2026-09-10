# xizi_double_link_init_then_len 验证交付

本目录保存 `xizi_double_link_init_then_len` 的最终 accepted 交付。`source/` 是带 annotation 的 C 源码，`rocq/` 包含 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics 快照，`reports/` 保存 controller 日志、accepted round/group handoff、checkpoint 和复用入口。

验证状态：controller run `xizi_double_link_init_then_len-20260808222000` 已到 `done`。`source_version` 为 `1b7370178254c96470476f0f35b7a30ef2a32cb4fd7e1c2ca977de5327889088`，`source_goal_version` 为 `f432bf1bba9d2939995f36d1aec7da461a583b29c64bf5a4c8a8a0ba7b3abffb`，7 个 manual witnesses 全部完成。

## 与单链表对齐

该调用点验证 `init` 建立的 `xizi_dll(head, nil)` 可以直接供长度函数的 `nil_case` 特化使用，返回 `0` 并保持空 DLL。standalone `xizi_double_link_len` 的一般公共规格保持不变：仍以抽象节点序列为输入，返回 `Zlength nodes`；公开规格没有额外暴露非空或 `UINT_MAX` 前提。

双链表相对单链表的必要差异只在内部证明：循环 invariant 同时维护前后向链接和 DLL 段，计数不回绕从实际双向节点字段 ownership 推出。

## 复现

canonical symbolic execution 必须保留 `-IQCP_examples/QCP_demos_LLM/`，以及 `QCP_examples/QCP_demos_LLM/ -> SimpleC.EE.QCP_demos_LLM` 和 `QCIPLib/xizi/xizi_double_link_common/ -> QCIPLib.xizi.xizi_double_link_common` 两组 `-slp`。fresh 输出应写到临时目录，不能覆盖已证明 manual。

固定 Rocq 检查：

    python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi-double-link-init-then-len-coq --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_init_then_len/source/xizi_double_link_init_then_len_goal_check.v --target-kind check --source-goal-version f432bf1bba9d2939995f36d1aec7da461a583b29c64bf5a4c8a8a0ba7b3abffb

完整 controller 和 accepted workflow 证据位于 `reports/controller/` 与 `reports/workflow/`。diagnostics split goals 只用于规划，不是 target witnesses。
