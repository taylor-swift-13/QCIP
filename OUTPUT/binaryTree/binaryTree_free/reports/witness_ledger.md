# Witness Ledger — binaryTree_free

- 目标函数：`free_tree`
- 规格：store_tree(root,tr) ⇒ emp（内存安全：无泄漏 / 无 double free）
- 手动 witness 数：0

| Witness | 内容 | 结论 |
|---|---|---|
| （无手动 witness） | 全部由 proof_auto + strategies 自动判定 | 全自动 |
