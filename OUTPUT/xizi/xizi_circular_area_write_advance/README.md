# xizi_circular_area_write_advance 验证交付

本目录保存 `CircularAreaDivideWrData` 的最终 accepted 交付。`source/` 是带 annotation 的 C 源码，`rocq/` 包含 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics，`reports/` 保存 controller、workflow、checkpoint 和复用证据。

验证状态：controller run `xizi_circular_area_write_advance-20260821120006` 已到 `done`，final-check 与独立 freshness 均通过；`source_goal_version` 为 `b82fb0447949471fb4380d0617f8e086a09e2da6bf69e27a420131c832f7d49b`，manual target witness 共 2 个，全部完成证明。

规约直接使用函数参数名，不含参数 `@pre`。函数名、static 属性、签名和可执行语义已与 CRTOS `circular_area.c` 对齐；`ERROR` 为 1，descriptor 保持 `p_head=data_buffer`、`p_tail=data_buffer+area_length` 和 `0 < area_length <= 256` 的有效状态约束。

## 复现

在仓库根目录运行 canonical symbolic execution，必须保留：

    -IQCP_examples/QCP_demos_LLM/
    -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM

fresh 输出必须写到报告临时目录，不能覆盖已证明的 manual。Rocq 只通过 `.agents/skills/vc-proving/scripts/coq_tooling.py check` 的 fixed argv 检查。精确命令、哈希和 phase 证据见 `reports/controller/` 与 `reports/workflow/`。

## 文件组织

- `source/`：最终 annotated C。
- `rocq/`：最终 generated files、manual proof、case_lib 与 diagnostics。
- `reports/controller/`：run log、timing、final state 与 freshness。
- `reports/workflow/`：accepted annotation、vc-checking、vc-proving handoff/report。
- `reports/generated_snapshots/`、`reports/input_snapshots/`：交付快照。
- `reports/checkpoint.json`、`reuse_packet.json`、`partial_proof_packet.json`：续证入口。
