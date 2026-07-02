# xizi_double_link_empty

这是从 `/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/double_link.c` 迁移出的 XiZi 双链表输入闭包。
本目录只保存未规约 C 闭包，不包含 QCP annotation。

## 内容

- `xizi_double_link_empty.c`：去规约后的待验证 C 程序。
- `xizi_double_link_def.h`：为了单文件夹内可编译而复制的本地头文件。
- `compile.sh`：本闭包的语法编译检查入口。

## 编译

```sh
cd INPUT/xizi/xizi_double_link_empty
./compile.sh
```
