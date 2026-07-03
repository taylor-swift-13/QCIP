## Timing Summary

- total_elapsed_seconds: about 3233 wall-clock seconds, from 2026-07-02T11:33:48+08:00 to 2026-07-02T12:27:41+08:00.
- total_command_seconds: at least 317.22 seconds recorded from key symexec/coqc/build commands.
- total_human_activity_seconds: partially recorded in subagent ledgers; exact main-side split is incomplete.
- total_subagent_wait_seconds: included in wall-clock total; subagent self-elapsed was 482s annotation, 93s vc-checking, and 1535s vc-proving.
- timing_gap_seconds: about 1116 seconds, covering main orchestration/integration, notification gaps, report writing, repeated checks, and uninstrumented setup/cleanup.

| phase | owner | started_at | finished_at | elapsed_seconds | source | notes |
| --- | --- | --- | --- | ---: | --- | --- |
| intake | main | 2026-07-02T11:33:48+08:00 | 2026-07-02T11:35:00+08:00 | 72 | wall-clock | created case skeleton and case brief |
| annotation | annotation-subagent | 2026-07-02T11:36:45+08:00 | 2026-07-02T11:44:47+08:00 | 482 | subagent-report | qcp-mcp passed after QCP-compatible source adaptation |
| goal-frozen | main | 2026-07-02T11:44:47+08:00 | 2026-07-02T11:50:00+08:00 | 313 | wall-clock gap | main integrated annotation/spec and ran symexec |
| vc-checking | vc-checking-subagent | 2026-07-02T11:50:03+08:00 | 2026-07-02T11:51:36+08:00 | 93 | subagent-report | all seven return witnesses proofable |
| vc-proving | vc-proving-subagent | 2026-07-02T11:56:30+08:00 | 2026-07-02T12:22:05+08:00 | 1535 | subagent-report | serial fallback; dependencies dominated |
| final-check | main | 2026-07-02T12:22:05+08:00 | 2026-07-02T12:27:41+08:00 | 336 | wall-clock | integrated proof, symexec, coqc, scans, cleanup |

| phase | command_or_step | elapsed_seconds | result | notes |
| --- | --- | ---: | --- | --- |
| annotation | annotation_scratch_lib coqc | 0.71 | passed | subagent report |
| annotation | final qcp-mcp symbolic | 0.13 | passed | file tail reached |
| annotation | enum parser probe | 1.87 | failed expected | rejected enum syntax; not used |
| goal-frozen | symexec | 0.053 | passed | generated formal files |
| vc-proving | split_manual_goals.py | 0.07 | passed | target witness split |
| vc-proving | make -C SeparationLogic/unifysl | 111.81 | passed | dependency bootstrap |
| vc-proving | make -C SeparationLogic core, second run | 173.57 | passed | dependency bootstrap |
| vc-proving | scratch manual coqc final | 1.14 | passed | subagent scratch gate |
| vc-proving | task_local_scratch_lib coqc | 0.47 | passed | no helper suffix |
| final-check | symexec | 0.050 | passed | generated files current; manual preserved |
| final-check | formal coqc sequence | 3.252 | passed | lib, goal, auto, manual, goal_check |

## Blocked / Long Subagent Rounds

| subagent_name | phase | round_outcome | elapsed_seconds | blocking_reason | long_duration_reason | evidence | recommended_next_phase |
| --- | --- | --- | ---: | --- | --- | --- | --- |
| vc-proving-subagent | vc-proving | completed | 1535 | n/a | missing prebuilt Rocq dependencies plus worker prepare script fallback | `make -C SeparationLogic/unifysl` 111.81s; `make -C SeparationLogic core` 173.57s; script `COQC_TRANSIENT_RETRIES` fallback noted in report | final-check |

## Timing Gaps

Main-side analysis and report writing were not fully split into start/end events in the ledger. The final wall-clock total includes those periods; they are represented in `timing_gap_seconds` rather than folded into command timings.
