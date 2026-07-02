# XiZi 双链表公共谓词定义

当前状态：双链表公共谓词定义已写入 `QCIPLib` 独立库目录，并通过 `coqc`。

## 来源

定义参考：

```text
/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/include/xs_klist.h
/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/double_link.c
```

该双链表属于 XiZi 问题来源，因此放在 `QCIPLib/xizi` 和 `OUTPUT/xizi` 下。

## 正式编译路径

正式源文件：

```text
QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib_core.v
QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v
```

logical path：

```text
QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib_core
QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib
```

## 编译命令

从 `/home/yangfp/QCIP` 执行：

```sh
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v
```

## Module 组织

结构贴近 QCP `ArrayLibCore.v` / `ArrayLib.v`：

- `xizi_double_link_lib_core.v`：泛型 `generic_dllseg`、`generic_dll_head`、节点 store 组合子、`DLL_LAYOUT`、`DLLLib(Layout)` functor。
- `xizi_double_link_lib.v`：XiZi 双链表结构名和字段名，`XiziDoubleLinkLayout`，`XiziDoubleLink := DLLLib ...`，以及稳定的 `xizi_*` 对外别名。

crtos 的真实双链表结构只有 `node_next` 和 `node_prev`，因此 `DLL_LAYOUT` 只包含 `struct_name`、`next_field`、`prev_field`，不导出任何 data 扩展。

## 谓词摘要

- `generic_dllseg`：带前驱地址、尾目标地址和最后节点地址的泛型双链表段谓词。
- `generic_dll_head`：哨兵头节点的循环双链表谓词。
- `xizi_dllseg`：XiZi 地址双链表段实例。
- `xizi_dll`：XiZi 哨兵头循环双链表实例。

`OUTPUT/xizi/xizi_double_link_common/rocq/` 是交付镜像；正式编译以 `QCIPLib/xizi/xizi_double_link_common/` 为准。
