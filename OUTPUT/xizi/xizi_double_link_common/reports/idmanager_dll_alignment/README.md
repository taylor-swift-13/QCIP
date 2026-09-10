# 原 DLL 接口迁移与指定源码验证（已完成）

范围为指定 `double_link.c` 的 8 个函数和相邻 `single_link.c` 的 9 个函数，使用原函数名。额外组合、递归包装与调用点示例不列入独立目标。完整清单见 [function_scope.md](function_scope.md)。17 个原函数当前版本统一复验已通过；逐函数证据以 [migration_inventory.json](migration_inventory.json) 和 controller 报告为准。

源码对齐时发现旧本地版本改写了两处函数体：`DoubleLinkListGetHead` 内联了判空调用，`SingleLinkListGetTailNode` 改写了遍历循环。本轮恢复原文件中的调用和循环，再重新生成目标与证明；其余原函数的既有对照差异仅涉及已核实的 NULL 宏表示或单语句循环花括号。逐函数源码对照和最终证据分别保存在 `upstream_source_comparison.json` 及各函数 `reports/executable_c_comparison.json`。

## 已通过的公共库兼容性

定义基准是 `crtosverify/master` 的 `lib/dll.v`，commit `d215f73b69916cc5c7c01af752bca4b6f96b3530`。公共库已经 controller final-apply 和 final-check，主工作区文件 SHA256 与实际原证明编译使用的文件一致：`2aa44db212fe9abc6dac6dc11e49a10fb4783c01c549bded57e89acd5cfa3384`，见 [common_adoption_check.json](common_adoption_check.json)。

| 模块 | 断言模型 | 字段结构名 | 用途 |
|---|---|---|---|
| DLL | CRules.expr | DoubleLinklistType | master 参考接口 |
| XiziIdmanagerDLL | CRules.expr | SysDoubleLinklistNode | origin/idnode 原证明入口 |
| XiziLocalDLL | naive_C_Rules.expr | SysDoubleLinklistNode | 本地实际 QCP C 用例 |

三个模块共享 `DLL.DL_Node`、构造器与真正投影的 notation 别名。公共谓词不添加参考定义没有的 guards。不同字段结构名不通过公理判等；两种断言模型不互相强制转换。五个谓词、19 个参考引理及参数声明的 82 项静态检查通过，见 [接口对应](interface_correspondence.md) 和 [定义审计](spec_definition_candidate_audit.json)。地址列表通过 `DL_Node unit`、`emp` 及已证明的地址/载荷投影连接；历史带 guards 模型仍只作为旧依赖保留。

## 原证明实际导入编译

本地 master 只有四个库文件，没有 VC 证明。验收采用本地 `origin/idnode` commit `84cbcc4e32c231ffc1de8fdf9f555fbb83a49317` 中现有的六组原证明：AllocId、FreeId、GetObj、IdInsertObj、InsertObj、RemoveObj；同时编译 master 原 `idnode.v`。不能把这些称为 master 中不存在的 VC 证明。

上述六组 goal_check 及 master 原 idnode 库已通过新公共库实际导入编译，耗时 570.605 秒。除了 Require/From 导入路径，原证明和定理文本逐字不变；全部 fixture 哈希、公共库依赖解析路径与哈希、编译期间源码稳定性均已核对。证据见 [local/manifest.json](compatibility_checks/local/manifest.json) 和同目录 `coqc_stdout.json`。测试过的库入口及原证明导入副本保存在 [compatibility_source_archive](compatibility_source_archive/)。

必要兼容调整都在库侧：按原布局导出实例，并使用 `Arguments sizeof_front_end_type _ : simpl never.` 保持当前依赖下原证明的 simpl 匹配行为。原分支已存在的 `store_dll_head_prev_next_nonzero` 假设只保留在冻结兼容入口，未加进新公共库。

原证明已有 1 条库级 nonzero 公理、82 个生成 auto Admitted 和 18 个 Abort 诊断。另有 123 个 goal Module Type Axiom 是由 goal_check 实现检查的接口义务。编译兼容通过不代表这些原有假设和自动占位已被证明。维护的公共库、case_lib 与 manual proofs 按严格无新增 Admitted/额外 Axiom 规则检查。

## 复现

在仓库根目录运行，使用新的隔离构建目录：

```sh
python3 OUTPUT/xizi/xizi_double_link_common/reports/idmanager_dll_alignment/check_idmanager_imports.py --mode local --work-root worktrees/idmanager-local-recheck-$(date +%Y%m%d%H%M%S)
```

脚本只通过主工作区 `coq_tooling.py check` 执行固定编译，从源码构建依赖，不复制上游 `.vo`。需要保留先前 `compatibility_checks/local/` 时，应在复现前另存该证据目录。原 C 快照和对照见 `input_snapshots/upstream/`、`upstream_source_comparison.json`；各函数中文 README 给出 canonical symexec 和固定 Coq 复现命令。

## 过程记录

`compatibility_checks/baseline/` 保存原分支在当前 sizeof simpl 行为下的失败；`baseline_compat/` 保存仅增加库侧展开控制后六组原证明通过的基线。`local_attempt1_model_mismatch/` 保存首次实际导入揭示的断言模型不兼容。最终三实例版本已经解决此差异；旧失败记录不作为当前结论。

单函数接受只来自 controller：annotation、VC 检查、group proof、parent verification、final-apply 和 final-check。阶段及清理耗时保存在每个函数的 `reports/controller/timing_review.json`；未完整计时的主 agent 活动、等待和失败重跑明确记作 unknown。

最终统一检查：`suite_audits/20260910072705/audit.json`，17 个函数均通过 freshness、严格结构审计和固定 Coq 编译。汇总见 [final_summary.json](final_summary.json)。

重新检查本次 17 个函数的当前版本（从仓库根目录运行；生成独立时间戳报告并清理构建目录）：

```sh
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/idmanager_dll_alignment/audit_completed_suite.py --cleanup
```

本次本地共完成 72 个 manual VC；生成 auto 文件保留的 21 个 Admitted 单独计数，不计为已完成的 manual 证明。未修改的策略依赖及其基线扫描见统一审计的 `existing_strategy_dependencies`。
