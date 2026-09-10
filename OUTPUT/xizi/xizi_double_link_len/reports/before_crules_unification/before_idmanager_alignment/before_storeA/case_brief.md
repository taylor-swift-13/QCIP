# Case Brief

- case_name: `xizi_double_link_len`
- c_path: `OUTPUT/xizi/xizi_double_link_len/source/xizi_double_link_len.c`
- target_function: `xizi_double_link_len`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_len`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_len_lib.v`
- current_phase: done
- source_version: `cb450f83c54d239a55806673bac7199f3d83deedeb7f00f66f099edd62b4743a`
- source_goal_version: `b049a55a4335805e427bf6e6fa1cc502ebd7b79bab236a5a8f082c68527a4e36`
- controller_run: `xizi_double_link_len-20260807220004`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

遍历环形双链表并返回抽象节点序列长度。
