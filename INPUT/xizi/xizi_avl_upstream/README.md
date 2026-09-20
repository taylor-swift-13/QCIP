# crtos AVL upstream snapshot

This directory preserves the upstream source used to organize the QCIP input
cases.  It is a reference snapshot, not a standalone QCIP case.

- Repository: `https://www.gitlink.org.cn/xuos/xiuos.git`
- Commit: `0af75ee8c0aaf611b9b17b7da41bc593937d5e4c`
- Source path: `Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c`
- Header path: `Ubiquitous/XiZi_IIoT_Macro/kernel/include/xs_avltree.h`
- Retrieved: 2026-09-20

The split cases in the parent directory rename functions to the repository's
`xizi_avl_*` convention, replace XiUOS integer aliases with standard C integer
types, and omit diagnostic `KPrintf` calls.  The upstream snapshot is retained
so every such adaptation remains reviewable.
