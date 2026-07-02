# IP_STSUseFlag QCP 验证成功案例

本文档记录 `IP_STSUseFlag` 的完整 QCP 验证流程和最终产物。

状态：验证成功。最终 `IP_STSUseFlag_goal_check.v` 已通过 `coqc`。

## 文件布局

- QCP C case: `QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.c`
- 配套头文件: `QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.h`
- common case formal lib: `SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_lib.v`
- 生成目标: `SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal.v`
- 自动证明骨架: `SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_auto.v`
- 手工证明: `SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v`
- 最终检查入口: `SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal_check.v`
- 持久报告目录: `.agents/reports/QCP_examples/LLM_bench/Engineering/STSUseFlag/2026-07-02/IP_STSUseFlag-20260702T033348/`

## 源文件适配

原始 IP 代码依赖 `IP_STSUseFlag.h`、`common.h` 中的宏和大型结构体。为了避开当前 QCP parser 对 header guard、`#define` 和无关 `float64` 字段的限制，正式 QCP case 使用等价的最小源形态：

- 只保留 `BUS_STSOBJ.update`、`STS_ATT.stsFlg`、`STS_ATT.dataSrc`、`STS_ATT.useOld` 四个目标字段。
- 将 `TRUE32` 展开为 `3952088175`，将 `FALSE32` 展开为 `0`。
- 函数控制流和字段更新语义保持不变。

## 规格

`IP_STSUseFlag_lib.v` 中定义了字段级数学后置关系：

- `STSUseFlag_TRUE32`
- `STSUseFlag_FALSE32`
- `STSUseFlagMappedStatus`
- `STSUseFlagPost`

`STSUseFlagPost` 描述四个旧字段值到四个新字段值的关系：

- `dataSrc <> 1` 时，`update` 变为 `0`，`stsFlg/useOld` 保持不变。
- `dataSrc = 1` 且 `update = TRUE32` 时，`stsFlg` 按 `1 -> 6`、`2 -> 7`、`4 -> 8` 映射，其他值保持不变，`useOld` 设为最终 `stsFlg`。
- `dataSrc = 1` 且 `update <> TRUE32` 且旧 `stsFlg <> 3` 时，`stsFlg` 变为旧 `useOld`，`useOld` 保持不变。
- `dataSrc = 1` 且 `update <> TRUE32` 且旧 `stsFlg = 3` 时，`stsFlg/useOld` 保持不变。

这些定义是字段关系，不是 C 分支树的 Rocq 算法镜像。

## 验证流程

1. `intake`
   - 新建 QCP case 和 formal 输出目录。
   - 记录 `case_brief.md`、冻结 `common_case_formal_lib` 前缀。

2. `annotation`
   - `annotation-subagent` 在 `.tmp` scratch 上运行 qcp-mcp。
   - 候选 annotation 使用函数级 `Require/Ensure`，拥有并归还四个全局字段。
   - `annotation-checking` 通过，随后主线程回填 C annotation 和 `IP_STSUseFlag_lib.v`。

3. `goal-frozen`
   - 主线程运行正式 symexec 生成 `.v` 文件。

4. `vc-checking`
   - `vc-checking-subagent` 判断 7 个 return witness 全部 `proofable`。
   - 不需要 helper lemma。

5. `vc-proving`
   - `vc-proving-subagent` 在 proving scratch 中证明 7 个 witness。
   - 并发 worker prepare 遇到脚本问题后，保持 phase ownership 切换到串行 fallback。
   - 没有向 `common_case_formal_lib` 追加 helper。

6. `final-check`
   - 主线程回填 handoff proof manual。
   - 重新运行 symexec。
   - 按顺序编译 `lib -> goal -> proof_auto -> proof_manual -> goal_check`。
   - 扫描确认 formal manual/lib 没有 `Admitted.`、`Axiom`、`Abort` 和 forbidden lemma。
   - 清理 `.tmp` scratch 和本 case 的 Coq 编译缓存。

## 关键命令

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal.v \
  --proof-auto-file=SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v \
  --coq-logic-path=SimpleC.EE.LLM_bench.Engineering.STSUseFlag \
  -slp QCP_examples/LLM_bench/ SimpleC.EE.LLM_bench \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --input-file=QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.c \
  --no-exec-info
```

```sh
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_lib.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_auto.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v
coqc $(cat _CoqProject) SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal_check.v
```

## 最终结果

- symexec: passed
- manual VC: 7/7 proved
- `goal_check.v`: passed
- `IP_STSUseFlag_proof_manual.v`: no `Admitted.`, no `Axiom`, no `Abort`, no helper lemma
- `IP_STSUseFlag_lib.v`: no `Admitted.`, no `Axiom`, no forbidden top-level declaration beyond approved spec definitions
- cleanup: no STSUseFlag `.tmp` scratch or case Coq cache remains
