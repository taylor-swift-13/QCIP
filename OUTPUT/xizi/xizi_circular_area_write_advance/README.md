# CircularAreaDivideWrData 验证归档

真实 CRTOS write-split helper 已用统一资源重证。入口 `With` 只有 `state/area_addr/entry_data_length/LitMap`；live post existential 展开隐藏表示，为普通 Write 调用点提供精确 `writeidx+length` 分支事实并保留可重封装的全部资源。

- run：`xizi_circular_area_write_advance-20260903141836`
- source version：`f1aa9a2122723dd46a85f8abc1ddd8430b7306054040d00148c493bdae1740bd`
- source-goal version：`c661c21e03b091dcea90762070ea51b3e563ba2eed1d20b216e2a786c0ee1a4a`
- manual VC：3/3；helper/import：无
- parent/final fixed Coq 与结构扫描：通过
- isolated freshness：skipped；canonical symexec 到 EOF

完整 workflow：`reports/workflow/xizi_circular_area_write_advance-20260903141836/`。
