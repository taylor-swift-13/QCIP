# Longest Nondecreasing Subsequence Verification Report

## Case Brief

- case_name: longest_nondecreasing_subsequence
- c_path: QCP_examples/LLM_bench/Algorithms/longest_nondecreasing_subsequence/longest_nondecreasing_subsequence.c
- target_function: lengthOfLNDS
- proof_type: direct-proof
- output_path: SeparationLogic/examples/LLM_bench/Algorithms/longest_nondecreasing_subsequence
- reference_cases: maximum_subarray, split_array_largest_sum, LongestIncreasingSubsequence
- annotation_style: predicate-first
- anti_patterns: no Rocq recursive mirror of the C tails algorithm or binary search
- lib_frozen_prefix_end_line: 73
- annotation_spec_definitions_status: integrated-and-refrozen
- proof_manual_scope: witness-proofs-after-lib-migration
- final_phase: done

## Final Check Checklist

- lib_frozen_prefix_matches_case_brief: yes
- proof_manual_scope_ok: yes
- lib_frozen_prefix_ok: yes
- lib_helper_suffix_ok: yes
- no_stale_scratch: yes after cleanup
- symexec_status: passed
- coqc_status: passed for lib, goal, proof_auto, proof_manual, goal_check
- admitted_axiom_review_status: passed; no `Admitted`, `Axiom`, `Parameter`, or `Abort` in formal manual/lib
- forbidden_top_level_review: passed; manual contains only witness lemmas; lib suffix contains proved lemmas only

## Timing Summary

- total_elapsed_seconds: about 5184, from 2026-05-15T20:06:32+08:00 to 2026-05-15T21:32:56+08:00
- total_command_seconds: partially measured; about 620+ seconds, dominated by round2 worker timeout
- total_human_activity_seconds: partially measured by subagent reports
- total_subagent_wait_seconds: included in total elapsed; subagent reports are approximate
- timing_gap_seconds: significant; repeated short coqc iterations and main integration/review were not fully stopwatch-segmented

| phase | owner | elapsed_seconds | source | notes |
| --- | --- | ---: | --- | --- |
| intake | main | unknown | wall-clock gap | Created new case skeleton and froze initial lib prefix. |
| annotation | annotation-subagent | 224 | subagent report | qcp-mcp reached file end; annotation-checking passed. |
| symexec refresh | main | <1 | command output | Generated formal goal/proof files. |
| vc-checking | vc-checking-subagent | 560 | subagent report | 11 witnesses classified; no annotation bug. |
| vc-proving round1 | vc-proving-subagent | unknown | subagent report | Blocked; worker app-server read-only failure, serial fallback partial progress. |
| vc-proving round2 | vc-proving-subagent | 567+ command seconds | subagent report | Blocked; all worker groups timed out; 9/11 witnesses proved in scratch. |
| vc-proving round3 | vc-proving-subagent | 1187 | subagent report | Completed serial fallback; all witnesses proved, helpers migrated to `task_local_scratch_lib` suffix. |
| final-check | main | partially measured | command output | Formal symexec and coqc chain passed; scans passed. |

## Blocked / Long Subagent Rounds

| subagent_name | phase | outcome | evidence | recommended action |
| --- | --- | --- | --- | --- |
| vc-proving-subagent | vc-proving round1 | blocked | worker app-server read-only failure; unfinished `replace_Znth_sublist` and LNDTailsState transition helpers | re-enter vc-proving with fresh scratch |
| vc-proving-subagent | vc-proving round2 | blocked | `run_agent_concurrent` 567.04s; all 11 groups timed out; remaining `entail_wit_8_1` and `entail_wit_8_2` | re-enter vc-proving focused on serial fallback |
| vc-proving-subagent | vc-proving round3 | completed, long | 1187s serial fallback; slowest proof area `LNDTailsState_replace` | integrate scratch manual/lib and run final-check |

## Verification Results

- manual witnesses proved: 11
- migrated helper area: `longest_nondecreasing_subsequence_lib.v` after line 73
- final generated check: `longest_nondecreasing_subsequence_goal_check.v` compiles
- cleanup status: completed; this case has no remaining `.tmp` scratch paths or Coq `.aux`/`.vo`/`.vos`/`.vok`/`.glob` byproducts
