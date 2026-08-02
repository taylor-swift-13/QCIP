(* ============================================================
 * CS_GyroData_Disposal 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/CS_GyroData_Disposal/source/IP_CS_GyroData_Disposal.c：
 *
 *   F_StopCtrl = (F_NoUseGroup==1) && (FS_AttD==0 || FS_AttD==1)
 *                && (FP_ModeStopCtrl[m_WorkMode]==1)
 *   n = #{i | FU_ing[i] == 1}                    （==1 严格，2 不计数）
 *   if (F_StopCtrl==1 || (n!=3 && n!=4))         // 停控或可用数不足
 *       deltag = deltag_Lst                      // 用历史值；wbi / deltag_Lst 不写
 *   else
 *       n==4: R4=前4个有效陀螺的 Vbs 行, dg4=对应 deltagm
 *             deltag = (R4ᵀ·R4)⁻¹ · R4ᵀ · dg4    // 最小二乘
 *       n==3: R3=前3个有效陀螺的 Vbs 行, dg3=对应 deltagm
 *             deltag = R3⁻¹ · dg3
 *       wbi[i]  = LimitDouble(deltag[i] / m_DeltaT, Mlfw)
 *       deltag_Lst = deltag                      // 保存历史值
 *
 * 外部组件库函数的重建说明（重要）：
 * MatrixTran / MatrixMulti / MatrixInv33 / LimitDouble 在仓库中无实现，
 * 参考驱动与 spec 均按 SAM 批次 std_utils.c 的 fp32 同名函数
 * （MatrixTranF / MatrixMultiF / MatrixInv33F / LimitFloat）的算法
 * 重建为 fp64（详见 README 备注）：
 *   - MatrixMulti：product[idx] 从 +0.0 起逐项累加 a·b，左到右；
 *     dotn 的 O 支 = f64 0（+0.0）精确对应（含 +0+(-0)=+0 的符号行为）。
 *   - MatrixInv33：伴随式求逆，rank = s0·c0 + s1·c3 + s2·c6（左结合），
 *     |rank| > 1e-6 时 inv[i] /= rank，否则回退 inv = src
 *     （1e-6 沿用 SAM fp32 的 FLT32_ZERO 阈值，重建假设）。
 *   - LimitDouble：与 LimitFloat 同形的 fp64 限幅（NaN 走 else 返回 fin）。
 * 1e-6 的 bits = 0x3EB0C6F7A0B5ED8D。
 *
 * m_WorkMode 越界 [0,13] 是 UB（C 数组越界读）；spec 按 ModeConvert_EIM
 * 惯例取 stop=0，驱动不生成越界向量。
 *
 * 特殊值纪律：NaN/±Inf 只走历史值透传分支（逐位拷贝，往返一致）；
 * 矩阵/除法路径只用有限值，奇异回退以 det=0 构造触发（无 0/0）。
 *
 * spec 是纯函数：
 *   输入  noUseGroup fsAttD workMode (Z) | fpModeStopCtrl[14] fuIng[9] (list Z)
 *       | dgm[9] vbs[27](行主序) lstIn[3] wbiIn[3] (list fp64)
 *       | deltaT mlfw (fp64)
 *   输出  (F_StopCtrl, deltag'[3] bits, wbi'[3] bits, deltag_Lst'[3] bits)
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition f64zero : fp64 := f64 0.
Definition f64_1em6 : fp64 := f64 (0x3EB0C6F7A0B5ED8D).

(* ---- LimitDouble（std_utils.c LimitFloat 算法的 fp64 版） ---- *)
Definition limitDouble (fin fb : fp64) : fp64 :=
  if c_gt64 fin fb then fb
  else if c_lt64 fin (fp64_neg fb) then fp64_neg fb
  else fin.

(* ---- MatrixMulti：从 +0.0 起、左到右累加 a·b ---- *)
Fixpoint dotn (k : nat) (f : nat -> fp64) : fp64 :=
  match k with
  | O => f64zero
  | S k' => fp64_add (dotn k' f) (f k')
  end.

(* a(nr×nrc) · b(nrc×nc) → nr*nc 列表（行主序）；维度参数用 Z 便于字面量调用 *)
Definition mmul (nrc nr nc : Z) (a b : list fp64) : list fp64 :=
  let nrc' := Z.to_nat nrc in
  let nr' := Z.to_nat nr in
  let nc' := Z.to_nat nc in
  map (fun idx =>
         let ir := (idx / nc')%nat in
         let jc := (idx mod nc')%nat in
         dotn nrc' (fun nk =>
           fp64_mul (nth (ir * nrc' + nk)%nat a f64zero)
                    (nth (nk * nc' + jc)%nat b f64zero)))
      (seq 0%nat (nr' * nc')%nat).

(* ---- MatrixTran 4×3 → 3×4：out[j*4+i] = in[i*3+j]，纯拷贝 ---- *)
Definition tran43 (m : list fp64) : list fp64 :=
  map (fun i => nth (Z.to_nat i) m f64zero)
      [0; 3; 6; 9; 1; 4; 7; 10; 2; 5; 8; 11].

(* ---- MatrixInv33：伴随式 + 行列式缩放，奇异（|rank| ≤ 1e-6）回退 src ---- *)
Definition inv33 (src : list fp64) : list fp64 :=
  let s (i : Z) := nth (Z.to_nat i) src f64zero in
  let c0 := fp64_sub (fp64_mul (s 4) (s 8)) (fp64_mul (s 5) (s 7)) in
  let c1 := fp64_sub (fp64_mul (s 2) (s 7)) (fp64_mul (s 1) (s 8)) in
  let c2 := fp64_sub (fp64_mul (s 1) (s 5)) (fp64_mul (s 2) (s 4)) in
  let c3 := fp64_sub (fp64_mul (s 5) (s 6)) (fp64_mul (s 3) (s 8)) in
  let c4 := fp64_sub (fp64_mul (s 0) (s 8)) (fp64_mul (s 2) (s 6)) in
  let c5 := fp64_sub (fp64_mul (s 2) (s 3)) (fp64_mul (s 0) (s 5)) in
  let c6 := fp64_sub (fp64_mul (s 3) (s 7)) (fp64_mul (s 4) (s 6)) in
  let c7 := fp64_sub (fp64_mul (s 1) (s 6)) (fp64_mul (s 0) (s 7)) in
  let c8 := fp64_sub (fp64_mul (s 0) (s 4)) (fp64_mul (s 1) (s 3)) in
  let rank := fp64_add (fp64_add (fp64_mul (s 0) c0)
                                 (fp64_mul (s 1) c3))
                       (fp64_mul (s 2) c6) in
  if c_lt64 f64_1em6 rank || c_lt64 rank (fp64_neg f64_1em6)
  then map (fun x => fp64_div x rank) [c0; c1; c2; c3; c4; c5; c6; c7; c8]
  else src.

(* ---- 有效陀螺统计与选择（FU_ing == 1 严格） ---- *)
Definition count_valid (fu : list Z) : Z :=
  fold_right (fun f acc => if f =? 1 then acc + 1 else acc) 0 fu.

(* 按下标顺序收集有效陀螺的 Vbs 行（摊平）与 deltagm *)
Fixpoint sel (i : nat) (fu : list Z) (vbs dgm : list fp64)
  : list fp64 * list fp64 :=
  match i with
  | O => ([], [])
  | S i' =>
      let '(rows, dgs) := sel i' fu vbs dgm in
      if nth i' fu 0 =? 1 then
        (rows ++ [nth (i' * 3)%nat vbs f64zero;
                  nth (i' * 3 + 1)%nat vbs f64zero;
                  nth (i' * 3 + 2)%nat vbs f64zero],
         dgs ++ [nth i' dgm f64zero])
      else (rows, dgs)
  end.

(* ---- 全函数 ---- *)
Definition cs_GyroData_Disposal_fun
    (noUseGroup fsAttD workMode : Z)
    (fpModeStopCtrl fuIng : list Z)
    (dgm vbs lstIn wbiIn : list fp64)
    (deltaT mlfw : fp64)
  : Z * list Z * list Z * list Z :=
  let stop :=
    if (0 <=? workMode) && (workMode <? 14) then
      if (noUseGroup =? 1) &&
         ((fsAttD =? 0) || (fsAttD =? 1)) &&
         (nth (Z.to_nat workMode) fpModeStopCtrl 0 =? 1)
      then 1 else 0
    else 0 in
  let n := count_valid fuIng in
  if (stop =? 1) || negb ((n =? 3) || (n =? 4)) then
    (stop, map bits_of_b64 lstIn, map bits_of_b64 wbiIn, map bits_of_b64 lstIn)
  else
    let '(rows, dgs) := sel 9%nat fuIng vbs dgm in
    let deltag :=
      if n =? 4 then
        let r4 := firstn 12%nat rows in
        let dg4 := firstn 4%nat dgs in
        let tun := tran43 r4 in
        let matr := mmul 4 3 3 tun r4 in
        let invm := inv33 matr in
        let matr4 := mmul 3 3 4 invm tun in
        mmul 4 3 1 matr4 dg4
      else
        let r3 := firstn 9%nat rows in
        let dg3 := firstn 3%nat dgs in
        let invm := inv33 r3 in
        mmul 3 3 1 invm dg3 in
    let wbi := map (fun d => limitDouble (fp64_div d deltaT) mlfw) deltag in
    (stop, map bits_of_b64 deltag, map bits_of_b64 wbi, map bits_of_b64 deltag).
