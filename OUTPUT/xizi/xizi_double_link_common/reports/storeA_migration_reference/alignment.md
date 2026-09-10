# 与 idmanager 的对齐关系

参照文件是 `crtosverify` 本地主分支 commit `d215f73b69916cc5c7c01af752bca4b6f96b3530` 的 `lib/dll.v` 和 `lib/idnode.v`，本目录保存了原文快照。未修改或切换该仓库当前分支。

| idmanager 使用的定义 | QCIP 迁移后的定义 | 保留的含义 |
| --- | --- | --- |
| `DLL.DL_Node A` | `XiziStoreADLL.DL_Node A` | 一个逻辑数据 `A` 与一个链接节点地址；不是给 C 节点增加字段 |
| `Build_DL_Node data ptr`、`getData`、`getPtr` | 同名构造器与投影，位于 `XiziStoreADLL` | 构造器参数顺序相同 |
| `storeA : addr -> A -> Assertion` | 同类型 | 第一个参数是内嵌链接节点地址，第二个参数是逻辑数据 |
| `dllseg storeA x px y py nodes` | 同名、同参数顺序 | 每个元素持有 payload、next、prev，空段要求两个端点相等 |
| `dllseg_shift`、`dllseg_shift_rev` | 同名、同参数顺序 | 前后移位的字段所有权视图 |
| `store_dll storeA head nodes` | 同名；公开别名 `xizi_store_dll` | 哨兵只持有结构字段，普通节点持有结构与 payload |

保留本地模型的差异：实际结构标记仍为 `SysDoubleLinklistNode`；原有的非空节点、非空哨兵和非空段排除终点条件不变。`xizi_dll_links` 保留 next/prev 的原有组织方式，资源的分离合取顺序不改变所有权含义。旧地址模型继续作为已证明的结构层被复用。

`IdNode` 的真实 C 布局是：

```c
struct IdNode {
    uint16 id;
    DoubleLinklistType link;
};
```

`idnode.v` 中 `store_idnode node_storeA link id` 的含义为：存在外围对象地址 `p`，满足 `link = &(p->link)` 和纯关系 `node_storeA p id`，并持有 `p->id` 的 `UShort` 字段。随后：

```coq
EX nodes : list (DL_Node Z),
  “ map getData nodes = ids ” &&
  store_dll (store_idnode node_storeA) head nodes.
```

因此，链表层的 `storeA` 对应这里的 `store_idnode node_storeA`；idmanager record 里的同名字段 `storeA : addr -> Z -> Prop` 只是外围对象与 id 的纯关系。两者类型不同，不能直接把该纯关系作为链表 payload。

单链表采用相同的“数据 + 链接地址”和 `addr -> A -> Assertion` 接口，通过 payload adapter 复用已有 `generic_sll` 递归。它保留本来的 NULL 终止、单个 next 字段和哨兵条件。

验收时还必须检查插入、删除和查询函数实际使用泛型 payload 规格，并通过最新目标的证明。初始化空表不包含元素，单凭初始化通过不能证明非空 payload 已迁移；逐 case 状态见 `migration_inventory.json`。

DLL 长度 run 已将经过验证的通用资源转换复用到公共库。`dll_decompose__storeA_shared` 与 `dll_compose__storeA_shared` 分别证明：

```text
store_dll storeA head nodes
  ⊣⊢ xizi_dll head (map getPtr nodes) ** xizi_dll_payloads storeA nodes
```

链段也有对应的 `seg_decompose__storeA_shared` / `seg_compose__storeA_shared`。这使旧的地址结构规约和证明可以继续使用，同时保留每个地址对应的逻辑数据与 payload。`storeA` 为空资源是可选实例，泛型函数规格没有把它限定为空。

证明范围以各 case 报告为准：手动 witnesses 与维护库要求没有 `Admitted` 或新增 `Axiom`；现有 QCP 生成器的 `proof_auto.v` 仍可能含自动目标的 `Admitted` 占位，数量在 checkpoint 和整套审计中单列，不能把它们当作已完成的 Coq 内核证明。

## 已验证的 IDNode 实例

callpoint_specs 的唯一 active case_lib 提供 `xizi_call_store_idnode` 和 `xizi_call_store_idnodes`，按参照 idnode.v 的 existential 外围地址、纯 node_storeA、UShort id 字段及 map getData 定义。

已证明 `xizi_call_idnodes_nonempty_ownership`：非空 ID 列表可分解出哨兵 next/prev、外围对象的 id 字段、首个内嵌 link 的 next/prev，以及剩余泛型链段。证明保留实际字段所有权，不限定 payload 为 emp，也没有增加数值偏移假设。

active 文件为 `SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_callpoint_specs/source/xizi_double_link_callpoint_specs_lib.v`，交付副本在该 case 的 `OUTPUT/xizi/.../rocq/`。该结果验证泛型接口可表达 idmanager 的资源划分；不另行声称验证了整个 idmanager 算法或框架抽象 field_address 的具体数值实现。
