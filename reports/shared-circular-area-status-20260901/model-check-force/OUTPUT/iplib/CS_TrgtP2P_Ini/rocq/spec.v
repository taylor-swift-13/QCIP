(* ============================================================
 * CS_TrgtP2P_Ini 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/CS_TrgtP2P_Ini/source/IP_CS_TrgtP2P_Ini.c：
 *
 *   dChimax[i] = dChimaxZR[i][F_P2PType]   （i=0..2，查表）
 *   amax[i]    = amaxZR[i][F_P2PType]
 *   m_WorkMode==WKMD_OAM → CS_TrgtP2P_OrbCtl_Ini()  【打桩】
 *              ==WKMD_AMM → CS_TrgtP2P_Tar_Init()    【打桩】
 *              其他       → f_Fun_Null()             【打桩】
 *   qro  = C2Q(Cro)          （Shepperd，q[3] 标量部）
 *   qro0 = qro               （透传拷贝）
 *
 * 三个 mode callee 全打空操作桩（CS_TrgtP2P_Tar_Init 是兄弟 case，
 * 其 Cro 生成逻辑在该题目内单独测试），故 m_WorkMode 不影响任何
 * 输出——spec 如实建模：wm 进签名但不参与计算，"wm 任意值输出
 * 相同"这一性质本身被全部向量验证。替身值 WKMD_OAM=0x55、
 * WKMD_AMM=0x44（仓库无定义）。C2Q 与 EIM 同款重建约定，
 * sqrt = fp64_sqrt 正确舍入。
 *
 * 输入纪律：全部有限值；F_P2PType ∈ [0,5]（越界为 UB，不注入）；
 * Cro 由参考驱动按物理 DCM 构造（C2Q 的 sqrt 参数非负）。
 *
 * spec 是纯函数：
 *   输入  wm ftype（Z） dchizr[18] amaxzr[18] cro[9]（list fp64，
 *         两个表均为 [3][6] 行主序扁平）
 *   输出  14 个 bits（list Z，顺序）：
 *         dChimax[3] amax[3] qro[4] qro0[4]
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

(* ---- [3][6] 行主序查表：out[i] = tab[i*6 + f] ---- *)

Definition tab3x6 (tab : list fp64) (f : Z) : list fp64 :=
  [nth (Z.to_nat (0 * 6 + f)) tab ZERO64;
   nth (Z.to_nat (1 * 6 + f)) tab ZERO64;
   nth (Z.to_nat (2 * 6 + f)) tab ZERO64].

(* ---- 主函数 ---- *)

Definition cs_TrgtP2P_Ini_fun
    (wm ftype : Z) (dchizr amaxzr cro : list fp64)
  : list Z :=
  let dchi := tab3x6 dchizr ftype in
  let amax := tab3x6 amaxzr ftype in
  (* wm 只决定调哪个被打桩的 callee，不影响任何输出（见文件头声明） *)
  let qro := c2q cro in
  map bits_of_b64 (dchi ++ amax ++ qro ++ qro).
