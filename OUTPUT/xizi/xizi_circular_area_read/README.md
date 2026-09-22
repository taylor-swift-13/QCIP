# xizi_circular_area_read 验证交付

本目录保存 `CircularAreaRead` 的统一资源规格与完整证明。最新 controller run 为 `xizi_circular_area_read-20260908100001`，状态为 `done`。

公开规格保留 `state`、`LitMap`、`output_capacity` 和 `output_before` 这些逻辑参数；删除了只用于保存函数入口参数值的 `ca0`、`out0`、`requested`、`d0`。入口资源由单一断言 `CircularAreaReadInput` 管理，函数参数的旧值统一写成 `circular_area@pre`、`output_buffer@pre` 和 `data_length@pre`。单一入口断言用于消除 QCP 在多分支 `Require` 中无法确定 `@pre` 分支的问题，不重新引入快照 `With`。

环形区所有权仍统一通过 `store_circular_area state circular_area` 传递；descriptor 字段、读写下标、状态位、物理数组及其 `UCharArray::mixed_full` 所有权由该谓词内部 existential 管理。输出缓冲区由调用者以 `UCharArray::mixed_full` 独立持有。错误分支保持 FIFO 与输出缓冲区不变；成功分支读取 `min(data_length@pre, FIFO 长度)` 个字节，更新输出缓冲区并从逻辑 FIFO 删除相同前缀。

本轮未修改可执行 C 控制流。canonical symbolic execution 到达文件尾；37/37 个 manual witness、四个 group-check、parent full check 和最终 fixed `goal_check` 均通过；manual/case_lib 结构、forbidden lemma 与 cleanup scan 通过。严格隔离 freshness replay 因仓库布局未配置而记录为 `skipped`，不计作通过。

- `source_version`: `003eaac4e1fd7e5fd8481f9678e829313d9ea6968cb72d301739d6da9fd2843d`
- `source_goal_version`: `e176fbd0a89351b86f945c404f1dd64e7680cbfa304e37b0ac9d714be8265fc7`
- 完整 workflow：`reports/workflow/xizi_circular_area_read-20260908100001/`

## 目录与复现

- `source/`：最终 annotated C。
- `rocq/`：最终 goal、auto/manual proof、goal_check、case lib 和 diagnostics。
- `reports/`：当前 run 的 controller、round、group-worker、版本与检查证据。

symbolic execution 必须从仓库根目录使用 `linux-binary/symexec`，保留 `-IQCP_examples/QCP_demos_LLM/` 和 `-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM`。Rocq 检查只通过 `.agents/skills/vc-proving/scripts/coq_tooling.py check` 的 fixed argv 执行；完整命令见 workflow report。
