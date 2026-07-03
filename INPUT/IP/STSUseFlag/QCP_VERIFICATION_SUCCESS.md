# STSUseFlag QCP 验证成功样例索引

本目录中的原始 IP 代码已迁移出一个 QCP 可验证成功样例。正式验证 case 和结果文件不混放在原始 IP 目录，而是放在仓库标准 QCP / SeparationLogic 路径：

- QCP case: `QCP_examples/LLM_bench/Engineering/STSUseFlag/`
- Rocq 结果: `SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/`
- 完整流程说明: `QCP_examples/LLM_bench/Engineering/STSUseFlag/README.md`
- 持久报告: `.agents/reports/QCP_examples/LLM_bench/Engineering/STSUseFlag/2026-07-02/IP_STSUseFlag-20260702T033348/`

最终通过项：

- `IP_STSUseFlag_goal.v`
- `IP_STSUseFlag_proof_auto.v`
- `IP_STSUseFlag_proof_manual.v`
- `IP_STSUseFlag_goal_check.v`
- `IP_STSUseFlag_lib.v`

最终检查结论：`goal_check.v` 编译通过，manual/lib 中没有 `Admitted.`、额外 `Axiom`、`Abort` 或 forbidden lemma。
