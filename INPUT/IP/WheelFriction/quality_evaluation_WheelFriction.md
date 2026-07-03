# WheelFriction 产物质量评估

## 源码事实基线

`WheelFriction` 是单函数，包含一个固定 4 次循环和一个有效性分支。

源码流程为：

- `para = sMWCtrl.para`。
- 对 `i = 0..3` 遍历 4 个动量轮。
- 若 `sMWData.F_Valid_MW[i] == TRUE32`，则计算补偿电压：
  `sMWData.vf[i] = para->kf[i] * sMWData.h[i] / para->cut[i] + para->vf0[i] * Sgn2(sMWData.h[i])`。
- 否则将 `sMWData.vf[i] = 0.0`。

可静态确认的主要输入是 `sMWCtrl.para`、`sMWData.F_Valid_MW[0..3]`、`sMWData.h[0..3]`、`para->kf[0..3]`、`para->cut[0..3]`、`para->vf0[0..3]`。主要输出是 `sMWData.vf[0..3]`。

重要数值前提：有效分支中存在除法 `para->cut[i]`，因此规约应约束 `para->cut[i] != 0`。

## 静态分析产物质量

总体判断：较好。循环、分支、字段读写和输出数组均被识别出来，已经较完整地还原了补偿计算主逻辑。

已形成的有效结果：

- 正确识别 1 个函数、1 条 unresolved call `Sgn2`、9 个字段访问。
- 正确识别 `for (i = 0; i < 4; i++)` 循环和 `F_Valid_MW[i] == TRUE32` 分支。
- 正确识别 `sMWData.vf` 为写字段。
- 正确识别 `para->kf`、`para->cut`、`para->vf0`、`sMWData.h`、`sMWData.F_Valid_MW`、`sMWCtrl.para` 为读取字段。
- `results_WheelFriction.json` 将 `sMWData.vf` 标为输出，方向正确。
- 数组索引范围 `i in [0,3]` 对循环主体是合理的。

可改进点：

- `sMWData.vf[i] in [0,0]` 的值域结论错误。源码只有无效分支写 0，有效分支会写公式结果。
- `condition_range` 给出 `i in [-1.79769e+308, 3] when i < 4`，对 `unint32 i` 和 `i=0` 初始化不够精确。
- 未识别或未报告 `para->cut[i] != 0` 的除零前提。
- `para = sMWCtrl.para` 的 rhs identifiers 中包含 `para`，有轻微抽取噪声。
- `results_WheelFriction.json` 未展开 `para->kf/cut/vf0` 到输入列表，仅保留 `sMWCtrl`，接口语义不够细。

## 有限状态机产物质量

总体判断：较高。该 IP 有明确循环和分支，FSM 产物能表达主要控制结构，是本组产物中控制流可读性较好的结果。

已形成的有效结果：

- `source2fsm_WheelFriction.log` 正确找到 `WheelFriction`。
- CFG 正确表达初始化、4 次循环、有效性判断、有效分支公式、无效分支置零和返回。
- 节点和边数量能够反映循环回边与 if/else 分支。
- `WheelFriction.png` 文件存在并可识别为 PNG。

可改进点：

- FSM 未把 `i=0..3` 的固定边界提升为状态约束或程序级不变式。
- 有效分支公式换行后可读性一般。
- 未标出除零风险状态，即 `para->cut[i] == 0` 时的未定义行为路径。

## 规约生成产物质量

总体判断：有实用起点。规约方向部分正确，已经关注到输入数组、参数指针和 `vf[0..3]` 写入，后续主要是语法和条件补全。

规约相对偏弱主要受限于生成规约的大模型能力，尤其是对 ACSL 量词、大小写符号一致性、除零前提和条件赋值后置关系的表达不够稳定；这不影响静态分析和 FSM 已经较好还原循环与分支结构。

已形成的有效结果：

