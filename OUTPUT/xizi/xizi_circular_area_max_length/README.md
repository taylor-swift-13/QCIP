# CircularAreaGetMaxLength 验证归档

真实 CRTOS `CircularAreaGetMaxLength` 已改用统一 `circular_area_state/store_circular_area` 规格：live 返回 `ca_capacity state` 并保持同一资源；null 返回 `ERROR=1`。公开 `With` 只有 `LitMap/state/area_addr`，所有表示字段仍为公共资源内部 existential。

- run：`xizi_circular_area_max_length-20260903121804`
- source version：`20623ba2715a0888ca66cffd7ed99db35243cb54e2f78add683136e6b15d9ed5`
- source-goal version：`fc3da5f5009779394b56d598233f53d3c3262812bc0a0e40582b1d04ceda5e0f`
- manual VC：2/2；新增 helper/import：无
- parent/final fixed Coq、结构与 forbidden 扫描：通过
- isolated freshness：skipped；accepted annotation canonical symexec 已到 EOF

完整 workflow：`reports/workflow/xizi_circular_area_max_length-20260903121804/`。run log 也保留了一次 main-agent 参数误用及随后按 accepted parent state 恢复成功的过程。
