# StructFilter 产物质量评估

## 源码事实基线

`StructFilter` 是单函数、无显式分支和循环的顺序计算模块。函数形参包括：

- `X`：长度至少为 8 的滤波器状态数组，函数读写 `X[0..7]`。
- `filter`：结构滤波器参数指针，读取 18 个系数字段。
- `PIDPara`：PID 参数数组，读取 `PIDPara[0..2]`。
- `Ang`、`dAng`：角度偏差和角速度偏差输入。

源码流程为：

- 缓存旧状态 `X[1]`、`X[3]`、`X[5]`。
- 读取 `Kp`、`Ki`、`Kd`。
- 按多阶滤波器链更新 `X[0]` 到 `X[6]`。
- 用 `sTime.prd * Ki * Ang` 积分更新 `X[7]`。
- 返回 `Y4`，其中 `Y4` 在更新 `X[5]` 和 `X[6]` 前由旧 `X[5] + filter->D4 * Y3` 计算得到。

## 静态分析产物质量

总体判断：较好。由于源码是直接赋值、无 helper 调用，静态产物能较完整地还原输入、状态更新和返回路径。

已形成的有效结果：

- 正确识别 1 个函数、5 个形参、11 个局部变量、0 条调用边、0 个 unresolved call。
- 正确识别无显式条件分支、无循环。
- 正确识别 19 条赋值语句，包括 `X[0..7]` 的状态更新。
- 正确识别 `filter->A11`、`filter->H1`、`filter->D1` 等 18 个滤波器参数字段读取，以及 `sTime.prd` 读取。
- `results_StructFilter.json` 将 `filter`、`PIDPara`、`Ang`、`dAng` 识别为输入，将 `X[0..7]` 识别为 inout，基本符合源码。

可改进点：

- `results_StructFilter.json` 将 `sTime`、`sTime.prd` 放在 `parameters`，但没有明确标为输入；语义上它们是全局只读输入。
- 未明确表达函数返回值 `Y4` 的来源和“返回值在 `X[5]` 更新前计算”这一重要顺序事实。
- 值域分析仍是 `float64` 全范围，缺乏滤波器稳定性、采样周期正值、PID 参数范围等有效约束。
- 未检查 `X`、`PIDPara`、`filter` 的空指针、数组长度、别名关系等必要前置条件。

## 有限状态机产物质量

总体判断：可用。控制流表达正确，能清晰说明该滤波器是无分支顺序计算链。

已形成的有效结果：

- `source2fsm_StructFilter.log` 正确找到 `StructFilter`。
- CFG 表达单条顺序路径，与源码无分支事实一致。
- 节点完整列出状态更新和 `return Y4`。
- `StructFilter.png` 文件存在并可识别为 PNG。

可改进点：

- 对无分支滤波器，FSM 退化为一个长基本块，不能体现多阶滤波链级联结构。
- 未把计算阶段拆成“PID 参数读取”“一阶控制器”“二阶滤波段”“三阶滤波段”“积分状态更新”“返回输出”。
- 无法体现 `Y4` 的计算先于 `X[5]`、`X[6]` 更新这一数据时序重点。

## 规约生成产物质量

总体判断：方向基本接近。规约已经识别到 `X[0..7]` 写入、`filter` 和 `PIDPara` 读取，适合作为可修订的初稿。

规约相对偏弱主要受限于生成规约的大模型能力，尤其是对局部变量不可出现在后置条件、数组可写有效性和滤波器递推关系的 ACSL 表达不够精确；这不影响静态分析已经较好还原赋值链。

已形成的有效结果：

- 识别了 `X[0..7]` 被赋值。
- 识别了 `filter` 和 `PIDPara[0..2]` 是只读输入。
- `ensures` 试图表达返回值来自 `Y4`，方向上与源码相关。

可改进点：

- `requires \valid_read(X + (0..7));` 不正确，因为函数写 `X[0..7]`，应为 `\valid(X + (0..7))`。
- `assigns X[0],x[1],...` 中 `x[1]` 大小写错误，应为 `X[1]`。
- `ensures \result == Y4;` 不可直接使用，因为 `Y4` 是局部变量，函数后置条件中不可见。
- 注释里的 `filter->D4 * Y` 截断或写错，不能作为精确公式。
- 未要求 `filter`、`PIDPara`、`X` 非空且数组范围有效，也未处理潜在别名。
- 未表达 `sTime.prd` 的有效性和采样周期约束。

## 不变式生成产物质量

总体判断：已有前置条件线索。不变式产物捕获到 `filter` 与 `PIDPara` 的有效性需求，后续可扩展到状态递推关系。

已形成的有效结果：

- 指出了 `filter` 和 `PIDPara[0..2]` 的只读有效性需求。

可改进点：

- 漏掉最关键的 `X + (0..7)` 可写有效性。
- 没有表达 `sTime.prd` 正值或非零。
- 没有表达滤波器稳定性约束，例如系数范围、离散系统极点约束。
- 没有表达积分状态 `X[7]` 的递推关系。
- 没有表达返回值与旧 `X[5]`、`filter->D4`、`Y3` 的关系。

## 改进后的规约

```c
/*@
  logic real sf_y4_model{L}(float64 *X, STRUCT_FILTER *filter,
                            float64 *PIDPara, float64 Ang, float64 dAng);
*/

/*@
  requires \valid(X + (0..7));
  requires \valid_read(PIDPara + (0..2));
  requires \valid_read(filter);
  requires sTime.prd > 0.0;
  requires \separated(X + (0..7), PIDPara + (0..2), filter);

  assigns X[0..7];

  ensures X[0] ==
            filter->A11 * \old(X[0]) + filter->H1 * PIDPara[0] * Ang;
  ensures X[7] ==
            \old(X[7]) + sTime.prd * PIDPara[1] * Ang;
  ensures \result == sf_y4_model{Pre}(X, filter, PIDPara, Ang, dAng);
*/
float64 StructFilter(float64 *X, STRUCT_FILTER *filter,
                     float64 *PIDPara, float64 Ang, float64 dAng);

/*@
  invariant struct_filter_period_valid:
    sTime.prd > 0.0;
*/
```
