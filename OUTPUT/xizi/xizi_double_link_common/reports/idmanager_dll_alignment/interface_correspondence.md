# 库接口对应（公共库及指定函数验收均已通过）

| 参考接口 | 实际 QCP C 布局接口 | 兼容规则 |
|---|---|---|
| DLL.DL_Node A | XiziLocalDLL.DL_Node A | 同一个记录类型，notation 别名 |
| DLL.Build_DL_Node | XiziLocalDLL.Build_DL_Node | 同一构造器，A 隐式 |
| DLL.getData / getPtr | XiziLocalDLL.getData / getPtr | 同一投影，A 隐式 |
| DLL.dllseg | XiziLocalDLL.dllseg | storeA, x, px, y, py, nodes 顺序一致 |
| DLL.dllseg_shift | XiziLocalDLL.dllseg_shift | storeA, px, py, nodes；参考字段所有权分配 |
| DLL.dllseg_shift_rev | XiziLocalDLL.dllseg_shift_rev | storeA, x, y, nodes；参考字段所有权分配 |
| DLL.store_dll | XiziLocalDLL.store_dll | storeA, sentinel, nodes；无新增 guards |
| DLL.occupy_dll_node | XiziLocalDLL.occupy_dll_node | 两个可写指针字段；不承诺自链接 |

参考布局在所有字段地址中保留 DoubleLinklistType；实际布局使用 C 的结构标签 SysDoubleLinklistNode。二者不是用公理或字符串替换强行判等。原 idmanager 导入入口在库侧选择 XiziIdmanagerDLL，DL_Node 不需要调用方转换。

断言模型也须匹配：DLL 和 XiziIdmanagerDLL 使用 CRules.expr；实际 QCP 用例的 XiziLocalDLL 使用 naive_C_Rules.expr。两种 Assertion 不是同一类型，不能只替换模块名或传递同一个 storeA 强行混用。

下列参考引理在各实例中保留原名称、陈述和参数声明，已在原证明导入检查中实际编译。某些原名字带有拼写差异也保留，以支持原调用。

- `dllseg_concat`
- `dllseg_split`
- `dllseg_shift_split`
- `dllseg_shift_concat`
- `dllseg_shift_rev_split`
- `dllseg_shift_rev_concat`
- `dllseg_to_dllseg_shift`
- `dllseg_to_dllseg_shift_rev`
- `dllseg_shift_to_dllseg`
- `dllseg_shift_rev_to_dllseg`
- `dllseg_shift_to_dllseg_shift_rev`
- `store_dll_shift_unfold`
- `store_dll_shift_rev_unfold`
- `dllseg_head_insert`
- `dllseg_neq`
- `dllseg_head_split`
- `dllseg_shift_transfrom_a`
- `dllseg_shift_contact_a`
- `dllseg_shift_rev_contact_a`

参考 record、五个谓词、19 个引理陈述、Arguments/notations 的静态比对见 spec_definition_candidate_audit.json。annotation-r2 通过了本地 Coq 检查，但实际原证明导入揭示了断言模型差异；该轮结果不能当作完整兼容性证据。annotation-r3 已修正上述模型和 record notation，并通过六组原证明和 master 原 idnode 库的实际导入编译；公共库已经 controller final-apply 和 final-check。编译证据见 compatibility_checks/local/manifest.json。

地址列表优先使用 addr_nodes : list addr -> list (DLL.DL_Node unit)、addr_store := emp、addr_dllseg 和 addr_store_dll。有效载荷通过 getData/getPtr 投影连接；不能无条件转换成带额外 guards 的历史 AddrDLL/XiziStoreADLL。旧模型目前只保留为范围外用例及历史辅助证明的依赖。

移除节点的公共后置条件仍须保证 node_next=node 和 node_prev=node。occupy_dll_node 只代表两个可写字段，不能用它替换该重置承诺。

三个模块的实例参数如下，记录类型始终是 DLL.DL_Node：

| 模块 | 断言模型 | 字段结构名 | 使用方 |
|---|---|---|---|
| DLL | CRules.expr | DoubleLinklistType | master 原 dll/idnode 接口 |
| XiziIdmanagerDLL | CRules.expr | SysDoubleLinklistNode | origin/idnode 原证明兼容入口 |
| XiziLocalDLL | naive_C_Rules.expr | SysDoubleLinklistNode | 本次八个实际 C 函数规约 |

原证明入口另含原分支已有的 `store_dll_head_prev_next_nonzero` 假设和 `Arguments sizeof_front_end_type _ : simpl never.`。前者是原证明已有的信任边界；后者保持当前依赖下的 simpl 匹配行为。两项均隔离于兼容入口，未加入新公共库。
