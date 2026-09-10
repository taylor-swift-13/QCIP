# Timing Summary

- run_id: `xizi_double_link_empty_rec-20260809010700`
- controller_run_elapsed_seconds: 1674.449303
- archive_and_cleanup_elapsed_seconds: 27.0
- total_elapsed_seconds: 1701.449303
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `03a4f937ff7078978ae5e008fa6cb3937a8b649344e3b67ab8d2be427b8a6b86`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 13.227124 |
| annotation | 1 | 301.899730 |
| vc-checking | 1 | 227.117168 |
| vc-proving-preparing | 1 | 986.972450 |
| final-check | 1 | 145.232831 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

controller 结束后约 27 秒用于归档和清理；该段不在 controller ledger 内。compact OUTPUT 同时保留完整 authoritative timing JSON。

## Blocked / Long Subagent Rounds

group-worker 用时 811.911613 秒，超过 600 秒；主要耗时是用直接 nil/non-nil 命题替换旧 wrapper unfold，并构建固定 group-check 的完整依赖。VC-checking 同一 attempt 还补写了最初遗漏的独立 `group_plan.json`。最终无未解决 blocker。
