# CtrlAttErr 产物质量评估

## 源码事实基线

`CtrlAttErr` 是单函数、无显式分支和循环的顺序计算模块。函数形参为 `q`、`w`、`qt`、`wt` 四个指针。

源码流程为：

- `Qdiv(sAttPub.qbt, qt, q)` 计算本体相对目标姿态四元数。
- `Q2C(Cq[0], sAttPub.qbt)` 将误差四元数转矩阵。
- `MatrixMulti331(wb, Cq[0], wt)` 将目标角速度转到相关坐标系。
- `VectorSub3(sAttPub.wbt, w, wb)` 计算角速度误差。
- `VectorScalar3(sAttCtrl.e, sAttPub.qbt, 2.0)` 计算三轴姿态角偏差近似量。
- `V3Copy(sAttCtrl.de, sAttPub.wbt)` 保存角速度偏差。

可静态确认的主要副作用是写 `sAttPub.qbt`、`sAttPub.wbt`、`sAttCtrl.e`、`sAttCtrl.de`。这些写入全部通过 helper 或宏的第一个参数完成。

## 静态分析产物质量

总体判断：结构识别有效。函数签名、调用顺序和无分支特征均被抽出，已经形成可审查的控制和调用骨架。

已形成的有效结果：

- 正确识别 1 个函数、4 个形参、2 个局部变量、6 个 helper 调用。
- 正确识别无显式条件分支、无循环。
- 调用顺序基本覆盖源码事实：`Qdiv`、`Q2C`、`MatrixMulti331`、`VectorSub3`、`VectorScalar3`、`V3Copy`。

可改进点：

- `static_analysis` 把 `sAttPub.qbt`、`sAttPub.wbt`、`sAttCtrl.e`、`sAttCtrl.de` 全部统计为只读字段，但源码中它们分别作为 helper 目标参数被写入。
- `results_CtrlAttErr.json` 完全没有列出函数形参 `q`、`w`、`qt`、`wt`，反而把全局字段放进 `parameters`。
- `results_CtrlAttErr.json` 的 `output` 和 `inout` 为空，漏掉真实输出。
- 因为没有 helper 语义建模，`assignments` 为空，无法反映主要计算行为。
- 值域不变式只是 `float64` 全范围，对四元数、角速度向量、数组长度没有有效约束。

## 有限状态机产物质量

总体判断：可用。对顺序控制流表达正确，能明确说明该函数没有显式状态分支。

已形成的有效结果：

- `source2fsm_CtrlAttErr.log` 正确找到 `CtrlAttErr`。
- CFG 体现单条顺序路径，与源码无分支事实一致。
- 节点中包含了 6 个核心 helper 调用。
- `CtrlAttErr.png` 文件存在并可识别为 PNG。

可改进点：

- 所有计算压在一个 terminal 节点内，无法区分“误差四元数”“角速度误差”“控制偏差输出”三个阶段。
- 图中不能体现 helper 的输出参数写入语义。
- 对于审查控制算法而言，FSM 只能证明“无控制分支”，不能证明姿态误差计算关系正确。

## 规约生成产物质量

总体判断：已有可用起点。规约捕获了部分输入有效性和输出字段，为后续人工规约提供了初稿。

规约相对偏弱主要受限于生成规约的大模型能力，尤其是对 helper 输出参数、全局状态副作用和 ACSL 数组范围表达的理解不足；这不影响函数调用链和控制流产物的有效性。

已形成的有效结果：

- `requires \valid(q) && \valid(w) && \valid(qt) && \valid(wt)` 方向上是必要的，虽然不够完整。
- `assigns` 包含 `sAttCtrl.e[0..2]`、`sAttCtrl.de[0..2]`，与源码最终输出之一一致。

可改进点：

- `assigns q[0..3]` 和 `w[...]` 不符合源码事实。`q`、`w` 是输入指针，源码没有写它们。
- `assigns` 漏掉 `sAttPub.qbt[0..3]` 和 `sAttPub.wbt[0..2]`，这两个全局字段通过 helper 被写入。
- `w[O]` 使用字母 `O`，不是数字 `0`，语法错误。
- `ensures \result == (void *)0;` 对 `void` 函数不成立，也没有行为意义。
- `\valid(q)` 只保证单个元素，对数组访问应表达为 `\valid_read(q + (0..3))`、`w + (0..2)`、`qt + (0..3)`、`wt + (0..2)`。
- 没有表达核心后置关系，例如 `sAttCtrl.e` 来自 `2 * sAttPub.qbt[0..2]`，`sAttCtrl.de` 来自 `sAttPub.wbt`。

## 不变式生成产物质量

总体判断：变量定位有效。不变式已经定位到关键数组，后续可在此基础上增加行为约束。

已形成的有效结果：

- 关注到了 `sAttPub.qbt`、`sAttPub.wbt`、`sAttCtrl.e`、`sAttCtrl.de` 这些关键数组。

可改进点：

- 只有有效性类不变式，没有行为不变式。
- 对数组只写 `&sAttPub.qbt` 这种单地址形式，未覆盖数组范围。
- 没有表达四元数单位化、误差角小角度近似、角速度偏差维度等领域约束。
- 没有表达函数结束后 `sAttCtrl.de == sAttPub.wbt`。

## 改进后的规约

```c
/*@
  logic real qdiv_model(integer k, float64 *qt, float64 *q);
  logic real wbt_model(integer k, float64 *q, float64 *w,
                       float64 *qt, float64 *wt);
*/

/*@
  requires \valid_read(q  + (0..3));
  requires \valid_read(qt + (0..3));
  requires \valid_read(w  + (0..2));
  requires \valid_read(wt + (0..2));

  assigns sAttPub.qbt[0..3],
          sAttPub.wbt[0..2],
          sAttCtrl.e[0..2],
          sAttCtrl.de[0..2];

  ensures \forall integer k; 0 <= k < 4 ==>
            sAttPub.qbt[k] == qdiv_model(k, qt, q);
  ensures \forall integer k; 0 <= k < 3 ==>
            sAttPub.wbt[k] == wbt_model(k, q, w, qt, wt);
  ensures \forall integer k; 0 <= k < 3 ==>
            sAttCtrl.e[k] == 2.0 * sAttPub.qbt[k];
  ensures \forall integer k; 0 <= k < 3 ==>
            sAttCtrl.de[k] == sAttPub.wbt[k];
*/
void CtrlAttErr(float64 *q, float64 *w, float64 *qt, float64 *wt);

/*@
  invariant ctrl_att_err_output_finite:
    (\forall integer k; 0 <= k < 4 ==> \is_finite(sAttPub.qbt[k])) &&
    (\forall integer k; 0 <= k < 3 ==>
       \is_finite(sAttPub.wbt[k]) &&
       \is_finite(sAttCtrl.e[k]) &&
       \is_finite(sAttCtrl.de[k]));
*/
```
