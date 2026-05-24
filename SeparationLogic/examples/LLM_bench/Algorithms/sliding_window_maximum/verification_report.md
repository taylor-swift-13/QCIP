# Sliding Window Maximum Verification Report

## Case Brief

- case_name: sliding_window_maximum
- c_path: QCP_examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum.c
- target_function: maxSlidingWindow
- proof_type: direct-proof
- output_path: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum
- reference_cases: maximum_subarray, LongestIncreasingSubsequence, split_array_largest_sum
- style_reference_cases: positive=maximum_subarray and LongestIncreasingSubsequence predicate-first interval specs; negative=algorithm mirror definitions that restate C control flow in Rocq
- annotation_style: predicate-first
- anti_patterns: do not define a Rocq recursive mirror of the monotonic-queue C loop; use MinMax interval predicates and queue representation invariants instead
- lib_frozen_prefix_end_line: 172
- lib_frozen_prefix_snapshot: sha256:29c715473a6f2c8585b038c9cd545af26e1555bdb483da7920c74ad26632234f over lines 1-172
- annotation_spec_definitions_status: integrated-and-refrozen
- proof_manual_scope: witness-proofs-after-lib-migration
- current_phase: done
- main_state_files: sliding_window_maximum.c, sliding_window_maximum_lib.v, sliding_window_maximum_goal.v, sliding_window_maximum_proof_auto.v, sliding_window_maximum_proof_manual.v, sliding_window_maximum_goal_check.v

## Witness Ledger

| witness_id | category | status | owner | source_goal_version | summary | stale_reason |
| --- | --- | --- | --- | --- | --- | --- |
| maxSlidingWindow_entail_wit_1 | pure/spatial | proofable | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | initial invariant | n/a |
| maxSlidingWindow_entail_wit_2 | pure/spatial | needs-lemma | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | state-to-drop-loop conversion | n/a |
| maxSlidingWindow_entail_wit_3 | pure/spatial | needs-lemma | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | expired head pop | n/a |
| maxSlidingWindow_entail_wit_4_1 | pure/spatial | proofable | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | empty drop-loop exit | n/a |
| maxSlidingWindow_entail_wit_4_2 | pure/spatial | needs-lemma | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | fresh-front exit | n/a |
| maxSlidingWindow_entail_wit_5 | pure/spatial | proofable | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | after-drop to pending | n/a |
| maxSlidingWindow_entail_wit_6 | pure/spatial | needs-lemma | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | dominated tail pop | n/a |
| maxSlidingWindow_entail_wit_7_1 | pure/spatial | proofable | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | empty tail-loop exit | n/a |
| maxSlidingWindow_entail_wit_7_2 | pure/spatial | proofable | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | last-value exit | n/a |
| maxSlidingWindow_entail_wit_8 | pure/spatial | needs-lemma | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | push current index and rebuild queue state | n/a |
| maxSlidingWindow_entail_wit_9 | pure/spatial | proofable | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | extract output assertion | n/a |
| maxSlidingWindow_entail_wit_10 | pure/spatial | needs-lemma | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | output prefix snoc | n/a |
| maxSlidingWindow_entail_wit_13 | pure/spatial | proofable | vc-proving-subagent | sliding_window_maximum_goal.v regenerated 2026-05-20T11:30+08:00 | complete prefix final spec | n/a |

## Phase Status

- phase: vc-proving
- frozen_inputs: formal C/lib after annotation round2; generated goal/proof files refreshed by symexec
- active_scratch_paths: none
- active_phase_owner: main
- invalidated_outputs: old vc-checking round1 conclusions and old generated witness statements are stale; current vc-checking round2 is active input to proving
- blocking_reason: none
- phase_started_at: 2026-05-20T10:55:48+08:00
- phase_finished_at:
- phase_elapsed_seconds:
- timing_source: wall-clock
- human_activity_timings:
  - analysis_seconds: unknown; initial repository/style inspection in current turn
  - integration_edit_seconds: unknown; skeleton creation, annotation integration, status transition
  - proof_edit_seconds: 0
  - helper_cleanup_seconds: 0
  - subagent_wait_seconds: 0
  - review_seconds: 0
- major_time_sinks: annotation-subagent round1 639s; vc-checking round1 225s; annotation-subagent round2 observed 308s plus setup gap
- next_action: done

## Delegation Ticket - annotation round 1

