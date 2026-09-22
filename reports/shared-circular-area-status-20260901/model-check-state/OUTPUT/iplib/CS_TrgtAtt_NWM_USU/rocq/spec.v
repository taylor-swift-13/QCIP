(* ============================================================
 * CS_TrgtAtt_NWM_USU 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/CS_TrgtAtt_NWM_USU/source/IP_CS_TrgtAtt_NWM_USU.c：
 *
 *   tmpCp       = CS_Angle2CX_temp1([0;0;Psi_DA], sv)
 *                 sv = Seq_AttD[m_WorkMode]（结构体字段真实使用）
 *                 【内嵌包装器是真实代码，default→321】
 *   tmpCp_Trgtb = Csib_DARot * Cbiasp
 *   Cro_si      = tmpCp * tmpCp_Trgtb
 *   wri_si      = Cro_si*w0i; wri_si[2] += dPsi_DA
 *   Cro         = Cbsi_DARot * Cro_si
 *   wri         = Cbsi_DARot * wri_si
 *   A_Ref_si    = C2Angle123(Cro_si)        【打桩：不进比较集】
 *   qri         = C2Q(Cro * coi)
 *   wro         = wri - Cro*w0i
 *
 * 组件库重建约定与 CS_TrgtAtt_EIM 完全相同（Angle2C 主动右手元旋转/
 * 参量序=轴号、mm333/mm331 行主序 0.0 起 k 升序、C2Q Shepperd q[3]
 * 标量部、sin/cos = FloatTrig.v musl 移植、sqrt = fp64_sqrt 正确舍入）；
 * C2Angle123（asin/atan2 未移植）打空操作桩，A_Ref_si 移出比较集，
 * 声明详见 README"组件库重建与打桩声明"。
 *
 * 输入纪律：全部有限值；cb/csib/cbsi/coi 由参考驱动按物理 DCM 构造；
 * wm ∈ [0,13]；seq 非法值走 default（=321，本 case 真实分支）。
 *
 * spec 是纯函数：
 *   输入  wm（Z） seq[14]（list Z） psi_DA dPsi_DA（fp64）
 *         cb[9] csib[9] cbsi[9] coi[9] w0i[3]（list fp64）
 *   输出  31 个 bits（list Z，顺序）：
 *         Cro_si[9] wri_si[3] Cro[9] wri[3] qri[4] wro[3]
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.

Import ListNotations.
Local Open Scope Z_scope.

(* ---- 行主序累加点积与矩阵乘（同 EIM） ---- *)
Definition dot3 (x0 x1 x2 y0 y1 y2 : fp64) : fp64 :=
  fp64_add (fp64_add (fp64_add ZERO64 (fp64_mul x0 y0)) (fp64_mul x1 y1))
           (fp64_mul x2 y2).

Definition mm333 (a b : list fp64) : list fp64 :=
  match a, b with
  | [a0; a1; a2; a3; a4; a5; a6; a7; a8],
    [b0; b1; b2; b3; b4; b5; b6; b7; b8] =>
    [dot3 a0 a1 a2 b0 b3 b6; dot3 a0 a1 a2 b1 b4 b7; dot3 a0 a1 a2 b2 b5 b8;
     dot3 a3 a4 a5 b0 b3 b6; dot3 a3 a4 a5 b1 b4 b7; dot3 a3 a4 a5 b2 b5 b8;
     dot3 a6 a7 a8 b0 b3 b6; dot3 a6 a7 a8 b1 b4 b7; dot3 a6 a7 a8 b2 b5 b8]
  | _, _ => []
  end.

Definition mm331 (a b : list fp64) : list fp64 :=
  match a, b with
  | [a0; a1; a2; a3; a4; a5; a6; a7; a8], [b0; b1; b2] =>
    [dot3 a0 a1 a2 b0 b1 b2; dot3 a3 a4 a5 b0 b1 b2; dot3 a6 a7 a8 b0 b1 b2]
  | _, _ => []
  end.

(* ---- 6 个 Angle2C（与 C 逐式同序；参量序 = 轴号） ---- *)

Definition angle2c123 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3;
   fp64_mul (fp64_neg c2) s3;
   s2;
   fp64_sub (fp64_mul c1 s3) (fp64_mul (fp64_mul s1 s2) c3);
   fp64_add (fp64_mul c1 c3) (fp64_mul (fp64_mul s1 s2) s3);
   fp64_mul s1 c2;
   fp64_sub (fp64_mul (fp64_neg s1) s3) (fp64_mul (fp64_mul c1 s2) c3);
   fp64_sub (fp64_mul (fp64_mul c1 s2) s3) (fp64_mul s1 c3);
   fp64_mul c1 c2].

