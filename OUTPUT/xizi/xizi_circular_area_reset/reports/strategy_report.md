# Proof strategy

1. Unfold `store_circular_area` at the internal entailment point and retain its hidden witnesses.
2. Execute the three field stores while preserving all untouched descriptor fields and the same `UCharArray.mixed_full` resource.
3. Repackage the post-state with read/write/status equal to zero and the same capacity/physical list.
4. Establish `CircularAreaLogicalState 0 0 capacity 0 nil physical`; the live-byte obligation is vacuous and the empty-state iff follows from capacity positivity.

No helper lemma or case-lib import was required.
