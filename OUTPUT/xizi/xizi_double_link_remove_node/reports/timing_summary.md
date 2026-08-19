# Timing Summary

- run_id: `xizi_double_link_remove_node-20260817134125`
- total_elapsed_seconds: 2407.081232
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `eb25c3c0d711b3f0b34598bf696cf40a874681b0e06d8e3e1b38be45c6750f79`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 13.680666 |
| annotation | 1 | 635.577603 |
| vc-checking | 1 | 548.265532 |
| vc-proving-preparing | 1 | 1040.106259 |
| final-check | 1 | 169.451172 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

compact OUTPUT 归档不重复数百 KB 节点明细；以 SHA-256 绑定 authoritative 文件。

## Blocked / Long Subagent Rounds

无 blocked、stale 或 compact-error；最终无未解决 blocker。
