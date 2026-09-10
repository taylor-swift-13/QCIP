# Case Brief

- case_name: `xizi_double_link_next_rec_last`
- c_path: `OUTPUT/xizi/xizi_double_link_next_rec_last/source/xizi_double_link_next_rec_last.c`
- target_function: `xizi_double_link_next_rec_last`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_next_rec_last`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_next_rec_last_lib.v`
- current_phase: done
- source_version: `818190db91ef1d0f80424c4c33046b9b82dc3cdabd2e09ef926ba3684b3e0512`
- source_goal_version: `65ba58e95f7b6200a7f4e9288207a41b7d10e647973ff1ea15ec3df3b9cf1e2b`
- controller_run: `xizi_double_link_next_rec_last-20260809015900`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

验证任意成员的完整序列 successor 语义及末节点 `NULL` 边界，公开 contract 与通用 `next` 同形。
