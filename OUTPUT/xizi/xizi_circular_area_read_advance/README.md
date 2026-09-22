# CircularAreaDivideRdData 验证归档

本 case 验证 CRTOS 循环缓冲区的读跨尾判断 helper。当前公开规格已删除仅用于保存入口 `data_length` 的编号 ghost `d0`：`Require` 通过 `CircularAreaDivideRdDataInput` 描述入口参数与统一缓冲区资源，`Ensure` 使用 `data_length@pre` 引用入口长度。

## 当前状态

- run：`xizi_circular_area_read_advance-20260909120000`
- source-goal version：`df5fd3c3edbe79c94d907954f222f1043e78a18eab4250a8e5bc7b2ca99ea7b2`
- manual VC：4/4
- helper/import：无新增
- canonical symbolic execution：到达文件尾
- group-check、parent fixed `coqc_check`、final fixed `goal_check`：通过
- manual/case_lib 结构、`Admitted`、额外 `Axiom`、forbidden lemma：检查通过

## 目录

- `source/`：最终注解 C 源码。
- `rocq/`：当前生成 goal、auto/manual proof、goal-check、case lib 和 diagnostics。
- `reports/`：case 摘要、witness 清单、最终检查记录及完整 controller workflow。

## 规格变化

旧规格使用：

```c
With (state : circular_area_state) d0 LitMap area_addr
```

当前规格使用：

```c
With (state : circular_area_state) LitMap area_addr
Require CircularAreaDivideRdDataInput(
          state, LitMap, circular_area, data_length, area_addr)
```

返回关系中的原 `d0` 已替换为 `data_length@pre`。由于 QCP 对多个独立 `Require` 分支中的 `@pre` 无法确定入口分支，null/live 输入被等价封装为数学谓词 `CircularAreaDivideRdDataInput`，使规格保留单一 syntactic entry；可执行 C token 未改变。

## 复现

本轮完整 handoff、group report、parent verify 和 final-check 证据位于：

`reports/workflow/xizi_circular_area_read_advance-20260909120000/`。

在仓库根目录可用以下 canonical 参数重放 symbolic execution（需进一步保护或恢复已证 manual）：

```sh
linux-binary/symexec \
  --goal-file=SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_read_advance/source/xizi_circular_area_read_advance_goal.v \
  --proof-auto-file=SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_read_advance/source/xizi_circular_area_read_advance_proof_auto.v \
  --proof-manual-file=SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_read_advance/source/xizi_circular_area_read_advance_proof_manual.v \
  -IQCP_examples/QCP_demos_LLM/ \
  -slp QCP_examples/QCP_demos_LLM/ SimpleC.EE.QCP_demos_LLM \
  --coq-logic-path=SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source \
  --input-file=OUTPUT/xizi/xizi_circular_area_read_advance/source/xizi_circular_area_read_advance.c \
  --no-exec-info
```

Rocq 完整检查统一通过 fixed tooling 执行：

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root . \
  --build-workspace _coq_builds/xizi_circular_area_read_advance-final \
  --target-file SeparationLogic/examples/OUTPUT/xizi/xizi_circular_area_read_advance/source/xizi_circular_area_read_advance_goal_check.v \
  --target-kind check \
  --source-goal-version df5fd3c3edbe79c94d907954f222f1043e78a18eab4250a8e5bc7b2ca99ea7b2
```
