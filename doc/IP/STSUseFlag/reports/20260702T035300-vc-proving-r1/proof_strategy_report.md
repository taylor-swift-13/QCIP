# Proof Strategy Report

- status: completed
- mode: serial fallback in vc-proving-subagent-owned scratch
- reason_for_fallback: concurrent prepare first rejected the ticket group-plan wrapper, then the original script hit `NameError: COQC_TRANSIENT_RETRIES`; a worker-local script copy was patched under `.tmp/vc_proving_workers/STSUseFlag-20260702T035300/scripts` and used only to build the overlay.
- target_scope: `proof_of_STSUseFlag_return_wit_1` through `proof_of_STSUseFlag_return_wit_7`
- helper_policy: no helper lemmas required; `task_local_scratch_lib` is byte-identical to the formal `common_case_formal_lib`

## Strategy

Each target witness proves the right side of the generated return disjunction. The proof runs `pre_process`, unfolds `STSUseFlagPost` and the relevant constants, splits pure/spatial goals, solves the spatial `emp |-- emp` branch with `entailer!`, then proves the pure postcondition by selecting the matching `STSUseFlagPost` disjunct.

- witnesses 1-4: `data_src = 1` and `update = STSUseFlag_TRUE32`; witnesses 1/2/3 select mapped statuses `1 -> 6`, `2 -> 7`, `4 -> 8`; witness 4 selects the default preserve-status branch.
- witnesses 5-6: `data_src = 1` and `update <> STSUseFlag_TRUE32`; witness 5 uses `status <> 3`, witness 6 uses `status = 3`.
- witness 7: `data_src <> 1`; selects the branch clearing update to `STSUseFlag_FALSE32`.

## Verification

- scratch manual coqc: passed
- task_local_scratch_lib coqc: passed
- forbidden lemma scan: passed
- target witness `Admitted` scan: passed
- protected lib prefix line 1-45: unchanged
- migrated helper imports: empty
- migrated helper lemmas: empty

## Handoff

- active scratch manual: `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag__vc_proving_subagent_tmp_proof_manual.v`
- active task_local_scratch_lib: `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag__vc_proving_subagent_tmp_lib.v`
- persistent handoff manual: `handoff_proof_manual.v`
- persistent handoff lib: `handoff_task_local_scratch_lib.v`
- checkpoint: generated for audit, marked `usable_for_next_round: false` because the checkpoint script included unchanged split_goal `Abort` blocks as solved candidates.
