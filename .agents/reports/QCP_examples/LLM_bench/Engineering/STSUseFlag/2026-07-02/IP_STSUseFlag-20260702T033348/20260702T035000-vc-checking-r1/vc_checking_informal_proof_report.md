# VC Informal Proof Provability Report

- status: passed
- source_goal_version: source_goal_hash=fce183c808ded6acfe7b2ff73f6975889fc098e22cacd612c7bccc2cb366ec8e; proof_manual_hash=7b4ffc38b09e3c934ce68ba2a2f550b961914353e2df2242fb770982087cbd8e; lib_hash=7e7735b1618639e77a7ff2c6df9d3a753cc9cc92db6e8f4e5c4f56d9204e2fb6
- checked_witness_scope: STSUseFlag_return_wit_1, STSUseFlag_return_wit_2, STSUseFlag_return_wit_3, STSUseFlag_return_wit_4, STSUseFlag_return_wit_5, STSUseFlag_return_wit_6, STSUseFlag_return_wit_7
- summary: All seven return witnesses are semantically proofable under the current annotation and case lib. Each witness follows the same generated return pattern: prove the spatial branch by instantiating the four existential post-state values and canceling the four unchanged or updated `store` resources; prove the pure split goal by unfolding `STSUseFlagPost`, selecting the matching outer disjunct, unfolding `STSUseFlagMappedStatus` when needed, and discharging the selected conjuncts from current `PreH` facts plus reflexivity.
- candidate_lib_lemmas: empty
- existing_library_lemmas: no nontrivial existing helper lemma is required. The proof uses only current-case definitions `STSUseFlagPost`, `STSUseFlagMappedStatus`, `STSUseFlag_TRUE32`, and `STSUseFlag_FALSE32`, plus standard propositional/equality reasoning and the existing separation-logic proof tactics used by LLM_bench return witnesses (`pre_process`, `split_pure_spatial`, `cancel`, `dump_pre_spatial`).
- failed_witnesses: none
- required_annotation_rework: no
- required_lib_rework: no
- ready_for_vc_proving: yes
- forbidden_lemma_risk: none identified; no forbidden lemma is needed.

## Common VC Shape

For each `STSUseFlag_return_wit_N`, the generated theorem is a disjunction:

1. A spatial entailment from the final concrete stores to the existential postcondition.
2. A pure split goal of the form `TT && emp |-- "(STSUseFlagPost ...)" && emp`.

The spatial proof plan is uniform. Instantiate `(data_src1, update1, status1, use_old1)` with the concrete post-state values shown in the witness. The left spatial resources then match the four required post stores exactly, so the spatial side is handled by `cancel`. The remaining pure proof is exactly the corresponding `_split_goal_1` obligation.

## Witness Judgments

