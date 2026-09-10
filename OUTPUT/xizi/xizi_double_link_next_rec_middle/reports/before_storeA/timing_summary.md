# Timing Summary

- run_id: `xizi_double_link_next_rec_middle-20260809023800`
- total_elapsed_seconds: 1237.338172
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `99110cd56600f938aa3bf6b17fc763870bf56cb8a1a8d494873581eafc739203`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 6.190182 |
| annotation | 1 | 236.265987 |
| vc-checking | 1 | 261.701910 |
| vc-proving-preparing | 1 | 576.922107 |
| final-check | 1 | 156.257986 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

compact OUTPUT 归档不重复数百 KB 节点明细；以 SHA-256 绑定 authoritative 文件。

## Blocked / Long Subagent Rounds

无 blocked 或超过 600 秒的 subagent/group-worker；最慢 group-worker 为 385.127667 秒。最终无未解决 blocker。
