# xizi_double_link_common

当前迁移以 crtosverify/master:lib/dll.v 的精确定义与原证明兼容性为准，函数范围仅为用户指定 double_link.c 的 8 个原函数。公共库及原 idmanager 导入检查已通过；指定 8 个双链表函数的最终验收与 17 函数统一复验均已通过。

active source 为 `QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v`，`rocq/` 保存采用后的副本。公共 `DLL` 保留参考 CRules 断言模型和 DoubleLinklistType 字段地址；`XiziIdmanagerDLL` 用于原 idnode 分支布局；`XiziLocalDLL` 用于实际 QCP 的 naive_C_Rules 模型与 SysDoubleLinklistNode 布局。三个模块共享 `DLL.DL_Node`，无调用方记录转换，公共谓词无新增 guards。

[当前结果与复现](reports/idmanager_dll_alignment/README.md)、[接口对应](reports/idmanager_dll_alignment/interface_correspondence.md)、[函数与状态](reports/idmanager_dll_alignment/migration_inventory.json)。旧 `storeA_migration_reference` 的 16 DLL 用例结论只对应历史 guarded 模型，不是本次验收证据；额外组合与递归包装不在本次独立验证范围。

链表谓词持有结构字段，任意 storeA 持有业务资源；哨兵不占业务 payload。维护库和 manual proofs 按无 Admitted/额外 Axiom 规则检查。原 idmanager 的既有 nonzero 假设和生成 auto 占位单独记录，不能据编译通过声称它们已经被证明。
