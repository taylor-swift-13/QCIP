# Case Brief

- case：`xizi_circular_area_read_advance`
- target：`CircularAreaDivideRdData`
- proof type：direct proof，predicate-first annotation
- change：删除 `With` 中的 `d0`，以入口 `data_length` / `data_length@pre` 表达同一语义
- input predicate：`CircularAreaDivideRdDataInput`
- resource：统一 `circular_area_state` / `store_circular_area`
- executable C change：无
- proof manual scope：仅 witness proofs
- output artifact dir：`OUTPUT/xizi/xizi_circular_area_read_advance/`
- accepted run：`xizi_circular_area_read_advance-20260909120000`

