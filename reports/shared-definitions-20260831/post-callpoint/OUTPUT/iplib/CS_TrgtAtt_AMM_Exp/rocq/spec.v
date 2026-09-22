(* ============================================================
 * CS_TrgtAtt_AMM_Exp 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/CS_TrgtAtt_AMM_Exp/source/IP_CS_TrgtAtt_AMM_Exp.c：
 *
 *   csMnvTrgtHook.Track_Plan_hook();        // 应用层钩子，参考侧置空操作，
 *                                           // 其产物 Chi_Ref/dChi_Ref 作为直接输入
 *   if (F_Init_tm3 == 1) {
 *       F_Init_tm3 = 0;
 *       tm1 = tm1p + tm_xin;  tm2 = tm2p + tm_xin;  tm3 = tm3p + tm_xin;
 *       tMnv = tm3;
 *   }
 *   tmpF   = Chi_Ref / 2.0;
 *   tmpSin = Sinx(tmpF);                     // sin/cos：musl 移植（见下）
 *   qrb0[0..2] = e_xyz[0..2] * tmpSin;
 *   qrb0[3]    = Cosx(tmpF);
 *   wrb0[0..2] = e_xyz[0..2] * dChi_Ref;
 *
 * 语义构成：
 *   - 一次 fp64 除 2.0（2 的幂，精确）、三次 fp64 乘法（qrb0）、三次
 *     fp64 乘法（wrb0）、分支内三次 fp64 加法（mode_NE，与 gcc -std=c11 一致）；
 *   - sin/cos 由 FloatTest/lib/FloatTrig.v 的 ported_sin/ported_cos 给出，
 *     与参考侧链接的 FloatTest/ref/ported_trig.c（musl 移植，shadow libm）
 *     同算法逐比特一致；输入域 |tmpF| <= 2π（chi ∈ [-4π,4π]），全部走
 *     kernel/small-rem 路径，不触 medium 边界与越域分支；
 *   - F_Init_tm3==0 时 tm1/tm2/tm3/tMnv 不写入，原值透传（spec 返回输入初值）。
 *
 * 函数不读取的字段（fun 指针、F_Init 清零后的回写）不进 spec；
 * F_Init_tm3 的 0/1 两值在向量中交替覆盖。
 *
 * spec 是纯函数：
 *   输入  fInit（Z）e0 e1 e2 chi dchi（fp64）
 *         tm1p tm2p tm3p tmxin（fp64）
 *         tm1i tm2i tm3i tmnvi（fp64，透传初值）
 *   输出  (qrb0[4] bits, wrb0[3] bits, tm1' bits, tm2' bits, tm3' bits, tMnv' bits)
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

Definition cs_TrgtAtt_AMM_Exp_fun
    (fInit : Z)
    (e0 e1 e2 chi dchi : fp64)
    (tm1p tm2p tm3p tmxin tm1i tm2i tm3i tmnvi : fp64)
  : list Z * list Z * Z * Z * Z * Z :=
  let tmpF := fp64_div chi TWO64 in
  let s := ported_sin tmpF in
  let qrb0 := [bits_of_b64 (fp64_mul e0 s);
               bits_of_b64 (fp64_mul e1 s);
               bits_of_b64 (fp64_mul e2 s);
               bits_of_b64 (ported_cos tmpF)] in
  let wrb0 := [bits_of_b64 (fp64_mul e0 dchi);
               bits_of_b64 (fp64_mul e1 dchi);
               bits_of_b64 (fp64_mul e2 dchi)] in
  let '(tm1, tm2, tm3, tmnv) :=
    if fInit =? 1
    then (fp64_add tm1p tmxin, fp64_add tm2p tmxin,
          fp64_add tm3p tmxin, fp64_add tm3p tmxin)
    else (tm1i, tm2i, tm3i, tmnvi) in
  (qrb0, wrb0,
   bits_of_b64 tm1, bits_of_b64 tm2, bits_of_b64 tm3, bits_of_b64 tmnv).
