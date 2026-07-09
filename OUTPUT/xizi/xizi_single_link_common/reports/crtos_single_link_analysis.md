# crtos 单链表实现核对

参考源码：

```text
/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/include/xs_klist.h
/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/single_link.c
```

注意：`kernel/thread/linklist.c` 不是单链表实现，它是任务 suspend/resume 逻辑，使用的是 `DoubleLinklistType`。

## 真实数据结构

crtos 单链表节点只有一个 next 指针：

```c
typedef struct SingleLinklistNode
{
    struct SingleLinklistNode *node_next;
} SysSingleLinklistType;
```

`NONE` 表示空指针，语义是 `0` / `NULL`。

因此 xizi 单链表库不应要求 `node_data` 字段。带 data 的单链表扩展已经删除，当前只保留 crtos 真实存在的 `node_next` 节点模型。

## API 行为

- `InitSingleLinkList(linklist)`：写 `linklist->node_next = NONE`。
- `AppendSingleLinkList(linklist, linklist_node)`：从传入的 `linklist` 节点开始走到尾节点，将尾节点 `node_next` 指向 `linklist_node`，再写 `linklist_node->node_next = NONE`。
- `SingleLinkListNodeInsert(linklist, linklist_node)`：局部 splice，把 `linklist_node` 插到 `linklist` 后面。
- `SingleLinkListGetLen(linklist)`：从 `linklist->node_next` 开始计数，不计传入 head 节点。
- `SingleLinkListRmNode(linklist, linklist_node)`：从 `linklist` 开始找目标节点前驱，找到后把前驱 `node_next` 改为目标节点后继。
- `SingleLinkListGetFirstNode(linklist)`：返回 `linklist->node_next`。
- `SingleLinkListGetTailNode(linklist)`：从传入节点开始走到最后一个 `node_next == NONE` 的节点，并返回该节点。
- `SingleLinkListGetNextNode(linklist_node)`：返回 `linklist_node->node_next`。
- `IsSingleLinkListEmpty(linklist)`：判断 `linklist->node_next == NONE`。

## 对应谓词选择

- 整条链从某个节点自身开始时，用 `xizi_sll(x, l)`；逻辑元素是节点地址，普通 intrusive 节点用 `list addr`。
- 只描述 head 后面的 data chain 时，不要把 head 混入 `xizi_sll`，使用 `xizi_sll_head(head, l)` 或显式写：

```coq
EX first: addr,
  xizi_head_store head first **
  xizi_sll first l
```

- `SingleLinkListGetLen` 这种从 `head->node_next` 开始的遍历，应保留 head field cell，链表主体从 `first` 开始。
- `AppendSingleLinkList` 和 `SingleLinkListGetTailNode` 从传入节点自身开始走，应使用 `xizi_sll(linklist, l)` 或前缀段 `xizi_sllseg(linklist, node, l1)`。
- `SingleLinkListNodeInsert` 是局部 splice，只需要拥有 `linklist->node_next`、原后缀 `xizi_sll(first,l)` 和待插入节点的 `node_next`。
- `SingleLinkListRmNode` 查找目标前驱，target-present 用 `xizi_sll_to_target`，target-absent 用 `xizi_sll_not_target`，不要用普通 `xizi_sllseg(target,target,l)` 做左消。

## QCIPLib 修正

当前 `QCIPLib/xizi/xizi_single_link_common` 已按 crtos 实现拆分：

- `SLL_LAYOUT`：只含 `struct_name` 和 `next_field`。
- `SLLLib`：生成基础 intrusive 单链表谓词。
- `xizi_sll : addr -> list addr -> Assertion`：对应 crtos 单链表节点地址模型。
