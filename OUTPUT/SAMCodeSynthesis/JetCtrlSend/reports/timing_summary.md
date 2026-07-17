# Timing Summary — JetCtrlSend

## 关键命令耗时（已实测）

| 命令 | 目标 | 耗时（秒） | 结果 |
|------|------|-----------|------|
| `symexec.exe` | 从 annotated C 生成 goal / auto / manual / goal_check | 0.66 | 成功（82 个 witness 定义） |
| `coqc` | `IP_JetCtrlSend_lib.v` | 0.92 | 通过 |
| `coqc` | `IP_JetCtrlSend_goal.v` | 1.54 | 通过 |
| `coqc` | `IP_JetCtrlSend_proof_auto.v` | 7.00 | 通过 |
| `coqc` | `IP_JetCtrlSend_proof_manual.v` | 1.57 | 通过 |
| `coqc` | `IP_JetCtrlSend_goal_check.v` | 1.11 | 通过 |
| coqc 链合计 | | ≈ 12.1 | |

对照：ThrusterCtrlLogic（64 个 return_wit，未做 helper 抽取）coqc 链约 247 秒。
JetCtrlSend 若内联 6 个 `||` 分支会产生 729 个 return_wit（合计 3642 个
witness，symexec 生成约 36 秒），证明与编译均不可承受；helper 抽取后
witness 总数 82，证明可脚本化，全链编译约 12 秒。

## 人工 / 分析耗时（本次会话内）

| 活动 | 说明 |
|------|------|
| 工具实验（局部数组 / 位运算 / 路径计数） | `.tmp/bitop_test/` 下 7 组 symexec 小实验 |
| 路径爆炸定位 | 发现 `||` 每对 3 路径、`3^6=729`，转向 helper 抽取 |
| spec / lib 设计 | `jet_step` / `pack_wPulse` / `JetCtrlSendPost` / `UartSendRecord` |
| 代表证明交互验证 | `.tmp/bitop_test/proof_test.v` 覆盖全部 10 类模板 |
| 批量生成脚本 | `reports/gen_proofs.py`，75 个引理一次生成 |
| final-check 与归档 | 编译链复测、Admitted/Axiom 扫描、Print Assumptions |
