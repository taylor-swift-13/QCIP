# 验证摘要

本 case 证明双链表的命名弱规约能在真实调用点从最小 ownership 实例化。所有 wrapper 都通过 symbolic execution，13 个 manual VC 全部证明，parent fixed check 与 final-check 通过。

对 `next*` 和 `insert_after`，实现由 `dispatch_case` 强规约验证，调用点使用由强规约导出的 `member_case`/`sentinel_case`。对 `remove_node`，调用点使用 `remove_front_spec`/`remove_tail_spec`，二者均由 `strong_spec` 导出。
