# CircularAreaIsEmpty 验证归档

本 case 使用统一 `circular_area_state/store_circular_area` 资源重证真实 CRTOS `CircularAreaIsEmpty`。公开 `With` 只有 `LitMap` 与抽象 `state`，live 返回 `1` 当且仅当 `ca_contents state = nil`，并保持原资源。

- run：`xizi_circular_area_is_empty-20260903094014`
- source version：`9ef70415f5c7b68e6a6acc146dfc9725661eeefbb6d1d4df85dfe7b578f89b3b`
- source-goal version：`b3d8c1016da9a18cc4a2d60112a89a28a99213ef04116b4340a2e2ece40dfb40`
- manual VC：6/6
- helper：`CircularAreaLogicalState_nil_iff__empty_query_unfold_and_repack`
- parent/final fixed Coq 与所有结构扫描：通过
- isolated freshness：skipped；accepted annotation canonical symexec 已到 EOF

完整 workflow 位于 `reports/workflow/xizi_circular_area_is_empty-20260903094014/`。
