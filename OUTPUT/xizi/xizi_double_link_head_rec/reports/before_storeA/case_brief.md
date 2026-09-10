# Case Brief

- case_name: `xizi_double_link_head_rec`
- c_path: `OUTPUT/xizi/xizi_double_link_head_rec/source/xizi_double_link_head_rec.c`
- target_function: `xizi_double_link_head_rec`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_head_rec`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_head_rec_lib.v`
- current_phase: done
- source_version: `d9eb150183330456f3eb7e8545eff2b3e145678bbb521552838bf8b813e8f360`
- source_goal_version: `9588c9ac37d5999533c4248e84d2b2d894aa8a5403d22e5affd55220e0fdf040`
- controller_run: `xizi_double_link_head_rec-20260809014000`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

从递归视图取得首节点，并恢复完整双链表谓词。公开规格与单链表 `first`、双链表 `head` 同形。
