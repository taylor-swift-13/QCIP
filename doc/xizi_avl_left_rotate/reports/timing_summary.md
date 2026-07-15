# Timing Summary

权威逐事件时间线见 `controller/timing_summary.json`。

- run 总 wall-clock：约 3374.87 秒；
- annotation phase：约 2104.42 秒，其中 annotation attempt 约 2084.83 秒；
- VC checking phase：约 419.13 秒；
- vc-proving-preparing/group/parent phase：约 700.10 秒；
- final-check phase：约 145.31 秒，固定全量编译约 134.71 秒。

annotation 和 group 工作均跨过 600 秒阈值，主要原因是多轮 qcp-mcp/symexec、隔离 build workspace 的完整 Rocq 编译及 worker 证明反馈；最终均完成，无 blocker。完整命令、失败重跑和 controller event 以 JSON 为准。
