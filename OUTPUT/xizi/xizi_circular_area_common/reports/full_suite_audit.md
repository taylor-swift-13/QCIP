# CRTOS 循环缓冲区最终审计

## 结论

通过。统一 `circular_area_state/store_circular_area` 已覆盖全部真实循环缓冲区函数及 8 条调用组合链，没有未证明的 target manual VC，也没有调用点因规格资源无法衔接。

## 覆盖

- 12 个真实函数 case：136/136 manual VC。
- 8 条组合调用链：29/29 manual VC。
- 合计：13 个 case，165/165 manual VC。
- 各 case controller phase 与 final-check：全部通过。
- 13-case 联合 fixed Coq 检查：通过，Coq 8.20.1，本轮观测耗时 674.491 秒，suite digest 为 `110d7a5a02506abe4f19a695f0b33271d909d4439a0f8fb98ced2f2ac45276a9`。

## 调用点结论

Init 成功输出统一空 FIFO 资源，可直接供查询、Read、普通 Write、Reset 和 Release 使用。调用点已用唯一的 `read_one_spec` 合并空队列和成功读取分支；Read 的 mixed 输出接口统一了未初始化与已初始化输出缓冲区。普通 Write 可继续供 Read、连续 Write 和 Reset 消费；Release 完整消费统一资源。

Read、普通 Write 与 force Write 的入口快照已经从 `With` 别名改为单一入口 Assertion 下的参数 `@pre`；真正的逻辑资源参数仍由 `With` 管理。三者重新生成并分别完成 37、32、30 个 manual VC。

一般 force Write 只交付 raw forced resource，不被误判为 canonical FIFO。组合 case 仅在 fresh、容量 4、恰写 4 字节的受限条件下通过 proved bridge 恢复 `store_circular_area` 后 Release。

## 一致性与清理

公共库 active/archive SHA-256 均为 `b99cd767c790f6111d1c4949ed0bda3270e80a5641c182e9e4cfd0768a292ca5`。审计验证 1434 个 JSON、3443 条 JSONL、195 组 active/archive 字节比较，错误为 0；manual/case_lib 没有 `Admitted.`、`Abort.`、额外 `Axiom` 或非法顶层声明。本轮三个 run 的注册 worktree 与 run root 均已清理。
