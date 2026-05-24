# 使用注意

这个文件用于说明应用 `vc-proving` 时必须优先遵守的细节。

- phase、ledger 状态、delegation 和 stale 规则统一以 `verification-orchestrator` 为准；本文件只保留 proving 相关硬规则。
- `vc-proving-subagent` 必须先从最新正式 `*_proof_manual.v` / `common_case_formal_lib` 创建 proving scratch pair，其中 lib 侧副本为本轮 `task_local_scratch_lib`。默认使用 `scripts/` 中的并发 worker 流水线；若已记录 Codex CLI / transport / backend / worker 会话不可恢复，则允许在同一 proving scratch 上进入串行 fallback。
- `vc-proving` 是长时间迭代 phase；本轮一旦交给 `vc-proving-subagent`，就应持续工作到 `completed`、`blocked` 或 `stale`，而不是只交第一版思路。
- `vc-proving` 必须保留 timing 摘要：pipeline 命令、worker / fallback proof search、`coqc` 编译、helper migration 和 verify gate 都要记录耗时；返回时指出最慢 witness/helper 和主要 proof bottleneck。
- 如果本轮是回流轮次，先读 `Re-entry Brief`，不要自己猜测为什么再次进入 `vc-proving`。
- 不要手写改动 `*_goal.v`、`*_proof_auto.v`、`*_goal_check.v`。
- 正式与最终 handoff 的 scratch `*_proof_manual.v` 只允许包含 manual witness theorem proofs；不要把 helper lemmas、helper definitions 或额外结构留在这里。
- `common_case_formal_lib` 与 `task_local_scratch_lib` 都遵守冻结前缀合同：前缀不可改写；merged manual 完成后只允许在 `task_local_scratch_lib` 后缀追加 audited helper-suffix `Require Import` 行和 migrated proved helper lemmas。
- 如果 scratch 里需要 reusable helper lemma，并发 worker 应写到本组 `worker_helper_scratch_lib`，经 `validate_and_merge.py` 收集到 merged manual，再由 `migrate_helpers_to_lib.py` 迁移进 `task_local_scratch_lib`。worker manual 只放 witness proof。
- helper lemma 不允许新增顶层 `Definition` / `Fixpoint` / `Inductive` / `Notation` / `Axiom`。如果 helper proof 需要额外库，只能在 `worker_helper_scratch_lib` 中加入最小 `Require Import` / `From ... Require Import` 行；迁移脚本会拒绝 `SimpleC.EE.*` 生成 case imports，并把通过审计的 imports 记录为 `migrated_helper_imports`。
- 如果证明推进必须修改冻结前缀，或必须新增上述顶层定义，则本轮应返回 `blocked`，而不是继续扩张文件职责。
- proving scratch `*_proof_manual.v` 继续依赖最新正式 `*_goal.v` / `*_proof_auto.v`，但其 lib 依赖必须通过 canonical case dependency overlay 切换到 `task_local_scratch_lib`。
- `prepare_agent_concurrent.py` 必须在 base workdir 和每个 group workdir 中创建 worker-local `_CoqProject`，优先消费 `vc-checking` 的 `witness_group_plan`，把每组 proof pattern notes 写入 worker `AGENTS.md`。脚本还必须创建只读 `case_deps/` overlay：正式 `*_goal.v` 保持 canonical `<case>_goal.v` 文件名，本轮 `task_local_scratch_lib` 只复制为当前 common_case_formal_lib 对应的 canonical `<case>_lib.v`；manual 额外导入的共享 `SimpleC.EE.*_lib` 必须复制正式只读源文件，不能误绑定为 `task_local_scratch_lib`。overlay 用具体 case package 的 `-Q` 绑定到 manual 中已有的 `SimpleC.EE...<case>` 逻辑模块名，再按依赖顺序预编译 overlay lib / goal `.vo`。
- 脚本必须按 proof group 启动 worker；每个 worker 使用独立 manual copy、独立组内 `worker_helper_scratch_lib`、独立 `rocq-mcp` 配置和 worker-local `_CoqProject`。如果并发 worker 成功启动，就不应主动回退到旧串行模式。
- worker 的 `.codex/config.toml` 必须把 `cwd` 指向 group workdir，以便 `rocq-mcp` 使用 worker-local `_CoqProject`；不要在 proving 中手工改 worker `_CoqProject` 或复制 `*_goal.v` / `common_case_formal_lib` / `task_local_scratch_lib` 来补救 loadpath。若 `case_deps/` overlay 缺失、不是只读、未绑定 canonical 逻辑名或未预编译，应视为 prepare 脚本问题，而不是 VC 语义不可证。
- 如果 worker 内 `rocq-mcp` 启动或调用失败，但 worker-local `coqc` 可用，这不是 proof blocker，也不是 annotation-bug。worker 必须把失败原因写入 report（例如 binary 缺失、timeout、transport/backend 不可达、exec 模式不支持 MCP tool、`request_user_input is not supported in exec mode`），然后直接使用生成的 `coqc` 命令继续证明当前 worker-local manual。
- 在 `coqc` fallback 中，允许通过临时插入 `Show.`, `Show n.`, `Show Existentials.`, `Search`, `Check`, `Print`, `About` 等 Rocq 命令并重新运行 `coqc` / `coqtop` 来观察 proof state；这些调试命令必须在该 witness 标记 solved 或 handoff 前删除。只要最终 worker manual 编译通过、无新增 `Admitted` / `Axiom` / forbidden top-level definition，就可以继续后续 validate / merge / migrate / verify 流水线。
- `coqc` 是 worker 和 merge/verify 的编译 gate；看到 `coqc` 不代表禁用了 `rocq-mcp`。但是 worker report 必须保留足够信息，能审计是否存在 `.codex/config.toml`、`use_rocq_mcp=true` 和实际证明策略。若切换到串行 fallback，也必须保留等价的 scratch-local 证明日志 / 报告，说明为什么不能继续使用 worker。
- 长时间 `coqc` 应尽量单独计时；必要时使用 `coqc -time` 或在报告中记录慢 theorem / 慢 tactic 的可观测线索。如果只能知道整文件编译耗时，也要如实记录 timing gap。
- 在写 proof 之前先判断目标是否可证；不可证的目标必须退回 annotation。
- 目标中出现数组或字符串 builtin 谓词时，先读 `.agents/skills/annotation-filling/docs/builtin-array-string-support.md`；优先使用其中列出的 `*Array`、`store_string`、`store_stringLit`、`GlobalStrings` 相关 lemma 和参考 proof，不要为单个 witness 新增重复的基础语义定义。
- 不允许引入 `Admitted`、新增 `Axiom` 或通过改变目标来规避证明。
- 证明风格要优先模仿 `QCP_demos_LLM` 中已完成的证明。
- 只要 symexec 刷新出新的正式 `*_proof_manual.v`，或 `common_case_formal_lib` 已变化，旧 proving scratch 就必须删除并重建。
- phase 完成、输入 stale 或主 agent 已正式集成后，proving scratch 和 `.tmp` worker workdir 必须删除。
