# xizi_double_link_init_then_empty 验证交付

本目录保存 初始化后判空真实调用点 的最新 controller-accepted 交付。`source/` 是最终 C annotation，`rocq/` 是当前 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics，`reports/` 保存复用和验收摘要。

验证状态：run `xizi_double_link_init_then_empty-20260808192707` 已到 `done`；source_goal_version 为 `90ae45af4a6e2a2009a80292705957446d192362fdf418d031dfdbbb7f0ed00c`；manual witness 数为 2。

## C 语义摘要

初始化空双链表后调用对齐后的 empty general spec；保留 nil_case 特化，并证明 general spec 在真实调用上下文中可实例化。

## 对齐后的 empty general spec

```c
/*@ With nodes
    Require
      xizi_dll(linklist, nodes)
    Ensure
      ((nodes == nil && __return == 1) ||
       (nodes != nil && __return == 0)) &&
      xizi_dll(linklist, nodes)
*/
```

不再保留 `xizi_double_link_empty_result` wrapper，也不在 general `Require` 重复 `linklist != 0`。非空性由 `xizi_dll` 自身蕴含。

## 复现

在仓库根目录运行 canonical symbolic execution时保留：

```text
-IQCP_examples/QCP_demos_LLM/
-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM
-slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common
```

不要覆盖已证明的 manual；fresh 输出应写到临时目录比较 witness statements。Rocq 只通过：

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_init_then_empty-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_init_then_empty/source/xizi_double_link_init_then_empty_goal_check.v --target-kind check --source-goal-version 90ae45af4a6e2a2009a80292705957446d192362fdf418d031dfdbbb7f0ed00c
```

本 case final-check 与包含 13 个目标（含真实调用点）的 suite fixed check 均通过。任何 annotation、case_lib seed 或 witness statement 变化都会使本归档 stale。
