# CircularAreaGetDataLength 验证归档

本 case 使用统一 `circular_area_state/store_circular_area` 重证真实 CRTOS `CircularAreaGetDataLength` 及其内部 `CircularAreaIsFull` 调用。公开资源只保留 `LitMap`、抽象 `state` 和用于保持所有权根一致的 `area_addr`；物理数组、下标和状态位仍封装在公共资源内部。

- run：`xizi_circular_area_data_length-20260903104035`
- source version：`9c92e952ed9d99623ccc3ffd787a6af4e9dba9f5ca19b8d175977e8224312d5e`
- source-goal version：`1a5df283e35d7ef04af89b8736b332aa1edd8eb26d561a5d80420e159c842ad1`
- manual VC：13/13（IsFull 6，DataLength 7）
- 新增 helper：无；复用 annotation-approved seed 引理
- parent/final fixed Coq 与结构扫描：通过
- isolated freshness：skipped；accepted annotation canonical symexec 已到 EOF

第一次 annotation 暴露了调用前后资源根不一致的问题；第二轮用同一个 ghost `area_addr` 约束调用根并重新生成全部目标，旧目标已 stale。完整 workflow 位于 `reports/workflow/xizi_circular_area_data_length-20260903104035/`。
