# Case Brief

- case_name: `xizi_double_link_empty_rec`
- c_path: `OUTPUT/xizi/xizi_double_link_empty_rec/source/xizi_double_link_empty_rec.c`
- target_function: `xizi_double_link_empty_rec`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_empty_rec`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_empty_rec_lib.v`
- current_phase: done
- source_version: `9dfd0f895225439ceb48e860af85115063f5e8b15c0d0dc83794a8d1688ca106`
- source_goal_version: `2d2c42bef36452ba0202118c82ff7a2b98187a8fd8d7b6cfdf9ab685db270c9c`
- controller_run: `xizi_double_link_empty_rec-20260809010700`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

从递归视图判断双链表是否为空，并保持链表 ownership。

## 与单链表的对齐

对应 `xizi_single_link_empty`：predicate-only 前置、内联 nil/non-nil 返回关系、ownership preservation。双链表的循环 sentinel 判断只存在于实现和 predicate 内部。
