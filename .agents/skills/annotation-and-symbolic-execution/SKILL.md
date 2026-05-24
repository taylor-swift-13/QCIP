---
name: annotation-and-symbolic-execution
description: 为 QCP C 程序补充或修正 annotation；annotation-subagent 在隔离 scratch C 上使用 qcp-mcp 持续交互检查，主 agent 负责回填正式 `.c` 并刷新 symexec 生成文件。
---

# Annotation And Symbolic Execution

这个 skill 是旧版 annotation 工作流说明；当前 case 默认使用 `annotation-filling` + `annotation-checking`。若因历史任务仍触发本 skill，也必须遵守 `verification-orchestrator` 的 report layout 和 annotation-checking 规则。
它固定绑定给 `annotation-subagent`；phase、工件模板、delegation、report folder 和失效传播规则统一由 `verification-orchestrator` 定义；本 skill 不再重复定义它们。

## 何时使用

- case 已由 `verification-orchestrator` 置于 `annotation` 阶段。
- 主 agent 已为当前 annotation 轮次启动 `annotation-subagent`。
- 需要为 C 文件补充 `Require`、`Ensure`、`Assert`、`Inv Assert`。
- symbolic execution 失败，需要定位并修正 annotation。
- 上游判定某些 witness 属于 `annotation-bug`，需要返工 annotation。

## 进入前提

- 当前 case 的目标 C 文件、输出目录、验证函数和 proof 类型已经明确。
- 主 agent 已确定这是当前 case 的正式 annotation 轮次。
- 当前 delegation ticket 的 `subagent_name` 固定为 `annotation-subagent`。
- 当前 delegation ticket 已给出最新正式 `.c` 快照和本轮 annotation scratch 路径；若路径已被旧轮次占用，必须先删除旧 scratch。
- 当前 delegation ticket 已明确：本轮 `annotation` 的 `iteration_owner` 是 `annotation-subagent`，main 线程不会在等待一段时间后接管本轮 domain 工作。
- 当前 delegation ticket 已明确本轮 `annotation_focus`、`preferred_hidden_properties` 和 `forbidden_annotation_patterns`；如果这些字段缺失，应以 `blocked` 返回主 agent 要求补全，而不是自行默许算法镜像方案。
- 若来自返工，主 agent 已明确哪些 witness / VC 暴露了 annotation 层问题。
- 若来自返工或下游回流，当前 ticket 还必须附带 `Re-entry Brief`，说明为什么会再次进入 `annotation`。

## 直接输出

- 已在 annotation scratch 上验证过的 annotation patch / block rewrite。
- `qcp-mcp` 交互检查摘要、案例映射和风险分析。
- 本轮 annotation 总耗时、关键 `qcp-mcp` symbolic/check/step 耗时、annotation 分析/编辑/失败归因/patch 整理等 activity 耗时、最慢 annotation 迭代点，以及主要耗时原因。
- 若本轮返回 `blocked` 或总耗时超过 600 秒，必须额外输出 blocked / long-duration 诊断：blocked reason、long-duration reason、具体证据、受影响函数/行号/annotation 区块、已经尝试过的路径、下一步建议。
- 主 agent 正式回填 annotation 并刷新生成文件时所需的执行建议。
- `Subagent Return Report`，其 `round_outcome` 只能是 `completed`、`blocked` 或 `stale`。

## 会使哪些产物失效

- annotation 一旦变化，旧 witness 分析、旧 proof skeleton、旧 proving 计划和旧 final-check 结论都会失效。
- 具体 stale 标记与 phase 迁移规则，按 `verification-orchestrator` 执行。

## 主 / 子 Agent 局部边界

- `annotation-subagent` 拥有 annotation scratch 和该 scratch 上的 `qcp-mcp` 会话。
- `annotation-subagent` 负责在 scratch 上持续试改 annotation，直到跑通或明确确认必须继续返工。
- 主 agent 独占正式 `.c` 写入、symexec 和 phase 状态提交。
- `annotation-subagent` 不直接提交当前 case 的正式 annotation。
- 本轮 `annotation` 一旦交给 `annotation-subagent`，main 线程不得因为等待较久而强行打断并自己完成 annotation。

## 参考文档

1. 先读 `../verification-orchestrator/SKILL.md`
2. `docs/use-notes.md`
3. `docs/annotation-rules.md`
4. `docs/predicate-first-annotation.md`
5. `docs/builtin-array-string-support.md`（遇见数组、字符数组、C 字符串或字符串字面量时必须阅读）
6. `docs/array-predicate-selection.md`（只在遇见与数组相关问题时阅读）
7. `docs/reference-cases.md`
8. `docs/symexec-refresh.md`

## 工作步骤

1. 读取当前 annotation 轮次的 delegation ticket，确认目标 C 文件、输出目录、验证函数、proof 类型、本轮 annotation scratch 路径、`timing_required` / `timing_log_path`，以及是否附带 `Re-entry Brief`；记录本轮 `phase_started_at`。
2. 若存在 `Re-entry Brief`，先根据其中的失败原因、受影响 witness / 文件和本轮重点，决定本轮优先修正的 annotation 点。
3. 若旧的 annotation scratch 仍存在，先删除；随后从最新正式 `.c` 复制出 fresh annotation scratch。
4. 先做一轮“predicate-first”设计：优先选局部隐藏性质、直观谓词和子区间语义，不要先在 Rocq 中重写算法本体；只有当 helper definition 真的是“性质接口”而不是“算法解释器”时，才允许继续。若涉及数组或字符串，先检查 `docs/builtin-array-string-support.md` 中已有的 `*Array::*`、`store_string`、`store_stringLit`、`GlobalStrings` 等 builtin 支持。
5. 参考 ticket 中给出的正例 / 反例以及 `reference-cases.md`，在 scratch 上补充或修正函数规格、断言和循环不变式。
6. 若发现自己正在依赖“Rocq 中的递归算法定义 / 状态机定义”来推动 annotation，应先回退并重新组织 annotation；只有 refinement proof 所必需的 `safeExec` / monad 规格可以保留。
7. 在 scratch 上反复运行 `qcp-mcp`，持续迭代 annotation；每次关键 `symbolic` / `check` / `step` / 重新验证都记录耗时、结果和对应 C 行号或 annotation 区块。不要在第一次尝试后就返回，只有在本轮达到 `completed`、`blocked` 或 `stale` 时才结束。
8. 标出哪些 annotation 点最可能影响 witness 结构、后续 proving，或暴露出 manual VC 语义不可证的问题。
9. 以 `Subagent Return Report` 的形式，把已经在 scratch 上验证过的 patch、风险点、最终采用的隐藏性质、参考案例映射和 timing 摘要交给主 agent；timing 摘要至少包含本轮总耗时、命令耗时、非命令 activity 耗时、最慢 `qcp-mcp` 检查或 annotation 区块、主要耗时原因和无法精确统计的 timing gaps。若本轮 `elapsed_seconds > 600`，必须提供 `long_duration_reason`，说明时间花在 qcp-mcp 交互、annotation 设计、反复 symbolic、工具等待、定位失败点或整理 patch 的哪些部分；若本轮 `round_outcome = blocked`，必须提供 `blocking_reason`、证据和建议回退/补充信息。由主 agent 回填正式 `.c` 并在正式文件上执行 symexec 刷新。
10. 当本轮结束、返工或输入 stale 时，删除 annotation scratch，并把 phase 切换建议交回 `verification-orchestrator`。
