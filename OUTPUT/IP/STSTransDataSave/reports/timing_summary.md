# Timing Summary

## Complete timing ledger

- total_elapsed_seconds: unknown; this run spans multiple interactive turns without a single external wall-clock source.
- total_command_seconds: partially recorded in tool outputs; final compile chain observed at ~22.8s, final-check reference/read step ~0.1s, earlier proof repair commands varied by run.
- total_failed_rerun_seconds: unknown; several failed proof-repair compilations occurred before the final passing proof.
- total_human_activity_seconds: unknown.
- total_subagent_wait_seconds: at least 300s of explicit `wait_agent` timeouts/waits were used around r5 annotation-checking; exact full wall-clock is not available.
- timing_gap_seconds: unknown because total_elapsed_seconds is unknown.

## Recorded command/subagent details

- r5 annotation-checking: passed; report stored under `.agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T_single-spec-r5/`.
- formal symexec: reached end of `STSTransDataSave`; final freshness regeneration matched current `goal` and `proof_auto`.
- Rocq compile chain: `char_array_strategy_goal`, `char_array_strategy_proof`, case lib, goal, proof_auto, proof_manual, and goal_check all compile.
- final scans: no `Admitted`, `Abort`, extra `Axiom`, forbidden lemma, or proof placeholder found in lib/manual.

## Timing gaps

- Earlier annotation/proving exploratory command timings are not complete enough to produce a conserved ledger.
- Subagent internal elapsed time was not reported in a machine-readable form.

## Blocked / Long Subagent Rounds

- No final blocked subagent round remains.
- r5 annotation-checking required repeated waiting but completed successfully; no blocked reason reported.

## Cleanup

- cleanup_status: completed
- cleanup_scope: removed current-case `.tmp` scratch/final-check temp and current-case Coq `.aux` / `.glob` / `.vo` / `.vos` / `.vok` cache files.

## Continuation Reverification

- continuation_status: completed
- checks: gcc syntax check, symexec freshness cmp, full coqc chain, placeholder scan, forbidden lemma scan, archive cmp, archive manifest generation.
- cleanup_after_reverification: completed after this report update.
