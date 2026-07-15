# Final Check Checklist

- [x] 旧 AVL OUTPUT/QCIPCases/QCIPLib common 已移入 `archieve/xizi_avl_invalid_20260714/`。
- [x] `INPUT/xizi` 无 QCP annotation。
- [x] 地址标记抽象树记录节点身份、data、cached height 和两棵子树。
- [x] 递归 separation predicate 拥有完整四字段与所有子树。
- [x] 前后状态明确表达 `A (B C) → (A B) C`。
- [x] 返回值等于原右孩子地址，全部内存资源保持。
- [x] canonical symexec 到文件尾，source-goal version 已冻结。
- [x] 隔离 freshness 重跑的 goal/auto 字节哈希及 manual witness statement hash 与正式文件一致；未覆盖已证明 manual。
- [x] 唯一 manual witness 已证明且 statement hash 一致。
- [x] group-check、parent full check、final fixed check 通过。
- [x] manual/case-lib 无 `Admitted`、额外 `Axiom`、forbidden lemma。
- [x] manual 仅含 witness proof；case lib 无 proving helper 后缀。
- [x] controller accepted candidate 是唯一写回来源。
- [x] `OUTPUT/xizi/xizi_avl_left_rotate/` 已收齐源码、全部 Rocq 文件、完整 controller/group/final-check evidence、README 与经验总结。
