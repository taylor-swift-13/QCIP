# float_clamp / double_clamp 验证结果

## 验证目标

证明以下两个函数在输入均为有限浮点数且 `lo <= hi` 时，返回值 `r` 满足 `lo <= r <= hi`：

- `float float_clamp(float x, float lo, float hi)`
- `double double_clamp(double x, double lo, double hi)`

## 文件说明

- `source/float_clamp.c`：带 QCP annotation 的 C 源码。
- `rocq/float_clamp_lib.v`：Coq/Rocq 辅助定义库，同时包含 `fp32`（单精度）和 `fp64`（双精度）两套定义、比较关系与序关系引理。
- `rocq/float_clamp_goal.v`：由 QCP symexec 生成的验证条件（VC），包含两个函数的 witness。
- `rocq/float_clamp_proof_auto.v`：自动证明占位文件。
- `rocq/float_clamp_proof_manual.v`：人工完成的两个函数的全部 witness 证明。
- `rocq/float_clamp_goal_check.v`：最终正确性检查模块。
- `reports/float_clamp_goal.v.backup`：原始生成的 goal 备份，未做替换。

## 关键发现

1. QCP 把 C 的 `float` 映射为 Coq 中的 `fp32`，把 `double` 映射为 `fp64`。
2. QCP 可以处理返回 `float`/`double` 变量的函数，但**不能处理 C 代码里的浮点字面量常量**（例如 `1.0`、`0.0`）。`float_clamp` / `double_clamp` 本身只涉及变量比较与返回，因此无需绕开即可直接证明。
3. `fp32` 没有 Flocq 预定义别名，需要手写 `binary_float 24 128` 并用 `binary_float_of_bits 23 8` 做位模式转换。

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
