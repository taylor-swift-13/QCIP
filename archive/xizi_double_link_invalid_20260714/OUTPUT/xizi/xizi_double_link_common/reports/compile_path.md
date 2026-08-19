# 编译路径记录

- repository: `/home/yangfp/QCIP`
- formal source:
  - `QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib_core.v`
  - `QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v`
- logical path:
  - `QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib_core`
  - `QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib`
- path rule: `_CoqProject` uses `-R QCIPLib QCIPLib`
- source reference:
  - `/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/include/xs_klist.h`
  - `/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/double_link.c`
- compile status: passed
- module organization: `Core` generic predicates + `DLLLib` functor, wrapper concrete XiZi layout + `xizi_*` aliases
- crtos layout: `DLL_LAYOUT` has only `struct_name`, `next_field`, and `prev_field`; no data extension is exported

```sh
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib_core.v
coqc $(cat _CoqProject) QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v
```
