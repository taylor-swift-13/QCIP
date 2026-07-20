# Timing Summary — B_TcProcess

## 关键命令耗时（已实测）

| 命令 | 目标 | 耗时（秒） | 结果 |
|------|------|-----------|------|
| `symexec.exe` | 从 annotated C 生成 goal / auto / manual / goal_check | 0.84 | 成功（66 个 witness 定义） |
| `coqc` | `IP_B_TcProcess_lib.v` | 1.06 | 通过 |
| `coqc` | `IP_B_TcProcess_goal.v` | 1.91 | 通过 |
| `coqc` | `IP_B_TcProcess_proof_auto.v` | 12.04 | 通过 |
| `coqc` | `IP_B_TcProcess_proof_manual.v` | 6.30 | 通过 |
| `coqc` | `IP_B_TcProcess_goal_check.v` | 1.27 | 通过 |
| coqc 链合计 | | ≈ 22.6 | |

## 人工 / 分析耗时（本次会话内）

| 活动 | 说明 |
|------|------|
| stub / 局部变量地址实验 | `.tmp/btctest/t1.c`：`&len`、`&numerror` 直接可用 |
| `data_at` 裸地址 typed store 实验 | `.tmp/btctest/t2.c`：`*pIp->workMode` 前置写法 |
| annotation 语法踩坑 | 列表字面量 `[235;148]` 不受支持，改 `Znth` 逐项描述 |
| spec / lib 设计 | `decode_mode` / `valid_frame` / `final_workMode` / `final_bSucc` |
| 证明生成与调试 | 5 轮编译迭代（PreH 提取、左结合 && 拆分、Post 被展开、不可行路径） |
| final-check 与归档 | 编译链复测、Admitted/Axiom 扫描、Print Assumptions |
