# xizi_double_link_head 验证交付

本目录保存 xizi_double_link_head 的最终 accepted 交付。source/ 是带 annotation 的 C 源码，rocq/ 包含 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics 快照，reports/ 保存本 case 的 checkpoint 和复用入口。

验证状态：controller run `xizi_double_link_head-20260809003517` 已到 `done`，final-check 已通过；本 case 的 `source_goal_version` 为 `a23a57064b3c11a1c031e50514283e7ed25d94182b4041b9f8b5fbc21cde71bb`，manual witness 数为 2。

复现顺序：

1. 在仓库根目录使用 linux-binary/symexec，保留 -IQCP_examples/QCP_demos_LLM/，并同时传入 QCP_examples/QCP_demos_LLM/ 到 SimpleC.EE.QCP_demos_LLM 与 QCIPLib/xizi/xizi_double_link_common/ 到 QCIPLib.xizi.xizi_double_link_common 两组 -slp。
2. 不覆盖已经证明的 manual；fresh 输出写到临时目录，再比较 generated 文件和 target witness statement。
3. 使用 .agents/skills/vc-proving/scripts/coq_tooling.py check 编译对应 *_goal_check.v。
4. 套件级复现和精确比对证据见 ../xizi_double_link_common/reports/。

公共 spec：../xizi_double_link_common/rocq/xizi_double_link_lib.v。

## C 语义摘要

读取首节点；空表返回 `NULL`，非空表返回第一个数据节点。循环 sentinel 只属于内部表示，不暴露为 API 返回值。

## Rocq 规格摘要

公开规格与 `xizi_single_link_first` 对齐：只要求 `xizi_dll(linklist,nodes)`，返回 `xizi_double_link_first_value(nodes)`，并原样归还同一 ownership。`xizi_dll` 已蕴含 sentinel 非空，因此不重复公开 `linklist != 0`；case_lib 只定义抽象首元素函数，manual 只保存 target witness proofs。

## 可复现命令

在仓库根目录创建独立临时输出目录后运行 canonical symbolic execution：

    mkdir -p /tmp/xizi_double_link_head-symexec
    linux-binary/symexec --goal-file=/tmp/xizi_double_link_head-symexec/xizi_double_link_head_goal.v --proof-auto-file=/tmp/xizi_double_link_head-symexec/xizi_double_link_head_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_head-symexec/xizi_double_link_head_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source --input-file=OUTPUT/xizi/xizi_double_link_head/source/xizi_double_link_head.c --no-exec-info

不要用该命令覆盖已证明的 manual；final-check 应把 fresh 输出写入临时目录再做比较。

通过唯一固定 Rocq 入口编译：

    python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_head-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_head/source/xizi_double_link_head_goal_check.v --target-kind check --source-goal-version a23a57064b3c11a1c031e50514283e7ed25d94182b4041b9f8b5fbc21cde71bb

## 报告与维护

reports/ 中包含 Case Brief、Witness Ledger、Final Checklist、Timing Summary、phase 摘要、输入/生成物快照和标准 checkpoint/reuse artifacts。diagnostics split goals 只用于规划，不能作为 target witness。任何 C annotation、case_lib seed 或 witness statement 变化都会使 checkpoint stale，必须重新执行 controller 流程。
