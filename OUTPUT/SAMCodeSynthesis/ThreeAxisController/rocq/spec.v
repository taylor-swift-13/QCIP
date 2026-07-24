(* ============================================================
 * ThreeAxisController 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/ThreeAxisController/IP_ThreeAxisController.c，
 * 以及 std_utils.c 的 LimitFloat：
 *
 *   LimitFloat(fin, b) = fin > b ? b : (fin < -b ? -b : fin)
 *   （两个比较对 NaN 均为 false，此时返回 fin 本身——c_gt/c_lt 与 C 一致）
 *
 *   X/Y 轴: Up = LimitFloat(pAngle, 8.0f);
 *           Ud = LimitFloat(pRate - destRate, 1.2f);
 *           fy = Up*Kp + Ud*Kd;   u = LimitFloat(fy, 1.3f)
 *   Z 轴  : Up = 0.0f（不再限幅）;
 *           Ud = LimitFloat(pRate[2], 1.2f);
 *           fy = Ud*Kd（无 Kp 项）; u = LimitFloat(fy, 1.3f)
 *
 * C 代码不读取 pAngle[2]、destRate[2]、CTRL_PARAM_SAM[2].Kp，
 * 故这三个输入不作为 spec 参数（参考程序侧任意初始化即可）。
 *
 * spec 是纯函数：12 路 float32 输入 → 12 个输出 fp32 的 bits
 *   [Up0 Up1 Up2 Ud0 Ud1 Ud2 fy0 fy1 fy2 u0 u1 u2]
 *
 * 常量为 C 字面量的 IEEE 单精度 bit pattern：
 *   8.0f = 0x41000000   1.2f = 0x3F99999A   1.3f = 0x3FA66666
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition c_8p0 : fp32 := f32 (0x41000000).
Definition c_1p2 : fp32 := f32 (0x3F99999A).
Definition c_1p3 : fp32 := f32 (0x3FA66666).

(* std_utils.c 的 LimitFloat（fbound 在本 case 中恒为正常量） *)
Definition limitFloat (fin fbound : fp32) : fp32 :=
  if c_gt fin fbound then fbound
  else if c_lt fin (fp32_neg fbound) then fp32_neg fbound
  else fin.

(* X/Y 轴一步：返回 (Up, Ud, fy, u) *)
Definition axis_pd (pa pr dr kp kd : fp32) : fp32 * fp32 * fp32 * fp32 :=
  let up := limitFloat pa c_8p0 in
  let ud := limitFloat (fp32_sub pr dr) c_1p2 in
  let fy := fp32_add (fp32_mul up kp) (fp32_mul ud kd) in
  (up, ud, fy, limitFloat fy c_1p3).

(* Z 轴一步：Up 恒 0.0f，fy 只有 Ud*Kd 项 *)
Definition axis_d (pr kd : fp32) : fp32 * fp32 * fp32 * fp32 :=
  let up := f32 0 in
  let ud := limitFloat pr c_1p2 in
  let fy := fp32_mul ud kd in
  (up, ud, fy, limitFloat fy c_1p3).

(* 三轴全函数：返回 12 个输出的 bits *)
Definition threeAxisController_fun
    (pa0 pa1 pr0 pr1 pr2 dr0 dr1 kp0 kp1 kd0 kd1 kd2 : fp32) : list Z :=
  let '(up0, ud0, fy0, u0) := axis_pd pa0 pr0 dr0 kp0 kd0 in
  let '(up1, ud1, fy1, u1) := axis_pd pa1 pr1 dr1 kp1 kd1 in
  let '(up2, ud2, fy2, u2) := axis_d pr2 kd2 in
  map bits_of_b32
      [up0; up1; up2; ud0; ud1; ud2; fy0; fy1; fy2; u0; u1; u2].
