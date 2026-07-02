# 编译路径记录

- repository: `/home/yangfp/QCIP`
- formal source:
  - `QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib_core.v`
  - `QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v`
- logical path:
  - `QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib_core`
  - `QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib`
- path rule: `_CoqProject` uses `-R QCIPLib QCIPLib`
- CAV / crtos role: definition reference only; no external compile path is used
- compile status: passed
- module organization: `Core` generic predicates + `SLLLib` functor, wrapper concrete XiZi layout + `xizi_*` aliases
- crtos layout: `SLL_LAYOUT` has only `struct_name` and `next_field`; no `node_data` extension is exported

```sh
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v
```
