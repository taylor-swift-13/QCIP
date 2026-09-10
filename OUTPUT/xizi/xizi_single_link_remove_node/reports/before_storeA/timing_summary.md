# Timing Summary

## Complete timing ledger

- Controller run wall-clock: `9105.217498 s`（约 2 小时 31 分 45 秒），从 `2026-08-14T05:18:30.700166Z` 到 `2026-08-14T07:50:15.917664Z`。
- Intake: `12.582443 s`。
- Annotation（含 retry）: `1241.636442 s`。
- VC checking（含 retry）: `2151.171323 s`。
- VC proving/preparing/parent verify（含 retry）: `5478.551523 s`。
- Final-check phase: `221.275767 s`。
- Controller 结束后的 isolated freshness、OUTPUT 归档与 cleanup 单独执行；它们不在 controller run interval 中，因此不把少数命令耗时伪装成完整子项守恒。

## Recorded command/subagent details

- 最终 fixed full Coq check: `139.661 s`。
- 最终 core group-check: `143.352 s`。
- annotation r1/r2/r3: `422.448378 s` / `363.607771 s` / `355.185125 s`。
- VC checking r1/r2/r3/r4: `607.080751 s` / `428.349439 s` / `406.956090 s` / `496.288674 s`。
- vc-proving r3 两个并行 worker: `1983.947930 s` / `1984.047631 s`。
- controller `vc-proving-verify` 六次累计 `737.782570 s`，包含 import alias、parent partial mutation 与 forbidden-lemma 回退后的失败重跑。

## Blocked / Long Subagent Rounds

- `vc-checking-r1`，`607.080751 s`，blocked：循环 invariant 缺少两个 immutable argument 的 current/snapshot alias；返回 annotation。
- `annotation-r2`，`363.607771 s`，blocked：该会话未发现 qcp-mcp；r3 使用仓库内 `mcp/qcp-mcp` 入口重试。
- `vc-proving-r1` 两组，`810.866669 s` / `817.118888 s`，blocked：固定 build workspace 无法解析跨根裸 strategy import；修复 tooling 后重建 round。
- `vc-proving-r2` 两组，约 `1706.2 s`，证明与 group-check 完成，但 final-check 发现 forbidden lemmas；返回 direct-proof round。
- `vc-proving-r3` 两组，约 `1984.0 s`，长耗时原因是多轮完整依赖编译与 direct separation-logic proof 调试；最终通过。

## Timing gaps

- `total_command_seconds`: unknown。早期 qcp-mcp 交互和部分人工诊断没有统一 command timer。
- `total_failed_rerun_seconds`: 至少包含 controller 记录的六次 parent verify 累计值，但无法从现有账本无重叠地拆出全部失败子区间，记为 unknown。
- `total_human_activity_seconds`: unknown；未为每段主 agent 分析单独打点。
- `total_subagent_wait_seconds`: 与 worker interval 重叠，不能安全求和，记为 unknown。
- `timing_gap_seconds`: controller run 本身为真实 wall-clock 且已守恒；controller 结束后的归档/cleanup 时间另行记录在最终交付说明，不回填估算值。

