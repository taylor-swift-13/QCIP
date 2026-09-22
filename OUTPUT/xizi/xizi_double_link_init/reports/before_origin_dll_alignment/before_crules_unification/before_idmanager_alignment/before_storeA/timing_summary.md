# Timing Summary

- run_id: `xizi_double_link_init-20260807220002`
- total_elapsed_seconds: 1480.113985
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `516efc7499617288f42c92b7ca0641549e568e5b03b5705ef1726547f39edd92`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 23.475163 |
| annotation | 1 | 683.079112 |
| vc-checking | 1 | 267.754692 |
| vc-proving-preparing | 1 | 285.910847 |
| final-check | 1 | 170.536029 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

compact OUTPUT 归档不重复数百 KB 节点明细；以 SHA-256 绑定 authoritative 文件。

## Blocked / Long Subagent Rounds

如存在长耗时 worker，其区间与原因保留在 authoritative timing/report；最终无未解决 blocker。
