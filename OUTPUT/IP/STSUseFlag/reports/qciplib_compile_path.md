# QCIPLib 编译路径记录

- repository: `/home/yangfp/QCIP`
- formal source: `QCIPLib/IP/STSUseFlag/IP_STSUseFlag_lib.v`
- logical path: `QCIPLib.IP.STSUseFlag.IP_STSUseFlag_lib`
- path rule: `_CoqProject` uses `-R QCIPLib QCIPLib`
- source mirror: `OUTPUT/IP/STSUseFlag/qciplib/IP_STSUseFlag_lib.v`
- compile status: passed

```sh
coqc $(cat _CoqProject) QCIPLib/IP/STSUseFlag/IP_STSUseFlag_lib.v
```
