# Timing Summary

- run_id: `xizi_double_link_head_rec-20260809014000`
- controller_run_elapsed_seconds: 1013.116761
- total_elapsed_seconds: 1013.116761
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `bed218469ca5a7c0a40a7e05650c4de234bddcf56d40306fa6fba7ee9d425197`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 5.990629 |
| annotation | 1 | 273.958833 |
| vc-checking | 1 | 174.842787 |
| vc-proving-preparing | 1 | 424.818317 |
| final-check | 1 | 133.506195 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

compact OUTPUT 归档不重复数百 KB 节点明细；以 SHA-256 绑定 authoritative 文件。

## Blocked / Long Subagent Rounds

本轮无超过 600 秒的 subagent/group-worker；group-worker 为 289.840872 秒。最终无未解决 blocker。
