# 双链表调用点规约审计（2026-08-18）

审计范围是 `INPUT/xizi` 的 12 个双链表程序及 OUTPUT 中已有的真实调用点。判定原则：公开调用者只应提供完整容器谓词、独立节点谓词和调用语义所必需的抽象关系；prefix/suffix、首尾结点、前驱/后继字段等实现切分不能成为公开调用前置。

弱规约统一采用单链表 `xizi_single_link_remove_node` 的模式：实现由一个覆盖内部语义的强规约验证；调用友好的命名规约写成 `weak_spec <= strong_spec`，由 generated derive witness 正式证明，不复制 C 实现。

| 函数/case | 当前调用性 | 结论或待补规约 |
| --- | --- | --- |
| `init` | 完成 | `xizi_dll_node(head) -> xizi_dll(head,nil)` 是最小接口，11 个 wrapper 均以它建立后续调用状态。 |
| `empty` | 完成 | standalone `nil_case <= general` 已证明，`init` 后真实调用已通过。 |
| `empty_rec` | 完成 | standalone `nil_case <= general` 已证明，`init` 后真实调用已通过。 |
| `head` | 完成 | `nil_case` 返回 `NULL` 并保持空表，真实调用已通过。 |
| `head_rec` | 完成 | `nil_case` 返回 `NULL` 并保持空表，真实调用已通过。 |
| `len` | 完成 | standalone `nil_case <= general` 已证明，`init` 后返回 0 的调用已通过。 |
| `next` | 完成 | `dispatch_case` 强规约已导出 `member_case`/`sentinel_case`；`init -> next(head,head)` 已通过。 |
| `next_rec_last` | 完成 | 同样导出 `member_case`/`sentinel_case`；`init` 后 sentinel 查询已通过。 |
| `next_rec_middle` | 完成 | 同样导出 `member_case`/`sentinel_case`；`init` 后 sentinel 查询已通过。 |
| `insert_after` | 完成 | `dispatch_case` 已导出 `member_case`/`sentinel_case`；`init -> insert_after(head,node)` 得到单节点表。 |
| `insert_before` | 完成 | 已有 `dispatch_case`、`member_case`、`sentinel_case`，且真实 `init; where(sentinel_case)` 调用点已通过。 |
| `remove_node` | 完成 | `remove_member_spec`/`remove_front_spec`/`remove_tail_spec` 均由 `strong_spec` 导出；singleton 头删/尾删真实调用已通过。 |

## 真实调用点验收要求

除 original case 的 derive witness 外，还要用调用点 wrapper 验证至少以下路径：

1. `init -> empty/head/len` 的 `nil_case`。
2. `init -> next(head)` 的 `sentinel_case`（普通版和两个 rec 版）。
3. `init -> insert_after(head,node)` 的 `sentinel_case`。
4. 构造单节点表后用 `remove_front_spec`/`remove_tail_spec` 删除该节点。
5. 已完成的 `init -> insert_before(head,node)` 保持在总审计中。

只有 original derive witness、真实 `where (...)` 调用、parent fixed check 和 final-check 全部通过，才把对应行标为完成。

## 终态证据

- 统一调用点 case：`xizi_double_link_callpoint_specs-20260818033857`，controller phase `done`。
- 11 个 wrapper 包含 13 个显式 `where(case_name)` 调用；13/13 manual witnesses 已证明。
- `source_goal_version`: `f730768681659fb55dc2fe8cdef974a79ba19ba137c70a32797e244b792e5a93`。
- parent fixed check 与 final-check 全部通过；manual 结构、case-lib contract、forbidden lemma 和 cleanup scan 均无发现。