- subagent_name: annotation-subagent
- skill_name: annotation-filling
- post_filling_quality_gate: annotation-checking
- task_type: annotation-phase
- phase: annotation
- phase_input_version: initial skeleton created 2026-05-20T10:55:48+08:00
- iteration_owner: subagent
- return_condition: completed | blocked | stale
- scratch_owned_paths: .tmp/QCP_examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum__annotation_subagent_tmp.c
- lib_scratch_owned_paths: .tmp/SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum__annotation_subagent_tmp_lib.v
- timing_required: true
- timing_log_path: .tmp/SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/annotation_round1_timing.md
- annotation_checking_required: true
- spec_definition_review_required: true
- annotation_focus: monotonic queue with initialized queue scratch and output prefix segment
- preferred_hidden_properties: MinMax interval max, output prefix, queue bounds/order/value monotonicity/front-correctness
- forbidden_annotation_patterns: Rocq recursive mirror of the C monotonic-queue loop, Admitted/Axiom, algorithm-body spec definitions

## Annotation Round 1 Return Summary

- round_outcome: completed
- phase_elapsed_seconds: about 639
- annotation_checking_status: passed
- ready_for_main_c_patch: integrated
- ready_for_main_lib_spec_update: integrated-and-refrozen
- qcp_summary: scratch symbolic execution reached file tail; 26 auto witnesses and 13 manual entailment witnesses
- key_issue: QCP needed explicit non-quantified range facts for nested reads through queue indices
- main_integration_status: formal C/lib updated; lib prefix refrozen at line 66 with sha256 above; formal symexec refreshed generated files

## Goal Frozen Summary

- generated_goal: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_goal.v
- generated_proof_auto: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_proof_auto.v
- generated_proof_manual: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_proof_manual.v
- generated_goal_check: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_goal_check.v
- symexec_status: passed via `/lib64/ld-linux-x86-64.so.2 linux-binary/symexec ...`; direct `linux-binary/symexec` failed with permission denied
- manual_witness_count: 13

## VC Checking Round 2 Return Summary

- round_outcome: completed
- phase_elapsed_seconds: about 300
- annotation_bug_exists: no
- proofable_witnesses: wit_1, wit_4_1, wit_5, wit_7_1, wit_7_2, wit_9, wit_13
- needs_lemma_witnesses: wit_2, wit_3, wit_4_2, wit_6, wit_8, wit_10
- recommended_next_phase: vc-proving
- proof_groups: swm_drop_loop_transition; swm_pending_and_push; swm_output_prefix_and_finish; swm_initial_frame

## Delegation Ticket - vc-proving round 1

- subagent_name: vc-proving-subagent
- skill_name: vc-proving
- task_type: vc-proving-phase
- phase: vc-proving
- phase_input_version: sliding_window_maximum_goal.v regenerated after annotation round2 around 2026-05-20T11:30+08:00
- iteration_owner: subagent
- return_condition: completed | blocked | stale
- scratch_owned_paths: .tmp/SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum__vc_proving_subagent_tmp_proof_manual.v; .tmp/SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum__vc_proving_subagent_tmp_lib.v
- timing_required: true
- timing_log_path: .tmp/SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/vc_proving_round1_timing.md
- proof_manual_write_contract: witness-proofs-after-lib-migration
- lib_write_contract: frozen-prefix-then-helper-lemmas
- protected_lib_prefix_end_line: 172
- grouping_source: vc-checking-group-plan
- group_helper_policy: group-local-helper-lib

## VC Proving Round 1 Return Summary

- round_outcome: completed
- target_witnesses: all 13 solved
- protected_prefix_respected: yes; first 172 lines of migrated `task_local_scratch_lib` matched `common_case_formal_lib` frozen prefix
- fallback_used: no; scripted concurrent worker pipeline completed
- ready_for_main_proof_manual: integrated into formal `sliding_window_maximum_proof_manual.v`
- ready_for_main_lib_append: integrated into formal `sliding_window_maximum_lib.v`
- migrated_helper_lemmas: `SWMQueueAfterDrop_to_PendingState`, `SWMQueuePendingState_pop_back_dominated`, `SWMQueuePendingState_push_current`, `SWMQueueState_window_max`, `SWMOutputPrefix_snoc`, `SWMOutputPrefix_complete`
- helper_suffix_note: scratch migration added `Require Import Coq.micromega.Lia.` immediately before proved helper lemmas; no forbidden definitions or axioms were introduced
- command_timing_summary: split 0.03s; prepare 0.04s; concurrent workers 829.52s; validate/merge 42.58s; helper migration failed once in 0.45s due missing `lia` import, then reran in 0.68s; verify 0.04s; measured command total 873.34s
- slowest_area: group `swm_pending_and_push`, especially `SWMQueuePendingState_push_current` and `proof_of_maxSlidingWindow_entail_wit_8`

