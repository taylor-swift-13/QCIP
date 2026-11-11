# CRTOS AVL 四个公开 API 的规约说明

状态：最终 QCP 检查已通过（控制器 done）。目标为 CRTOS 原始提交 f62bc98621e4298370a662a8b7f02fc6d86d4930 的四个公开 AVL API。93/93 项手写目标全部 Qed，没有添加独立调用点或测试程序的证明。

公开状态统一使用键集合。`avl_key_set := Z -> Prop`，`keys k` 表示键 k 存在；`avl_set_insert keys k` 的成员条件为 `x = k \/ keys x`，`avl_set_remove keys k` 为 `keys x /\ x <> k`。集合没有保存节点地址。`avl_balanced_set_root_rep keys root` 内部存在一个图模型 g，要求其 BST、缓存高度、AVL 平衡和非空节点地址条件成立，root 对应模型根，集合成员恰好等于模型中的键，并拥有整棵树的内存。

内存由 `avl_tree_store` 展开为节点列表上的分离合取。每个节点拥有 data、height、left、right 四个 C 字段，值与模型一致。分离合取保证这些资源互不重叠。纯图模型是描述内存的逻辑值，不能代替字段的内存所有权。`avl_api_runtime_strings` 单独保存原始日志调用需要的只读字符串资源，调用后归还。

## AvlNodeSearchNode

前条件拥有以 avl_node 为根、键集合为 keys 的合法 AVL 树，允许空树。未命中分支要求键不在集合，返回 NULL，保持原根与键集合并归还树资源。low spec 使用同一个图 g，因此也描述具体节点字段不变。命中分支直接存在量化图 g，给出返回指针非空、节点有效和节点键等于 data，并显式交还返回节点四个字段与其余节点的资源。因此 data 字段的值直接等于查找键；命中分支归还结果图上的 BST、缓存一致性和平衡事实。high spec 用根和集合描述前后状态，未公开前后图的地址恒等关系。

```c
AvlNodeType AvlNodeSearchNode(AvlNodeType avl_node, int data)
  /*@ high_level_spec <= low_level_spec
      With keys
      Require avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
      Ensure (
        ((!avl_set_member(keys, data) && __return == 0) &&
         avl_balanced_set_root_rep(keys, avl_node)) ||
        (exists g,
          avl_set_member(keys, data) && __return != 0 &&
          avl_gvalid(g) && avl_tree_valid(g) && avl_balanced(g) &&
          avl_node == avl_ptr_of(avl_root(g)) &&
          avl_set_refines_graph(keys, g) &&
          avl_vvalid(g, __return) &&
          avl_key_of(g, __return) == data &&
          store(&(__return->data), data) *
          store(&(__return->height), avl_height_of(g, __return)) *
          store(&(__return->left), avl_ptr_of(avl_left(g, __return))) *
          store(&(__return->right), avl_ptr_of(avl_right(g, __return))) *
          avl_graph_nodes_store(g, avl_nodes_without(g, __return))) ) * avl_api_runtime_strings
   */
```

```c
AvlNodeType AvlNodeSearchNode(AvlNodeType avl_node, int data)
  /*@ low_level_spec
      With g LitMap
      Require
        avl_tree_valid(g) &&
        avl_search_cursor_valid(g, avl_node, data) &&
        avl_subtree_store_at(g, avl_node) * GlobalStrings(LitMap)
      Ensure
        avl_search_result(g, data, __return) &&
        avl_subtree_store_at(g, avl_node) * GlobalStrings(LitMap)
 */
```

## AvlTreeInsertNode

前条件要求合法 AVL 树和 C int 范围内的 data。键已存在时，返回原输入根，集合不变；新键插入成功时，返回结果树根，集合精确变为 avl_set_insert keys data。返回的是根，不能从插入成功直接推出它就是新节点地址。分配失败时返回 NULL，并由 avl_api_insert_failure_rep 描述原始代码沿搜索路径清空孩子链接后的实际堆资源。该分支不保证原树保持完整，也不能把 NULL 自动解释为拥有一棵合法空 AVL 树。原有未释放节点的资源仍由后条件交还。

```c
AvlNodeType AvlTreeInsertNode(AvlNodeType avl_node, int data)
 /*@ high_level_spec <= low_level_spec
 With keys
 Require INT_MIN <= data && data <= INT_MAX &&
   avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
 Ensure
  ((avl_set_member(keys, data) && __return == avl_node &&
    avl_balanced_set_root_rep(keys, __return)) ||
   (!avl_set_member(keys, data) && __return != 0 &&
    avl_balanced_set_root_rep(avl_set_insert(keys, data), __return)) ||
   (__return == 0 && avl_api_insert_failure_rep(keys, avl_node, data))) *
  avl_api_runtime_strings
 */
```

