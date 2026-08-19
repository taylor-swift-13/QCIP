# Timing Summary

- run_id: `xizi_double_link_len-20260807220004`
- total_elapsed_seconds: 9056.90437
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `47b24b47a869899932de5452f6b39b29699833ebc388ed66161f0d669102e0ee`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 18.291648 |
| annotation | 1 | 504.920748 |
| vc-checking | 2 | 2418.794472 |
| vc-proving-preparing | 2 | 5767.872091 |
| final-check | 2 | 347.025411 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

compact OUTPUT 归档不重复数百 KB 节点明细；以 SHA-256 绑定 authoritative 文件。

## Blocked / Long Subagent Rounds

如存在长耗时 worker，其区间与原因保留在 authoritative timing/report；最终无未解决 blocker。
