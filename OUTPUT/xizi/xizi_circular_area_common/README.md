# CRTOS 循环缓冲区统一验证交付

本目录是 CRTOS `CircularArea` 验证套件的公共入口。验证基线为 `/home/yangfp/crtos` commit `d1a2bbc0312b9750edbcb00c73c5eedc21d14d96`，生产实现位于 `Ubiquitous/XiZi_IIoT_Macro/kernel/thread/circular_area.c`。

## 当前结论

- 12 个真实函数验证 case（普通 Write 与 force Write 分开）完成 136/136 manual VC。
- 调用点组合覆盖 8 条调用链，完成 29/29 manual VC。
- 总计 13 个 case、165/165 manual VC；所有 controller run 为 `done`，各自 final-check 通过。
- 同时导入全部 13 个 case 的 `xizi_circular_area_suite_goal_check.v` 已通过固定 Coq 8.20.1 检查。
- 1434 个 JSON、3443 条 JSONL 记录和 195 组 active/archive 字节比较均无错误。
- 所有 manual/case_lib 均无 `Admitted.`、`Abort.`、额外 `Axiom` 或 forbidden 顶层声明。

## 统一资源语义

唯一公共资源接口为 `circular_area_state/store_circular_area`。公开状态只包含容量与逻辑 FIFO；backing pointer、operations pointer、读写下标、status 和 `list (option Z)` 物理数组全部由 `store_circular_area` 内部 existential 管理。物理数组统一使用 `UCharArray.mixed_full`。

Init 成功返回空 FIFO 的统一资源，输出可直接供 Read、普通 Write、查询、Reset 和 Release 消费。调用点中只保留一个 `read_one_spec`，用返回值区分空队列和成功读取；Read 使用 mixed 输出所有权，既能接未初始化输出缓冲区，也能接已有字节的输出缓冲区。Release 完整消费 descriptor 和 backing buffer。

Read、普通 Write 和 force Write 的入口参数旧值现统一使用 `@pre`，不再用 `ca0/in0/out0/requested/d0` 这类快照 `With`。真正的逻辑状态与数组内容仍由 `With` 量化；nullable 分支由单一入口 Assertion 封装，以保证 `@pre` 有唯一入口语义。

一般 `b_force != 0` Write 仍返回 raw forced resource：实现即使未填满也可能形成“等索引、status=1”，因此不能无条件恢复 canonical FIFO。只有 fresh、容量 4、恰写 4 字节的调用点使用已证明 bridge 恢复统一资源。当前 CRTOS 测试中的实际间接 Write 调用传入 `b_force=0`。

机器审计入口为 `reports/completion_audit.json`，中文结论见 `reports/full_suite_audit.md`。
