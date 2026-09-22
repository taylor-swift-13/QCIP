# Timing Summary

## Complete timing ledger

- Intake started: 2026-08-25T09:25:02.559538Z
- Controller reached `done`: 2026-08-25T11:29:32.254397Z
- Cleanup, archive audit, and final report freeze completed: 2026-08-25T11:42:44.970461Z
- Controller run wall-clock: 7469.694859 seconds
- End-to-end intake-to-final-report-freeze wall-clock: 8262.410923 seconds

Required totals:

- `total_elapsed_seconds`: 8262.410923
- `total_command_seconds`: unknown — 646.703606 seconds are controller-recorded, but
  diagnostic, archive, independent symexec, and cleanup commands were not all separately timed
- `total_failed_rerun_seconds`: 1449.821412 recorded invalid-proof path
- `total_human_activity_seconds`: unknown — analysis/review was not independently instrumented
- `total_subagent_wait_seconds`: 6479.666274
- `timing_gap_seconds`: 1136.041043

Conservation over the available categories:
`646.703606 recorded controller-command + 6479.666274 subagent/worker wait + 1136.041043
timing gap = 8262.410923 total elapsed`. The gap explicitly contains controller-unattributed
activity, human review, independent freshness replay, archive synchronization, and cleanup; it is
not silently presented as command time.

## Recorded command/subagent details

Phase wall-clock:

| Phase | Attempts | Seconds |
| --- | ---: | ---: |
| intake | 1 | 19.441334 |
| annotation | 1 | 2385.503161 |
| vc-checking | 2 | 1309.820088 |
| vc-proving-preparing / group proof / parent verify | 2 | 3348.055438 |
| final-check | 2 | 406.874838 |

Worker/attempt elapsed:

| Worker or attempt | Seconds | Result |
| --- | ---: | --- |
| annotation r1 | 2294.750602 | accepted |
| vc-checking r1 | 549.924616 | accepted, later superseded after forbidden-proof failure |
| vc-checking r2 | 707.557026 | accepted retry plan |
| group r1 `double_link_remove_contracts` | 1155.603166 | compiled, later rejected by final forbidden scan |
| group r2 `dll_cut_remove_and_spec_derivations` | 1771.830864 | accepted; 5/5 proved, zero forbidden hits |

Parent verify commands totaled 289.503284 seconds. Final-check commands totaled 304.630322
seconds; the final successful fixed Coq check reported 154.414 seconds.

Recorded invalid-proof path: group r1 1155.603166 + parent verify r1 144.067955 + first
final-check 150.150291 = 1449.821412 seconds. The reusable first VC analysis is excluded.

Post-controller work took 792.716064 seconds and covered isolated canonical symexec replay,
byte/hash comparison, experience/README/report updates, OUTPUT synchronization, consistency
checks, worktree removal, trashing the run build root, and residual cache scanning. The final
cleanup/archive-audit/report window after the preserved pre-cleanup snapshot took 284.246941 seconds.

## Blocked / Long Subagent Rounds

- `annotation_subagent`, annotation r1, 2294.750602 seconds. Long-duration reason: designed the
  tagged two-layout body spec, repaired QCP's “pre is not determined” rejection, reran canonical
  symexec/qcp-mcp/annotation-checking. Evidence: archived annotation report. Impact: target C and
  all generated witnesses. Recommended action: accepted annotation.
- `vc_checking_subagent_r2`, vc-checking r2, 707.557026 seconds. Long-duration reason: replanned
  all five witnesses after final-check rejected low-level entailment shortcuts. Evidence: archived
  r2 report/group plan. Recommended action: accepted proof plan.
- group worker `double_link_remove_contracts`, proving r1, 1155.603166 seconds. It returned
  compiled proofs, but final-check found forbidden lemmas. Evidence: controller
  `forbidden-lemma-used` event. Impact: all five witnesses. Recommended action: rollback and retry.
- group worker `dll_cut_remove_and_spec_derivations`, proving r2, 1771.830864 seconds.
  Long-duration reason: high-level DLL/wand rewrite; main-agent audit found four residual
  `derivable1_sepcon_mono` calls and the same worker removed them before acceptance. Evidence:
  archived group report and final zero-hit scan. Recommended action: accept final group.
- No fixed phase subagent or group worker ended with terminal `blocked`. The only blocked
  controller step was first final-check; it rolled back safely and triggered the retry lineage.

## Timing gaps

The controller ledger leaves 343.324979 seconds between its own run wall-clock and recorded
controller-command plus worker intervals. Another 792.716064 seconds elapsed after controller
`done`. Because those intervals mix uninstrumented commands and human review, they are preserved
together as the exact 1136.041043-second timing gap rather than estimated into artificial command or
human subtotals.
