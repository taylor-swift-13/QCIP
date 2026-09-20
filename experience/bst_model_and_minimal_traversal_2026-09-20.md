# BST 模型接入与最小遍历验证经验（2026-09-20）

`bst.zip` 提供的核心建模思路是把 C 指针节点映射到有限有向图：`bst_left`、`bst_key_of` 等函数读取抽象图中的边和标签，`ptr_of` 把可选顶点转换为 C 指针值，分离逻辑谓词负责连接具体字段单元与抽象图。

最小可验证切片不需要完整 `tree_store` 展开，也不需要插入、删除 case 的策略库。对单次 `root->left` 读取，只要求该字段满足：

```text
store(&(root->left), ptr_of(bst_left(g, root)))
```

返回后保持同一 `store`，并证明返回值等于 `ptr_of(bst_left(g, root))`。这会产生一个语义直接的 manual witness；证明模式是展开定义、选择正常返回分支、分离纯/空间命题、`cancel` 保留字段，再以反身性关闭等式。

完整验证记录归档在 `OUTPUT/bst/bst_left_child/`。更复杂的沿左链遍历应在此基础上引入 `left_reachable` 和循环/递归不变式，而不是把这些条件提前塞进单步读取规格。