## Final Check Checklist

- phase: final-check
- lib_frozen_prefix_matches_case_brief: yes; first 172 lines hash to `29c715473a6f2c8585b038c9cd545af26e1555bdb483da7920c74ad26632234f`
- proof_manual_scope_ok: yes; manual contains only 13 witness lemmas
- lib_frozen_prefix_ok: yes
- lib_helper_suffix_ok: yes; suffix has one support import and six proved helper lemmas, no forbidden definitions
- no_stale_scratch: yes after cleanup
- temp_files_cleanup_status: completed; case `.tmp` subtree and case Coq byproducts removed
- symexec_status: passed in final-check via dynamic loader; direct binary lacks execute bit
- coqc_status: passed for lib, goal, proof_auto, proof_manual, goal_check
- timing_summary_status: persisted here before cleanup
- slowest_phase: vc-proving round1
- slowest_command_or_witness: concurrent worker run, 829.52s; slowest proof area `SWMQueuePendingState_push_current` / `wit_8`
- major_time_sinks: annotation round1 qcp/invariant tuning; annotation round2 coverage predicate design; vc-proving worker proof search
- admitted_axiom_review_status: passed for formal manual/lib
- blocking_reason: none
- recommended_next_phase: done

## Timing Summary

- total_elapsed_seconds: about 3867 from 2026-05-20T10:55:48+08:00 to 2026-05-20T12:00:15+08:00 after cleanup
- total_command_seconds: at least 909.0 from measured symexec/coqc/proving commands; some short command timings were not individually captured
- total_human_activity_seconds: partially measured by subagent reports; exact total unknown
- total_subagent_wait_seconds: included in elapsed; exact wait total not independently stopwatch-segmented
- timing_gap_seconds: unknown residual from main analysis/integration, subagent setup/teardown, and worker proof-search internals

| phase | owner | started_at | finished_at | elapsed_seconds | source | notes |
| --- | --- | --- | ---: | ---: | --- | --- |
| intake + skeleton | main | 2026-05-20T10:55:48+08:00 | 2026-05-20T10:59:05+08:00 | 197 | wall-clock | Created case skeleton and initial report. |
| annotation round1 | annotation-subagent | 2026-05-20T10:59:45+08:00 | 2026-05-20T11:10:24+08:00 | 639 | subagent report | Long round; qcp fallback reached tail, checking passed. |
| symexec/goal freeze round1 | main | 2026-05-20T11:10:24+08:00 | 2026-05-20T11:13:08+08:00 | about 164 | wall-clock + command | Formal lib compile and symexec refresh. |
| vc-checking round1 | vc-checking-subagent | unknown | unknown | about 225 | subagent report | Found annotation bugs in `wit_4_2`, `wit_6`, `wit_8`. |
| annotation round2 | annotation-subagent | 2026-05-20T11:21:44+08:00 precise timestamp | 2026-05-20T11:26:52+08:00 | 308 observed plus setup gap | subagent report | Added validity/coverage predicates; checking passed. |
| symexec/goal freeze round2 | main | unknown | 2026-05-20T11:30:26+08:00 | unknown | command + wall-clock gap | Integrated annotation round2 and refreshed generated files. |
| vc-checking round2 | vc-checking-subagent | unknown | unknown | about 300 | subagent report | No annotation bugs; produced four proof groups. |
| vc-proving round1 | vc-proving-subagent | 2026-05-20T11:35:49+08:00 | unknown | > 873 command seconds | subagent report | Long round; all 13 witnesses solved by worker pipeline. |
| final-check | main | 2026-05-20T11:58:09+08:00 | 2026-05-20T12:00:15+08:00 | about 126 | command + wall-clock | Prefix/manual audits, final symexec, coqc chain passed, cleanup completed. |

