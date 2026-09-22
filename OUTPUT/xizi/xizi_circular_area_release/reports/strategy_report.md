# Strategy Report

唯一 manual witness 在 `release_resource_unfold` group 中通过展开 `CircularAreaBackingResource` 证明；`UCharArray::mixed_full` 原样交给 buffer 的 `x_free`，descriptor 字段更新后交给第二个 `x_free`。parent verify 合并后运行 full fixed goal_check；未新增 helper/import，未使用 forbidden lemma。
