(* ============================================================
 * CS_TrgtAtt_AHM_USU 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/CS_TrgtAtt_AHM_USU/source/IP_CS_TrgtAtt_AHM_USU.c：
 *
 *   主函数 CS_TrgtAtt_AHM_USUFun（5.3.2.5.1）：
 *     tmpCp      = CS_Angle2C([0;0;Psi_DA], sv)      sv = Seq_AttD[wm]
 *     tmpC_Trgtb = Cbiasp * CS_Angle2C(A_Trgt, sv)
 *     Cro_si     = (tmpCp * Csib_DARot) * tmpC_Trgtb
 *     wri_si     = Cro_si*w0i; wri_si[2] += dPsi_DA
 *     Cro        = Cbsi_DARot * Cro_si
 *     wri        = Cbsi_DARot * wri_si
 *     A_Ref_si   = C2Angle123(Cro_si)        【打桩：不进比较集】
 *     qri        = C2Q(Cro*coi)
 *     wro        = wri - Cro*w0i
 *   XX_Track_Atti（5.3.1.5）：
 *     A_Ref   = CS_C2Angle(Cro, sv)          【打桩：注入输入 a_ref_in】
 *     dA_Ref  = w2dEuler(A_Ref, wro, sv)     （default 转序原样透传）
 *     ddA_Ref = (dA_Ref - dA_Ref_Lst) / m_DeltaT
 *     if wm==WKMD_AMM && F_MnvNextMode∈{1,2}:
 *       dChi_Ref2 = (FS==0) ? XX_RateForeHybridTrace : 原值
 *       tmpCp  = Q2C([0;0;sin(ψ/2);cos(ψ/2)]); tmpCpp = tmpCp*Csib
 *       wri_si2 = Cro_si*w0i + tmpCpp*(e_xyz*dChi_Ref2) + [0;0;dPsi_DA]
 *                 （前两个分量有显式 +0.0，-0.0 会被翻成 +0.0，如实建模）
 *       wri2 = Cbsi * wri_si2
 *       dwri = (wri2 - wri2_Lst) / m_DeltaT
 *     else:
 *       wri2 = wri; dwri = (wri - wri_Lst) / m_DeltaT
 *     TorqRef = Mdf * (Js_Use * dwri); 若 VectorNorm3(TorqRef) > Mlf 则清零
 *   XX_RateForeHybridTrace：9 段混合轨迹角速度规划（4 段含 sin/cos）；
 *     tmA 先加 dt_TorqRef2 再参与分段判断，函数返回前恢复原值（无可观察效应）。
 *
 * 组件库函数仓库全库无实现，重建约定与 CS_TrgtAtt_EIM 相同
 * （Angle2C 主动右手元旋转/参量序=轴号、mm333/331 行主序 0.0 起 k 升序、
 * C2Q Shepperd q[3] 标量部；Q2C 为同号约定的标准展开式），sin/cos 用
 * FloatTrig.v 的 musl 移植，sqrt 用 fp64_sqrt（Bsqrt mode_NE，正确舍入）。
 * 打桩与比较集声明见 README"组件库重建与打桩声明"。
 *
 * 裸全局：m_WorkMode（=wm 输入）、m_DeltaT（=deltaT 输入）、
 * csCtrlerData.Js_Use（=js 输入）、csMnvData.e_xyz（=e_xyz 输入）；
 * WKMD_AMM 仓库无定义，替身值 3（<14 保证 Seq_AttD[wm] 不越界）。
 *
 * 输入纪律：全部有限值；cb/csib/cbsi/coi 由参考驱动按物理 DCM 构造；
 * a_ref_in ∈ [-1.4,1.4]（w2dEuler 各转序 cos 除数 |cos| ≥ 0.17）；
 * wm ∈ [0,13]；mtrack 断点有序 0<t_m1a<...<tm3p；t_sinacc > 0。
 *
 * spec 是纯函数：
 *   输入  wm fmn fs（Z） seq[14]（list Z）
 *         psi_DA dPsi_DA deltaT dchi_init mdf mlf（fp64）
 *         atr[3] cb[9] csib[9] cbsi[9] coi[9] w0i[3] wri_lst[3]
 *         wri2_lst[3] da_lst[3] da_init[3] a_ref_in[3] mtrack[12]
 *         e_xyz[3] js[9]（list fp64）
 *   输出  44 个 bits（list Z，顺序）：
 *         Cro_si[9] wri_si[3] Cro[9] wri[3] qri[4] wro[3] dA_Ref[3]
 *         ddA_Ref[3] wri2[3] TorqRef[3] dChi_Ref2
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

(* WKMD_AMM 替身值（见头部注释） *)
Definition wkmd_amm : Z := 3.

Definition PI64 : fp64 := f64 0x400921FB54442D18.        (* std_utils.h PI *)
Definition HALF64 : fp64 := f64 0x3FE0000000000000.      (* 0.5 *)
Definition THOUSAND64 : fp64 := f64 0x408F400000000000.  (* 1000.0 *)
Definition EPS_SINACC : fp64 := f64 0x3F50624DD2F1A9FC.  (* 1.0e-3 *)

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

Definition vectornorm3 (v : list fp64) : fp64 :=
  match v with
  | [x; y; z] =>
    fp64_sqrt (fp64_add (fp64_add (fp64_mul x x) (fp64_mul y y))
                        (fp64_mul z z))
  | _ => ZERO64
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

(* CS_Angle2C 转序分发（重建；default→321 沿用 EIM case 内嵌包装器惯例） *)
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

(* ---- 四元数→DCM（q[3] 标量部；与 C2Q/Angle2C 同号约定，标准展开式） ---- *)

Definition q2c (q : list fp64) : list fp64 :=
  match q with
  | [q1; q2; q3; q4] =>
    [fp64_sub ONE64 (fp64_mul TWO64 (fp64_add (fp64_mul q2 q2) (fp64_mul q3 q3)));
     fp64_mul TWO64 (fp64_sub (fp64_mul q1 q2) (fp64_mul q3 q4));
     fp64_mul TWO64 (fp64_add (fp64_mul q1 q3) (fp64_mul q2 q4));
     fp64_mul TWO64 (fp64_add (fp64_mul q1 q2) (fp64_mul q3 q4));
     fp64_sub ONE64 (fp64_mul TWO64 (fp64_add (fp64_mul q1 q1) (fp64_mul q3 q3)));
     fp64_mul TWO64 (fp64_sub (fp64_mul q2 q3) (fp64_mul q1 q4));
     fp64_mul TWO64 (fp64_sub (fp64_mul q1 q3) (fp64_mul q2 q4));
     fp64_mul TWO64 (fp64_add (fp64_mul q2 q3) (fp64_mul q1 q4));
     fp64_sub ONE64 (fp64_mul TWO64 (fp64_add (fp64_mul q1 q1) (fp64_mul q2 q2)))]
  | _ => []
  end.

(* ---- w2dEuler（IP 文件内真实代码的逐式建模；default 原样透传 rate_init） ---- *)

Definition w2euler (sv : Z) (ang wbo rate_init : list fp64) : list fp64 :=
  match ang, wbo, rate_init with
  | [p1; p2; p3], [w0; w1; w2], [r0; r1; r2] =>
    let s1 := ported_sin p1 in let c1 := ported_cos p1 in
    let s2 := ported_sin p2 in let c2 := ported_cos p2 in
    let s3 := ported_sin p3 in let c3 := ported_cos p3 in
    if sv =? 132 then
      [fp64_div (fp64_add (fp64_mul c2 w0) (fp64_mul s2 w2)) c3;
       fp64_add w1 (fp64_div (fp64_mul (fp64_add (fp64_mul c2 w0) (fp64_mul s2 w2)) s3) c3);
       fp64_add (fp64_mul (fp64_neg s2) w0) (fp64_mul c2 w2)]
    else if sv =? 321 then
      [fp64_add w0 (fp64_div (fp64_mul (fp64_add (fp64_mul s1 w1) (fp64_mul c1 w2)) s2) c2);
       fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2);
       fp64_div (fp64_add (fp64_mul s1 w1) (fp64_mul c1 w2)) c2]
    else if sv =? 312 then
      [fp64_add (fp64_mul w0 c2) (fp64_mul w2 s2);
       fp64_add w1 (fp64_div (fp64_mul (fp64_sub (fp64_mul w0 s2) (fp64_mul w2 c2)) s1) c1);
       fp64_div (fp64_add (fp64_mul (fp64_neg w0) s2) (fp64_mul w2 c2)) c1]
    else if sv =? 213 then
      [fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1);
       fp64_div (fp64_add (fp64_mul s3 w0) (fp64_mul c3 w1)) c1;
       fp64_add w2 (fp64_div (fp64_mul (fp64_add (fp64_mul s3 w0) (fp64_mul c3 w1)) s1) c1)]
    else if sv =? 123 then
      [fp64_div (fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1)) c2;
       fp64_add (fp64_mul c3 w1) (fp64_mul s3 w0);
       fp64_sub w2 (fp64_div (fp64_mul (fp64_sub (fp64_mul c3 w0) (fp64_mul s3 w1)) s2) c2)]
    else if sv =? 231 then
      [fp64_sub w0 (fp64_div (fp64_mul (fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2)) s3) c3);
       fp64_div (fp64_sub (fp64_mul c1 w1) (fp64_mul s1 w2)) c3;
       fp64_add (fp64_mul c1 w2) (fp64_mul s1 w1)]
    else [r0; r1; r2]   (* default: break —— 输出保持原值 *)
  | _, _, _ => []
  end.

