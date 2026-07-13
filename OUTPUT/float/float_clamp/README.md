# float_clamp / double_clamp 验证结果（QCP v2.0.4）

## 验证目标

证明以下两个函数在输入均为有限浮点数且 `lo <= hi` 时，返回值 `r` 满足 `lo <= r <= hi`：

- `float float_clamp(float x, float lo, float hi)`
- `double double_clamp(double x, double lo, float hi)`

## 环境说明

本 case 使用 QCP **v2.0.4** 重新生成并证明。v2.0.4 的主要变化：

- 原生支持 `fp32` / `fp64` 类型，由 `SimpleC.SL.FloatLib` 提供，不再需要把浮点 hack 成 `Z`。
- 支持 C 代码中的浮点字面量（如 `1.0f`、`2.0`），会在 VC 中生成 `fp32_of_real` / `fp64_of_real`。
- 浮点比较谓词（`fp32_le`、`fp32_ge`、`fp64_le`、`fp64_ge` 等）已内置。

## 文件说明

- `source/float_clamp.c`：带 QCP annotation 的 C 源码。
- `rocq/float_clamp_lib.v`：Coq/Rocq 辅助定义库。
  - 只包含本 case 的 4 个谓词：`clampFloatSafe`、`clampFloatPost`、`clampSafe`、`clampPost`。
  - 以及 4 条最小比较引理：`fp32_le_refl`、`fp32_le_ge`、`fp64_le_refl`、`fp64_le_ge`。
  - `fp32` / `fp64` 类型、比较算子、有限性判断等全部来自 `SimpleC.SL.FloatLib`。
- `rocq/float_clamp_goal.v`：由 QCP v2.0.4 symexec 生成的验证条件（VC），包含两个函数的 witness。
- `rocq/float_clamp_proof_auto.v`：自动证明占位文件。
- `rocq/float_clamp_proof_manual.v`：人工完成的两个函数的全部 witness 证明。
- `rocq/float_clamp_goal_check.v`：最终正确性检查模块。

## 复现命令

在项目根目录：

```bash
cd INPUT/float/float_clamp
export PATH="/e/installs/Coq-Platform~8.20~2025.01/bin:$PATH"
COQOPTS="$(sed 's/#.*//' _CoqProject | tr '\n' ' ')"
coqc $COQOPTS float_clamp_lib.v
coqc $COQOPTS float_clamp_goal.v
coqc $COQOPTS float_clamp_proof_auto.v
coqc $COQOPTS float_clamp_proof_manual.v
coqc $COQOPTS float_clamp_goal_check.v
```

全部通过即证明完成。
