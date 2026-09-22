# CircularAreaIsFull 验证归档

本 case 使用统一 `circular_area_state/store_circular_area` 资源重证真实 CRTOS `CircularAreaIsFull`。公开 `With` 只有 `LitMap` 与抽象 `state`；布局指针、下标、状态位和 physical bytes 全部隐藏在资源谓词中。

- live 返回 `1` 当且仅当 `Zlength (ca_contents state) = ca_capacity state`，否则返回 `0`
- live 资源和日志字面量资源保持不变；null 返回 `ERROR=1`
- run：`xizi_circular_area_is_full-20260903083043`
- source version：`17edc68f80b40d0a3fb92f28352522aab7daa7825c776978c555aab9cfa0efd3`
- source-goal version：`83f6f3ba0f9415c60af15e3092f4cbdf657172355df14eb83e7fa5b8cbc27335`
- manual VC：6/6；单组证明；无新增 helper/import
- parent/final fixed Coq、manual structure、case-lib contract、forbidden scan：通过
- isolated freshness：仓库布局未配置，记录为 skipped；accepted annotation canonical symexec 已到 EOF

完整 workflow 位于 `reports/workflow/xizi_circular_area_is_full-20260903083043/`。