(* ---- XX_RateForeHybridTrace（9 段混合轨迹角速度规划） ---- *)

Definition hybrid_trace (mtrack : list fp64) : fp64 :=
  match mtrack with
  | [dt2; amax; t_sinacc; t_conacc; t_m1a; t_m1b; tm1p; tm2p; t_m3a; t_m3b; tm3p; tmA] =>
    let w_ping :=
      if c_gt64 t_sinacc EPS_SINACC
      then fp64_div (fp64_div PI64 TWO64) t_sinacc
      else fp64_mul (fp64_mul HALF64 PI64) THOUSAND64 in
    let tm := fp64_add tmA dt2 in
    let awp := fp64_div amax w_ping in
    if c_lt64 tm ZERO64 then ZERO64
    else if c_lt64 tm t_m1a then
      fp64_mul awp (fp64_sub ONE64 (ported_cos (fp64_mul w_ping tm)))
    else if c_lt64 tm t_m1b then
      fp64_add awp (fp64_mul amax (fp64_sub tm t_m1a))
    else if c_lt64 tm tm1p then
      fp64_add (fp64_add awp (fp64_mul amax t_conacc))
               (fp64_mul awp (ported_sin (fp64_mul w_ping (fp64_sub tm t_m1b))))
    else if c_lt64 tm tm2p then
      fp64_add (fp64_mul amax t_conacc) (fp64_mul TWO64 awp)
    else if c_lt64 tm t_m3a then
      fp64_add (fp64_mul amax t_conacc)
               (fp64_mul awp (fp64_add ONE64 (ported_cos (fp64_mul w_ping (fp64_sub tm tm2p)))))
    else if c_lt64 tm t_m3b then
      fp64_sub (fp64_add (fp64_mul amax t_conacc) awp)
               (fp64_mul amax (fp64_sub tm t_m3a))
    else if c_lt64 tm tm3p then
      fp64_mul awp (fp64_sub ONE64 (ported_sin (fp64_mul w_ping (fp64_sub tm t_m3b))))
    else ZERO64
  | _ => ZERO64
  end.

