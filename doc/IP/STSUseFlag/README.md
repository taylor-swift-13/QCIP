# IP_STSUseFlag 验证产物说明

本文档说明 `IP_STSUseFlag` 这个 QCP 验证 case 的完整交付物、规格含义、验证流程、复现命令和最终检查结果。

当前状态：验证通过。`IP_STSUseFlag_goal_check.v` 已经按依赖顺序通过 `coqc` 编译，manual VC 共 7 个，均已证明。

## 目录结构

```text
OUTPUT/IP/STSUseFlag/
  README.md
  source/
    IP_STSUseFlag.c
    IP_STSUseFlag.h
  rocq/
    IP_STSUseFlag_lib.v
    IP_STSUseFlag_goal.v
    IP_STSUseFlag_proof_auto.v
    IP_STSUseFlag_proof_manual.v
    IP_STSUseFlag_goal_check.v
  reports/
    case_brief.md
    witness_ledger.md
    final_checklist.md
    timing_summary.md
    input_snapshots/
    generated_snapshots/
    20260702T033500-annotation-r1/
    20260702T035000-vc-checking-r1/
    20260702T035300-vc-proving-r1/
```

## 文件清单

### source

- `IP_STSUseFlag.c`
  已补充 QCP annotation 的 C 源文件。函数 `STSUseFlag` 的 `Require/Ensure` 规格拥有并归还 4 个全局字段：`sSTSAtt.dataSrc`、`sBusSTSObj.update`、`sSTSAtt.stsFlg`、`sSTSAtt.useOld`。

- `IP_STSUseFlag.h`
  配套头文件快照。当前验证用的 C case 已经把实际参与验证的数据结构缩减到函数语义需要的字段。

### rocq

- `IP_STSUseFlag_lib.v`
  当前 case 的 common case formal lib，包含 annotation 通过质量门后正式回填的数学规格定义。

- `IP_STSUseFlag_goal.v`
  symexec 生成的 VC 目标文件。

- `IP_STSUseFlag_proof_auto.v`
  symexec 生成的自动证明骨架。

- `IP_STSUseFlag_proof_manual.v`
  手工证明文件，包含 7 个 `STSUseFlag_return_wit_*` witness 的 Rocq 证明。

- `IP_STSUseFlag_goal_check.v`
  最终检查入口，将 `proof_auto` 和 `proof_manual` 合并为 `VC_Correctness`，用于确认所有 VC 已被覆盖。

### qciplib

- `qciplib/IP_STSUseFlag_lib.v`
  从 generated proof 路径迁出的 common case formal lib 副本，正式位置为 `QCIPLib/IP/STSUseFlag/IP_STSUseFlag_lib.v`，logical path 为 `QCIPLib.IP.STSUseFlag.IP_STSUseFlag_lib`。该文件已单独通过 `coqc`。

### reports

- `case_brief.md`
  case 的主状态说明，包括输入、输出、lib 冻结信息和 phase 状态。

- `witness_ledger.md`
  witness 账本，记录需要证明的目标及其处理状态。

- `final_checklist.md`
  final-check 结果清单。

- `timing_summary.md`
  本轮验证的计时摘要。

- `input_snapshots/`
  输入快照，包括 annotation 后的 C 文件和 lib 冻结前缀快照。

- `generated_snapshots/`
  final-check 阶段留存的生成文件快照。

- `20260702T033500-annotation-r1/`
  annotation phase 的分析、检查报告和 timing log。

- `20260702T035000-vc-checking-r1/`
  VC 可证性分诊报告和 timing log。

- `20260702T035300-vc-proving-r1/`
  VC proving 产物，包括 handoff manual、fallback proof report、proof strategy report、witness group plan 和 checkpoint/reuse packet。

## C 语义摘要

`STSUseFlag` 读取并更新两个全局对象中的状态字段：

- `sSTSAtt.dataSrc`
- `sBusSTSObj.update`
- `sSTSAtt.stsFlg`
- `sSTSAtt.useOld`

验证使用的 C 文件保留了函数语义相关字段，并把宏值展开为常量：

- `TRUE32 = 3952088175`
- `FALSE32 = 0`

函数行为可以概括为：

1. 如果 `dataSrc != 1`，则把 `update` 置为 `FALSE32`，其他状态保持不变。
2. 如果 `dataSrc = 1` 且 `update = TRUE32`：
   - `stsFlg = 1` 时映射为 `6`；
   - `stsFlg = 2` 时映射为 `7`；
   - `stsFlg = 4` 时映射为 `8`；
   - 其他 `stsFlg` 保持原值；
   - 最后 `useOld` 更新为新的 `stsFlg`。
