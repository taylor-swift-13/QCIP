# XiZi AVL 左旋验证经验

## 1. 为什么旧谓词和旧规格不够

旧抽象类型只有：

```coq
empty | make_tree left right
```

旧 `store_tree` 虽然递归拥有节点内存，但把 `data`、`height` 和孩子地址全部存在量化。
因此它只记录二叉树形状，不能区分不同节点身份、载荷和缓存高度。旧左旋后置条件又仅为
`store_non_empty_tree(r)`，会进一步遗忘原根、被提升的右孩子、三棵子树以及旋转前后关系。

这种规格只能证明“返回了一棵非空二叉树”，不能证明执行了左旋。

## 2. 地址标记抽象树

新 case 使用：

```coq
Inductive addr_avl_tree :=
| avl_empty
| avl_node_model
    (address data cached_height : Z)
    (left right : addr_avl_tree).
```

每个抽象节点记录：

- 物理节点地址；
- `data` 字段；
- 当前缓存 `height` 字段；
- 完整左右子树。

`store_addr_avl p t` 是递归分离逻辑谓词。非空分支要求 `p` 等于模型中的节点地址，分离地
拥有四个字段，并递归拥有左右子树。这使规格无法用另一批地址或凭空复制的等形树代替原堆。

## 3. 左旋的数学关系

精确关系是：

```text
before = Node(root, d, h, A,
              Node(promoted, rd, rh, B, C))

after  = Node(promoted, rd, rh,
              Node(root, d, h, A, B), C)
```

这同时固定：

- 原右孩子 `promoted` 成为返回根；
- 原根 `root` 成为其左孩子；
- 中间子树 `B` 移到原根右侧；
- `A`、`B`、`C` 的完整模型及内存所有权保持；
- 两个节点的地址、数据和缓存高度字段逐值保持；
- 没有分配、释放、丢失、复制或别名化资源。

## 4. “完整描述代码”不等于“虚构 AVL 平衡恢复”

当前 C 函数只写两个指针字段，没有写 `height`。因此正确规格必须精确说明缓存高度保持旧值；
不能声称旋转后高度已刷新，也不能声称一般情况下恢复了 AVL 平衡。若产品需求要求这两个性质，
必须先修改 C 实现以重新计算高度，并为平衡条件补充可证明的前置条件，不能通过加强后置条件伪造。

本 case 的“完全功能正确性”指对现有指针旋转 primitive 的所有可观察堆效果做完整、无遗忘的描述。

## 5. 源码与证明隔离

`INPUT/xizi/xizi_avl_left_rotate/` 保持无 annotation。验证副本位于
`Verification/xizi/xizi_avl_left_rotate/`；Rocq 文件位于
`SeparationLogic/examples/Verification/xizi/xizi_avl_left_rotate/`。

旧错误 AVL proof 及旧弱公共谓词库已整体移动到：

```text
archieve/xizi_avl_invalid_20260714/
```

归档只用于审计，任何新证明不得导入其中结论。

## 6. 验证检查表

- [ ] 抽象树记录地址、数据、高度和两棵子树。
- [ ] 递归谓词拥有每个节点四个字段及全部子树。
- [ ] 前置状态明确是 `A (B C)`，且被提升节点非空。
- [ ] 后置状态明确是 `(A B) C`。
- [ ] 返回值等于原右孩子地址。
- [ ] `A`、`B`、`C` 和两个根节点身份保持。
- [ ] 所有空间资源在后置条件中出现且只出现一次。
- [ ] 不虚构 height 更新或平衡恢复。
- [ ] manual 只含 witness proof，无 helper/Admitted/额外 Axiom。
- [ ] parent full check 与 final-check 都通过。
- [ ] 最终源码、全部 Rocq 文件、accepted controller evidence 和复现说明均已同步到 `OUTPUT/<case>/`；`doc` 不能替代发布目录。

## 7. 最终验证记录

- run：`xizi_avl_left_rotate-20260714130000`，最终 phase `done`；
- source-goal version：`6da032c68fa16d1834116bcb630fedb46237df8880afa00b9f967b09cfefed95`；
- target witness：`proof_of_xizi_avl_left_rotate_return_wit_1`；
- group：`left_rotation_relation_and_frame`；
- helper/import：无；
- group-check：通过；
- parent full fixed check：通过；
- final fixed check：通过，编译约 134.71 秒；
- manual/case-lib：无 `Admitted`、额外 `Axiom`、forbidden lemma；
- controller 总 wall-clock：约 3374.87 秒；
- 交付归档：`doc/xizi_avl_left_rotate/`；
- 最终发布全集：`OUTPUT/xizi/xizi_avl_left_rotate/`；
- 旧错误证明：`archieve/xizi_avl_invalid_20260714/`。

## 8. `OUTPUT` 是最终发布门

controller 的 `final-candidate-apply` 只负责把 accepted candidate 写回正式 `Verification` 和 `SeparationLogic/examples/Verification` 路径；`verification-entry` 还要求维护 `doc/<case>/`，但这两步都不会自动生成仓库面向用户的 `OUTPUT`。因此 case 收尾必须另设发布门：

- `OUTPUT/<case>/source/` 同时保存 annotated 正式源码和明确命名的无 annotation 输入快照；
- `OUTPUT/<case>/rocq/` 收齐 case lib、goal、auto、manual、goal-check、diagnostics 和 snapshot；
- `OUTPUT/<case>/reports/` 收齐标准摘要、当前 accepted controller round/group/final-check evidence、新鲜度证据和经验总结；
- 根目录保存中文 README；
- 发布后以 `diff -qr`/`cmp` 检查 `OUTPUT` 与正式源、formal 目录及当前 report root 一致，并运行发布源码的语法检查。

以后不得把“正式文件已写回”或“`doc` 已归档”误当作“`OUTPUT` 已交付”。
