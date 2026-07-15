# `xizi_double_link_init` 完整验证归档

状态：已完成。controller run `xizi_double_link_init-20260714130001` 已进入 `done`，唯一 manual witness 已证明，parent full check 与 final-check 均通过。

最终交付全集位于 `OUTPUT/xizi/xizi_double_link_init/`：包含干净输入快照、annotated 验证源码、全部正式/诊断 Rocq 文件、controller round/group/final-check 报告、新鲜度证据和本 README。`doc/xizi_double_link_init/` 保留同一 case 的文档归档。

## 文件边界

- `source/xizi_double_link_init.c`：来自 `INPUT` 的干净 C 源码，不含 QCP annotation。
- `source/xizi_double_link_init_annotated.c`：位于 `Verification` 的正式验证副本，包含 QCP annotation。
- `source/xizi_double_link_def.h`：干净的节点定义。
- `rocq/`：case lib、生成 goal/auto、手写 manual proof 和总检查文件。
- `reports/`：controller 日志、完整 round/group handoff、输入及生成文件快照。

在 `OUTPUT` 的 `source/` 中，`xizi_double_link_init.c` 与 `xizi_double_link_init_annotated.c` 均为正式 annotated 验证源码，`xizi_double_link_init_input.c` 是无 annotation 的 `INPUT` 快照。

## 功能与内存规格

前置条件要求 `linklist_head != NULL`，并以分离合取分别拥有哨兵的 `node_next`、`node_prev` 两个字段，旧值任意。函数写完后满足：

```coq
xizi_dll_empty head :=
  “ head <> NULL ” &&
  head->node_next |-> head **
  head->node_prev |-> head
```

因此后置条件同时表达两个功能事实和对应内存所有权：`next`、`prev` 都回指同一个哨兵；两块字段资源没有丢失、复制、重叠或释放。程序不分配也不释放内存。

## 验证结果

annotation round 完成三次 qcp-mcp 与三次 canonical symexec 检查，case lib 编译及 annotation-checking 通过。VC checking 识别唯一 witness `proof_of_xizi_double_link_init_return_wit_1`；group-worker 直接展开 `xizi_dll_empty` 后完成空间消去，无 helper。parent verify 和 final-check 的固定 `goal_check` 均返回 0；额外隔离 symexec freshness 重跑确认 goal/auto 字节一致且 witness statement hash 一致；manual/case-lib 不含 `Admitted`、额外 `Axiom` 或 forbidden lemma。

## 复现

在仓库根目录运行 symbolic execution：

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/Verification/xizi/xizi_double_link_init/xizi_double_link_init_goal.v \
  --proof-auto-file=SeparationLogic/examples/Verification/xizi/xizi_double_link_init/xizi_double_link_init_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/Verification/xizi/xizi_double_link_init/xizi_double_link_init_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=SimpleC.EE.Verification.xizi.xizi_double_link_init \
  --input-file=Verification/xizi/xizi_double_link_init/xizi_double_link_init.c \
  --no-exec-info
```

Rocq 检查统一使用固定入口：

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --target-file SeparationLogic/examples/Verification/xizi/xizi_double_link_init/xizi_double_link_init_goal_check.v \
  --target-kind check
```

维护时必须继续保持 `INPUT` 无 QCP annotation；只修改 `Verification` 验证副本后重新走 controller run。任何 C annotation 或 case-lib 变化都会使生成文件及 witness proof stale。
