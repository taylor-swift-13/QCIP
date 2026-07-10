# Timing Summary — binaryTree_invert

> 本 case 由主 agent 直接推进（annotation + symexec + 证明 + final-check 串行）。

| Phase | 主要工作 |
|---|---|
| annotation | 编写带 QCP 标注的 C 源码，复用 avl_shape 形状述语 |
| symexec | 运行 `linux-binary/symexec` 生成 VC |
| vc-proving | 填写 2 个手动 witness（entailer! / subst / simpl / lia / pose proof nonneg） |
| coqc | 依赖顺序编译 lib → strategy → goal → auto → manual → goal_check |
| final-check | Admitted/Axiom/forbidden lemma 扫描 + 归档一致性检查 |

- 全套件（4 case + 公共库，共 19 个 .v 文件）clean rebuild 全部通过。
