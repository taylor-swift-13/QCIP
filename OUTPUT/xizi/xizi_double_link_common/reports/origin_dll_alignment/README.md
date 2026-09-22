# DLL 公共入口对齐 origin/idnode（已完成）

8 个原双链表函数统一使用 DLL 命名空间；DLL 采用 SysDoubleLinklistNode 实际布局，MasterDLL 保留 master 参考布局。CRules、逻辑内容、资源与原 C 算法保持不变。9 个单链表函数做当前依赖回归。此前 crules_unification 为旧命名版本证据。


复现入口（仓库根目录执行；各 run 已完成并保留报告）：

```bash
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/origin_dll_alignment/audit_spec_alignment.py
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/origin_dll_alignment/audit_proof_reuse.py
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/origin_dll_alignment/check_idmanager_imports.py --mode local --work-root worktrees/idmanager-public-dll-reproduction
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/origin_dll_alignment/audit_completed_suite.py --cleanup
```

原 origin/idnode 的六组证明只调整导入，库侧 wrapper 导出本地 DLL；master 原 idnode 库通过 MasterDLL 编译。兼容日志和完整原有假设清单位于 compatibility_checks/local。原 nonzero 公理、auto Admitted 和 Abort 诊断保留来源，不进入维护库的新增假设。所有 Coq 检查均经 main coq_tooling.py。

最终统一检查：`suite_audits/20260911051353/audit.json`，17 个函数均通过 freshness、严格结构审计和固定 Coq 编译。汇总见 [final_summary.json](final_summary.json)。

51 项接口检查通过。42 段 DLL 手动证明均在映射命名空间后复用；8 个 C 文件（含 annotation）与迁移前文本仅有 `XiziLocalDLL::` 到 `DLL::` 的替换。17 个函数共 72 个 manual witnesses；生成 auto 文件的 21 个既有 `Admitted` 单列记录，维护库和 manual 不含 `Admitted` 或额外 `Axiom`。

原 `origin/idnode` 六组证明除导入外正文不变；其既有 1 个 nonzero 公理、123 个目标接口义务、82 个 auto `Admitted` 和 18 个 `Abort` 诊断完整记录在兼容清单中。218 项兼容编译依赖已与最终版本逐项核对，见 [compatibility_dependencies_current.json](compatibility_dependencies_current.json)。
