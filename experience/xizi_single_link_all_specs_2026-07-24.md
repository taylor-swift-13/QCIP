# Xizi 单链表最终规约汇总

更新时间：2026-07-24

对应 `crtosverify` 分支：`single_linklist`

对应提交：`9f912da`（`align single-link specs with sentinel usage`）

## 1. 统一抽象模型

Xizi 单链表节点只有一个链接字段：

```c
typedef struct SingleLinklistNode
{
    struct SingleLinklistNode *node_next;
} SysSingleLinklistType;
```

真实 CRTOS 的 netdev 链表使用 `netdev_guard.list` 作为哨兵。逻辑列表
`l : list addr` 只保存真实数据节点地址，不包含哨兵地址。

核心谓词含义如下：

- `xizi_sll(first, l)`：从 `first` 开始拥有由地址列表 `l` 描述的完整数据链。
- `xizi_sll_head(head, l)`：拥有非空哨兵 `head` 的 `node_next` 字段，以及
  哨兵之后由 `l` 描述的完整数据链。
- `xizi_sll_node(node)`：`node` 非空，并拥有其 `node_next` 字段的写权限；
  不关心字段旧值，适合描述将被初始化或插入的新节点。
- `xizi_sllseg(first, end, l)`：从 `first` 到 `end` 之前的链段，地址列表为
  `l`。
- `xizi_sll_first_value(l)`：`l` 非空时返回首地址，`l == nil` 时返回
  `NULL`。
- `xizi_sll_tail_value(l, default)`：`l` 非空时返回尾地址，空表时返回
  `default`。
- `xizi_sll_next_value(l, node)`：返回完整地址列表 `l` 中 `node` 的后继；
  尾节点的后继为 `NULL`。

公开规约优先使用 `xizi_sll_head`、`xizi_sll_node` 和地址列表变换，避免暴露
字段权限等底层细节。证明内部可以将抽象谓词展开为字段所有权。

## 2. `xizi_single_link_init`

```c
void xizi_single_link_init(SysSingleLinklistType *linklist)
/*@ Require
      xizi_sll_node(linklist)
    Ensure
      xizi_sll_head(linklist, nil)
*/
```

前置条件提供一个非空、可写且旧 `node_next` 值不重要的节点。函数把
`node_next` 写成 `NULL`，建立空哨兵链表。

初始化普通待插入节点时，也可以由空头谓词通过
`xizi_sll_head_nil_node` 转回 `xizi_sll_node`。

## 3. `xizi_single_link_append`

```c
void xizi_single_link_append(
    SysSingleLinklistType *linklist,
    SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      xizi_sll_head(linklist, l) *
      xizi_sll_node(linklist_node)
    Ensure
      xizi_sll_head(
        linklist,
        app(l, cons(linklist_node, nil)))
*/
```

`linklist` 是哨兵。新节点通过分离合取与原链表互不重叠。函数在尾部接入
新节点，并把新节点的后继设为 `NULL`。

## 4. `xizi_single_link_insert_after`

```c
void xizi_single_link_insert_after(
    SysSingleLinklistType *linklist,
    SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      xizi_sll_head(linklist, l) *
      xizi_sll_node(linklist_node)
    Ensure
      xizi_sll_head(linklist, cons(linklist_node, l))
*/
```

虽然 C 实现具有“任意节点后插”的机械能力，但真实 CRTOS 中唯一调用传入
`netdev_guard.list` 哨兵，因此当前正式规约验证的是哨兵后的头插。

插入后地址列表由 `l` 变为 `linklist_node :: l`。

如果未来出现真实的中间节点调用，应增加独立的通用后插规约，不能直接把
哨兵加入数据地址列表 `l`。

## 5. `xizi_single_link_remove_node`

```c
SysSingleLinklistType *xizi_single_link_remove_node(
    SysSingleLinklistType *linklist,
    SysSingleLinklistType *linklist_node)
/*@ With l l1 l2
    Require
      l == app(l1, cons(linklist_node, l2)) &&
      xizi_sll_head(linklist, l)
    Ensure
      __return == linklist@pre &&
      xizi_sll_head(linklist@pre, app(l1, l2)) *
      (linklist_node -> node_next ==
        xizi_sll_first_value(l2))
*/
```

