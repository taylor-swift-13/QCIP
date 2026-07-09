# Witness Ledger — binaryTree_size

- 目标函数：`count_nodes`
- 规格：__return = tree_size tr（前提 tree_size tr ≤ INT_MAX）
- 手动 witness 数：6

| Witness | 内容 | 结论 |
|---|---|---|
| safety_wit_3 | ls+rs+1 无溢出（= tree_size tr ≤ INT_MAX） | Qed |
| safety_wit_4 | ls+rs 无溢出 | Qed |
| return_wit_1 | 非空：ls+rs+1 = tree_size tr | Qed |
| return_wit_2 | 空：0 = tree_size empty，保留 store_tree | Qed |
| partial_solve_wit_2_pure | 左递归前提 tree_size tr1 ≤ INT_MAX | Qed |
| partial_solve_wit_3_pure | 右递归前提 tree_size tr2 ≤ INT_MAX | Qed |
