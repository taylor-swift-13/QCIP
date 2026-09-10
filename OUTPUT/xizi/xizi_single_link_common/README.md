# xizi_single_link_common

本模块验证用户指定 single_link.c 的 9 个原函数，沿用任意 A/storeA 的 NULL 终止单链表规约。SingleLinkListGetTailNode 已恢复原文件中的遍历循环，并重新生成 VC、完成证明和 final-check；其余 8 个原函数也已通过本次 canonical freshness 与固定 Coq 统一依赖复验。

`sll_payload_node A` 与 payload adapter 复用原 generic_sll 递归，公开谓词接收 storeA : addr -> A -> Assertion。保留单个 next 字段、原哨兵语义及业务资源。active source 位于 `QCIPLib/xizi/xizi_single_link_common/`，`rocq/` 保存交付副本。

[本次范围与验证结果](../xizi_double_link_common/reports/idmanager_dll_alignment/README.md)、[逐函数状态](../xizi_double_link_common/reports/idmanager_dll_alignment/migration_inventory.json)。历史验证保留于 storeA_migration_reference，不替代当前复验。维护库和 manual proofs 严格检查；生成 auto Admitted 的既有信任边界单独记录。

当前双链表 CRules 统一任务不修改单链表规约与证明，另做这 9 个原函数的当前依赖回归；进度与证据见 [CRules 统一报告](../xizi_double_link_common/reports/crules_unification/README.md)。上文 idmanager_dll_alignment 为上一轮验收。