| phase | command_or_step | elapsed_seconds | result | notes |
| --- | --- | ---: | --- | --- |
| annotation round1 | qcp fallback | about 120 total | passed | 4 iterations; final reached tail. |
| annotation round2 | qcp fallback symexec | about 10.7 | passed | Dynamic-loader fallback due binary execute permission. |
| vc-proving round1 | split | 0.03 | passed | Worker pipeline. |
| vc-proving round1 | prepare | 0.04 | passed | Worker pipeline. |
| vc-proving round1 | run concurrent workers | 829.52 | passed | Longest command. |
| vc-proving round1 | validate_and_merge | 42.58 | passed | Merged 13/13 witnesses. |
| vc-proving round1 | migrate helpers first run | 0.45 | failed | Missing `lia` import in `task_local_scratch_lib` suffix. |
| vc-proving round1 | migrate helpers rerun | 0.68 | passed | Added suffix support import, prefix preserved. |
| vc-proving round1 | verify_manual_goals | 0.04 | passed | Structural checks; compile deferred until main integration. |
| final-check | final symexec | about 10 | passed | Warning that manual was not overwritten is expected. |
| final-check | final coqc chain | about 15 | passed | lib, goal, proof_auto, proof_manual, goal_check. |

## Blocked / Long Subagent Rounds

| subagent_name | phase | outcome | elapsed_seconds | reason | evidence | recommended action |
| --- | --- | --- | ---: | --- | --- | --- |
| annotation-subagent | annotation round1 | completed | about 639 | Long qcp/invariant iteration | Nested queue array reads needed explicit range facts | Completed; integrated then refactored after vc-checking. |
| vc-proving-subagent | vc-proving round1 | completed | > 873 command seconds | Worker proof search and merge dominated time | `run scripted concurrent workers` 829.52s, validate/merge 42.58s | Completed; integrated proof/manual and helpers. |

## VC Checking Round 1 Return Summary

- round_outcome: completed
- phase_elapsed_seconds: about 225
- annotation_bug_exists: yes
- proofable_witnesses: wit_1, wit_2, wit_3, wit_4_1, wit_5, wit_7_1, wit_7_2, wit_9
- needs_lemma_witnesses: wit_10, wit_13
- annotation_bug_witnesses: wit_4_2, wit_6, wit_8
- recommended_next_phase: annotation
- key_annotation_gaps: universal queue element validity; queue domination/coverage strong enough to prove head is max over whole active window after enqueue

## Re-entry Brief - annotation round 2

- reentered_from_phase: vc-checking
- why_reentered: generated VC contains semantically unprovable witnesses under current annotation/spec
- what_failed_last_round: `wit_4_2` and `wit_6` lack universal queue-index validity; `wit_8` lacks domination/coverage to show queue head is max over the whole active window after enqueue
- affected_witnesses_or_files: sliding_window_maximum.c, sliding_window_maximum_lib.v, generated goal/proof files after symexec refresh
- what_changed_since_last_round: vc-checking produced concrete counterexample shapes and missing invariant classes
- must_focus_this_round: strengthen `annotation_scratch_lib`/C annotation with queue element validity and non-algorithmic dominance/coverage predicates; rerun qcp-mcp and annotation-checking before main integration

## Annotation Round 2 Return Summary

- round_outcome: completed
- phase_elapsed_seconds: observed 308 plus unknown pre-timestamp setup gap
- annotation_checking_status: passed
- ready_for_main_c_patch: integrated
- ready_for_main_lib_spec_update: integrated-and-refrozen
- qcp_summary: fallback dynamic-loader symexec on scratch reached file tail; qcp-mcp unavailable due `linux-binary/mcp` permission denied
- key_changes: added declarative queue validity, stale-removal state, pending domination, and active-window coverage predicates; preserved MinMax `WindowMaxValue`
- main_integration_status: formal C/lib updated; lib prefix refrozen at line 172 with sha256 above; formal symexec refreshed goal/auto/check and manual skeleton remains aligned with current manual witness names

## Goal Frozen Summary - after annotation round 2

- generated_goal: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_goal.v
- generated_proof_auto: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_proof_auto.v
- generated_proof_manual: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_proof_manual.v
- generated_goal_check: SeparationLogic/examples/LLM_bench/Algorithms/sliding_window_maximum/sliding_window_maximum_goal_check.v
- symexec_status: passed via `/lib64/ld-linux-x86-64.so.2 linux-binary/symexec ...`; direct binary execution remains unavailable due missing execute bit
- coqc_status_so_far: lib, goal, proof_auto, proof_manual skeleton compile
- manual_witness_count: 13
