# 双链表弱规约调用点验证

本 case 不重复验证各函数实现，而是在真实 C wrapper 中检查已证明的弱规约能否从调用点拥有的最小资源直接实例化。controller run `xizi_double_link_callpoint_specs-20260818033857` 已到 `done`，`source_goal_version` 为 `f730768681659fb55dc2fe8cdef974a79ba19ba137c70a32797e244b792e5a93`。

## 覆盖

- 11 个 wrapper，13 个显式 `where(case_name)` 调用。
- `init -> empty/empty_rec/head/head_rec/len`。
- `init -> next/next_rec_last/next_rec_middle(head,head)`，使用无 `In(head,nodes)` 前置的 `sentinel_case`。
- `init -> insert_after(head,node)`，使用 `sentinel_case` 构造 singleton。
- singleton 上分别使用 `remove_front_spec` 和 `remove_tail_spec`，返回空表与独立已移除节点。

wrapper 公开前置只包含一个或两个 `xizi_dll_node` ownership。`nodes=nil`、singleton prefix/suffix 和 sentinel 别名都只在前序调用建立后作为局部 Assert 出现。

## 结果

- canonical symbolic execution 到 11 个 wrapper 文件尾，3 次 qcp-mcp 交互轮次均成功。
- 13/13 manual witnesses 已证明；parent merge 通过。
- fixed `coqc_check` return code 0，Coq 8.20.1，fixed flags hash `75b2bdd1edb990c20e7514694fa4303e8d948c120bc1e5ac3813d06caabc3dff`。
- final-check 的 manual 结构、case-lib contract、forbidden lemma 和 cleanup scan 全部通过。

## 复现

在仓库根目录运行 canonical symbolic execution，但将 fresh manual 输出到临时目录，不覆盖已证明文件：

    linux-binary/symexec --goal-file=/tmp/xizi_double_link_callpoint_specs_goal.v --proof-auto-file=/tmp/xizi_double_link_callpoint_specs_proof_auto.v --proof-manual-file=/tmp/xizi_double_link_callpoint_specs_proof_manual.v -IQCP_examples/QCP_demos_LLM/ -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_callpoint_specs.source --input-file=OUTPUT/xizi/xizi_double_link_callpoint_specs/source/xizi_double_link_callpoint_specs.c --no-exec-info

使用唯一固定 Rocq 入口编译：

    python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_callpoint_specs-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_callpoint_specs/source/xizi_double_link_callpoint_specs_goal_check.v --target-kind check --source-goal-version f730768681659fb55dc2fe8cdef974a79ba19ba137c70a32797e244b792e5a93

`reports/workflow/20260818-current/` 保存本轮 annotation、vc-checking、group-worker、parent merge 和 final-check 证据；`rocq/` 为已通过的正式快照。
