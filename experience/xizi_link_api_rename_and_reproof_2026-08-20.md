# Xizi 单双链表 API 改名与完整重证经验

日期：2026-08-20

## 任务边界

本轮工作的目标是让 QCIP 中的 Xizi 单、双链表函数名与 Ubiquitous/CRTOS
公开 API 对齐，同时只对函数 contract 做表面规格迁移：删除参数后的 `@pre`，
直接使用对应参数名。除证明适配及经确认必需的循环快照等式外，不改变函数体、
spec label、数学谓词、case 目录名或文件名。

必须严格区分三类文本：

1. C 的可调用函数标识符需要改名。
2. 函数 `Require`/`Ensure` 中的参数 `@pre` 需要去掉。
3. `Assert`、循环 `Inv` 中用于连接入口值和循环当前值的 `@pre` 默认必须保留。

不能用全局字符串替换完成这项工作。case 名、Rocq theory/import 路径、lib 文件名
仍然使用 `xizi_*`，这是稳定的验证工件身份，不是遗漏的函数名。

## 最终 API 映射

### 双链表

| 原函数名 | 最终函数名 |
| --- | --- |
| `xizi_double_link_init` | `InitDoubleLinkList` |
| `xizi_double_link_insert_after` | `DoubleLinkListInsertNodeAfter` |
| `xizi_double_link_insert_before` | `DoubleLinkListInsertNodeBefore` |
| `xizi_double_link_remove_node` | `DoubleLinkListRmNode` |
| `xizi_double_link_empty` / `xizi_double_link_empty_rec` | `IsDoubleLinkListEmpty` |
| `xizi_double_link_head` / `xizi_double_link_head_rec` | `DoubleLinkListGetHead` |
| `xizi_double_link_next` / `next_rec_middle` / `next_rec_last` | `DoubleLinkListGetNext` |
| `xizi_double_link_len` | `DoubleLinkListLenGet` |

### 单链表

| 原函数名 | 最终函数名 |
| --- | --- |
| `xizi_single_link_init` | `InitSingleLinkList` |
| `xizi_single_link_append` | `AppendSingleLinkList` |
| `xizi_single_link_insert_after` | `SingleLinkListNodeInsert` |
| `xizi_single_link_len` | `SingleLinkListGetLen` |
| `xizi_single_link_remove_node` | `SingleLinkListRmNode` |
| `xizi_single_link_first` | `SingleLinkListGetFirstNode` |
| `xizi_single_link_tail` | `SingleLinkListGetTailNode` |
| `xizi_single_link_next` | `SingleLinkListGetNextNode` |
| `xizi_single_link_empty` | `IsSingleLinkListEmpty` |

## `@pre` 迁移的核心经验

### 函数 contract 与循环 invariant 不是同一作用域

函数 contract 中直接使用参数名，可以表达本轮要求的公开接口；但 symbolic
execution 进入循环后，循环状态中的当前参数符号不会自动等同于入口快照。
如果 postcondition 或抽象 heap 仍以入口地址为根，loop invariant 必须显式保存
这个桥接。

本轮发现三个语义上不可证的 VC，原因都不是 Rocq tactic 不够强，而是 invariant
缺失入口快照等式：

- `SingleLinkListGetLen` 增加 `linklist == linklist@pre`。
- `SingleLinkListGetTailNode` 增加 `linklist == linklist@pre`。
- `AppendSingleLinkList` 增加 `linklist == linklist@pre` 和
  `linklist_node == linklist_node@pre`。

添加后重新 symbolic execution，原先相互独立的 current root 与 snapshot root
被统一，return witness 才可恢复 postcondition 所需的 heap ownership。

这类失败不能通过 helper lemma 或黑盒 entailment tactic 修补：如果前提中没有地址
相等或资源转换桥，目标在语义上就存在反例。正确流程是退回 annotation、补最小
invariant、刷新 `source_goal_version`，再重新做 VC checking 和 proving。

### 已有 snapshot invariant 不应机械删除

`SingleLinkListRmNode` 原有循环 invariant 中的
`linklist == linklist@pre` 与 `linklist_node == linklist_node@pre` 必须保留。
该 case 的 4 个既有 spec 保持不变，只迁移函数名及函数 contract 的参数写法。

