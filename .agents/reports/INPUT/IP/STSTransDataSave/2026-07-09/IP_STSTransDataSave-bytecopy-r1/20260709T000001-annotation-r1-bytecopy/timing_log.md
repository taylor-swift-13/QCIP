# Timing Log - annotation r1 byte-copy

| event_id | parent_event_id | actor | phase | round_id | activity_kind | started_at | finished_at | elapsed_seconds | status | artifact_paths | summary |
|---|---|---|---|---|---|---|---:|---:|---|---|---|
| main-annotation-launch-001 |  | main | annotation | 20260709T000001-annotation-r1-bytecopy | subagent-launch-observed | 2026-07-09T15:20:38Z | 2026-07-09T15:20:38Z | 0 | completed | .agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000001-annotation-r1-bytecopy/delegation_ticket.md | Spawned annotation-subagent for byte-level SRAM copy continuation. |
| main-annotation-wait-001 | main-annotation-launch-001 | main | annotation | 20260709T000001-annotation-r1-bytecopy | subagent-wait-timeout-observed | 2026-07-09T15:20:38Z | 2026-07-09T15:26:33Z | unknown | in_progress | .agents/reports/INPUT/IP/STSTransDataSave/2026-07-09/IP_STSTransDataSave-bytecopy-r1/20260709T000001-annotation-r1-bytecopy/subagent_return_report.md | First wait timed out; annotation-subagent still running or report not yet final. |
