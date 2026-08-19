# xizi_double_link_insert_after 验证交付

本目录保存 xizi_double_link_insert_after 的最终 accepted 交付。source/ 是带 annotation 的 C 源码，rocq/ 包含 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics 快照，reports/ 保存本 case 的 checkpoint 和复用入口。

验证状态：controller run `xizi_double_link_insert_after-20260818002001` 已到 `done`，final-check 已通过；本 case 的 `source_goal_version` 为 `aed62eb4352aeac5871ea90cc729e767b5da79d68b814095b50ed8a2a594feae`，manual witness 数为 7。

复现顺序：

1. 在仓库根目录使用 linux-binary/symexec，保留 -IQCP_examples/QCP_demos_LLM/，并同时传入 QCP_examples/QCP_demos_LLM/ 到 SimpleC.EE.QCP_demos_LLM 与 QCIPLib/xizi/xizi_double_link_common/ 到 QCIPLib.xizi.xizi_double_link_common 两组 -slp。
2. 不覆盖已经证明的 manual；fresh 输出写到临时目录，再比较 generated 文件和 target witness statement。
3. 使用 .agents/skills/vc-proving/scripts/coq_tooling.py check 编译对应 *_goal_check.v。
4. 套件级复现和精确比对证据见 ../xizi_double_link_common/reports/。

公共 spec：../xizi_double_link_common/rocq/xizi_double_link_lib.v。

## C 语义摘要

把独立新节点插入目标节点之后并重建双向链接。

## Rocq 规格摘要

实现使用覆盖成员锚点和 sentinel 锚点的 `dispatch_case` 强规约。公开调用接口由 generated derive witnesses 正式导出 `member_case` 和 `sentinel_case`：成员分支在第一次出现后插入，sentinel 分支把新节点放到 `nodes` 头部。两个弱规约都只暴露完整 `xizi_dll` 与独立 `xizi_dll_node`，不暴露 prefix/suffix 或字段值。

合法 `xizi_dll` 的分离所有权排除重复节点地址；数学变换采用 first-occurrence 形式以保持标准列表接口。suffix 为空/非空及双向字段 cut/join 只属于内部 Assert 和证明，不泄露到公开 API。

## 可复现命令

在仓库根目录创建独立临时输出目录后运行 canonical symbolic execution：

    mkdir -p /tmp/xizi_double_link_insert_after-symexec
    linux-binary/symexec --goal-file=/tmp/xizi_double_link_insert_after-symexec/xizi_double_link_insert_after_goal.v --proof-auto-file=/tmp/xizi_double_link_insert_after-symexec/xizi_double_link_insert_after_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_insert_after-symexec/xizi_double_link_insert_after_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source --input-file=OUTPUT/xizi/xizi_double_link_insert_after/source/xizi_double_link_insert_after.c --no-exec-info

不要用该命令覆盖已证明的 manual；final-check 应把 fresh 输出写入临时目录再做比较。

通过唯一固定 Rocq 入口编译：

    python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_insert_after-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_after/source/xizi_double_link_insert_after_goal_check.v --target-kind check --source-goal-version aed62eb4352aeac5871ea90cc729e767b5da79d68b814095b50ed8a2a594feae

## 报告与维护

reports/ 中包含当前 run 的 controller/round/group 证据和输入/生成物快照。7 个 target witnesses 已完成，包括 5 个实现 VC 和 2 个强规约导出弱规约的 VC。final-check 的 fixed Rocq 检查、manual 结构、case-lib contract、forbidden lemma 和 cleanup scan 均通过。
