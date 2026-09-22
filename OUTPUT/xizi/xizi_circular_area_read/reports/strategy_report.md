# Proof strategy

1. Query witnesses open `store_circular_area` only inside proofs and derive Full/Empty/DataLength observations from `CircularAreaLogicalState`.
2. DivideRdData uses an implementation-local existential bridge for the hidden layout discriminator while leaving the public Read contract abstract.
3. Copy-setup witnesses derive initialized one- or two-slice intervals from `CircularAreaLiveBytes`; the whole backing array stays `mixed_full`.
4. Success witnesses rebuild the caller output as `map Some prefix ++ untouched suffix` and rebuild ring ownership with the FIFO suffix.
5. Error witnesses select the explicit identity-transition branch.

首次 parent merge 暴露 `return_wit_5/6` 对合并上下文敏感；把 `aggressive_pre_process` 改为显式选择 `CircularAreaErrorResult` 分支后，完整 parent 与 final fixed check 均通过。
