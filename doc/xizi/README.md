# xizi 验证产物总览

本目录整理 `/home/yangfp/QCIP/INPUT/xizi` 当前所有单链表和双链表 C 闭包的 QCIP 验证产物。`INPUT` 保持无规格输入；`OUTPUT` 保存带 annotation 的源码、Rocq 生成文件、manual proof 和说明。

## 编译路径

正式 Rocq 编译路径在 QCIP 仓库内：

- 公共库：`QCIPLib/xizi/...`
- case 生成产物：`QCIPCases/xizi/<case>/...`
- 归档副本：`OUTPUT/xizi/<case>/rocq/...`

`_CoqProject` 已加入：

```sh
-R QCIPLib QCIPLib -R QCIPCases QCIPCases
```

## 已验证 case

单链表 case 来自 CAV/OS 的 end-end 证明结构，并按 crtos 真实 `SingleLinklistNode { node_next }` 布局重证：

- `xizi_single_link_append`
- `xizi_single_link_empty`
- `xizi_single_link_first`
- `xizi_single_link_init`
- `xizi_single_link_insert_after`
- `xizi_single_link_len`
- `xizi_single_link_next`
- `xizi_single_link_remove_node`
- `xizi_single_link_tail`

双链表 case 来自 crtos 真实 `SysDoubleLinklistNode { node_next, node_prev }` 布局：

- `xizi_double_link_empty`
- `xizi_double_link_head`
- `xizi_double_link_init`
- `xizi_double_link_insert_after`
- `xizi_double_link_insert_before`
- `xizi_double_link_len`
- `xizi_double_link_next`
- `xizi_double_link_remove_node`

注意：`xizi_double_link_len` 当前证明的是空双链表输入下返回 0 的规格；其它双链表 case 使用字段级规格。若要覆盖非空双链表长度，需要继续补双链表段谓词的展开 strategy 和循环不变式。

## 复现编译

公共库：

```sh
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_strategy_goal.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_strategy_proof.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v
```

单个 case：

```sh
case=xizi_single_link_append
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_goal.v
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/xizi/$case/${case}_goal_check.v
```

## 产物约定

- `source/`：带 annotation 的 C 源码和本 case 需要的本地头文件。
- `rocq/`：`*_goal.v`、`*_proof_auto.v`、`*_proof_manual.v`、`*_goal_check.v` 的归档副本。
- `reports/`：后续可追加 case brief、final checklist、timing summary。