Definition angle2c132 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3;
   fp64_neg s3;
   fp64_mul s2 c3;
   fp64_sub (fp64_mul (fp64_mul c1 s3) c2) (fp64_mul s1 s2);
   fp64_mul c1 c3;
   fp64_add (fp64_mul (fp64_mul c1 s2) s3) (fp64_mul s1 c2);
   fp64_sub (fp64_mul (fp64_mul (fp64_neg s1) s3) c2) (fp64_mul c1 s2);
   fp64_mul (fp64_neg s1) c3;
   fp64_sub (fp64_mul c1 c2) (fp64_mul (fp64_mul s1 s2) s3)].

Definition angle2c213 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_sub (fp64_mul c2 c3) (fp64_mul (fp64_mul s1 s2) s3);
   fp64_sub (fp64_mul (fp64_neg c2) s3) (fp64_mul (fp64_mul s1 s2) c3);
   fp64_mul s2 c1;
   fp64_mul c1 s3;
   fp64_mul c1 c3;
   s1;
   fp64_sub (fp64_mul (fp64_neg s2) c3) (fp64_mul (fp64_mul c2 s1) s3);
   fp64_sub (fp64_mul s2 s3) (fp64_mul (fp64_mul c2 s1) c3);
   fp64_mul c2 c1].

Definition angle2c231 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3;
   fp64_sub (fp64_mul s2 s1) (fp64_mul (fp64_mul c2 s3) c1);
   fp64_add (fp64_mul s2 c1) (fp64_mul (fp64_mul c2 s3) s1);
   s3;
   fp64_mul c3 c1;
   fp64_mul (fp64_neg c3) s1;
   fp64_mul (fp64_neg s2) c3;
   fp64_add (fp64_mul c2 s1) (fp64_mul (fp64_mul s2 s3) c1);
   fp64_sub (fp64_mul c2 c1) (fp64_mul (fp64_mul s2 s3) s1)].

Definition angle2c312 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_add (fp64_mul c2 c3) (fp64_mul (fp64_mul s1 s2) s3);
   fp64_mul (fp64_neg c1) s3;
   fp64_sub (fp64_mul s2 c3) (fp64_mul (fp64_mul s1 c2) s3);
   fp64_sub (fp64_mul c2 s3) (fp64_mul (fp64_mul s1 s2) c3);
   fp64_mul c1 c3;
   fp64_add (fp64_mul s2 s3) (fp64_mul (fp64_mul s1 c2) c3);
   fp64_mul (fp64_neg c1) s2;
   fp64_neg s1;
   fp64_mul c1 c2].

Definition angle2c321 (a1 a2 a3 : fp64) : list fp64 :=
  let s1 := ported_sin a1 in let c1 := ported_cos a1 in
  let s2 := ported_sin a2 in let c2 := ported_cos a2 in
  let s3 := ported_sin a3 in let c3 := ported_cos a3 in
  [fp64_mul c2 c3;
   fp64_sub (fp64_mul (fp64_mul s1 s2) c3) (fp64_mul c1 s3);
   fp64_add (fp64_mul (fp64_mul c1 s2) c3) (fp64_mul s1 s3);
   fp64_mul c2 s3;
   fp64_add (fp64_mul (fp64_mul s1 s2) s3) (fp64_mul c1 c3);
   fp64_sub (fp64_mul (fp64_mul c1 s2) s3) (fp64_mul s1 c3);
   fp64_neg s2;
   fp64_mul s1 c2;
   fp64_mul c1 c2].

