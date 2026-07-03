# AntennaDistTorq 产物质量评估

## 源码事实基线

`AntennaDistTorq` 是单函数、无显式分支和循环的顺序计算模块。代码从 `sAntennaCtrl` 读取天线角度、角速度、上一周期角动量和安装矩阵，从 `sAntennaPara` 读取质量、质心位置和转动惯量参数，从 `sTime.prd` 读取控制周期。核心流程包括：

- 读取 `Aaf`、`Baf`、`wDTa`、`wDTb` 和 `HsigmaDtpat`。
- 构造 X 轴、Y 轴相关姿态转换矩阵。
- 分别计算两级天线机构角动量 `Ha1`、`Ha2`。
- 计算 `HsigmaDT = Ha1 + Ha2`。
- 更新 `sAntennaCtrl.TDT = (HsigmaDT - HsigmaDTpatj) / sTime.prd`。
- 更新 `sAntennaCtrl.HsigmaDtpat = HsigmaDT`。

可静态确认的主要副作用是写 `sAntennaCtrl.TDT[0..2]` 和 `sAntennaCtrl.HsigmaDtpat[0..2]`。由于这些写入通过 `VectorSub3`、`VectorScalar3`、`V3Copy` 等 helper 或宏完成，分析工具若不能理解输出参数语义，就容易误判读写方向。

## 静态分析产物质量

总体判断：基础结构识别较好，已给出函数、调用、字段和关键数据来源等核心线索，具备静态审查价值。

已形成的有效结果：

- 正确识别 1 个源文件、1 个函数、无缺失本地 include、无重复函数定义。
- 正确识别 `AntennaDistTorq` 无形参、无显式条件分支。
- 调用关系覆盖较完整，列出了 `Sinx`、`Cosx`、矩阵运算、向量运算等 66 条调用边。
- 字段读取覆盖了主要输入字段，例如 `sAntennaCtrl.Aaf`、`sAntennaCtrl.Baf`、`sAntennaCtrl.wDTa`、`sAntennaCtrl.wDTb`、`sAntennaPara.ma1`、`sAntennaPara.ma2`、`sTime.prd`。

可改进点：

- 没有提取关键安全前提 `sTime.prd != 0`，而源码存在 `1.0 / sTime.prd`。
- 值域不变式基本是 `float64` 全范围，不能反映三角函数输出范围、矩阵元素关系、周期非零约束或角动量更新关系。


## 有限状态机产物质量

总体判断：可用。对于无分支顺序计算函数，FSM 能正确表达单路径控制流。

已形成的有效结果：

- `source2fsm_AntennaDistTorq.log` 正确找到 `AntennaDistTorq`。
- 该函数无 `if`、`for`、`switch`，生成单条顺序路径符合源码控制流事实。
- CFG 节点保留了主要计算语句，能用于粗略追踪顺序执行过程。
- `AntennaDistTorq.png` 文件存在并可识别为 PNG。

可改进点：

- 对顺序数学计算函数，FSM 退化为长基本块，几乎没有“状态”抽象。
- 图中语句过长，矩阵/向量计算混在一个节点内，可读性和审查效率较低。
- 未把算法阶段抽象为更有意义的状态，例如“参数读取”“矩阵构造”“X 轴角动量”“Y 轴角动量”“扰动力矩更新”。

## 规约生成产物质量

总体判断：有明确起点。`assigns` 已抓到关键输出字段，形成了可继续人工完善的规约框架。

规约相对偏弱主要受限于生成规约的大模型能力，尤其是对航天控制领域语义、helper 输出参数和 ACSL 后置条件表达的理解深度；这不影响静态分析产物本身已抽取出的有效结构信息。

已形成的有效结果：

- `assigns` 包含 `sAntennaCtrl.TDT[0..2]` 和 `sAntennaCtrl.HsigmaDtpat[0..2]`，与源码最终写入目标一致。

可改进点：

- `requires \true;` 过弱，未约束 `sTime.prd != 0`。
- 未表达全局数组、矩阵参数的可读性和有效性。
- `ensures \result == \old(\result);` 对 `void` 函数无实际意义，不能描述输出关系。
- 未描述核心语义：`TDT` 应等于新旧角动量差除以控制周期，`HsigmaDtpat` 应保存本周期 `HsigmaDT`。
- 未说明 helper 函数和矩阵运算的语义假设，导致规约无法支撑算法正确性审查。

## 不变式生成产物质量

总体判断：生成链路已有占位性产出。当前不变式较基础，但至少表明工具能定位输出状态并生成 ACSL 形式片段。

产物内容只有：

- `sAntennaCtrl.TDT[0] == sAntennaCtrl.TDT[0]`
- `sAntennaCtrl.TDT[1] == sAntennaCtrl.TDT[1]`
- `sAntennaCtrl.TDT[2] == sAntennaCtrl.TDT[2]`

这些是基础一致性占位式，还可以继续扩展为能表达稳定性、范围、单位、周期关系或状态更新关系的领域不变式。

建议补充的不变式包括：

- `sTime.prd` 非零，通常还应为正。
- `HsigmaDtpat` 是上一周期角动量缓存，函数结束后等于本周期 `HsigmaDT`。
- `TDT` 与 `HsigmaDT`、旧 `HsigmaDtpat`、`sTime.prd` 之间的关系。
- 转换矩阵、惯量矩阵的维度和物理合理性约束。

## 改进后的规约

```c
/*@ logic real HsigmaDT_model(integer k); */

/*@
  requires sTime.prd > 0.0;
  requires \valid_read(&sAntennaCtrl.CAntenna[0][0] + (0..8));
  requires \valid_read(sAntennaCtrl.HsigmaDtpat + (0..2));
  requires \valid_read(sAntennaPara.ro1 + (0..2));
  requires \valid_read(sAntennaPara.ro1c1 + (0..2));
  requires \valid_read(sAntennaPara.ro1o2 + (0..2));
  requires \valid_read(sAntennaPara.ro2c2 + (0..2));
  requires \valid_read(&sAntennaPara.Ja1[0][0] + (0..8));
  requires \valid_read(&sAntennaPara.Ja2[0][0] + (0..8));

  assigns sAntennaCtrl.TDT[0..2],
          sAntennaCtrl.HsigmaDtpat[0..2];

  ensures \forall integer k; 0 <= k < 3 ==>
            sAntennaCtrl.HsigmaDtpat[k] == HsigmaDT_model(k);
  ensures \forall integer k; 0 <= k < 3 ==>
            sAntennaCtrl.TDT[k] ==
              (HsigmaDT_model(k) - \old(sAntennaCtrl.HsigmaDtpat[k])) / sTime.prd;
*/
void AntennaDistTorq(void);

/*@
  invariant antenna_period_valid:
    sTime.prd > 0.0;
  invariant antenna_output_finite:
    \forall integer k; 0 <= k < 3 ==>
      \is_finite(sAntennaCtrl.TDT[k]) &&
      \is_finite(sAntennaCtrl.HsigmaDtpat[k]);
*/
```
