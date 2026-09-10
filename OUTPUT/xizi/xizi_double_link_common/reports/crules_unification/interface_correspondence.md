# CRules 统一接口（已验收）

本轮将 active DLL 定义与证明统一到 CRules，保留参考库接口。结构如下：

```coq
Module DLLNode. (* 唯一公共 DL_Node 记录 *) End DLLNode.
Module CanonicalDLL (Layout : DLL_LAYOUT).
  Import CRules.
  Include DLLNode.
  (* 五个公共空间谓词、参考引理、地址/载荷投影：仅一份定义和证明。 *)
End CanonicalDLL.
Module DLL := CanonicalDLL ReferenceDoubleLinkLayout.
Module XiziIdmanagerDLL := CanonicalDLL SysDoubleLinkLayout.
Module XiziLocalDLL := XiziIdmanagerDLL.
```

| 接口 | CRules 模型 | 布局 | 关系 |
|---|---|---|---|
| DLL | mem -> Prop | DoubleLinklistType，node_next/node_prev | 对齐 master:lib/dll.v |
| XiziIdmanagerDLL | mem -> Prop | SysDoubleLinklistNode，node_next/node_prev | 原 origin/idnode 布局 |
| XiziLocalDLL | mem -> Prop | 同上 | 同一实例的模块别名 |

参考布局与实际布局的字段名来自显式 string 常量；未添加结构名相等公理。实际 C 类型别名 DoubleLinklistType 仍指向 struct SysDoubleLinklistNode，不修改原 C 布局。

DL_Node、Build_DL_Node、getData/getPtr、Arguments 与 record syntax 通过共享记录导出。公共 dllseg、dllseg_shift、dllseg_shift_rev、store_dll、occupy_dll_node 以及 19 个原引理接口按参考模板比较；既有 guards 不加进这些公共定义。

本地与 idmanager 的五个谓词通过 reflexivity 检查定义相同；payload 函数显式检查为 CRules.expr。检查文件为 unified_interface_checks.v，编译时与 master 原 idnode 及 origin/idnode 六组原证明合并测试。文本/静态检查不替代实际编译结果。

已有带 guards 的 AddrDLL/XiziStoreADLL 和原策略依赖作为明确标注的历史依赖保留。它们不是本次 8 个函数的公共规约；当前函数的生成目标须明确 Import CRules，不能在 active 函数规约中继续引用旧带 guards 的谓词。单链表规约本轮不改。

原 idnode 的 nonzero Axiom 只在原证明兼容 fixture 中保留，不进入维护的公共库。原证明正文只允许修改导入路径；库侧 sizeof simpl 设置单列。既有 auto 占位、原策略接口义务单列，不据编译通过宣称已证明。
