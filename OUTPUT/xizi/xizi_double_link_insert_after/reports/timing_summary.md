# Timing Summary

- run_id: `xizi_double_link_insert_after-20260817150208`
- total_elapsed_seconds: 1697.060432
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `854f49caae899264dcc2176e269c9127d1fecb019d23f8d54308fabd2f9ea395`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 24.114213 |
| annotation | 1 | 473.781250 |
| vc-checking | 1 | 497.938879 |
| vc-proving-preparing | 1 | 524.006640 |
| final-check | 1 | 177.219450 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

compact OUTPUT 归档不重复数百 KB 节点明细；以 SHA-256 绑定 authoritative 文件。

## Blocked / Long Subagent Rounds

无 blocked、stale、compact-error 或超过 600 秒的 fixed phase subagent；最终无未解决 blocker。
