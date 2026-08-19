---
name: verification-entry
description: QCIP 验证入口规范；任何端到端 C/QCP/Rocq 验证、case 收尾或证明产物整理任务都先使用。要求先进入 verification-orchestrator，完成后将源码、Rocq 证明产物、报告、快照、checkpoint/reuse packet 和中文复现 README 统一归档到 OUTPUT 下的 case 目录，不另建 doc 快照，并及时清理非交付临时文件。
---

# Verification Entry

这个 skill 是 QCIP 单个验证 case 的入口约束层。它不替代 `verification-orchestrator`、`annotation-filling`、`vc-checking`、`vc-proving` 或 `final-check`；它补充三条全局交付要求：

- 所有证明交付物必须统一整理到 `OUTPUT` 下的 case 目录，不再复制一份 `doc` 快照。
- 每次工作中形成的可复用经验和用户约束必须同步写入仓库顶层 `experience/` 的对应主题文件。
- 每轮验证结束或中止前必须及时清理工作区临时产物。

## 入口顺序

1. 对任何端到端验证、已有 case 收尾、proof 产物整理或 final-check 后归档任务，先加载并遵守本 skill。
2. 立即进入 `verification-orchestrator` 建立或恢复 case workflow。
3. 在 `Case Brief` 或 phase 状态中记录 `output_artifact_dir`，优先沿用仓库已有的 `OUTPUT/<series>/<case-name>/`；没有 series 约定时使用 `OUTPUT/<case-name>/`。
4. 后续 annotation、VC 分诊、VC 证明和 final-check 仍按各自 domain skill 与固定 subagent 合同执行。

## experience 积累规则

任务开始时确定 `experience/<topic>.md`；优先更新已有主题文件，只在确实没有合适主题时新建。任务进行中就应持续记录，不要等到最后凭记忆补写。

至少记录：

- 用户的明确要求、禁止项、交付路径和格式约定。
- C 语义、spec / 谓词设计的取舍，以及为工程可扩展性保留的稳定接口。
- annotation、symbolic execution 和 Rocq 证明中的失败路径、根因、有效修复和不应重复的尝试。
- 实际 driver、working directory、关键参数、fixed `coq_tooling.py` 入口和通过结果，但不得记录密钥或不必要的机器私有信息。
- 可复用的引理、proof pattern、检查清单、易错边界和后续维护注意事项。

`experience/` 是持久工程知识，不是 controller acceptance evidence，不替代 JSON report、fixed check 证据或 OUTPUT 正式交付物。

## OUTPUT 归档规则

最终归档目录固定为：

```text
OUTPUT/<series>/<case-name>/
  README.md
  source/
  rocq/
  reports/
```

`<case-name>` 默认使用 C 文件 basename 去掉扩展名。若 repo 中已有同 case 的 OUTPUT 目录，必须沿用现有 series、目录名和子目录格式；不为了归档再创建平行的 `doc/` 目录。

归档内容必须包括：

- `source/`
  - 最终正式 `.c`。
  - 当前 case 必要的本地头文件或输入文件。
- `rocq/`
  - `common_case_formal_lib`，例如 `*_lib.v`。
  - `*_goal.v`。
  - `*_proof_auto.v`。
  - `*_proof_manual.v`。
  - `*_goal_check.v`。
- `reports/`
  - `case_brief.md`。
  - `witness_ledger.md`。
  - `final_checklist.md`。
  - `timing_summary.md`。
  - annotation / vc-checking / vc-proving 的 subagent report、timing log、strategy report。
  - `input_snapshots/`、`generated_snapshots/`。
  - `vc_proving_round_checkpoint.json`、`partial_proof_packet.json`、`reuse_index.json` 及对应 migrated manual / scratch lib 快照；这些文件仍是 report artifact，不是 active scratch。
- `README.md`
  - 用中文写明 case 状态、目录结构、C 语义摘要、Rocq 规格摘要、验证流程、symexec 复现命令、coqc 编译命令、最终检查结果和后续维护注意事项。

如果已有中间 `artifacts/` 目录，可以先生成或更新它，但最终必须同步到对应 OUTPUT case 目录。完成后用文件数、`diff -qr` 或关键文件 `cmp` 确认 OUTPUT 归档与交付源一致。

## 清理规则

每次 phase 完成、输入 stale、下游返工、用户取消或 case 结束时，清理本轮产生的非交付临时产物。

必须清理：

- `.tmp/` 下当前 case 的 annotation scratch、proving scratch、worker workdir 和 scratch-local manual。
- 当前 case 产生的 Coq 编译缓存：`*.vo`、`*.glob`、`*.vos`、`*.vok`、`.*.aux`、`.lia.cache`、`.nia.cache`。
- Python / pytest 缓存：`__pycache__/`、`.pytest_cache/`，如果是本轮工具产生的。
- 失败重跑留下的临时 diff、日志、overlay、scratch lib，只要它们没有被纳入当前 run report 或 OUTPUT 的必要交付报告。

不得清理：

- 正式 `.c`。
- 正式 `*_goal.v`、`*_proof_auto.v`、`*_proof_manual.v`、`*_goal_check.v`。
- 正式 `common_case_formal_lib`。
- `.agents/reports` 下作为持久 report artifact 的 checkpoint、partial proof packet、reuse index、handoff manual、snapshot、timing report。
- `OUTPUT/<series>/<case-name>/` 下的归档交付物。

结束前至少执行一次工作区检查：

```sh
find .tmp -mindepth 1 -maxdepth 4 -print
find . -type f \( -name '*.vo' -o -name '*.glob' -o -name '*.vos' -o -name '*.vok' -o -name '.*.aux' -o -name '.lia.cache' -o -name '.nia.cache' \) -print
find . -type d \( -name '__pycache__' -o -name '.pytest_cache' \) -print
```

只删除确认属于本轮或当前 case 的临时产物；不要用破坏性 git 命令清理。

## 完成门

在报告 case 完成前，除原有 verification/final-check 条件外，还必须满足：

- `output_artifact_dir` 指向仓库现有 OUTPUT 格式下的当前 case。
- 对应 `experience/<topic>.md` 已记录本次用户约束、设计取舍、失败/修复路径、验证证据和可复用经验。
- OUTPUT case 目录中的中文 `README.md`、`source/`、`rocq/`、`reports/` 已同步当前最终产物。
- OUTPUT 归档与正式产物已做一致性检查，且没有为同一交付另建 `doc` 快照。
- 当前 case 的 `.tmp` scratch、worker workdir、Coq cache 和 Python cache 已清理，或明确说明剩余项为何必须保留。
