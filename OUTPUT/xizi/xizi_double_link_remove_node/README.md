# xizi_double_link_remove_node 验证交付

本目录保存 xizi_double_link_remove_node 的最终 accepted 交付。source/ 是带 annotation 的 C 源码，rocq/ 包含 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics 快照，reports/ 保存本 case 的 checkpoint 和复用入口。

验证状态：controller run `xizi_double_link_remove_node-20260817134125` 已到 `done`，final-check 已通过；本 case 的 `source_goal_version` 为 `1c849d11baac6ce4019b27ec691382628d97fff824a20cf973449e11d94988a0`，manual witness 数为 3。

复现顺序：

1. 在仓库根目录使用 linux-binary/symexec，保留 -IQCP_examples/QCP_demos_LLM/，并同时传入 QCP_examples/QCP_demos_LLM/ 到 SimpleC.EE.QCP_demos_LLM 与 QCIPLib/xizi/xizi_double_link_common/ 到 QCIPLib.xizi.xizi_double_link_common 两组 -slp。
2. 不覆盖已经证明的 manual；fresh 输出写到临时目录，再比较 generated 文件和 target witness statement。
3. 使用 .agents/skills/vc-proving/scripts/coq_tooling.py check 编译对应 *_goal_check.v。
4. 套件级复现和精确比对证据见 ../xizi_double_link_common/reports/。

公共 spec：../xizi_double_link_common/rocq/xizi_double_link_lib.v。

## C 语义摘要

摘除目标节点并重连前驱与后继，恢复环形双链表。

## Rocq 规格摘要

公共 `xizi_dll` 持有非空 sentinel 的 next/prev 与有限双链表段。此函数保留精确的 `strong_spec`，并只增加一个有调用价值的弱规约 `remove_member_spec <= strong_spec`：调用者只需提供 `In(linklist_node,nodes)` 与 `xizi_dll(head,nodes)`，即可得到删除该节点第一次出现后的双链表，以及重置为自环的独立节点 `xizi_dll(linklist_node@pre,nil)`。没有增加无调用证据的 front/tail 规约。

`xizi_dll_remove_first` 是纯列表变换；`xizi_dll_remove_first_split__spec_derivations_direct` 从成员关系构造 strong spec 所需的 prefix/suffix，并证明弱规约由强规约直接派生。合法 `xizi_dll` 的分离所有权排除了同一节点地址重复出现，因此这里的“第一次出现”也就是唯一出现。

## 可复现命令

在仓库根目录创建独立临时输出目录后运行 canonical symbolic execution：

    mkdir -p /tmp/xizi_double_link_remove_node-symexec
    linux-binary/symexec --goal-file=/tmp/xizi_double_link_remove_node-symexec/xizi_double_link_remove_node_goal.v --proof-auto-file=/tmp/xizi_double_link_remove_node-symexec/xizi_double_link_remove_node_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_remove_node-symexec/xizi_double_link_remove_node_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source --input-file=OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node.c --no-exec-info

不要用该命令覆盖已证明的 manual；final-check 应把 fresh 输出写入临时目录再做比较。

通过唯一固定 Rocq 入口编译：

    python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_remove_node-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node_goal_check.v --target-kind check --source-goal-version 1c849d11baac6ce4019b27ec691382628d97fff824a20cf973449e11d94988a0

## 报告与维护

reports/ 中包含 Case Brief、Witness Ledger、Final Checklist、Timing Summary、phase 摘要、输入/生成物快照和标准 checkpoint/reuse artifacts。3 个 target witnesses 分别验证实现切分、删除后重连，以及 `remove_member_spec` 从 `strong_spec` 的派生。diagnostics split goals 只用于规划，不能作为 target witness。final-check 的固定 Rocq 检查、manual 结构、case_lib contract、forbidden lemma 和 cleanup scan 均通过；严格隔离的 final symexec refresh 因当前 OUTPUT 布局未配置而记录为 skipped，生成文件的新鲜度由 accepted annotation round 的 canonical symexec 与绑定的 witness hashes 保证。
