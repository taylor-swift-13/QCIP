# Proof Strategy Report

- target witnesses: 2
- grouping source: accepted vc-checking group plan
- parent verification: passed
- helper policy: no helper/import added; case_lib remains annotation-approved and wrapper-free
- manual policy: witness proofs only

## Groups

- `dll_empty_rec_sentinel_discrimination`: first differs from sentinel excludes nil；first equals sentinel excludes nonempty；直接完成 0/1 等式并用 `xizi_dll_close` 重闭合 ownership。
