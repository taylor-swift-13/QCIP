# Witness Ledger

最终 `source_goal_version` 下共有 7 个 target witnesses：

- `proof_of_xizi_double_link_len_entail_wit_1`
- `proof_of_xizi_double_link_len_entail_wit_2_1`
- `proof_of_xizi_double_link_len_entail_wit_2_2`
- `proof_of_xizi_double_link_len_return_wit_1`
- `proof_of_xizi_double_link_len_return_wit_2`
- `proof_of_xizi_double_link_init_then_len_return_wit_1`
- `proof_of_xizi_double_link_len_derive_nil_case_by_general`

前 5 个由 `dll_len_invariant_cycle` group 完成，后 2 个由 `len_nil_case_callsite_bridge` group 完成。两组 fixed group-check 和父级 fixed goal-check 均通过。
