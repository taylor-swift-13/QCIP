# xizi_double_link_common

当前公共库已统一到 CRules，并通过原 idnode 导入兼容检查；8 个原 double_link.c 函数的本轮最终验收与 17 函数统一复验均已通过。

active source：`QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v`。公共谓词与证明只在 CanonicalDLL 布局模块中维护一份。DLL 是 master 参考布局实例；XiziIdmanagerDLL 是实际 SysDoubleLinklistNode 布局实例；XiziLocalDLL 是后者的直接模块别名。所有公共节点类型共享，公共谓词无额外 guards。

[本轮统一进度与复现](reports/crules_unification/README.md)、[接口说明](reports/crules_unification/interface_correspondence.md)。此前 idmanager_dll_alignment 的双模型结果与更早的 storeA_migration_reference 均为历史版本证据。rocq 副本已随本轮 final-check 归档。

范围仍为 8 DLL 原函数；9 SLL 原函数做当前依赖回归。原 idnode 假设与生成 auto 占位单列，维护库和 manual 不新增 Admitted/额外 Axiom。
