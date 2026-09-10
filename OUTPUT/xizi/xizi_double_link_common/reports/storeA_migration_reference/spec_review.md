# 当前 storeA spec 复核

结论：QCIP 本地的 25 个迁移用例（双链表 16、单链表 9）已实际使用泛型 payload spec。此次逐文件读取公共库、函数规约、插入/删除的序列关系及 IDNode 实例；未修改正式 spec 或证明。

- 25 个 C 文件共 74 个函数规约块（含声明、派生规格和调用组合），全部显式量化 `{A}` 与 `storeA : Z -> A -> Assertion`，且后置条件保留 storeA。所有 generated goal 文件也包含任意 A/storeA 参数，生成器可能追加 `_general`、`_strong_spec`、`_dispatch_case` 等后缀。
- DLL 的 `DL_Node A` 保存逻辑数据和节点地址；`dllseg` 中包含 `storeA node (getData a)` 与 next/prev。`store_dll` 的哨兵只拥有结构字段，不要求业务 payload。
- SLL 的 `sll_payload_node A` 同样保存数据和地址；`sll_payload_cell` 把业务 storeA 与 next 字段分离，通过原 generic_sll 递归定义公开 payload 谓词。原内部 generic_sll 的三参数存储回调保留，业务接口仍是二参数 storeA。
- 插入要求新节点的结构资源与 storeA，并在结果中保留原节点的数据、顺序和新节点数据。删除从逻辑序列删去对应元素，返还其 storeA。长度、判空、head/first、next、tail 查询保留原逻辑序列及全部 payload。
- 旧 xizi_dll/xizi_sll 地址定义、头文件的旧 Extern 声明和部分结构不变量仍然存在；payload 分解/组合引理证明结构层与 payload 资源合取可恢复新谓词，因此这些属于有意复用。函数文件自行声明新泛型 Extern。
- 对齐参考为 crtosverify/master（d215f73）的 lib/dll.v 与 lib/idnode.v，均与已保存参考快照字节一致。DLL 的模块/记录是本地定义，并非直接复用 DLL.DL_Node 的同一个 Rocq 类型；结构名仍为 SysDoubleLinklistNode，保留非空节点/哨兵与非空段排除终点条件。因此是接口和资源结构对齐，不是与参考定义逐字相同或无条件可互换。
- shift/shift_rev 的字段所有权分配对齐参考；它们没有 guarded dllseg 的额外终点排除条件，反向恢复 guarded segment 仍需形状事实。
- IDNode 实例通过外围对象地址、link 字段地址、UShort id 所有权与纯 node_storeA 关系构造链表 payload。idmanager record 的 storeA : addr -> Z -> Prop 与链表的 Assertion 参数不同，不可混用。

证据：spec_review.json。既有整套审计绑定的 153 个正式文件哈希仍全部相符，各 case 有对应 active 文件的 Rocq 归档副本也一致。此次未重跑 Coq 或 symbolic execution，复用已有通过的整套检查记录，不新增 controller acceptance。

范围：正式迁移规约在 OUTPUT/xizi/<case>/source，公共模型在 QCIPLib/xizi；INPUT 是未加规约的原始输入。crtosverify 当前仍检出 double_linklist，尚未把这套迁移写入该仓库 master。

证明边界：125 个手动目标的现有完成记录适用于当前文件；manual/维护库未发现 Admitted 或 Axiom。生成的 proof_auto 仍有 84 个既有 Admitted，不能声称整套证明完全无占位。既有 strategy 依赖的边界沿用原审计说明。
