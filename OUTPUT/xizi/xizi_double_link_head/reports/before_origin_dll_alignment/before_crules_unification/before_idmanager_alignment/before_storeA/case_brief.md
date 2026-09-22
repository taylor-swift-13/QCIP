# Case Brief

- case_name: `xizi_double_link_head`
- c_path: `OUTPUT/xizi/xizi_double_link_head/source/xizi_double_link_head.c`
- target_function: `xizi_double_link_head`
- proof_type: direct-proof
- output_path: `OUTPUT/xizi/xizi_double_link_head`
- reference_cases: `xizi_single_link_*`, `crtosverify/lib/dll.v`
- style_reference_cases: 单链表 predicate-first spec；双链表 crtos segment/shift 形状
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中镜像 C 算法；不从 field store 伪造 base 非空
- proof_manual_scope: witness-proofs-after-lib-migration
- common_case_formal_lib: `rocq/xizi_double_link_head_lib.v`
- current_phase: done
- source_version: `2597cebf438e7d51f9486d1a3a5f36e8f06a5bfb2fb03fd88af9c30a283dc399`
- source_goal_version: `a23a57064b3c11a1c031e50514283e7ed25d94182b4041b9f8b5fbc21cde71bb`
- controller_run: `xizi_double_link_head-20260809003517`
- report_layout: OUTPUT compact archive + authoritative root controller reports

## C 语义

读取第一个节点；空表返回 `NULL`，非空表返回首节点。公开规格采用完整抽象序列，不暴露循环 sentinel。

## 与单链表的对齐

对应 `xizi_single_link_first`：predicate-only 前置、抽象首元素返回值、查询后 ownership 不变。双链表仅在内部用循环 sentinel 表示空表，这是不可消除的实现差异。
