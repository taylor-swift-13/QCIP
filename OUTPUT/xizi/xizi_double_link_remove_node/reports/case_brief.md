# Case Brief

- case_name: `xizi_double_link_remove_node`
- c_path: `OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node.c`
- target_function: `xizi_double_link_remove_node`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_remove_node`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_remove_node_lib.v`
- current_phase: done
- source_version: `fd029478e6025b3cedb63163aa0a045e97eb6929660756f127ecf2786d1a7605`
- source_goal_version: `1c849d11baac6ce4019b27ec691382628d97fff824a20cf973449e11d94988a0`
- controller_run: `xizi_double_link_remove_node-20260817134125`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

从环形双链表摘除目标节点并重连前驱与后继；普通调用使用 member 规约，精确推理使用 strong 规约。
