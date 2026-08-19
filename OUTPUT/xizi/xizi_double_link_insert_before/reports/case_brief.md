# Case Brief

- case_name: `xizi_double_link_insert_before`
- c_path: `OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before.c`
- target_function: `xizi_double_link_insert_before`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_insert_before`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_insert_before_lib.v`
- current_phase: done
- source_version: `f132c14ebc0a9ac4f87d9a01069cb46f886db25999fcf687356602fcba96b73f`
- source_goal_version: `3f6f71b8eb02cb698df63cca60fe9daa5c49a4637869f1262ae0d14289bc9dc7`
- controller_run: `xizi_double_link_insert_before-20260809035500`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

把独立新节点插入目标节点之前并重建双向链接。