双链表 `DoubleLinkListRmNode` 没有增加“删除自环节点”的特殊 spec。不要因为实现中
可能出现 sentinel/自环形状，就在没有真实规格需求和调用点证据时扩展公开 contract。

## 证明与 controller lineage

函数名或 annotation 改动会刷新 generated witness 名称、statement hash 和
`source_goal_version`。旧 manual proof 即使证明思路仍可复用，也不能作为当前版本
的接受证据。完整流程必须重新走完：

1. annotation round 中做最小 C/spec 修改。
2. canonical symbolic execution 到文件尾并生成新目标。
3. controller 接受 annotation round，冻结新的 `source_goal_version`。
4. fresh vc-checking round 重新覆盖全部 target witnesses。
5. group-worker 只微调当前分配的 witness proof body。
6. parent verify 合并后运行完整 fixed `coqc_check`。
7. `final-candidate-apply` 后由 main agent 执行 final-check。

本轮 len、tail、append 分别重新证明了 3、4、3 个 manual witnesses。证明不需要
修改 case lib，也没有新增 helper/import；改动只落在相应 witness proof body。

## group report 证据必须与 handoff 精确一致

tail 和 append 的 group proof 首次已经编译通过，但报告没有完整记录 handoff 指定
的底层 `coqc_check.argv`，parent/controller 因证据合同不完整而拒绝接受。这不是
formal proof 失败。

修复方法是使用 `group_worker_input.json` 中的固定
`group_manifest.tooling.coq_tooling_check_argv` 原样重跑，并把工具返回的完整 argv、
working directory、target kind、`source_goal_version` 和 fixed flags hash 写入 group
report。不得手写 flags，也不得把一次宽松或不同入口的编译冒充固定检查。

经验结论：`returncode == 0` 只是证据的一部分；版本绑定、目标文件、固定 argv 和
报告字段都必须一致，group 才能进入 parent verify。

## 最终验证结果

- 16 个双链表 controller run 全部进入 `done`，无 blocker。
- 9 个单链表 controller run 全部进入 `done`，无 blocker。
- 双链表统一 suite goal-check 通过。
- 单链表各 case 的完整 goal-check 全部通过。
- 当前 21 个目标 C 文件中，旧名称不再作为可调用标识符出现；函数 contract 中
  `Require`/`Ensure` 的参数 `@pre` 为零。
- 42 个当前正式 `*_proof_manual.v` / case lib 文件均无 `Admitted.`、`Abort.`、
  顶层额外 `Axiom`，并对正式 23 项 forbidden lemma 扫描零命中。

三个 annotation 修复后的权威 run：

- `reports/xizi_single_link_len-20260820033437/`
- `reports/xizi_single_link_tail-20260820033111/`
- `reports/xizi_single_link_append-20260820040100/`

双链表统一检查入口：

- `SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_suite_goal_check.v`

当前环境未暴露 `qcp-mcp` 的 round 均按规则如实记录为 `skipped`，没有把其他 CLI
检查冒充 MCP evidence；canonical symbolic execution、controller 验收、parent fixed
Coq check 和 final-check 仍全部完成。

## 可复用审计方法

检查旧函数标识符时，应匹配“标识符后跟左括号”的 callable 形态，例如：

```text
\bxizi_single_link_len\s*\(
```

不能只搜索裸 case 名。裸名称会合法出现在 `SimpleC.EE.OUTPUT...` theory 路径、
`*_lib.v` import 和报告目录中，误报这些文本会诱发不必要的路径/工件改名。

最终审计至少同时检查：

1. 所有权威 run 的最后一个 state snapshot 为 `phase == done` 且 blockers 为空。
2. 新 callable 标识符存在，旧 callable 标识符不存在。
3. 只有函数 contract 的参数 `@pre` 被删除，授权保留/新增的 invariant 等式存在。
4. manual 和 case lib 无 `Admitted`、`Abort`、额外 `Axiom`。
5. 使用 `forbidden_lemma.md` 的完整 23 项精确名称扫描，而不是较短 fallback。
6. 每个 group-check、parent full check 和 final-check 都绑定当前
   `source_goal_version`。
