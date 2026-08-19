# Case Brief

- case_name: `xizi_double_link_next`
- c_path: `OUTPUT/xizi/xizi_double_link_next/source/xizi_double_link_next.c`
- target_function: `xizi_double_link_next`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_next`
- reference_cases: `OUTPUT/xizi/xizi_single_link_next/source/xizi_single_link_next.c`, `QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v`, `QCIPLib/xizi/xizi_double_link_common/`
- style_reference_cases: 单链表 `In + 完整序列 + next_value` predicate-first spec
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_next_lib.v`
- current_phase: done
- source_version: `e316851e114a2ac7902d9a9243ee938398c20338a1aab37919cb824b5f14e7c7`
- source_goal_version: `999bfbeba92961fd0dc887054676c876a1d9ad9d7c5d3a4df615ed9a849d2390`
- controller_run: `xizi_double_link_next-20260808235135`
- report_layout: OUTPUT snapshots + controller JSONL + round/group reports

## C 语义

以 `In(linklist_node,nodes) && xizi_dll(linklist,nodes)` 描述完整抽象链表，返回给定节点的后继，尾节点返回 NULL，并保持完整双链表 ownership。
