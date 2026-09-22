# xizi_double_link_common

当前公共库使用 CRules，公共入口 `DLL` 已对齐 `origin/idnode`，并通过原 idnode 导入兼容检查。8 个原 double_link.c 函数的本轮最终验收与 17 函数统一复验均已通过。

active source：`QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v`。公共谓词与证明只在 `CanonicalDLL` 布局模块中维护一份。`DLL` 使用实际 `SysDoubleLinklistNode` 布局；`MasterDLL` 保留 master 的 `DoubleLinklistType` 布局。`XiziIdmanagerDLL`、`XiziLocalDLL` 均为 `DLL` 的兼容别名。所有公共节点类型共享，公共谓词无额外 guards。

[本轮进度与复现](reports/origin_dll_alignment/README.md)、[接口说明](reports/origin_dll_alignment/interface_correspondence.md)。此前 `crules_unification`、`idmanager_dll_alignment` 和 `storeA_migration_reference` 均为历史版本证据。当前公共库的 rocq 副本已随初始化的 final-check 归档。

范围仍为 8 DLL 原函数；9 SLL 原函数做当前依赖回归。原 idnode 假设与生成 auto 占位单列，维护库和 manual 不新增 Admitted/额外 Axiom。
