# Case Brief

- case_name: `xizi_double_link_insert_after`
- c_path: `OUTPUT/xizi/xizi_double_link_insert_after/source/xizi_double_link_insert_after.c`
- target_function: `xizi_double_link_insert_after`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_insert_after`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_insert_after_lib.v`
- current_phase: done
- source_version: `f394bed6bf0a789b785fd7ca6d08148c570ce6c15db97afd3c946fc2c5f88c43`
- source_goal_version: `e2e9be8a2fca9b41961acf47b5ae65d910e67ce0b050c9a5eb5644b5936937a2`
- controller_run: `xizi_double_link_insert_after-20260817150208`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

把独立新节点插入任意成员节点之后并重建双向链接；单一一般成员规约覆盖全部位置。
