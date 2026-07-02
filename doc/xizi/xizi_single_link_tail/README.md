# xizi_single_link_tail

这是从 `/home/yangfp/CAV/OS/CAV-bench/input/xizi/xizi_single_link_tail.c` 迁移出的 XiZi 单链表输入闭包。
本目录只保存未规约 C 闭包：已移除源文件和头文件中的所有 `/*@ ... */` QCP annotation。

## 内容

- `xizi_single_link_tail.c`：去规约后的待验证 C 程序。
- `*.h`：为了单文件夹内可编译而复制的本地头文件。
- `compile.sh`：本闭包的语法编译检查入口。

## 编译

```sh
cd INPUT/xizi/xizi_single_link_tail
./compile.sh
```