(* 内嵌包装器 CS_Angle2CX_temp1 的转序分发（真实代码，default→321） *)
Definition angle2c (sv : Z) (a1 a2 a3 : fp64) : list fp64 :=
  if sv =? 123 then angle2c123 a1 a2 a3
  else if sv =? 132 then angle2c132 a1 a2 a3
  else if sv =? 213 then angle2c213 a1 a2 a3
  else if sv =? 231 then angle2c231 a1 a2 a3
  else if sv =? 312 then angle2c312 a1 a2 a3
  else angle2c321 a1 a2 a3.

(* ---- Shepperd DCM→四元数（q[3] 标量部，同 EIM） ---- *)

Definition c2q (m : list fp64) : list fp64 :=
  match m with
  | [m0; m1; m2; m3; m4; m5; m6; m7; m8] =>
    let tr := fp64_add (fp64_add m0 m4) m8 in
    if c_gt64 tr ZERO64 then
      let s := fp64_mul (fp64_sqrt (fp64_add tr ONE64)) TWO64 in
      [fp64_div (fp64_sub m7 m5) s;
       fp64_div (fp64_sub m2 m6) s;
       fp64_div (fp64_sub m3 m1) s;
       fp64_mul (f64 0x3FD0000000000000) s]
    else if c_gt64 m0 m4 && c_gt64 m0 m8 then
      let s := fp64_mul (fp64_sqrt (fp64_sub (fp64_sub (fp64_add ONE64 m0) m4) m8)) TWO64 in
      [fp64_mul (f64 0x3FD0000000000000) s;
       fp64_div (fp64_add m1 m4) s;
       fp64_div (fp64_add m2 m6) s;
       fp64_div (fp64_sub m7 m5) s]
    else if c_gt64 m4 m8 then
      let s := fp64_mul (fp64_sqrt (fp64_sub (fp64_sub (fp64_add ONE64 m4) m0) m8)) TWO64 in
      [fp64_div (fp64_add m1 m4) s;
       fp64_mul (f64 0x3FD0000000000000) s;
       fp64_div (fp64_add m5 m7) s;
       fp64_div (fp64_sub m2 m6) s]
    else
      let s := fp64_mul (fp64_sqrt (fp64_sub (fp64_sub (fp64_add ONE64 m8) m0) m4)) TWO64 in
      [fp64_div (fp64_add m2 m6) s;
       fp64_div (fp64_add m5 m7) s;
       fp64_mul (f64 0x3FD0000000000000) s;
       fp64_div (fp64_sub m3 m1) s]
  | _ => []
  end.

(* ---- 主函数 ---- *)

Definition cs_TrgtAtt_NWM_USU_fun
    (wm : Z) (seq : list Z) (psi_DA dPsi_DA : fp64)
    (cb csib cbsi coi w0i : list fp64)
  : list Z :=
  match w0i with
  | [w0; w1; w2] =>
    let sv := nth (Z.to_nat wm) seq 321 in
    let tmpCp := angle2c sv ZERO64 ZERO64 psi_DA in
    let cro_si := mm333 tmpCp (mm333 csib cb) in
    let wri_si :=
      match mm331 cro_si w0i with
      | [x; y; z] => [x; y; fp64_add z dPsi_DA]
      | _ => []
      end in
    let cro := mm333 cbsi cro_si in
    let wri := mm331 cbsi wri_si in
    let qri := c2q (mm333 cro coi) in
    let wro :=
      match wri, mm331 cro w0i with
      | [u0; u1; u2], [v0; v1; v2] =>
        [fp64_sub u0 v0; fp64_sub u1 v1; fp64_sub u2 v2]
      | _, _ => []
      end in
    map bits_of_b64 (cro_si ++ wri_si ++ cro ++ wri ++ qri ++ wro)
  | _ => []
  end.
