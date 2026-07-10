# Witness Ledger — binaryTree_invert

- 目标函数：`invert_tree`
- 规格：store_tree(root,tr) ⇒ store_tree(root, tree_mirror tr)（功能正确性）
- 手动 witness 数：2

| Witness | 内容 | 结论 |
|---|---|---|
| return_wit_1 | root=NULL：tr=empty ⇒ tree_mirror tr=tr | Qed |
| return_wit_2 | root≠NULL：tree_mirror(make_tree tr1 tr2)=make_tree(mirror tr2)(mirror tr1) | Qed |
