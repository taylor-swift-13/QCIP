# xizi_double_link_next_rec_middle 验证交付

本目录保存 xizi_double_link_next_rec_middle 的最终 accepted 交付。source/ 是带 annotation 的 C 源码，rocq/ 包含 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics 快照，reports/ 保存本 case 的 checkpoint 和复用入口。

验证状态：controller run `xizi_double_link_next_rec_middle-20260818002004` 已到 `done`，final-check 已通过；本 case 的 `source_goal_version` 为 `3ba8de191dcfd4c71b547981fedd3435b793bd45ad24b58455b1b1ac3e9d72d1`，manual witness 数为 7。

复现顺序：

1. 在仓库根目录使用 linux-binary/symexec，保留 -IQCP_examples/QCP_demos_LLM/，并同时传入 QCP_examples/QCP_demos_LLM/ 到 SimpleC.EE.QCP_demos_LLM 与 QCIPLib/xizi/xizi_double_link_common/ 到 QCIPLib.xizi.xizi_double_link_common 两组 -slp。
2. 不覆盖已经证明的 manual；fresh 输出写到临时目录，再比较 generated 文件和 target witness statement。
3. 使用 .agents/skills/vc-proving/scripts/coq_tooling.py check 编译对应 *_goal_check.v。
4. 套件级复现和精确比对证据见 ../xizi_double_link_common/reports/。

公共 spec：../xizi_double_link_common/rocq/xizi_double_link_lib.v。

## C 语义摘要

验证递归遍历中间节点时的后继和分段重组。

## Rocq 规格摘要

实现使用 `dispatch_case` 强规约，并导出 `member_case` 与无 `In(head,nodes)` 前置的 `sentinel_case`。case_lib 只保存数学关系及 2 个当前 group suffix 的 proved helper，manual 只保存 7 个 target witness proofs。

## 可复现命令

在仓库根目录创建独立临时输出目录后运行 canonical symbolic execution：

    mkdir -p /tmp/xizi_double_link_next_rec_middle-symexec
    linux-binary/symexec --goal-file=/tmp/xizi_double_link_next_rec_middle-symexec/xizi_double_link_next_rec_middle_goal.v --proof-auto-file=/tmp/xizi_double_link_next_rec_middle-symexec/xizi_double_link_next_rec_middle_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_next_rec_middle-symexec/xizi_double_link_next_rec_middle_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source --input-file=OUTPUT/xizi/xizi_double_link_next_rec_middle/source/xizi_double_link_next_rec_middle.c --no-exec-info

不要用该命令覆盖已证明的 manual；final-check 应把 fresh 输出写入临时目录再做比较。

通过唯一固定 Rocq 入口编译：

    python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_next_rec_middle-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_next_rec_middle/source/xizi_double_link_next_rec_middle_goal_check.v --target-kind check --source-goal-version 3ba8de191dcfd4c71b547981fedd3435b793bd45ad24b58455b1b1ac3e9d72d1

## 报告与维护

reports/ 中包含 Case Brief、Witness Ledger、Final Checklist、Timing Summary、phase 摘要、输入/生成物快照和标准 checkpoint/reuse artifacts。diagnostics split goals 只用于规划，不能作为 target witness。任何 C annotation、case_lib seed 或 witness statement 变化都会使 checkpoint stale，必须重新执行 controller 流程。
