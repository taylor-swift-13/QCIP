## Final Check Checklist

- phase: final-check
- lib_frozen_prefix_matches_case_brief: passed
- proof_manual_scope_ok: passed; only seven `proof_of_STSUseFlag_return_wit_*` witness proofs remain.
- lib_frozen_prefix_ok: passed; `IP_STSUseFlag_lib.v` matches `input_snapshots/IP_STSUseFlag_lib.frozen-prefix.v`.
- lib_helper_suffix_imports_ok: n/a; no helper imports were migrated.
- lib_helper_suffix_ok: n/a; no helper lemmas were migrated.
- no_stale_scratch: passed
- temp_files_cleanup_status: passed
- symexec_status: passed; final symexec reached file tail.
- coqc_status: passed; lib, goal, proof_auto, proof_manual, and goal_check compiled.
- timing_summary_status: passed with explicit timing gap notes.
- slowest_phase: vc-proving
- slowest_command_or_witness: `make -C SeparationLogic core` second run, 173.57s, during vc-proving fallback dependency bootstrap.
- major_time_sinks: Rocq dependency bootstrap and vc-proving script fallback, not the target proof itself.
- admitted_axiom_review_status: passed; no `Admitted.`, `Axiom`, `Abort`, or forbidden lemma hit in formal manual/lib.
- blocking_reason: n/a
- recommended_next_phase: done

## Final Command Results

- `linux-binary/symexec ... IP_STSUseFlag.c`: passed.
- `coqc ... IP_STSUseFlag_lib.v`: passed.
- `coqc ... IP_STSUseFlag_goal.v`: passed.
- `coqc ... IP_STSUseFlag_proof_auto.v`: passed.
- `coqc ... IP_STSUseFlag_proof_manual.v`: passed.
- `coqc ... IP_STSUseFlag_goal_check.v`: passed.

## Final Hashes

```text
9e84535fc8924bb5000ddf8326bfe9944ad2493872694b4c037179a3e994d8d0  QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.c
88a481362e5d9bede3aade64a74142c63b33cd52fccffa0271715fabf6223253  QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.h
fce183c808ded6acfe7b2ff73f6975889fc098e22cacd612c7bccc2cb366ec8e  SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal.v
b5a30a8568b34369e88c2467d15124a69fbfd334882c2bc9de87303c7acc9e6d  SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal_check.v
7e7735b1618639e77a7ff2c6df9d3a753cc9cc92db6e8f4e5c4f56d9204e2fb6  SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_lib.v
2277ba5cad1ad2e7157ab17e36735cd20b277ba59367f7204d3021383074331b  SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_auto.v
dc04a724aae6dde4b330f78ea40307d05bde52bb97d5f49fc94b6349cafe796c  SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v
```
