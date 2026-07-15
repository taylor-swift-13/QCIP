# Final Check Checklist

- [x] `INPUT/xizi` 不含 QCP annotation。
- [x] canonical symexec 到达文件尾，generated files 与 accepted source version 绑定。
- [x] 隔离 freshness 重跑的 goal/auto 字节哈希及 manual witness statement hash 与正式文件一致；未覆盖已证明 manual。
- [x] 唯一 manual witness 已完成且 statement hash 一致。
- [x] parent fixed `goal_check` 通过。
- [x] final fixed `goal_check` 通过。
- [x] `*_proof_manual.v` 仅含 witness proof。
- [x] manual/case-lib 无 `Admitted`、额外 `Axiom`、forbidden lemma。
- [x] case-lib 仅含 annotation-approved `xizi_dll_empty` 定义，无 helper 后缀。
- [x] controller accepted candidate 是唯一写回来源。
- [x] doc 源码、Rocq 与 controller 报告已同步。
- [x] `OUTPUT/xizi/xizi_double_link_init/` 已收齐源码、全部 Rocq 文件、完整 controller/group/final-check evidence、README 与经验总结。
