# Timing Summary

- run_id: `xizi_double_link_next_rec_last-20260809015900`
- controller_run_elapsed_seconds: 2039.770294
- total_elapsed_seconds: 2039.770294
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `2933bebeb6fc9fb0d19c0592f10918bf0f7c8ea2072721bd3a4ac1823446f08e`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 5.349977 |
| annotation | 1 | 434.175083 |
| vc-checking | 1 | 195.612841 |
| vc-proving-preparing | 1 | 1262.733836 |
| final-check | 1 | 141.898557 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

compact OUTPUT 归档不重复数百 KB 节点明细；以 SHA-256 绑定 authoritative 文件。

## Blocked / Long Subagent Rounds

group-worker 用时 1121.325036 秒，超过 600 秒；主要耗时为首次出现分解、suffix/完整 successor 对应、DLL segment 重闭合，以及多轮 fixed group-check 完整依赖编译。最终无未解决 blocker。
