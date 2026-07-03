# AttMnvrMain 产物质量评估

## 源码事实基线

该 IP 包含两个函数：

- `targetTrack`：根据当前时间与机动起始时间差 `tm`，分段计算规划角加速度 `ar`、规划角速度 `dphair`、规划角 `phair`，并计算 `dEuler`。
- `AttMnvrMain`：调用 `targetTrack`，根据规划角和机动轴生成机动四元数 `qtm`，再根据工作模式和 `F_AttManeuInVVLH` 选择轨道系机动或惯性系机动路径。

可静态确认的关键控制流：

- `targetTrack` 有 5 个时间段：`tm < 0`、`tm < tm1`、`tm < tm2`、`tm < tm3`、`tm >= tm3`。
- `AttMnvrMain` 有 1 个业务分支：`IN_RANGE_CLOSE(workmode, 7, 11) && F_AttManeuInVVLH == 1`。

可静态确认的主要副作用：

- `targetTrack` 直接写 `sAttMnvr.ar`、`sAttMnvr.dphair`、`sAttMnvr.phair`、`sAttMnvr.dEuler`。
- `AttMnvrMain` 通过 `QMulti`、`Q2C`、`VectorScalar3`、`VectorAdd3` 等 helper 写 `sAttMnvr.qtm0`、`sAttMnvr.Ctm0`、`sAttPub.qti`、`sAttPub.wti` 等目标。

## 静态分析产物质量

总体判断：基础质量较好。直接赋值、函数关系和分支条件抽取较准确，已经还原出姿态机动主流程。

已形成的有效结果：

- 正确识别 1 个源文件、2 个函数、18 条调用边、无缺失本地 include。
- 正确识别 `targetTrack` 的 4 个 `if/else if` 条件。
- 正确识别 `AttMnvrMain` 的轨道系/惯性系机动分支条件。
- 正确识别 `targetTrack` 直接写入 `sAttMnvr.ar`、`sAttMnvr.dphair`、`sAttMnvr.phair`、`sAttMnvr.dEuler`。
- 正确识别 `AttMnvrMain -> targetTrack` 为已解析调用。

可改进点：

- `AttMnvrMain` 中通过 helper 写入的 `sAttMnvr.qtm0`、`sAttMnvr.Ctm0`、`sAttPub.qti`、`sAttPub.wti` 被当作读字段，输出语义不完整。
- `results_AttMnvrMain.json` 对 `AttMnvrMain` 只输出 `targetTrack` 的 4 个字段，漏掉主函数在两条分支中更新的目标四元数和目标角速度。
- `static_analysis` 的值域推断有明显错误倾向，例如把 `sAttMnvr.ar` 归纳为 `[0,0]`，但源码在加速段和减速段会赋非零值。
- `tm < 0.0` 的 condition range 被写成 `[-1.79769e+308, -1]`，对浮点连续区间不准确。
- `workmode transitions target values subset of {UI8_LO4, WorkMode}` 不是有意义的状态迁移语义。
- `SQUARE`、`Sinx`、`Cosx`、`IN_RANGE_CLOSE`、`UI8_LO4` 等宏未被展开，导致大量 unresolved。

## 有限状态机产物质量

总体判断：主函数 FSM 可用。产物已经表达出轨道系/惯性系两条主路径，后续若补充 `targetTrack` 分段图，完整性会更好。

已形成的有效结果：

- `source2fsm_AttMnvrMain.log` 正确找到 `AttMnvrMain`。
- CFG 正确表达了 `AttMnvrMain` 的顺序前置计算、轨道系分支、惯性系分支和返回。
- `AttMnvrMain.png` 文件存在并可识别为 PNG。

可改进点：

- FSM 只针对 `AttMnvrMain` 生成，没有为 `targetTrack` 生成图。对该 IP 来说，真正的时间分段规划逻辑在 `targetTrack`，这是最重要的 FSM 缺口。
- 主函数图没有展开 `targetTrack` 的 5 段时序状态，因此无法审查完整姿态机动过程目标计算。
- 分支条件保留为源码表达式，未抽象出“轨道系机动”和“惯性系机动”的状态语义。

## 规约生成产物质量

总体判断：已有可利用片段。规约中混入了其他模块内容，但仍捕获到本 IP 的部分关键写字段，适合作为人工筛选和修订的初稿。

规约相对偏弱主要受限于生成规约的大模型能力，尤其是对姿态机动领域语义、跨函数副作用、helper 输出参数和 ACSL 精确语法的掌握不足；这不影响静态分析和 FSM 已抽取出的结构信息。

已形成的有效结果：

- `assigns` 中包含 `sAttMnvr.ar`、`sAttMnvr.dphair`、`sAttMnvr.phair`、`sAttMnvr.dEuler`，这些确实由 `targetTrack` 写入。
- `assigns` 中包含 `sAttMnvr.qtm0`、`sAttMnvr.Ctm0`、`sAttPub.qti`、`sAttPub.wti`，这些与 `AttMnvrMain` 的 helper 写目标相关。

可改进点：

- `requires \valid(pPhasePara)` 引用了源码中不存在的 `pPhasePara`。
- `assigns` 大量引用本 IP 不存在或未出现的对象，例如 `sMWCtrl`、`sMWDev`、`sJetCtrl`、`sAttCtrl`、`sAttJet`、`sMWData`。
- 存在明显拼写和语法错误，例如 `sMWCtrl.F_ WheelSaturation`、`SMWCtrl.i`、`sJetctrl.TJ`、`sAttJet.qti jet`。
- `ensures \true,` 语法不完整且没有任何行为约束。
- 文件名为 `acsl_specs_AttMnvrCtr.log`，与 IP 名 `AttMnvrMain` 不一致，提示生成链路可能串用了模块名或模板。

