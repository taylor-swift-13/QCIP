# xizi_double_link_remove_node 验证交付

本目录是 `DoubleLinkListRmNode` 的最终验证交付。controller run
`xizi_double_link_remove_node-20260825172438` 已进入 `done`，当前
`source_goal_version` 为
`44819d3a6d3a8a320ab0fc5991cf7b48b003190802e321db2b573d59dcc1f464`。

目录内容：

- `source/`：最终带 annotation 的 C 源码及本 case 所需头文件。
- `rocq/`：case lib、generated goal/auto、已证明 manual、goal check 和 diagnostics。
- `reports/`：controller 日志、phase/group 报告、freshness、checkpoint、复用说明和快照。

## C 语义与新增规格

函数先把目标节点的前驱和后继重新连接，再把目标节点的 `node_next`、
`node_prev` 都写回自身。函数名、签名和可执行 C 函数体未修改。

非周期软定时器存在真实二次删除路径：`CheckTimerList` 在 `softtimer.c:286`
先摘除 `t->sortlist`，随后经 `QuitRun(t)` 到 `_QuitRun` 的 `softtimer.c:122`
再次删除同一节点。第二次调用时该节点已经是自环。

新增的公开调用规格为：

```c
/*@ remove_self_loop_spec <= strong_spec
    Require xizi_dll(linklist_node, nil)
    Ensure xizi_dll(linklist_node, nil)
*/;
```

它表达删除已隔离自环是幂等操作。`xizi_dll(node,nil)` 中的 `node` 是空循环链表
sentinel，不是 `nil` 中的数据成员，因此不能用旧 `remove_member_spec` 和虚假的
`In(node,nil)` 覆盖这个调用。

现有 `remove_member_spec`、`remove_front_spec`、`remove_tail_spec` 全部保留。
QCP 只直接检查一个 body spec，所以 `strong_spec` 用 `dispatch_case` 区分：

- `0`：普通成员的精确 cut/reconnect ownership；
- `1`：`next == node && prev == node` 的精确自环 ownership。

四个公开规格均由 generated derive witness 从该 `strong_spec` 派生。

## 验证结果

- canonical symbolic execution 到达 C 文件尾；1 个 auto witness、5 个 manual witnesses。
- 5/5 manual witnesses 全部证明：body return、自环、tail、front、member。
- group-check、parent full check、最终 fixed `goal_check` 均返回 0。
- `*_proof_manual.v` 只包含这 5 个 witness proofs。
- manual/case_lib 中没有 `Admitted.`、额外 `Axiom` 或 helper definition。
- 完整 23 项 forbidden lemma 扫描零命中。
- 最终 fixed flags hash：
  `24021e94f65d7fcb0014dc119baf8b1f9efef2bcb2cf5fbeb875549a843dbeb8`。
- report-root isolated symexec 重放得到的 `goal.v`、`proof_auto.v` 与正式文件逐字节一致；
  fresh manual 的 witness 顺序和 statement hash 也与正式 manual 完全一致。

第一轮 proof 虽然能够编译，但 final-check 命中了禁止的底层 entailment lemmas，
controller 随即回滚。第二轮改用高层 DLL split/reconnect lemmas、直接 wand 构造和
`sep_apply_r_atomic` 后重新通过所有检查。

## symbolic execution 复现

在仓库根目录创建独立输出目录，运行：

```sh
mkdir -p /tmp/xizi_double_link_remove_node-symexec
linux-binary/symexec \
  --goal-file=/tmp/xizi_double_link_remove_node-symexec/xizi_double_link_remove_node_goal.v \
  --proof-auto-file=/tmp/xizi_double_link_remove_node-symexec/xizi_double_link_remove_node_proof_auto.v \
  --proof-manual-file=/tmp/xizi_double_link_remove_node-symexec/xizi_double_link_remove_node_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  -slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common \
  --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_double_link_remove_node.source \
  --input-file=OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node.c \
  --no-exec-info
```

不要用 fresh skeleton 覆盖已证明的正式 manual；应比较 `goal.v`、`proof_auto.v`
的文件哈希和 manual witness statement hash。

## Rocq 编译复现

只通过固定工具入口运行：

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --build-workspace /tmp/xizi_double_link_remove_node-coq-build \
  --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_remove_node/source/xizi_double_link_remove_node_goal_check.v \
  --target-kind check \
  --source-goal-version 44819d3a6d3a8a320ab0fc5991cf7b48b003190802e321db2b573d59dcc1f464
```

详细 witness、失败修复、用时和 controller 证据见 `reports/`。
