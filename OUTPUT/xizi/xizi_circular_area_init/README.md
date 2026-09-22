# xizi_circular_area_init 验证交付

`CircularAreaInit` 已按 idmanager 风格的统一资源模型重新验证。run `xizi_circular_area_init-20260902203539` 已进入 `done`；`source_version=3622e70192751ed6026a65366a37df20f72f9e3cc20366c85af13edf44f7b787`，`source_goal_version=504cd345b4013dac6c6785ee960b623a22a0ccbf92c99986840ec62101ffc0d9`。

输入长度 4..256，成功分支只向调用者返回 `store_circular_area (CircularAreaInitState requested) retval`：capacity 向下按 4 对齐，逻辑 FIFO 为空。readidx/writeidx/status、物理列表、backing pointer 和 operations pointer 全部在 `store_circular_area` 内 existential 封装。allocator 的 `UCharArray::undef_full` 在 Init 证明内转为 `repeat None` 对应的 `UCharArray::mixed_full`，调用者不需要自行转换。descriptor 或 buffer 分配失败均返回 null/`emp`，buffer 失败时 descriptor 已释放。

20 个 automatic obligations 和 1 个 manual witness 全部完成；3 次 qcp-mcp EOF、parent/final fixed `goal_check`、formal 结构与 forbidden 扫描全部通过，无新增 helper/import。controller final-check 的严格隔离 freshness replay 因当前仓库布局未配置而记录为 `skipped`，未误报为通过。证据见 `reports/workflow/xizi_circular_area_init-20260902203539/`。
