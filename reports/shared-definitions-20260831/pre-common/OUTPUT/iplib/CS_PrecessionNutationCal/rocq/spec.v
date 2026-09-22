(* ============================================================
 * CS_PrecessionNutationCal 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/CS_PrecessionNutationCal/source/IP_CS_PrecessionNutationCal.c：
 *
 *   F_qJDerr = 0
 *   if FS_CPNCal == 1:
 *     tJ2000 = tmpT + I_UTC0 + tGPS0 + dT_UTC2TDT
 *     CPN    = CPNCalc(tJ2000)      【IAU1976 岁差 + 1980 章动】
 *   else if TripleFabsMax(qd[0..2]) < 0.05:
 *     qd[3]  = sqrt(1 - qd0² - qd1² - qd2²)
 *     CPN    = Q2C(qd)
 *   else:
 *     CPN    = I；F_qJDerr = 1
 *
 * 组件库重建约定（仓库全库无实现，声明详见 README"组件库重建声明"）：
 *   - CPN_POLY1/POLY3：朴素逐项多项式（a0+a1·T(+a2·T²+a3·T³)），
 *     结果乘 ARC2RAD 角秒→弧度——IAU 系数均为角秒而下游 Sinx/Cosx/
 *     Rx/Ry/Rz 在弧度域工作，转换只可能存在于被裁掉的宏中，这是本
 *     case 重建约定中最重要的假设（换 convention 需两侧同步重做）；
 *   - Rx/Ry/Rz：Vallado/IAU 被动元旋转（与 EIM 重建中 1 轴元旋转一致）；
 *   - Q2C：q[3] 标量部标准展开式（与 AHM_USU 同款）；
 *   - mm333 行主序 0.0 起 k 升序；tran33/ident33/triple_fabs_max 直白；
 *   - sin/cos = FloatTrig.v musl 移植；sqrt = fp64_sqrt 正确舍入。
 *
 * 输入纪律：全部有限值；FS ∈ {0,1}（原代码 ==1 判定，其余整数值
 * 一律走 else，spec 如实建模）。
 *
 * spec 是纯函数：
 *   输入  fs（Z） tmpT qd[4] i_utc0 dt_utc2tdt tgps0（fp64）
 *   输出  11 个值（list Z，顺序）：F_qJDerr（0/1） CPN[9] qd[3] 终值
 *         （除 F_qJDerr 外均为 bits64）
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

(* ---- 常量（C 字面量的 bits64） ---- *)

Definition c_arc2rad : fp64 := f64 4527337695575248797.  (* π/648000 *)
Definition c_daycy   : fp64 := f64 4748908516016652288.  (* 86400.0*36525.0 *)
Definition c_0p05    : fp64 := f64 4587366580439587226.

(* ---- fabs：清符号位 ---- *)
Definition fabs64 (x : fp64) : fp64 :=
  b64_of_bits (Z.land (bits_of_b64 x) 9223372036854775807).

(* ---- CPN_POLY1/POLY3：朴素逐项 + ARC2RAD（重建约定） ---- *)

Definition cpn_poly1 (a0 a1 t : fp64) : fp64 :=
  fp64_mul (fp64_add a0 (fp64_mul a1 t)) c_arc2rad.

Definition cpn_poly3 (a0 a1 a2 a3 t : fp64) : fp64 :=
  fp64_mul
    (fp64_add (fp64_add (fp64_add a0 (fp64_mul a1 t))
                        (fp64_mul (fp64_mul a2 t) t))
              (fp64_mul (fp64_mul (fp64_mul a3 t) t) t))
    c_arc2rad.

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

Definition tran33 (m : list fp64) : list fp64 :=
  match m with
  | [m0; m1; m2; m3; m4; m5; m6; m7; m8] =>
    [m0; m3; m6; m1; m4; m7; m2; m5; m8]
  | _ => []
  end.

Definition ident33 : list fp64 :=
  [ONE64; ZERO64; ZERO64; ZERO64; ONE64; ZERO64; ZERO64; ZERO64; ONE64].

(* ---- Vallado/IAU 被动元旋转 ---- *)

Definition rx (a : fp64) : list fp64 :=
  let s := ported_sin a in let c := ported_cos a in
  [ONE64; ZERO64; ZERO64; ZERO64; c; s; ZERO64; fp64_neg s; c].

Definition ry (a : fp64) : list fp64 :=
  let s := ported_sin a in let c := ported_cos a in
  [c; ZERO64; fp64_neg s; ZERO64; ONE64; ZERO64; s; ZERO64; c].

Definition rz (a : fp64) : list fp64 :=
  let s := ported_sin a in let c := ported_cos a in
  [c; s; ZERO64; fp64_neg s; c; ZERO64; ZERO64; ZERO64; ONE64].

(* ---- 四元数→DCM（q[3] 标量部，与 AHM_USU 同款） ---- *)

Definition q2c (q : list fp64) : list fp64 :=
  match q with
  | [q1; q2; q3; q4] =>
    [fp64_sub ONE64 (fp64_mul (f64 4611686018427387904)
                    (fp64_add (fp64_mul q2 q2) (fp64_mul q3 q3)));
     fp64_mul (f64 4611686018427387904)
       (fp64_sub (fp64_mul q1 q2) (fp64_mul q3 q4));
     fp64_mul (f64 4611686018427387904)
       (fp64_add (fp64_mul q1 q3) (fp64_mul q2 q4));
     fp64_mul (f64 4611686018427387904)
       (fp64_add (fp64_mul q1 q2) (fp64_mul q3 q4));
     fp64_sub ONE64 (fp64_mul (f64 4611686018427387904)
                    (fp64_add (fp64_mul q1 q1) (fp64_mul q3 q3)));
     fp64_mul (f64 4611686018427387904)
       (fp64_sub (fp64_mul q2 q3) (fp64_mul q1 q4));
     fp64_mul (f64 4611686018427387904)
       (fp64_sub (fp64_mul q1 q3) (fp64_mul q2 q4));
     fp64_mul (f64 4611686018427387904)
       (fp64_add (fp64_mul q2 q3) (fp64_mul q1 q4));
     fp64_sub ONE64 (fp64_mul (f64 4611686018427387904)
                    (fp64_add (fp64_mul q1 q1) (fp64_mul q2 q2)))]
  | _ => []
  end.

(* ---- TripleFabsMax：左到右两两取大（严格 > 才替换） ---- *)

Definition triple_fabs_max (a b c : fp64) : fp64 :=
  let m0 := fabs64 a in
  let m1 := if c_gt64 (fabs64 b) m0 then fabs64 b else m0 in
  if c_gt64 (fabs64 c) m1 then fabs64 c else m1.

(* ---- CPNCalc：IAU1976 岁差 + 1980 章动 ---- *)

Definition cpn_calc (tj : fp64) : list fp64 :=
  let tc := fp64_div tj c_daycy in
  let zeta_p := cpn_poly3 ZERO64 (f64 4657289842307997316) (f64 4599109806539948341) (f64 4580844791718402444) tc in
  let zp     := cpn_poly3 ZERO64 (f64 4657289842307997316) (f64 4607608819612736847) (f64 4580903878945513545) tc in
  let theta_p:= cpn_poly3 ZERO64 (f64 4656529868007264590) (f64 13824729499896752216) (f64 13809561628553347519) tc in
  let cp := mm333 (mm333 (rz (fp64_neg zp)) (ry theta_p)) (rz (fp64_neg zeta_p)) in
  let omg := cpn_poly3 (f64 4691477307187548652) (f64 13932606394617231835) (f64 4620079602232899666) (f64 4575765307799480828) tc in
  let ff  := cpn_poly3 (f64 4689512249646926266) (f64 4745082914151646364) (f64 13847024682442040541) (f64 4577494690056391098) tc in
  let dd  := cpn_poly3 (f64 4697356138966388048) (f64 4744510116250058228) (f64 13842816631540216234) (f64 4581133598555306459) tc in
  let mm  := cpn_poly3 (f64 4698278863284924842) (f64 4728469488828506178) (f64 13826744410370037776) (f64 13801443187663470330) tc in
  (* delta_psi：((((t1 + t2) - t3) + t4) - t5) *)
  let dpsi :=
    fp64_sub
      (fp64_add
        (fp64_sub
          (fp64_add
            (fp64_mul (fp64_neg (cpn_poly1 (f64 4625534474691561495) (f64 4580678194560986755) tc))
                      (ported_sin omg))
            (fp64_mul (cpn_poly1 (f64 4596467454566577524) (f64 4536524183238306033) tc)
                      (ported_sin (fp64_mul (f64 4611686018427387904) omg))))
          (fp64_mul (cpn_poly1 (f64 4608617716001260385) (f64 4550034982120417521) tc)
                    (ported_sin (fp64_mul (f64 4611686018427387904)
                                 (fp64_add (fp64_sub ff dd) omg)))))
        (fp64_mul (cpn_poly1 (f64 4594305726745439686) (f64 13778279553484038016) tc)
                  (ported_sin mm)))
      (fp64_mul (cpn_poly1 (f64 4597360968732647830) (f64 4536524183238306033) tc)
                (ported_sin (fp64_mul (f64 4611686018427387904)
                             (fp64_add ff omg)))) in
  (* delta_eps：((((u1 - u2) + u3) + u4) + u5) *)
  let deps :=
    fp64_add
      (fp64_add
        (fp64_add
          (fp64_sub
            (fp64_mul (cpn_poly1 (f64 4621370165001118024) (f64 4561348024384372206) tc)
                      (ported_cos omg))
            (fp64_mul (cpn_poly1 (f64 4591113575329559478) (f64 13765875559246349101) tc)
                      (ported_cos (fp64_mul (f64 4611686018427387904) omg))))
          (fp64_mul (cpn_poly1 (f64 4603341749037795849) (f64 13777726151161826729) tc)
                    (ported_cos (fp64_mul (f64 4611686018427387904)
                                 (fp64_add (fp64_sub ff dd) omg)))))
        (fp64_mul (cpn_poly1 (f64 4591704447600670487) (f64 13765875559246349101) tc)
                  (ported_cos (fp64_mul (f64 4611686018427387904)
                               (fp64_add ff omg)))))
      (fp64_mul (cpn_poly1 (f64 4572875798278559918) (f64 13755392620465711345) tc)
                (ported_cos mm)) in
  let eps := cpn_poly3 (f64 4680535062163360842) (f64 13855157479681629880) (f64 13781953049628091582) (f64 4566003809650350806) tc in
  let eps_mean := fp64_sub eps deps in
  let cn := mm333 (mm333 (rx (fp64_neg (fp64_add eps_mean deps)))
                         (rz (fp64_neg dpsi)))
                  (rx eps_mean) in
  mm333 (tran33 cp) (tran33 cn).

(* ---- 主函数 ---- *)

Definition cs_PrecessionNutationCal_fun
    (fs : Z) (tmpT : fp64) (qd : list fp64)
    (i_utc0 dt_utc2tdt tgps0 : fp64)
  : list Z :=
  match qd with
  | [q0; q1; q2; q3] =>
    if fs =? 1 then
      let tj := fp64_add (fp64_add (fp64_add tmpT i_utc0) tgps0) dt_utc2tdt in
      0 :: map bits_of_b64 (cpn_calc tj) ++ [bits_of_b64 q3]
    else
      if c_lt64 (triple_fabs_max q0 q1 q2) c_0p05 then
        let q3' := fp64_sqrt
                     (fp64_sub (fp64_sub (fp64_sub ONE64 (fp64_mul q0 q0))
                                         (fp64_mul q1 q1))
                               (fp64_mul q2 q2)) in
        0 :: map bits_of_b64 (q2c [q0; q1; q2; q3']) ++ [bits_of_b64 q3']
      else
        1 :: map bits_of_b64 ident33 ++ [bits_of_b64 q3]
  | _ => []
  end.
