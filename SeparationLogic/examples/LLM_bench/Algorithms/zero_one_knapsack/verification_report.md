# Zero One Knapsack Verification Report

## Case Brief

- case_name: zero_one_knapsack
- c_path: QCP_examples/LLM_bench/Algorithms/zero_one_knapsack/zero_one_knapsack.c
- target_function: zeroOneKnapsack
- proof_type: direct-proof
- output_path: SeparationLogic/examples/LLM_bench/Algorithms/zero_one_knapsack
- reference_cases: coin_change, house_robber, LongestIncreasingSubsequence, split_array_largest_sum
- style_reference_cases: positive predicate-first DP examples are coin_change and house_robber; avoid Rocq-side C loop mirrors from historical max-subarray diagnostics
- annotation_style: predicate-first
- anti_patterns: do not define the final answer by replaying the C dynamic-programming loops in Rocq; use MinMax/MaxMin mathematical maximum over feasible plans
- lib_frozen_prefix_end_line: 69
- lib_frozen_prefix_snapshot: f25d59ae0e55d7d60d0be94d7f88439682b9d36067bfed3b139a349c162d8d26
- annotation_spec_definitions_status: integrated-and-refrozen
- proof_manual_scope: witness-proofs-after-lib-migration
- final_phase: done
- main_state_files: zero_one_knapsack.c, zero_one_knapsack_lib.v, zero_one_knapsack_goal.v, zero_one_knapsack_proof_auto.v, zero_one_knapsack_proof_manual.v, zero_one_knapsack_goal_check.v

## Verification Results

- symbolic execution: passed to file end after final-check rerun
- manual witnesses proved: 20 / 20
- goal_check: compiled successfully
- final answer spec: `KnapsackMaxValue` uses `MaxMinLib.max_value_of_subset` over feasible 0/1 selected-index plans with `NoDup`, index bounds, total weight within capacity, and summed values
- generated hashes:
  - c: 35486aca5f555a3cb5f5343a52083cb5c6a8a0ac81fb83439f713ab0fa1a2891
  - lib: f550d84428797848a77a87ebbb418d181d1d64ee5b3e9b433e513537c9379777
  - goal: c3ea8c1bd7881cf154d28fd790cca309bf3077d5ca25e8345fa26338b185ee82
  - proof_auto: 0db7e3d3be79e0393514b0d8c8825ace869e548a7431414f5d557e52c88d4e6e
  - proof_manual: 8b11ec855f7510303ec1c84f14bb52704b65b5954682cbf472344361b2284445
  - goal_check: 13cf6fa2f22301bb7125f0079941b7f3337f74ab1c50ff5ce58cd9c5e95f4012

## Final Check Checklist

- lib_frozen_prefix_matches_case_brief: yes
- proof_manual_scope_ok: yes; formal manual contains only the 20 witness lemmas
- lib_frozen_prefix_ok: yes; first 69 lines hash to the frozen prefix snapshot
- lib_helper_suffix_imports_ok: yes; helper suffix imports are `Require Import` / `From ... Require Import` lines and do not import generated `SimpleC.EE.*` case artifacts
- lib_helper_suffix_ok: yes; suffix contains proved helper lemmas and no forbidden top-level definitions
- no_stale_scratch: yes after cleanup
- temp_files_cleanup_status: completed; current case `.tmp` scratch/worker dirs and Coq side products removed
- symexec_status: passed; final rerun reported the expected manual-not-overwritten warning
- coqc_status: passed for lib, goal, proof_auto, proof_manual, goal_check
- admitted_axiom_review_status: passed; no `Admitted.`, top-level `Axiom`, `Parameter`, or `Abort` in formal manual/lib

## Phase Ledger

| phase | owner | status | notes |
| --- | --- | --- | --- |
| intake | main | completed | New Algorithms case created for classic 0/1 knapsack. |
| annotation | annotation-subagent | completed | qcp-mcp reached file end; annotation-checking passed. |
| goal-frozen | main | completed | Formal symexec refreshed generated files; manual skeleton contained 20 witnesses. |
| vc-checking | vc-checking-subagent | completed | No annotation bug; recurrence/table witnesses needed helper lemmas. |
| vc-proving | vc-proving-subagent | completed, long | Concurrent worker pipeline proved all witnesses; helpers migrated to `task_local_scratch_lib`. |
| final-check | main | completed | Final symexec, coqc chain, structural scans, and cleanup passed. |

## Timing Summary

- total_elapsed_seconds: at least 4350 from first recorded current-round annotation artifact at 2026-05-21T08:45+08:00 to pre-cleanup report at 2026-05-21T09:57:28+08:00
- total_command_seconds: at least 2900, dominated by vc-proving worker/validate/migration commands
- total_failed_rerun_seconds: at least 630 from vc-proving validation/migration reruns plus one failed include-path symexec and one stale empty-manual symexec rerun
- total_human_activity_seconds: partially measured; report/inspection/integration/review time is included in elapsed but not fully segmented
- total_subagent_wait_seconds: included in total elapsed; vc-proving accounted command time alone was about 2595s
- timing_gap_seconds: present; early intake/search time and short main review/edit intervals were not stopwatch-segmented

| command or phase | elapsed_seconds | result |
| --- | ---: | --- |
| annotation-subagent qcp symbolic attempts | about 129.84 | passed on scratch |
| `task_local_scratch_lib` compile | 0.35 | passed |
| formal symexec initial success | 72.174 | passed |
| formal symexec manual-skeleton refresh | 71.721 | passed |
| vc-proving split/prepare/run/validate/migrate/verify | about 2595 | completed |
| formal coqc after integration | lib 0.668, goal 0.838, auto 0.345, manual 43.083, check 0.400 | passed |
| final-check symexec | 72.464 | passed |
| final-check coqc chain | lib 0.827, goal 1.046, auto 0.439, manual 51.090, check 0.385 | passed |
| cleanup | 0.018 | current case scratch and Coq side products removed |

## Blocked / Long Subagent Rounds

| subagent_name | phase | outcome | elapsed / evidence | recommended action |
| --- | --- | --- | --- | --- |
| vc-proving-subagent | vc-proving | completed, long | accounted command time about 2595s; slow group `G_dp_recurrence_append`, especially `proof_of_zeroOneKnapsack_entail_wit_11` and recurrence/value-bound helpers | integrated completed handoff; no follow-up phase needed |

## VC Proving Summary

- worker mode: scripted concurrent worker pipeline; no serial fallback
- worker groups solved: 5 / 5
- validation: `validate_and_merge.py`, `migrate_helpers_to_lib.py`, `verify_manual_goals.py`, and `task_local_scratch_lib` `coqc` passed
- helper migration: helper lemmas and audited imports moved into `zero_one_knapsack_lib.v` after frozen line 69
- notable helper families: row progress/rows done plumbing, table lookup, base row/column zero cells, plan split by last item, take/keep/too-heavy recurrence, value bounds, append-cell preservation
- known warnings: Coq 8.20 deprecation warnings for `map_length` / `seq_length` in helper proofs; compilation succeeds

## Cleanup Plan

- current case `.tmp` scratch and worker directories: removed
- current case Coq side products (`.aux`, `.glob`, `.vo`, `.vok`, `.vos`): removed from the formal directory
- preserved deliverables: `.c`, `problem.txt`, `*_goal.v`, `*_proof_auto.v`, `*_proof_manual.v`, `*_goal_check.v`, `zero_one_knapsack_lib.v`, and this report