| witness_id | judgment | informal_proof | used_lemmas | lemma_sources | premise_discharge | missing_or_unjustified_premises | next_action |
| --- | --- | --- | --- | --- | --- | --- | --- |
| STSUseFlag_return_wit_1 | proofable | Instantiate post state as `(data_src, update, 6, 6)`. For the pure postcondition, unfold `STSUseFlagPost`; prove `new_data_src = old_data_src` by reflexivity; choose the `old_data_src = 1 /\ old_update = TRUE32` branch; unfold `STSUseFlagMappedStatus` and choose the `old_status = 1 /\ new_status = 6` branch. | Definition unfolding only: `STSUseFlagPost`, `STSUseFlagMappedStatus`, `STSUseFlag_TRUE32`; spatial tactic support `cancel`. | current-case-lib; existing proof tactic support | `data_src = 1` from `PreH3`; `update = STSUseFlag_TRUE32` from `PreH2` after unfolding `STSUseFlag_TRUE32`; mapped-status branch from `PreH1 : status = 1` and reflexivity for `6 = 6`; `new_update = update`, `new_use_old = new_status`, and store equality obligations by reflexivity/cancel. | none | Enter vc-proving in mapped-status group. |
| STSUseFlag_return_wit_2 | proofable | Instantiate post state as `(data_src, update, 7, 7)`. Select the same `data_src = 1` and `update = TRUE32` outer branch. In `STSUseFlagMappedStatus`, select the `old_status = 2 /\ new_status = 7` disjunct. | Definition unfolding only: `STSUseFlagPost`, `STSUseFlagMappedStatus`, `STSUseFlag_TRUE32`; spatial tactic support `cancel`. | current-case-lib; existing proof tactic support | `status = 2` from `PreH1`; `data_src = 1` from `PreH4`; `update = STSUseFlag_TRUE32` from `PreH3`; new post equalities are reflexive. `PreH2 : status <> 1` is generated branch context but not needed for the selected mapped-status disjunct. | none | Enter vc-proving in mapped-status group. |
| STSUseFlag_return_wit_3 | proofable | Instantiate post state as `(data_src, update, 8, 8)`. Select the true-update outer branch. In `STSUseFlagMappedStatus`, select the `old_status = 4 /\ new_status = 8` disjunct. | Definition unfolding only: `STSUseFlagPost`, `STSUseFlagMappedStatus`, `STSUseFlag_TRUE32`; spatial tactic support `cancel`. | current-case-lib; existing proof tactic support | `status = 4` from `PreH1`; `data_src = 1` from `PreH5`; `update = STSUseFlag_TRUE32` from `PreH4`; new post equalities are reflexive. `PreH2` and `PreH3` are branch context but not needed for the selected mapped-status disjunct. | none | Enter vc-proving in mapped-status group. |
| STSUseFlag_return_wit_4 | proofable | Instantiate post state as `(data_src, update, status, status)`. Select the true-update outer branch. In `STSUseFlagMappedStatus`, select the default disjunct requiring old status to be different from 1, 2, and 4, with `new_status = old_status`. | Definition unfolding only: `STSUseFlagPost`, `STSUseFlagMappedStatus`, `STSUseFlag_TRUE32`; spatial tactic support `cancel`. | current-case-lib; existing proof tactic support | `status <> 4` from `PreH1`; `status <> 2` from `PreH2`; `status <> 1` from `PreH3`; `update = STSUseFlag_TRUE32` from `PreH4`; `data_src = 1` from `PreH5`; `new_status = status` and `new_use_old = new_status` by reflexivity. | none | Enter vc-proving in mapped-status group. |
| STSUseFlag_return_wit_5 | proofable | Instantiate post state as `(data_src, update, use_old, use_old)`. Unfold `STSUseFlagPost`; select the branch for `old_data_src = 1`, `old_update <> TRUE32`, and `old_status <> 3`. | Definition unfolding only: `STSUseFlagPost`, `STSUseFlag_TRUE32`; spatial tactic support `cancel`. | current-case-lib; existing proof tactic support | `status <> 3` from `PreH1`; `update <> STSUseFlag_TRUE32` from `PreH2` after unfolding `STSUseFlag_TRUE32`; `data_src = 1` from `PreH3`; `new_update = update`, `new_status = use_old`, and `new_use_old = use_old` by reflexivity. | none | Enter vc-proving in stale-update group. |
| STSUseFlag_return_wit_6 | proofable | Instantiate post state as `(data_src, update, status, use_old)`. Unfold `STSUseFlagPost`; select the branch for `old_data_src = 1`, `old_update <> TRUE32`, and `old_status = 3`. | Definition unfolding only: `STSUseFlagPost`, `STSUseFlag_TRUE32`; spatial tactic support `cancel`. | current-case-lib; existing proof tactic support | `status = 3` from `PreH1`; `update <> STSUseFlag_TRUE32` from `PreH2` after unfolding `STSUseFlag_TRUE32`; `data_src = 1` from `PreH3`; all post-state equality conjuncts are reflexive. | none | Enter vc-proving in stale-update group. |
| STSUseFlag_return_wit_7 | proofable | Instantiate post state as `(data_src, 0, status, use_old)`. Unfold `STSUseFlagPost`; select the branch for `old_data_src <> 1`, where the function clears `update` to `FALSE32` and leaves the other fields unchanged. | Definition unfolding only: `STSUseFlagPost`, `STSUseFlag_FALSE32`; spatial tactic support `cancel`. | current-case-lib; existing proof tactic support | `data_src <> 1` from `PreH1`; `new_update = STSUseFlag_FALSE32` from unfolding `STSUseFlag_FALSE32` to `0`; `new_status = status` and `new_use_old = use_old` by reflexivity. | none | Enter vc-proving in non-data-src-one group. |

## Lemma Audit

No candidate helper lemma is required.

