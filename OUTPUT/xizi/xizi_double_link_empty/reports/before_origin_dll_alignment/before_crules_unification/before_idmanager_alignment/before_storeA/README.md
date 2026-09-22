# xizi_double_link_empty 验证交付

本目录保存 双链表判空定义一 的最新 controller-accepted 交付。`source/` 是最终 C annotation，`rocq/` 是当前 generated goal、auto/manual proof、goal check、唯一 case lib 与 diagnostics，`reports/` 保存复用和验收摘要。

验证状态：run `xizi_double_link_empty-20260808185540` 已到 `done`；source_goal_version 为 `8b91d6eab6826562326ca7321df33d1f9057b0fe7c11e36ef9e464bb26da1844`；manual witness 数为 2。

## C 语义摘要

只读判断 sentinel 的 next 是否回到自身；公开 general spec 与单链表 empty 对齐，直接关联抽象序列是否为空与返回值，并保持 xizi_dll。

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
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check --workspace-root /home/yangfp/QCIP --build-workspace /tmp/xizi_double_link_empty-coq-build --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_empty/source/xizi_double_link_empty_goal_check.v --target-kind check --source-goal-version 8b91d6eab6826562326ca7321df33d1f9057b0fe7c11e36ef9e464bb26da1844
```

本 case final-check 与包含 13 个目标（含真实调用点）的 suite fixed check 均通过。任何 annotation、case_lib seed 或 witness statement 变化都会使本归档 stale。