前置分解表示目标节点确实位于完整数据列表中：

```text
l = l1 ++ [linklist_node] ++ l2
```

删除后数据列表为 `l1 ++ l2`。被删除节点不再属于链表，但调用者仍拥有其
`node_next` 字段；函数没有修改该字段，所以它仍指向原后缀首节点。若删除
尾节点，`l2 == nil`，该值为 `NULL`。

该规约统一覆盖删除首数据节点、中间节点和尾节点。哨兵非空、目标非空以及
目标不等于哨兵均由 `xizi_sll_head` 和列表分解隐含。

## 6. `xizi_single_link_len`

```c
unsigned int xizi_single_link_len(
    const SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      __return == Zlength(l) &&
      xizi_sll_head(linklist, l)
*/
```

返回不含哨兵的数据节点数量，并保持链表不变。

公开规约不需要额外要求 `Zlength(l) <= UINT_MAX`。证明库中的
`xizi_sll_length_max` 和 `xizi_sll_loop_length_max` 从有限地址空间及链表
实际占用的分离内存推出循环计数所需的上界。

## 7. `xizi_single_link_empty`

```c
int xizi_single_link_empty(SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      ((l == nil && __return == 1) ||
       (l != nil && __return == 0)) &&
      xizi_sll_head(linklist, l)
*/
```

逻辑地址列表为空时返回 `1`，否则返回 `0`，并保持哨兵链表不变。

## 8. `xizi_single_link_first`

```c
SysSingleLinklistType *xizi_single_link_first(
    SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      __return == xizi_sll_first_value(l) &&
      xizi_sll_head(linklist, l)
*/
```

非空表返回第一个数据节点，空表返回 `NULL`。该函数只读链表。

## 9. `xizi_single_link_tail`

```c
SysSingleLinklistType *xizi_single_link_tail(
    SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      __return ==
        xizi_sll_tail_value(l, linklist@pre) &&
      xizi_sll_head(linklist@pre, l)
*/
```

非空表返回最后一个数据节点；空表返回哨兵本身。`linklist@pre` 明确记录
入口哨兵地址，同时后置条件恢复原链表。

## 10. `xizi_single_link_next`

```c
SysSingleLinklistType *xizi_single_link_next(
    SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      In(linklist_node, l) &&
      xizi_sll(xizi_sll_first_value(l), l)
    Ensure
      __return == xizi_sll_next_value(l, linklist_node) &&
      xizi_sll(xizi_sll_first_value(l), l)
*/
```

该函数的参数是数据节点而不是哨兵，所以使用 `xizi_sll` 描述完整数据链。
`In(linklist_node, l)` 保证读取目标节点字段安全。中间节点返回其后继，尾
节点返回 `NULL`，完整数据链保持不变。

## 11. 真实仓库中的哨兵依据

`get_netdev_listhead()` 创建静态保护节点：

```c
static struct netdev netdev_guard;
InitSingleLinkList(&(netdev_guard.list));
netdev_listhead = &netdev_guard;
```

真实插入调用为：

```c
SingleLinkListNodeInsert(
    &(NETDEV_LISTHEAD->list),
    &(netdev->list));
```

`NETDEV_LISTHEAD` 正常情况下指向 `netdev_guard`，因此该调用是哨兵后的
头插。遍历宏也从 `(head)->node_next` 开始，进一步说明哨兵不属于数据
地址列表。

## 12. 当前证明状态

- 所有 manual proof lemma 均为 `Qed`，没有 `Admitted`。
- auto proof 文件按当前项目约定保留 `Admitted`。
- `insert_after`、`remove_node` 等最新修改已通过对应 `goal_check`。
- QCIP、OUTPUT 与 `crtosverify` 的公开规约已对齐。

因此，“规约已验证”与“整个 Rocq 工程零 `Admitted`”需要区分：当前
manual 数学证明已经闭合，但 auto 文件仍是显式信任点。
