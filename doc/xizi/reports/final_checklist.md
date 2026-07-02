# xizi final-check checklist

- phase: final-check
- scope: `/home/yangfp/QCIP/INPUT/xizi` 全部 17 个 case
- output_root: `OUTPUT/xizi`
- formal_root: `QCIPCases/xizi`
- common_lib_root: `QCIPLib/xizi`
- symexec_status: passed，已在 `.tmp/final_symexec_xizi` 临时重生成并比较 `*_goal.v`、`*_proof_auto.v`、`*_goal_check.v`
- coqc_status: passed，公共库与 17 个 `*_goal_check.v` 全部通过
- input_c_compile_status: passed，17 个 `INPUT/xizi/*/compile.sh` 用 bash 全部通过
- proof_manual_admitted_axiom_review: passed，`*_proof_manual.v` 与 `QCIPLib/xizi` 公共库无 `Admitted.`、无顶层 `Axiom`
- forbidden_lemma_review: passed，`*_proof_manual.v` 与 `QCIPLib/xizi` 公共库无 forbidden lemma 命中
- generated_auto_review: recorded，`QCIPCases/xizi/*/*_proof_auto.v` 中有 27 个工具生成 `Admitted.`，按 final-check 文档识别但不手改
- temp_cleanup_status: completed，本轮 `.tmp/final_symexec_xizi` 和 QCIPLib/QCIPCases/OUTPUT/xizi/INPUT/xizi 下 Coq 编译缓存已清理

## Case list

- `xizi_single_link_append`
- `xizi_single_link_empty`
- `xizi_single_link_first`
- `xizi_single_link_init`
- `xizi_single_link_insert_after`
- `xizi_single_link_len`
- `xizi_single_link_next`
- `xizi_single_link_remove_node`
- `xizi_single_link_tail`
- `xizi_double_link_empty`
- `xizi_double_link_head`
- `xizi_double_link_init`
- `xizi_double_link_insert_after`
- `xizi_double_link_insert_before`
- `xizi_double_link_len`
- `xizi_double_link_next`
- `xizi_double_link_remove_node`

## Notes

- 单链表 proof 迁移自 CAV/OS end-end，并重生成到 QCIP 路径。
- 双链表使用 crtos 真实字段布局；`xizi_double_link_len` 当前规格覆盖空双链表输入。

