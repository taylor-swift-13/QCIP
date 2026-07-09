# Witness Ledger — binaryTree_height

- 目标函数：`tree_height`
- 规格：__return = tree_depth tr（前提 tree_depth tr ≤ INT_MAX）
- 手动 witness 数：7

| Witness | 内容 | 结论 |
|---|---|---|
| safety_wit_3 | lh+1 无溢出 | Qed |
| safety_wit_5 | rh+1 无溢出 | Qed |
| return_wit_1 | lh≤rh：rh+1 = tree_depth tr（Z.max） | Qed |
| return_wit_2 | lh>rh：lh+1 = tree_depth tr（Z.max） | Qed |
| return_wit_3 | 空：0 = tree_depth empty，保留 store_tree | Qed |
| partial_solve_wit_2_pure | 左递归前提 tree_depth tr1 ≤ INT_MAX | Qed |
| partial_solve_wit_3_pure | 右递归前提 tree_depth tr2 ≤ INT_MAX | Qed |
