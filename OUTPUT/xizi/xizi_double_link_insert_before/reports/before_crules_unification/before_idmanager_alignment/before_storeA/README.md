# xizi_double_link_insert_before 验证交付

本目录保存 `xizi_double_link_insert_before` 的最新 accepted 交付。此次修正的重点是让公开 spec 在真实调用点可实例化，而不是只证明函数体。

最终接口包含三个命名规格：

- `dispatch_case`：统一描述“目标是普通成员或 sentinel”的插入语义。
- `member_case <= dispatch_case`：普通成员调用，要求 `In(linklist, nodes)`。
- `sentinel_case <= dispatch_case`：sentinel 调用，不要求错误的 `In(head, nodes)`，语义是把新节点追加到抽象序列尾部。

controller run `xizi_double_link_insert_before-20260817190000` 已到 `done`。`source_goal_version` 为 `5dfcd902197d89db68e123f0f89d2998aeb2be3792c2e0c207a64ad3cabec848`，7 条 target manual witness 全部完成，parent fixed check 与 final-check 均通过。

目录说明：

- `source/`：带 annotation 的 C 源码和头文件。
- `rocq/`：generated goal、auto/manual proof、goal check、唯一 active case lib 和 diagnostics 快照。
- `reports/controller_run/`：完整 controller run、round 和 group-worker evidence。
- `reports/generated_snapshots/`：最终 formal 文件快照。
- `reports/checkpoint.json`、`reports/reuse_packet.json`：后续复用入口。

## 固定 Rocq 复现

在仓库根目录运行：

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --build-workspace /tmp/xizi-double-link-insert-before-coq \
  --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_insert_before/source/xizi_double_link_insert_before_goal_check.v \
  --target-kind check \
  --source-goal-version 5dfcd902197d89db68e123f0f89d2998aeb2be3792c2e0c207a64ad3cabec848
```

symbolic execution 使用 `/home/yangfp/QCIP/linux-binary/symexec`，工作目录为仓库根目录，并保留：

```text
-IQCP_examples/QCP_demos_LLM/
-slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM
-slp QCIPLib/xizi/xizi_double_link_common/ QCIPLib.xizi.xizi_double_link_common
```

不要直接覆盖已经证明的 `*_proof_manual.v`；fresh skeleton 应写入隔离目录后比较 generated 文件和 witness statement。精确 evidence 见 `reports/controller_run/run_logs.json`。

真实调用点 `init(head); insert_before(head,node) where (sentinel_case)` 的独立验证交付在 `../xizi_double_link_init_then_insert_before/`。
