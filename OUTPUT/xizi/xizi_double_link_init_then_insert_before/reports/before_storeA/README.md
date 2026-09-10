# init 后调用 insert_before 的调用点验证

这个 case 专门验证实际调用序列：

```c
xizi_double_link_init(linklist_head);
xizi_double_link_insert_before(linklist_head, linklist_node)
  /*@ where (sentinel_case) */;
```

它证明 `init` 建立的空 sentinel 链表可以直接满足 `sentinel_case`，不需要伪造 `In(linklist_head, nil)`。调用结束后得到 `xizi_dll(linklist_head, cons(linklist_node@pre, nil))`。

controller run `xizi_double_link_init_then_insert_before-20260817232144` 已到 `done`。`source_goal_version` 为 `994d2a96258574f994ceefbcece3a4217e0aff418d79b4d8f268d2ece3816455`，3 条 target manual witness 全部完成，parent fixed check 与 final-check 均通过。

目录说明：

- `source/`：真实 wrapper 与所需声明。
- `rocq/`：generated goal、proof、goal check、case lib 和 diagnostics。
- `reports/controller_run/`：完整 controller/round/group evidence。
- `reports/checkpoint.json`、`reports/reuse_packet.json`：版本绑定和复用入口。

固定 Rocq 复现：

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --build-workspace /tmp/xizi-double-link-callpoint-coq \
  --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_init_then_insert_before/source/xizi_double_link_init_then_insert_before_goal_check.v \
  --target-kind check \
  --source-goal-version 994d2a96258574f994ceefbcece3a4217e0aff418d79b4d8f268d2ece3816455
```

canonical symbolic execution 的 driver、工作目录、`-I` 和 `-slp` 参数记录在 `reports/controller_run/run_logs.json`。fresh skeleton 必须写入隔离目录，不能覆盖已证明的 manual。
