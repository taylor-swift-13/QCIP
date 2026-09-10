# Timing Summary

- run_id: `xizi_double_link_head-20260809003517`
- controller_run_elapsed_seconds: 1760.025135
- archive_and_cleanup_elapsed_seconds: 110.709456
- total_elapsed_seconds: 1870.734591
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `3c41f523f9c1fd05e3036059afcf08af7ee000c6fbb98aa8a0738033a5628007`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: unknown for human/subagent split; no gap in controller run wall-clock

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 8.180728 |
| annotation | 1 | 899.028752 |
| vc-checking | 1 | 168.266148 |
| vc-proving-preparing | 1 | 544.653328 |
| final-check | 1 | 139.896179 |

## Recorded command/subagent details

完整节点级账本保留在仓库根目录对应 controller report 的 `timing_summary.json`。

## Timing gaps

controller 结束后到归档/清理检查共 110.709456 秒；该段不在 controller ledger 内，已单独列出。compact OUTPUT 同时保留完整 `reports/controller/timing_summary.json`。

## Blocked / Long Subagent Rounds

annotation attempt 用时 894.203048 秒，超过 600 秒。主要工作是删除冗余非空与 `@pre`、对齐单链表首元素规格、完成 qcp-mcp/canonical symexec/case-lib 检查，并识别旧 manual 中因删除前置条件而失效的 `PreH3`。group-worker 用时 405.193775 秒，将该引用修正为 `PreH2`。最终无未解决 blocker。