```c
AvlNodeType AvlTreeInsertNode(AvlNodeType avl_node, int data)
  /*@ low_level_spec
      With before LitMap
      Require avl_insert_input(before, avl_node, data) &&
              avl_subtree_store_at(before, avl_node) * GlobalStrings(LitMap)
      Ensure exists after,
               strict_insert_outcome(before, after, data, __return) &&
               avl_tree_store(after) * GlobalStrings(LitMap)
   */
```

## AvlTreeDeleteNode

前条件拥有合法 AVL 树。后条件只有两条按键是否存在区分的分支。键不存在时，返回原输入根，集合不变并归还合法树资源；low spec 另外记录有效节点及其字段的保持关系。键存在时，结果树集合精确为 avl_set_remove keys data，仍满足 AVL 条件。第二条同时容纳空结果：删除唯一键时返回 NULL，集合为空，不再另列空树分支。两孩子分支复制前驱键，并递归从左子树删掉原前驱键；具体释放哪个地址取决于递归走到的分支。集合规约不承诺其余键仍绑定原地址。

```c
AvlNodeType AvlTreeDeleteNode(AvlNodeType avl_node, int data)
  /*@ high_level_spec <= low_level_spec
      With keys
      Require avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
      Ensure (
        (!avl_set_member(keys, data) && __return == avl_node &&
         avl_balanced_set_root_rep(keys, __return)) ||
        (avl_set_member(keys, data) &&
         avl_balanced_set_root_rep(avl_set_remove(keys, data), __return)) ) * avl_api_runtime_strings
  */
```

```c
AvlNodeType AvlTreeDeleteNode(AvlNodeType avl_node, int data)
  /*@ low_level_spec
      With before LitMap
      Require avl_gvalid(before) && avl_node == avl_ptr_of(avl_root(before)) &&
              avl_tree_store(before) * GlobalStrings(LitMap)
      Ensure exists after,
        avl_delete_outcome(before, after, data, __return) &&
        avl_api_delete_identity(before, after, data) &&
        avl_tree_store(after) * GlobalStrings(LitMap)
 */
```

## AvlNodeModifyNode

前条件拥有合法 AVL 树。若输入根为空，原始实现立即返回 NULL，仍保留原空树，不执行插入。若输入根非空，先删除 src_data，再插入 dst_data；成功时结果集合精确为 avl_set_insert (avl_set_remove keys src_data) dst_data，返回结果根。即使源键不存在，也会继续插入目标键。失败分支交还先删除、再按原始插入失败路径操作后的真实堆状态，不保证源键或原树恢复。src_data 与 dst_data 相等时，也不能据此承诺无需重新分配或不会失败。

```c
AvlNodeType AvlNodeModifyNode(AvlNodeType avl_node, int src_data, int dst_data)
 /*@ high_level_spec <= low_level_spec
 With keys
 Require avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
 Ensure
  ((avl_node == 0 && __return == 0 && avl_balanced_set_root_rep(keys, avl_node)) ||
   (avl_node != 0 && __return != 0 &&
    avl_balanced_set_root_rep(avl_set_insert(avl_set_remove(keys, src_data), dst_data), __return)) ||
   (__return == 0 && avl_api_modify_failure_rep(keys, avl_node, src_data, dst_data))) *
  avl_api_runtime_strings
 */
```

```c
AvlNodeType AvlNodeModifyNode(AvlNodeType avl_node, int src_data, int dst_data)
 /*@ low_level_spec
 With before LitMap
 Require avl_gvalid(before) && avl_node == avl_ptr_of(avl_root(before)) &&
   avl_tree_store(before) * GlobalStrings(LitMap)
 Ensure
  ((avl_node == 0 && __return == 0 && avl_tree_store(before)) ||
   (exists middle after,
     avl_node != 0 &&
     avl_delete_outcome(before, middle, src_data, avl_ptr_of(avl_root(middle))) &&
     strict_insert_outcome(middle, after, dst_data, __return) && avl_tree_store(after))) *
  GlobalStrings(LitMap)
 */
```

## 共用内部函数与证明边界

四个 API 包含同一份已注解内部实现，Height、更新高度、平衡因子、左右单旋、左右双旋和 Balance 各有一份图与内存层规约，没有按不同 API 替换 callee 规约。Height 只有 low-level spec。Delete 的 cursor_level_spec 是同一 low spec 推导出的内部资源视图，用于先读取前驱节点字段再递归删除。函数体与 low 到 high 的手写 VC 必须全部完成，不能用符号执行到 EOF 代替证明。分配、释放和日志作为显式外部服务契约列出；生成 auto 文件按先前约定保持原样并单独记录，不计为手写证明完成。

