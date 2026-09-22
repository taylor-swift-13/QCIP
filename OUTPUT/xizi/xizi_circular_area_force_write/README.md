# xizi_circular_area_force_write 验证交付

本目录保存真实 CRTOS `CircularAreaWrite` 在 `b_force != 0` 下的独立 force 规格与完整证明。最新 controller run 为 `xizi_circular_area_force_write-20260908100003`，状态为 `done`。

公开规格保留 `state`、`input_contents` 等逻辑参数；删除了入口快照 `ca0`、`in0`、`requested`、`d0`。入口资源由 `CircularAreaForceWriteInput` 统一管理，旧参数值使用 `circular_area@pre`、`input_buffer@pre`、`data_length@pre` 和 `b_force@pre`。可执行 C 控制流未修改。

参数错误保持原 `store_circular_area` 与输入数组资源。正长度 force 成功返回 `store_forced_circular_area raw circular_area@pre`：实现只写 free space 可容纳的字节，却无条件令 `readidx = writeidx`、`status = 1`，所以未填满时不能伪装成普通 FIFO invariant。`CircularAreaForceRawRecoverable` 与 `CircularAreaForceFillToCapacity` 继续只提供带前提的恢复 bridge。

canonical symbolic execution 到达文件尾；30/30 个 manual witness、四个 group-check、parent full check 和最终 fixed `goal_check` 均通过；manual/case_lib 结构、forbidden lemma 与 cleanup scan 通过。严格隔离 freshness replay 因仓库布局未配置而记录为 `skipped`。

- `source_version`: `23d786abb961fb961488a900251247c9a8835b794e720a3d0c894b19df879131`
- `source_goal_version`: `cd0d0e48cd4702b6ce4e0d6cd0360eeb202a2f05b34afb7adb1ca3f90d3328ef`
- proof groups：12 + 8 + 5 + 5
- 完整 workflow：`reports/workflow/xizi_circular_area_force_write-20260908100003/`

symbolic execution 必须保留 `-IQCP_examples/QCP_demos_LLM/` 和 `-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM`；Rocq 只使用 `.agents/skills/vc-proving/scripts/coq_tooling.py check` 的 fixed argv。