(* ---- 主函数 ---- *)

Definition cs_TrgtAtt_AHM_USU_fun
    (wm : Z) (seq : list Z) (fmn fs : Z)
    (psi_DA dPsi_DA : fp64)
    (atr cb csib cbsi coi w0i wri_lst wri2_lst da_lst da_init : list fp64)
    (deltaT : fp64) (a_ref_in : list fp64) (dchi_init : fp64)
    (mtrack e_xyz js : list fp64) (mdf mlf : fp64)
  : list Z :=
  match atr, w0i, wri_lst, wri2_lst, da_lst, da_init, a_ref_in, mtrack, e_xyz, js
  with
  | [a1; a2; a3], [w0; w1; w2], [wl0; wl1; wl2], [w2l0; w2l1; w2l2],
    [dl0; dl1; dl2], [di0; di1; di2], [ar0; ar1; ar2],
    [dt2; amax; t_sinacc; t_conacc; t_m1a; t_m1b; tm1p; tm2p; t_m3a; t_m3b; tm3p; tmA],
    [e0; e1; e2], [j0; j1; j2; j3; j4; j5; j6; j7; j8] =>
    let sv := nth (Z.to_nat wm) seq 321 in
    (* 主函数 *)
    let tmpCp := angle2c sv ZERO64 ZERO64 psi_DA in
    let tmpC_Trgtb := mm333 cb (angle2c sv a1 a2 a3) in
    let cro_si := mm333 (mm333 tmpCp csib) tmpC_Trgtb in
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
    (* XX_Track_Atti *)
    let da_ref := w2euler sv [ar0; ar1; ar2] wro [di0; di1; di2] in
    let dda_ref :=
      match da_ref with
      | [r0; r1; r2] =>
        [fp64_div (fp64_sub r0 dl0) deltaT;
         fp64_div (fp64_sub r1 dl1) deltaT;
         fp64_div (fp64_sub r2 dl2) deltaT]
      | _ => []
      end in
    let ratefore := (wm =? wkmd_amm) && ((fmn =? 1) || (fmn =? 2)) in
    let res :=
      if ratefore then
        let dchi :=
          if fs =? 0 then
            hybrid_trace [dt2; amax; t_sinacc; t_conacc; t_m1a; t_m1b;
                          tm1p; tm2p; t_m3a; t_m3b; tm3p; tmA]
          else dchi_init in
        let half_psi := fp64_div psi_DA TWO64 in
        let tmpCpp := mm333 (q2c [ZERO64; ZERO64; ported_sin half_psi;
                                  ported_cos half_psi]) csib in
        let wrb02 := [fp64_mul e0 dchi; fp64_mul e1 dchi; fp64_mul e2 dchi] in
        let wsi2 :=
          match mm331 cro_si w0i, mm331 tmpCpp wrb02 with
          | [x0; x1; x2], [y0; y1; y2] =>
            [fp64_add (fp64_add x0 y0) ZERO64;
             fp64_add (fp64_add x1 y1) ZERO64;
             fp64_add (fp64_add x2 y2) dPsi_DA]
          | _, _ => []
          end in
        let wri2 := mm331 cbsi wsi2 in
        let dwri :=
          match wri2 with
          | [u0; u1; u2] =>
            [fp64_div (fp64_sub u0 w2l0) deltaT;
             fp64_div (fp64_sub u1 w2l1) deltaT;
             fp64_div (fp64_sub u2 w2l2) deltaT]
          | _ => []
          end in
        (dchi, wri2, dwri)
      else
        let dwri :=
          match wri with
          | [u0; u1; u2] =>
            [fp64_div (fp64_sub u0 wl0) deltaT;
             fp64_div (fp64_sub u1 wl1) deltaT;
             fp64_div (fp64_sub u2 wl2) deltaT]
          | _ => []
          end in
        (dchi_init, wri, dwri) in
    let '(dchi2, wri2, dwri) := res in
    let torq_scaled :=
      match mm331 js dwri with
      | [t0; t1; t2] =>
        [fp64_mul mdf t0; fp64_mul mdf t1; fp64_mul mdf t2]
      | _ => []
      end in
    let torq :=
      if c_gt64 (vectornorm3 torq_scaled) mlf
      then [ZERO64; ZERO64; ZERO64]
      else torq_scaled in
    map bits_of_b64
      (cro_si ++ wri_si ++ cro ++ wri ++ qri ++ wro ++ da_ref ++ dda_ref
              ++ wri2 ++ torq) ++ [bits_of_b64 dchi2]
  | _, _, _, _, _, _, _, _, _, _ => []
  end.