| lemma_name | source | statement_shape | used_by_witnesses | premises | helper_destination |
| --- | --- | --- | --- | --- | --- |
| STSUseFlagPost | current-case-lib definition | four-way relation between old and new `dataSrc`, `update`, `stsFlg`, and `useOld` | all return witnesses | selected branch premises are direct `PreH` facts or reflexive equalities | n/a |
| STSUseFlagMappedStatus | current-case-lib definition | maps status 1/2/4 to 6/7/8, otherwise preserves status | return witnesses 1-4 | selected mapped-status premises are direct `PreH` facts or reflexive equalities | n/a |
| STSUseFlag_TRUE32 | current-case-lib definition | constant `3952088175` | return witnesses 1-6 | equalities or disequalities come directly from update branch `PreH` facts after unfolding | n/a |
| STSUseFlag_FALSE32 | current-case-lib definition | constant `0` | return witness 7 | equality `0 = STSUseFlag_FALSE32` after unfolding | n/a |

## Witness Group Plan

```yaml
witness_group_plan:
  - proof_group_id: sts_useflag_true_update_mapped_status
    members:
      - STSUseFlag_return_wit_1
      - STSUseFlag_return_wit_2
      - STSUseFlag_return_wit_3
      - STSUseFlag_return_wit_4
    representative_witness: STSUseFlag_return_wit_1
    natural_language_proof_pattern: >
      Use the generated return-witness pattern. Run pre-processing, split pure/spatial obligations,
      cancel the four store resources, unfold STSUseFlagPost, select the data_src=1/update=TRUE32
      branch, unfold STSUseFlagMappedStatus, and select the matching mapped-status disjunct.
      Witnesses 1-3 choose the concrete 1->6, 2->7, 4->8 disjuncts; witness 4 chooses the default
      not-1/not-2/not-4 disjunct.
    shared_helper_candidates: []
    proving_hints:
      - unfold STSUseFlagPost, STSUseFlagMappedStatus, STSUseFlag_TRUE32
      - split_pure_spatial; cancel the spatial side
      - use current PreH equality/disequality facts for the selected disjunct
      - avoid forbidden structural equivalence lemmas; no helper needed
    grouping_confidence: high
  - proof_group_id: sts_useflag_stale_update_preserve_or_restore
    members:
      - STSUseFlag_return_wit_5
      - STSUseFlag_return_wit_6
    representative_witness: STSUseFlag_return_wit_5
    natural_language_proof_pattern: >
      Cancel the post stores after instantiating the post-state values. Unfold STSUseFlagPost and
      select one of the old_data_src=1/update<>TRUE32 branches: witness 5 uses old_status<>3 and
      restores status from useOld; witness 6 uses old_status=3 and preserves status/useOld.
    shared_helper_candidates: []
    proving_hints:
      - unfold STSUseFlagPost, STSUseFlag_TRUE32
      - use PreH1 for the status branch and PreH2 for update<>TRUE32
      - all remaining field equalities are reflexive
    grouping_confidence: high
  - proof_group_id: sts_useflag_non_data_src_clears_update
    members:
      - STSUseFlag_return_wit_7
    representative_witness: STSUseFlag_return_wit_7
    natural_language_proof_pattern: >
      Cancel the post stores after instantiating update to 0. Unfold STSUseFlagPost and select the
      old_data_src<>1 branch. Unfold STSUseFlag_FALSE32 to close the update equality.
    shared_helper_candidates: []
    proving_hints:
      - unfold STSUseFlagPost, STSUseFlag_FALSE32
      - use PreH1 for data_src<>1
      - all preserved-field equalities are reflexive
    grouping_confidence: high
```

## Timing Summary

- phase_started_at: 2026-07-02T11:50:03+08:00
- phase_finished_at: 2026-07-02T11:51:36+08:00
- phase_elapsed_seconds: 93
- slowest_step: witness shape and generated return-pattern analysis, 33 seconds
- major_time_sinks: reading the generated witness shape and checking that each pure branch of `STSUseFlagPost` is directly covered by current `PreH` facts.
- long_duration_reason: n/a; elapsed time did not exceed 600 seconds.
- blocking_reason: n/a
- recommended_next_phase: vc-proving

## Round Outcome

- round_outcome: completed
- ready_for_main: vc-checking report is ready for main ledger update and vc-proving ticket preparation.
- cleanup_status: n/a; vc-checking owned no scratch paths.