3. 如果 `dataSrc = 1` 且 `update != TRUE32` 且 `stsFlg != 3`，则把 `stsFlg` 恢复为旧 `useOld`，`useOld` 保持不变。
4. 如果 `dataSrc = 1` 且 `update != TRUE32` 且 `stsFlg = 3`，则 `stsFlg/useOld/update/dataSrc` 均保持不变。

## Rocq 规格摘要

核心规格位于 `rocq/IP_STSUseFlag_lib.v`：

- `STSUseFlag_TRUE32`
  表示 `3952088175`。

- `STSUseFlag_FALSE32`
  表示 `0`。

- `STSUseFlagMappedStatus old_status new_status`
  描述 `update = TRUE32` 分支中的状态映射关系：`1 -> 6`、`2 -> 7`、`4 -> 8`，其他值保持不变。

- `STSUseFlagPost old_data_src old_update old_status old_use_old new_data_src new_update new_status new_use_old`
  描述函数执行前后 4 个字段的数学关系。

这些定义是字段关系规格，不是把 C 分支结构重新写成 Rocq 算法镜像。

## 验证流程摘要

1. `intake`
   建立 case brief，记录正式 C 文件、formal 输出目录和 `common_case_formal_lib` 初始冻结前缀。

2. `annotation`
   在隔离 scratch 中为 C 函数添加 annotation，并在 `annotation_scratch_lib` 中设计规格定义。`annotation-checking` 质量门通过后，才把 annotation 和规格回填到正式文件。

3. `goal-frozen`
   主线程运行正式 symexec，生成 `goal/proof_auto/proof_manual/goal_check` 四类 Rocq 文件。

4. `vc-checking`
   对 7 个 return witness 做可证性分诊。结果为全部可证，不需要额外 helper lemma。

5. `vc-proving`
   完成 7 个 witness 的 manual proof。最终 handoff manual 回填为正式 `IP_STSUseFlag_proof_manual.v`。本 case 没有向 `IP_STSUseFlag_lib.v` 追加 helper lemma。

6. `final-check`
   重新运行 symexec，按依赖顺序编译 Rocq 文件，扫描 `Admitted`、额外 `Axiom`、`Abort` 和 forbidden lemma，清理临时 scratch 与 Coq 编译缓存。

## 复现命令

以下命令从仓库根目录 `/home/yangfp/QCIP` 执行。

### 重新生成 Rocq 产物

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal.v \
  --proof-auto-file=SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v \
  --coq-logic-path=SimpleC.EE.LLM_bench.Engineering.STSUseFlag \
  -slp QCP_examples/LLM_bench/ SimpleC.EE.LLM_bench \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=OUTPUT/IP/STSUseFlag/source/IP_STSUseFlag.c \
  --no-exec-info
```

### 编译检查

```sh
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_lib.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_auto.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal_check.v
```

### 快速扫描未完成证明

```sh
rg -n "\\bAdmitted\\b|\\badmit\\b|^\\s*Axiom\\b|\\bAbort\\b" \
  SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_lib.v \
  SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v
```

## 最终检查结果

- symexec：通过，生成文件已刷新。
- manual VC：7/7 已证明。
- `IP_STSUseFlag_goal_check.v`：通过 `coqc`。
- `IP_STSUseFlag_proof_manual.v`：未发现 `Admitted`、`admit`、顶层 `Axiom` 或 `Abort`。
- `IP_STSUseFlag_lib.v`：未发现 `Admitted`、`admit`、顶层 `Axiom` 或 `Abort`。
- helper lemma：本 case 不需要迁入 helper lemma。
- 临时文件：final-check 后已清理 STSUseFlag 相关 `.tmp` scratch 和 Coq 编译缓存。

## 使用注意

- `OUTPUT/IP/STSUseFlag/rocq/` 是集中交付副本；当前可编译正式 Rocq 路径仍是 `SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/`。
- `QCIPLib/IP/STSUseFlag/IP_STSUseFlag_lib.v` 是 IP 自定义 common lib 的独立库位置；后续新 case 应优先使用 `QCIPLib` 路径组织自定义库。
- `INPUT/IP/STSUseFlag/` 保存未规约原始输入闭包；`OUTPUT/IP/STSUseFlag/source/` 保存已标注、可用于复现 symexec 的 C 源快照。
- 旧的 `QCP_examples/LLM_bench/Engineering/STSUseFlag/` 位置已经迁出，不再作为交付或复现入口。
- 如果后续修改正式 C annotation 或 `IP_STSUseFlag_lib.v`，需要重新运行 symexec、重新编译 `goal_check`，并同步更新本目录副本。
- 本 case 使用 `QCP_demos_LLM` 头文件搜索路径约定；symexec 命令中的 `-I` 和 `-slp` 都需要保留，二者不能互相替代。
