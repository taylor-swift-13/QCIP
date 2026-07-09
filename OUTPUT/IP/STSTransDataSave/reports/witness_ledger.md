# Witness Ledger

- `STSTransDataSave_return_wit_1`: proved manually. True branch merges SRAM prefix, copied `data_head`, and suffix into the 1KB SRAM post-state and proves `STSTransDataSaveBytePost_true_segment`.
- `STSTransDataSave_return_wit_2`: proved manually. False branch merges unchanged SRAM prefix, `old_dst`, and suffix into the 1KB SRAM post-state and proves `STSTransDataSaveBytePost_false_segment`.
- Auto witnesses: safety, entailment, and partial-solve witnesses are provided by generated proof_auto/strategy dependencies.
