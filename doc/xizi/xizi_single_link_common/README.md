# XiZi 单链表公共谓词定义

当前状态：公共谓词定义已迁入 `QCIPLib` 独立库目录，并通过 `coqc`。

## 正式编译路径

本库不放在 `SeparationLogic/examples/LLM_bench`，避免污染 QCP 示例目录。crtos / CAV 只作为定义参考，不使用它们的编译路径。

正式源文件：

```text
QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib_core.v
QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v
```

`_CoqProject` 中的路径规则：

```text
-R QCIPLib QCIPLib
```

logical path：

```text
QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib_core
QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib
```

## 编译命令

从 `/home/yangfp/QCIP` 执行：

```sh
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v
```

## Module 组织

结构贴近 QCP `ArrayLibCore.v` / `ArrayLib.v`：

- `xizi_single_link_lib_core.v`：泛型 `generic_sll`、`generic_sllseg`、节点 store 组合子、`SLL_LAYOUT`、`SLLLib(Layout)` functor。
- `xizi_single_link_lib.v`：XiZi 具体结构名和字段名，`XiziSingleLinkLayout`，`XiziSingleLink := SLLLib ...`，以及稳定的 `xizi_*` 对外别名。

crtos 的真实单链表结构只有一个字段：

```c
typedef struct SingleLinklistNode {
    struct SingleLinklistNode *node_next;
} SysSingleLinklistType;
```

因此基础 `SLL_LAYOUT` 只包含：

```coq
struct_name = "SingleLinklistNode"
next_field = "node_next"
```

`node_data` 不属于 crtos `single_link.c` 的基础节点。带 data 的单链表扩展已经删除，本库只保留真实存在的 crtos 单链表模型。

## 谓词摘要

- `generic_sll`：泛型单链表谓词。
- `generic_sllseg`：泛型单链表段谓词。
- `generic_sll_to_target` / `generic_sll_not_target`：面向遍历目标的链表段变体。
- `xizi_sll : addr -> list addr -> Assertion`：XiZi 侵入式地址链表实例；逻辑元素是节点地址本身，节点资源包含 `x = p` 和 `node_next` 字段。
- `xizi_sll_head : addr -> list addr -> Assertion`：显式 head 节点谓词，保存 `head->node_next` 并描述 head 后面的 data chain。
`OUTPUT/xizi/xizi_single_link_common/rocq/` 是交付镜像；正式编译以 `QCIPLib/xizi/xizi_single_link_common/` 为准。
