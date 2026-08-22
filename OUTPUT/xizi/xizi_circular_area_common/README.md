# xizi_circular_area_common

这是 11 个 CRTOS CircularArea 函数 case 的套件交付入口。每个 case 位于相邻 `xizi_circular_area_*` 目录，统一包含 source、rocq、controller/workflow reports、快照、checkpoint 和 reuse packet。

公共结论：函数名、static、签名和除用户授权日志删除外的可执行语义与 CRTOS `circular_area.c` 对齐；ERROR=1；p_tail 为 one-past-end；uint8 索引对应有效容量 0<area_length<=256；Read/Write 保留原始 memcpy；Init 验证版删除 KPrintf；所有函数 spec 不使用参数 @pre。

套件 fixed Rocq 8.20.1 联合检查已通过，共覆盖 11 个 case、85 个 target witnesses。证据见 `reports/full_suite_check.json`；其余审计见 `reports/completion_audit.json`、`run_manifest.json`、`strict_refresh_comparison.json`、`final_structure_audit.json`、`output_layout_audit.json`、`cleanup_summary.json` 与 `full_suite_audit.md`。
