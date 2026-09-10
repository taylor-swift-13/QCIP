# Case Brief

- case_name: `xizi_double_link_next_rec_middle`
- c_path: `OUTPUT/xizi/xizi_double_link_next_rec_middle/source/xizi_double_link_next_rec_middle.c`
- target_function: `xizi_double_link_next_rec_middle`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_next_rec_middle`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_next_rec_middle_lib.v`
- current_phase: done
- source_version: `3e5712c09037e930893d7bd7093fa502bd91fd12b3bc196cce9cd6d25dc7131c`
- source_goal_version: `b10e15c5c16d584c466e004c2090ba8492d321592cf919f12a695f7e3148f3a5`
- controller_run: `xizi_double_link_next_rec_middle-20260809023800`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

公开规格与通用 `next` 一致：查询完整抽象序列中成员节点的后继并保持双链表；中间节点分解只作为内部证明事实。
