# xizi_double_link_next 验证交付

本目录保存 xizi_double_link_next 的最终 accepted 交付。source/ 是带 annotation 的 C 源码，rocq/ 包含 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics 快照，reports/ 保存本 case 的 checkpoint 和复用入口。

验证状态：controller run `xizi_double_link_next-20260818002002` 已到 `done`，`final-check` 已通过；本 case 的 `source_goal_version` 为 `47fb665b00a73747a58e4148331d2cea33bd0f8ca0b627c4231a85df43c08175`，manual witness 数为 7。

复现顺序：

1. 在仓库根目录使用 linux-binary/symexec，保留 -IQCP_examples/QCP_demos_LLM/，并同时传入 QCP_examples/QCP_demos_LLM/ 到 SimpleC.EE.QCP_demos_LLM 与 QCIPLib/xizi/xizi_double_link_common/ 到 QCIPLib.xizi.xizi_double_link_common 两组 -slp。
2. 不覆盖已经证明的 manual；fresh 输出写到临时目录，再比较 generated 文件和 target witness statement。
3. 使用 .agents/skills/vc-proving/scripts/coq_tooling.py check 编译对应 *_goal_check.v。
4. 套件级复现和精确比对证据见 ../xizi_double_link_common/reports/。

公共 spec：../xizi_double_link_common/rocq/xizi_double_link_lib.v。

## C 语义摘要

返回给定节点的后继并保持完整双链表 ownership。对普通成员返回抽象序列中的后继；对 sentinel 查询返回首节点，空表返回 `NULL`。

## Rocq 规格摘要

实现使用 `dispatch_case` 强规约，并正式导出调用友好的 `member_case` 与 `sentinel_case`。sentinel 不需求 `In(head,nodes)`。非空分支保留首节点非 NULL 事实，以使调用点能重闭合 `xizi_dll`。manual 只保存 7 个 target witness proofs。

## 可复现命令

在仓库根目录创建独立临时输出目录后运行 canonical symbolic execution：

    mkdir -p /tmp/xizi_double_link_next-symexec
    linux-binary/symexec --goal-file=/tmp/xizi_double_link_next-symexec/xizi_double_link_next_goal.v --proof-auto-file=/tmp/xizi_double_link_next-symexec/xizi_double_link_next_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_next-symexec/xizi_double_link_next_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source --input-file=OUTPUT/xizi/xizi_double_link_next/source/xizi_double_link_next.c --no-exec-info

不要用该命令覆盖已证明的 manual；final-check 应把 fresh 输出写入临时目录再做比较。

通过唯一固定 Rocq 入口编译：

    python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_next-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_next/source/xizi_double_link_next_goal_check.v --target-kind check --source-goal-version 47fb665b00a73747a58e4148331d2cea33bd0f8ca0b627c4231a85df43c08175

## 报告与维护

`reports/` 中包含 Case Brief、Witness Ledger、Final Checklist、Timing Summary、输入/生成物快照，以及本轮 controller/round/group 原始报告。diagnostics split goals 只用于规划，不能作为 target witness。任何 C annotation、case_lib seed 或 witness statement 变化都会使 checkpoint stale，必须重新执行 controller 流程。