- `assigns` 试图覆盖 `sMWData.vf[0..3]`，与源码输出目标一致。
- `requires` 关注到了 `F_Valid_MW`、`h`、`sMWCtrl.para`、`kf`、`cut`、`vf0`。

可改进点：

- 多处大小写错误：`sMwData`、`SMWCtrl` 与源码 `sMWData`、`sMWCtrl` 不一致。
- `requires \valid_read(sMWData.vf)` 不准确，`vf` 是写目标，应要求可写有效性。
- `ensures \forall integer k; 0 <=k< 4 ==>` 未完成，规约语法不完整。
- 未写出核心后置条件：有效轮按公式赋值，无效轮赋 0。
- 未要求 `sMWCtrl.para` 非空，也未用数组范围表达 `kf/cut/vf0[0..3]` 有效。
- 未要求 `para->cut[k] != 0`。

## 不变式生成产物质量

总体判断：变量选择较贴近。不变式围绕本函数输入和输出数组展开，具备继续细化为程序级不变式的基础。

已形成的有效结果：

- 变量选择方向基本围绕本函数的输入和输出数组。

可改进点：

- 大小写错误 `sMwCtrl` 会导致不变式无法匹配源码符号。
- 只有有效性不变式，没有程序级行为不变式。
- 未表达 `0 <= i < 4`。
- 未表达 `vf[k]` 与 `F_Valid_MW[k]` 的条件关系。
- 未表达 `cut[k] != 0`。
- 对写目标 `sMWData.vf` 使用 `valid_read`，方向不准确。

## 改进后的规约

```c
/*@ logic real sgn2_model(real x); */

/*@
  requires sMWCtrl.para != \null;
  requires \valid_read(sMWData.F_Valid_MW + (0..3));
  requires \valid_read(sMWData.h + (0..3));
  requires \valid(sMWData.vf + (0..3));
  requires \valid_read(sMWCtrl.para->kf + (0..3));
  requires \valid_read(sMWCtrl.para->cut + (0..3));
  requires \valid_read(sMWCtrl.para->vf0 + (0..3));
  requires \forall integer k; 0 <= k < 4 ==>
            (sMWData.F_Valid_MW[k] == TRUE32 ==> sMWCtrl.para->cut[k] != 0.0);

  assigns sMWData.vf[0..3];

  ensures \forall integer k; 0 <= k < 4 ==>
            (sMWData.F_Valid_MW[k] == TRUE32 ==>
              sMWData.vf[k] ==
                sMWCtrl.para->kf[k] * sMWData.h[k] / sMWCtrl.para->cut[k] +
                sMWCtrl.para->vf0[k] * sgn2_model(sMWData.h[k]));
  ensures \forall integer k; 0 <= k < 4 ==>
            (sMWData.F_Valid_MW[k] != TRUE32 ==> sMWData.vf[k] == 0.0);
*/
void WheelFriction(void);

/*@
  invariant wheel_param_initialized:
    sMWCtrl.para != \null;

  invariant wheel_arrays_valid:
    \valid_read(sMWData.F_Valid_MW + (0..3)) &&
    \valid_read(sMWData.h + (0..3)) &&
    \valid(sMWData.vf + (0..3)) &&
    \valid_read(sMWCtrl.para->kf + (0..3)) &&
    \valid_read(sMWCtrl.para->cut + (0..3)) &&
    \valid_read(sMWCtrl.para->vf0 + (0..3));

  invariant wheel_valid_flag_boolean:
    \forall integer k; 0 <= k < 4 ==>
      (sMWData.F_Valid_MW[k] == TRUE32 ||
       sMWData.F_Valid_MW[k] == FALSE32);

  invariant wheel_cut_nonzero_when_valid:
    \forall integer k; 0 <= k < 4 ==>
      (sMWData.F_Valid_MW[k] == TRUE32 ==>
       sMWCtrl.para->cut[k] != 0.0);
*/
```
