# Timing Summary

- run_id: `xizi_double_link_next-20260808235135`
- total_elapsed_seconds: 2419.413400
- controller_run_elapsed_seconds: 2103.641742
- output_archive_and_cleanup_seconds: 315.771658
- timing_source: controller append-only run ledger
- authoritative_timing_sha256: `7e9a88145bb2d37d060c9953b6a67d03e532cbc5787ae2585ef70c21e8de479d`
- total_command_seconds: recorded in authoritative timing JSON
- total_failed_rerun_seconds: recorded by retry/controller intervals where applicable
- total_human_activity_seconds: not separately reconstructible from compact archive
- total_subagent_wait_seconds: included in phase wall-clock intervals
- timing_gap_seconds: 315.771658 outside the controller ledger, covering OUTPUT archive/report synchronization and post-run cache cleanup; human/subagent split inside controller phases remains unavailable

## Complete timing ledger

| phase | count | total_seconds |
| --- | ---: | ---: |
| intake | 1 | 15.133231 |
| annotation | 1 | 529.950563 |
| vc-checking | 1 | 316.897531 |
| vc-proving-preparing | 1 | 1084.011113 |
| final-check | 1 | 157.649304 |

## Recorded command/subagent details

完整节点级账本保留在 `reports/controller/timing_summary.json`。annotation subagent 用时 500.557273 秒，vc-checking subagent 用时 295.562383 秒，group-worker 用时 906.541493 秒；parent verify 用时 137.950758 秒，final-check 用时 136.784137 秒。

## Timing gaps

controller 账本覆盖 intake 到 `done` 的 2103.641742 秒。`done` 后到 OUTPUT 归档、报告同步与缓存清理完成又用时 315.771658 秒，因不在 controller 节点账本内而显式列为 timing gap。从 intake 到 cleanup 完成的总 wall-clock 为 2419.413400 秒。人工活动与纯等待时间在 controller phase 内无法进一步拆分。

## Blocked / Long Subagent Rounds

- `group-worker / dll_successor_split_and_reclose`：906.541493 秒，超过 600 秒阈值。主要耗时在完整序列 `In` 的首次出现分解、DLL segment ownership 拆分/重闭合和固定 group-check；最终 3/3 witness 通过，无 blocker，后续动作已完成 parent verify 与 final-check。
