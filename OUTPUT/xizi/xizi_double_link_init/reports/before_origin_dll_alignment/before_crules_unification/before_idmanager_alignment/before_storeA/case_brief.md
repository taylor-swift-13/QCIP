# Case Brief

- case_name: `xizi_double_link_init`
- c_path: `OUTPUT/xizi/xizi_double_link_init/source/xizi_double_link_init.c`
- target_function: `xizi_double_link_init`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_init`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_init_lib.v`
- current_phase: done
- source_version: `37881364a336228e0aa6898a1596be2020014fde6a59290780726998ac0e0235`
- source_goal_version: `0db2d3264815cb6f251322133c9dd75e32941511789b256b909aed0d2d0a9a15`
- controller_run: `xizi_double_link_init-20260807220002`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

初始化 sentinel，使 next/prev 都指向自身，并建立空双链表。
