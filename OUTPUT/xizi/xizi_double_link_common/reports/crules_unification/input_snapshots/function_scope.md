# 本次函数范围

只包含以下原函数；目录名是验证用例标识，C 和 witness 使用原函数名。

| 原函数 | 源文件 | 验证用例 |
|---|---|---|
| `IsDoubleLinkListEmpty` | `double_link.c` | `xizi_double_link_empty` |
| `DoubleLinkListGetHead` | `double_link.c` | `xizi_double_link_head` |
| `InitDoubleLinkList` | `double_link.c` | `xizi_double_link_init` |
| `DoubleLinkListInsertNodeAfter` | `double_link.c` | `xizi_double_link_insert_after` |
| `DoubleLinkListInsertNodeBefore` | `double_link.c` | `xizi_double_link_insert_before` |
| `DoubleLinkListLenGet` | `double_link.c` | `xizi_double_link_len` |
| `DoubleLinkListGetNext` | `double_link.c` | `xizi_double_link_next` |
| `DoubleLinkListRmNode` | `double_link.c` | `xizi_double_link_remove_node` |
| `AppendSingleLinkList` | `single_link.c` | `xizi_single_link_append` |
| `IsSingleLinkListEmpty` | `single_link.c` | `xizi_single_link_empty` |
| `SingleLinkListGetFirstNode` | `single_link.c` | `xizi_single_link_first` |
| `InitSingleLinkList` | `single_link.c` | `xizi_single_link_init` |
| `SingleLinkListNodeInsert` | `single_link.c` | `xizi_single_link_insert_after` |
| `SingleLinkListGetLen` | `single_link.c` | `xizi_single_link_len` |
| `SingleLinkListGetNextNode` | `single_link.c` | `xizi_single_link_next` |
| `SingleLinkListRmNode` | `single_link.c` | `xizi_single_link_remove_node` |
| `SingleLinkListGetTailNode` | `single_link.c` | `xizi_single_link_tail` |

额外递归包装、组合调用与调用点示例均不作为本次独立验证目标。idmanager 的六组原证明只用于 DLL 库导入兼容性验收。
