# Proof Strategy Report

The final group `dll_cut_remove_and_spec_derivations` proves all five witnesses in one context.

- The body return proof applies the existing high-level remove-result lemma to the exact six-factor
  cut layout.
- Member/front/tail derivations split `xizi_dll` at the target node, fix dispatch to 0, and build
  the generated post-wand directly.
- The self-loop derivation opens `xizi_dll(node,nil)`, fixes dispatch to 1, and reuses the two
  self-link field stores without treating the sentinel as a data member.
- No case-lib helper or import was added.

The first proving round compiled but used forbidden low-level entailment lemmas. In the retry, direct
wand construction plus `sep_apply_r_atomic` replaced all remaining `derivable1_sepcon_mono` calls.
The final full 23-name scan has zero hits.
