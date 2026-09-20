# 最终检查清单

- [x] symbolic execution 到达函数末尾
- [x] fresh symexec 与已采用 generated files 一致
- [x] target witness 覆盖完整
- [x] group-worker fixed group-check 通过
- [x] parent full fixed `coqc_check` 通过
- [x] final fixed `coqc_check` 通过
- [x] manual proof 不含 `Admitted.` 或 forbidden top-level declaration
- [x] case lib 不含 `Admitted.`、额外 `Axiom` 或 generated-artifact import
- [x] controller phase 为 `done`

权威证据见 `controller/run_logs.json`，合并证据见 `rounds/bst_left_child-vc-proving-r1/group_merged_result.json`。

