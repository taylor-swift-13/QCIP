# xizi_circular_area_write 验证交付

本目录保存真实 CRTOS `CircularAreaWrite` 在 `b_force = 0` 下的统一资源规格与完整证明。最新 controller run 为 `xizi_circular_area_write-20260908100002`，状态为 `done`。

公开规格保留 `state`、`LitMap`、`input_contents` 这些逻辑参数；删除了入口快照 `ca0`、`in0`、`requested`、`d0`。入口资源由单一断言 `CircularAreaWriteInput` 管理，旧参数值统一使用 `circular_area@pre`、`input_buffer@pre`、`data_length@pre` 和 `b_force@pre`。单一入口断言等价地封装原来的四种空指针组合，使 QCP 能在唯一入口分支解析 `@pre`。

环形区仍消费并返回统一的 `store_circular_area`；输入数组所有权始终归还。参数错误或满队列保持状态；成功时写入 `min(data_length@pre, capacity-current_length)` 个输入字节并向逻辑 FIFO 追加同一前缀。可执行 C 控制流未修改。

canonical symbolic execution 到达文件尾；32/32 个 manual witness、四个 group-check、parent full check 和最终 fixed `goal_check` 均通过；manual/case_lib 结构、forbidden lemma 与 cleanup scan 通过。严格隔离 freshness replay 因仓库布局未配置而记录为 `skipped`。

- `source_version`: `9c8fd4b9a749a99e62bd2064c341edb75ac2719ae0d530d3631df5b4bb779487`
- `source_goal_version`: `a047715e902a91bf4c6a65de399a2cbe1a04e01947c98d21d234449e095854be`
- 完整 workflow：`reports/workflow/xizi_circular_area_write-20260908100002/`

symbolic execution 必须保留 `-IQCP_examples/QCP_demos_LLM/` 和 `-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM`；Rocq 只使用 `.agents/skills/vc-proving/scripts/coq_tooling.py check` 的 fixed argv。
