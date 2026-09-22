# xizi 链表命名空间简化（2026-09-22）

## 目标

减少双链表 C annotation、生成目标和 Rocq 证明中重复出现的 `DLL::` 与 `DLL.`，同时保持 C 可执行代码、规格定义、循环不变量、manual witness 语义和证明结论不变。单链表也做同类扫描，但仅在确实存在 `SLL::` / `SLL.` 时修改。

## 采用的写法

参考 `crtosverify` 的 `origin/idnode` 分支：在 C annotation import 区加入 `/*@ Import Coq Import DLL */`，随后直接使用 `DL_Node`、`Build_DL_Node`、`store_dll`、`dllseg`、`getData` 等名字；Rocq 文件使用 `Import DLL.`，证明正文采用未限定名字。

这里不使用 `Export DLL`，也不增加别名、包装定义或新的链表模型。`Import` 只改变后续短名的解析方式，因此原定义及其证明语义保持不变。

## 范围

双链表共八个 case：

- `xizi_double_link_init`
- `xizi_double_link_empty`
- `xizi_double_link_head`
- `xizi_double_link_len`
- `xizi_double_link_next`
- `xizi_double_link_insert_after`
- `xizi_double_link_insert_before`
- `xizi_double_link_remove_node`

单链表九个 active case 的目标 C、goal、manual proof 和 case_lib 扫描未发现 `SLL::` 或 `SLL.`；它们已经使用全局 `xizi_sll*` 名字，因此没有人为增加 `SLL` module 或改写定义。

## 验证方法

每个 DLL case 独立运行 controller 流程：annotation、canonical symbolic execution、diagnostics split、VC checking、group worker proof、parent verify、final candidate apply 和 final-check。最终检查使用 canonical `symexec` 参数以及 `coq_tooling.py check`，并检查 generated freshness、witness 一致性、manual 文件结构、case_lib contract、禁用 lemma 和残留 `Admitted.` / extra `Axiom`。

前三个 case（`init`、`empty`、`head`）已完成全部流程并进入 `done`；其余 case 的完整结果以各自归档的 controller `run_logs.json` 和 `timing_summary.json` 为准。

## 补记：insert_before 补齐（2026-09-23）

`xizi_double_link_insert_before` 在 9-22 轮次中未迁移，原因是其 Assert 中局部存在变量 `ptrs` 与 `DLL.ptrs` 同名冲突，直接去掉 `DLL::` 后 `ptrs(nodes)` 会被解析为对局部列表变量的应用（symexec 报 `Cannot unify types ((list (DL_Node A)) -> r) and (list Z)`）。处理：把该局部变量 α-重命名为 `node_ptrs`（不引入 case_lib 别名或包装定义），再按同一方案迁移——C annotation 加 `/*@ Import Coq Import DLL */`，goal / proof_auto / proof_manual / case_lib / diagnostics 用 `Import DLL.` + 未限定名。

验证：canonical symexec 重新生成 goal / proof_auto（diff 归一化后逐字节一致，差异仅 `Import DLL.`、短名与 α 重命名），goal_check 逐字节不变；固定 `coq_tooling.py check` 全链通过（约 235 秒）；manual 7 个 witness 语句与刷新 skeleton 一致，无 `Admitted.` / extra `Axiom`；diagnostics 重新生成；OUTPUT 归档与 live 字节一致；新 source_goal_version `e43d8b5d3ef27d61a62d774aae84fa7e1ce3a728ce35e677994c1a3507393064`。17 个链表 case 源文件 `DLL::` / `SLL::` 终扫为 0。

经验：其他 case 若遇同类局部变量与 `DLL` 短名冲突，优先 α-重命名局部变量（证明脚本的 `Intros` 自命名假设，不受影响），不要新增 case_lib 别名。

## 再补记：remove_node 别名统一与套件口径说明（2026-09-23）

两套套件审计脚本口径不同：`idmanager_dll_alignment/audit_completed_suite.py`（2026-09-10，naive_C_Rules）已过时，其 freshness 重放不含 `--CRules CRules`，会把当前 8 个双链 case 全部误判为 freshness 失败（diff 仅 `Import CRules.` vs `Import naive_C_Rules.` 一行）；当前有效的是 `origin_dll_alignment/audit_completed_suite.py`（断言 `coq_rules == 'CRules'`、goal 含 `Import CRules.`、active 文件无 `XiziLocalDLL.`/`XiziIdmanagerDLL.`）。

按 CRules 口径复验时发现 `xizi_double_link_remove_node` 的 2026-09-18 run 在 proof_manual.v 证明正文遗留 11 处 `XiziLocalDLL.*` 别名拼写（`Module XiziLocalDLL := DLL.` 别名，编译本可通过，但违反套件别名断言）。已改写为 `DLL.*`，固定 coqc 全链通过，新 source_goal_version `1ca58d5a984858c07a2feec25c282392104dfe129fa375dba515556a334cb991`，归档已同步。经验：跑套件审计一律用 `origin_dll_alignment` 版本脚本；检查 active 文件是否残留 `XiziLocalDLL.`/`XiziIdmanagerDLL.`/`naive_C_Rules` 拼写应纳入命名空间类迁移的终扫项。
