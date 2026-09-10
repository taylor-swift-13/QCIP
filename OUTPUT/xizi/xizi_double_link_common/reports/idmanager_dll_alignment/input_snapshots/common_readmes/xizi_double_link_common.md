# xizi_double_link_common

本模块的 16 个用例已迁移至任意 A/storeA，全部通过 controller final-check 和当前共享依赖下的整套回归。源码算法及节点布局保持不变。

`XiziStoreADLL.DL_Node A`、dllseg、shift/shift_rev 与 store_dll 对齐 idmanager 的 dll.v；xizi_store_dll 为公开别名。原 AddrDLL 地址结构库和已证明资源转换桥继续复用。

active source 位于 `QCIPLib/xizi/xizi_double_link_common/`，`rocq/` 保存接受库的交付副本。链表谓词持有结构指针，storeA 持有对应外围对象的附加资源；哨兵不要求 payload。

[迁移结果与复现步骤](reports/storeA_migration_reference/README.md)、[idmanager 对齐说明](reports/storeA_migration_reference/alignment.md)、[逐 case 状态](reports/storeA_migration_reference/migration_inventory.json)。各用例保留其原始 controller 报告，最新公共库兼容性由整套审计单独记录。

手动 witnesses 和维护库无 Admitted 或新增 Axiom。generated proof_auto 的 Admitted 占位仍是上游生成器的信任边界，不能据固定编译通过声称整套证明无假设；数量见迁移结果。