## Set 与内存表示的 Rocq 定义

在合法根表示里，NULL 根对应空键集合和空节点内存；空树仍使用相同的 avl_balanced_set_root_rep。分配失败谓词只交还失败图的节点资源，不声称失败图满足 avl_gvalid，因此返回 NULL 并不能把失败路径当成合法空树。With keys 是逻辑参数，C 函数的运行时签名没有加入集合。

```coq
Definition avl_ptr_of (x : option addr) : addr :=
  match x with
  | None => NULL
  | Some p => p
  end.

Definition avl_gvalid (g : avl_model) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_balanced g /\
  avl_vertices_nonnull g.

Definition avl_tree_valid (g : avl_model) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_vertices_nonnull g.
```

```coq
Definition avl_key_set := Z -> Prop.

Definition avl_set_refines_graph (keys : avl_key_set) (g : avl_model) : Prop :=
  forall key, keys key <-> In key (avl_keys g).

Definition avl_set_member (keys : avl_key_set) (key : Z) : Prop := keys key.

Definition avl_set_insert (keys : avl_key_set) (key : Z) : avl_key_set :=
  fun x => x = key \/ keys x.

Definition avl_set_remove (keys : avl_key_set) (key : Z) : avl_key_set :=
  fun x => keys x /\ x <> key.

Definition avl_balanced_set_root_rep (keys : avl_key_set) (root : addr) : Assertion :=
  EX g, “ avl_gvalid g /\ root = avl_ptr_of (avl_root g) /\
          avl_set_refines_graph keys g ” && avl_tree_store g.
```

```coq
Definition avl_graph_node_store (g : avl_model) (x : addr) : Assertion :=
  “ avl_vvalid g x ” &&
  “ x <> NULL ” &&
  “ INT_MIN <= avl_key_of g x <= INT_MAX ” &&
  “ 0 <= avl_height_of g x <= UINT_MAX ” &&
  &(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x **
  &(x # "AvlNode" ->ₛ "height") # UInt |-> avl_height_of g x **
  &(x # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g x) **
  &(x # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g x).

Definition avl_graph_nodes_store (g : avl_model) (xs : list addr) : Assertion :=
  iter_sepcon (map (avl_graph_node_store g) xs).

Definition avl_tree_store (g : avl_model) : Assertion :=
  avl_graph_nodes_store g (avl_nodes g).
```

## 验证证据

| 范围 | 函数体手写目标 | 规约蕴含 |
|---|---:|---:|
| Search | 10 | 1 |
| Insert | 15 | 1 |
| Delete | 19 | 2（high 与 cursor） |
| Modify | 3 | 1 |
| 共用的 8 个内部函数 | 41 | 0 |
| 合计 | 88 | 5 |

合并检查和当前源码的最终符号执行、Rocq 编译均通过。93 项手写目标和 12 个新增辅助引理均以 Qed 结束；手写证明和规约库没有 Admitted 或新增 Axiom，禁用引理检查无命中。按先前约定，182 个生成 auto 的 Admitted 保留原样，未计为已证明。内存分配、释放和日志按列明的外部契约验证。

## 复验

在仓库根目录运行以下命令。需要 Coq 8.20.1、Python 3 和仓库自带的 Linux QCP 2.1.0 执行器。确保 PATH 上的 coqc 和 coqtop 对应同一版本。

```sh
set -e
scratch=$(mktemp -d)
case_name=crtos_avl_api_crtos
case_dir=SeparationLogic/examples/INPUT/crtos/$case_name
linux-binary/symexec \
  --goal-file="$scratch/${case_name}_goal.v" \
  --proof-auto-file="$scratch/${case_name}_proof_auto.v" \
  --proof-manual-file="$scratch/${case_name}_proof_manual.v" \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=SimpleC.EE.INPUT.crtos.crtos_avl_api_crtos \
  --input-file="INPUT/crtos/$case_name/$case_name.c" --no-exec-info
for suffix in goal proof_auto goal_check; do
  cmp "$scratch/${case_name}_$suffix.v" "$case_dir/${case_name}_$suffix.v"
done
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root . --build-workspace "$scratch/build" \
  --target-file "$case_dir/${case_name}_goal_check.v" --target-kind check \
  --source-goal-version bce5b5b736e74af7ae56cc12085c2dbd0d4f29f867fac2d1cfbe7b3a72c89333
```