## 不变式生成产物质量

总体判断：生成链路已有产出。当前不变式与本 IP 贴合度不高，但能作为检查模板串用和命名一致性的依据。

可改进点：

- 不变式全部围绕 `sMWCtrl`，与姿态机动目标计算基本无关。
- 存在 `sMWCtrl` / `sMwCtrl` 大小写不一致问题。
- 没有覆盖 `targetTrack` 的时间分段关系、`tm1/tm2/tm3` 顺序约束、`phair/dphair/ar` 的分段公式、`dEuler` 的取模关系。
- 没有覆盖四元数构造约束，例如 `qtm = [sin(phair/2)e, cos(phair/2)]`。

## 改进后的规约

```c
/*@
  logic real sgn_model(real x);
  logic real mod_z2p_model(real x, real period);
*/

/*@
  requires 0.0 <= sAttMnvr.tm1;
  requires sAttMnvr.tm1 <= sAttMnvr.tm2;
  requires sAttMnvr.tm2 <= sAttMnvr.tm3;
  requires sAttMnvr.amax >= 0.0;

  assigns sAttMnvr.ar,
          sAttMnvr.dphair,
          sAttMnvr.phair,
          sAttMnvr.dEuler;

  behavior before_start:
    assumes sTime.tDbl - sAttMnvr.tmstar < 0.0;
    ensures sAttMnvr.ar == 0.0;
    ensures sAttMnvr.dphair == 0.0;
    ensures sAttMnvr.phair == 0.0;

  behavior accel:
    assumes 0.0 <= sTime.tDbl - sAttMnvr.tmstar &&
            sTime.tDbl - sAttMnvr.tmstar < sAttMnvr.tm1;
    ensures sAttMnvr.ar == sgn_model(sAttMnvr.phaim) * sAttMnvr.amax;
    ensures sAttMnvr.dphair ==
              sAttMnvr.ar * (sTime.tDbl - sAttMnvr.tmstar);

  behavior coast:
    assumes sAttMnvr.tm1 <= sTime.tDbl - sAttMnvr.tmstar &&
            sTime.tDbl - sAttMnvr.tmstar < sAttMnvr.tm2;
    ensures sAttMnvr.ar == 0.0;
    ensures sAttMnvr.dphair ==
              sgn_model(sAttMnvr.phaim) * sAttMnvr.amax * sAttMnvr.tm1;

  behavior decel:
    assumes sAttMnvr.tm2 <= sTime.tDbl - sAttMnvr.tmstar &&
            sTime.tDbl - sAttMnvr.tmstar < sAttMnvr.tm3;
    ensures sAttMnvr.ar == -sgn_model(sAttMnvr.phaim) * sAttMnvr.amax;
    ensures sAttMnvr.dphair ==
              sAttMnvr.ar * (sTime.tDbl - sAttMnvr.tmstar - sAttMnvr.tm3);

  behavior finished:
    assumes sAttMnvr.tm3 <= sTime.tDbl - sAttMnvr.tmstar;
    ensures sAttMnvr.ar == 0.0;
    ensures sAttMnvr.dphair == 0.0;
    ensures sAttMnvr.phair == sAttMnvr.phaim;

  ensures sAttMnvr.dEuler ==
            mod_z2p_model(sAttMnvr.phaim - sAttMnvr.phair, DBL_PI);

  complete behaviors;
  disjoint behaviors;
*/
void targetTrack(void);

/*@
  logic integer workmode_model(integer mode);
  logic real qti_vvlh_model(integer k);
  logic real qti_inertial_model(integer k);
  logic real wti_vvlh_model(integer k);
  logic real wti_inertial_model(integer k);
*/

/*@
  requires \valid_read(sAttMnvr.e + (0..2));
  requires \valid_read(sAttMnvr.qb0 + (0..3));
  requires \valid_read(sAttPub.qoitemp + (0..3));
  requires \valid_read(sAttPub.woitemp + (0..2));

  assigns sAttMnvr.ar,
          sAttMnvr.dphair,
          sAttMnvr.phair,
          sAttMnvr.dEuler,
          sAttMnvr.qtm0[0..3],
          sAttMnvr.Ctm0[0][0..2],
          sAttMnvr.Ctm0[1][0..2],
          sAttMnvr.Ctm0[2][0..2],
          sAttPub.qti[0..3],
          sAttPub.wti[0..2];

  behavior vvlh_maneuver:
    assumes 7 <= workmode_model(WorkMode) &&
            workmode_model(WorkMode) <= 11;
    assumes sAttMnvr.F_AttManeuInVVLH == 1;
    ensures \forall integer k; 0 <= k < 4 ==>
              sAttPub.qti[k] == qti_vvlh_model(k);
    ensures \forall integer k; 0 <= k < 3 ==>
              sAttPub.wti[k] == wti_vvlh_model(k);

  behavior inertial_maneuver:
    assumes !((7 <= workmode_model(WorkMode) &&
               workmode_model(WorkMode) <= 11) &&
              sAttMnvr.F_AttManeuInVVLH == 1);
    ensures \forall integer k; 0 <= k < 4 ==>
              sAttPub.qti[k] == qti_inertial_model(k);
    ensures \forall integer k; 0 <= k < 3 ==>
              sAttPub.wti[k] == wti_inertial_model(k);

  complete behaviors;
  disjoint behaviors;
*/
void AttMnvrMain(void);

/*@
  invariant att_mnvr_time_order:
    0.0 <= sAttMnvr.tm1 &&
    sAttMnvr.tm1 <= sAttMnvr.tm2 &&
    sAttMnvr.tm2 <= sAttMnvr.tm3;
*/
```
