# Case Brief

- Case：`xizi_avl_left_rotate`
- Run：`xizi_avl_left_rotate-20260714130000`
- 干净输入：`INPUT/xizi/xizi_avl_left_rotate/xizi_avl_left_rotate.c`
- 正式 annotation source：`Verification/xizi/xizi_avl_left_rotate/xizi_avl_left_rotate.c`
- Formal：`SeparationLogic/examples/Verification/xizi/xizi_avl_left_rotate/`
- Proof 类型：direct、predicate-first separation logic
- 功能目标：同地址、同载荷、同缓存高度、同三棵子树的精确左旋。
- 内存目标：完整堆 frame 保持，无分配、释放、遗失、复制或别名化。
- 明确不声称：函数未执行的高度刷新和一般 AVL 平衡恢复。
- 反模式：只返回非空树；遗忘节点身份/数据/高度/子树；导入旧归档证明；在 `INPUT` 写 annotation。
