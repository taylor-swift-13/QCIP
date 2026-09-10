# 双链表 CRules 统一（已完成）

范围：double_link.c 的 8 个原函数统一到底层 CRules；single_link.c 的 9 个原函数只做当前依赖回归。保持原 C、函数规约、数据与顺序关系、资源转移、删除节点自链接保证。

已采用布局参数化的一套公共双链表定义与证明。实际 C 与 origin/idnode 使用同一实例，XiziLocalDLL 仅为 XiziIdmanagerDLL 的别名；master 入口保留参考布局。本目录的新 controller、统一实例测试、原证明实际编译及 suite audit 已同时通过。

前一轮双模型交付见 ../idmanager_dll_alignment/，只作历史基线。新规约要求见 contract.md，最终逐函数记录见 migration_inventory.json。

已完成公共库统一、初始化/判空/前插入/后插入的 controller final-check，以及该公共库的原 idnode 证明实际导入编译（证明正文不变）。长度/删除/取头/取后继及 17-case 当前依赖总回归均已通过。公共库采用证据见 common_adoption_check.json；原证明导入证据见 compatibility_checks/local/manifest.json。

## 复现入口

在 `/home/yangfp/QCIP` 执行：

```bash
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/crules_unification/audit_spec_alignment.py
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/crules_unification/check_idmanager_imports.py --mode local --work-root worktrees/idmanager-crules-reproduction
python3 -B OUTPUT/xizi/xizi_double_link_common/reports/crules_unification/audit_completed_suite.py --cleanup
```

总回归入口要求 8 个 DLL run 均已完成并归档。脚本内部统一调用 `coq_tooling.py check`，不复用旧 `.vo`。原证明文件仅调整导入路径；库侧 wrapper 和 sizeof 展开控制单独记录。完整差异、原始假设和依赖解析记录保存在 `compatibility_checks/local/manifest.json`；复现 fixture 源码保存在 `compatibility_source_archive/`。

## 兼容性边界

master `d215f73b69916cc5c7c01af752bca4b6f96b3530` 只有参考库，没有 VC 证明目录。因此验收同时编译 master 原 idnode 库，以及 origin/idnode `84cbcc4e32c231ffc1de8fdf9f555fbb83a49317` 的 AllocId、FreeId、GetObj、IdInsertObj、InsertObj、RemoveObj 六组原证明。32 个 fixture 源码的差异逐项列在 manifest；非库侧 wrapper 文件均确认除导入外正文不变。

原 idnode 既有 1 个 nonzero 公理、82 个 auto Admitted、18 个 Abort 诊断仍单列保留；另外 123 个 goal Module Type Axiom 是原接口义务。既有 nonzero 公理只保留在兼容 fixture，不进入公共库。本轮不声称消除了这些原有假设和占位。

当前 42 个 DLL manual witnesses 均已通过各自 final-check。其中 41 段证明正文直接复用；初始化的一个证明将末尾 `entailer!` 改为两次显式字段资源 `cancel`，陈述不变。8 个 C 文件（含 annotation/规约）与本轮输入快照逐字节相同。比对见 [proof_reuse_audit.json](proof_reuse_audit.json)。

最终统一检查：`suite_audits/20260910113338/audit.json`，17 个函数均通过 freshness、严格结构审计和固定 Coq 编译。汇总见 [final_summary.json](final_summary.json)。

17 函数共 72 个 manual witnesses（DLL 42，SLL 30）通过当前固定编译。生成 auto 文件保留原有的 21 个 Admitted；维护的公共库、case_lib 和 manual proofs 均通过严格无 Admitted/额外 Axiom/禁用项检查。单链表源码、规格与证明本轮不修改，仅完成当前依赖回归。全部本轮 case worktrees 和 suite 构建目录已清理，crtosverify 与外部 crtos 原源码保持不变。
