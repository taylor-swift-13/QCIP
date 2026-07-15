# Timing Summary

权威逐事件时间线见 `controller/timing_summary.json`。主要耗时包括：

- annotation phase 约 960.37 秒，包含三轮 qcp-mcp、三轮 symexec、case-lib/fixed goal 检查及修复；
- final-check 固定全量编译约 139.85 秒；
- VC checking、group-worker、parent verify 的完整开始/结束事件均保存在 controller JSON 中。

annotation subagent 超过 600 秒，原因是按合同完成三次完整自修复循环和多次 Rocq 全量编译，不是停滞；结果最终通过。controller JSON 是完整 wall-clock ledger，本摘要不替代它。
