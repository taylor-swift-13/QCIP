(* ============================================================
 * GyroPick 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/GyroPick/IP_GyroPick.c：
 * 对 9 路陀螺独立做剔野（i = 0..8）：
 *
 *   wa_out[i] = wa[i];
 *   tmpgi = ABS(wa[i] - wal[i]);          // ABS 宏：((a)>0)?(a):-(a)
 *   if (tmpgi > waThr) {                  // 超限：判为野值
 *     countPick[i]++;                     // unint08，模 256 回绕
 *     if (countPick[i] < pickThr) {       // 比较的是自增后的值
 *       wa_out[i] = wal[i];               // 未连续 n 次：沿用上周期的值
 *     } else {
 *       wal[i] = wa[i]; wa_out[i] = wa[i]; countPick[i] = 0;
 *     }
 *   } else {                              // 未超限：采纳新值
 *     wal[i] = wa[i]; wa_out[i] = wa[i]; countPick[i] = 0;
 *   }
 *
 * ABS 宏（IP.h）：((a) > 0) ? (a) : -(a)。NaN 时 (a)>0 为 false，取 -(a)
 * 支（仍是 NaN），随后 tmpgi > waThr 为 false，走"未超限"支——NaN 输入
 * 会被直接采纳进 wal/wa_out。spec 用 c_gt/fp32_neg 复刻同一结构。
 *
 * 整数语义：countPick / pickThr 是 unint08；自增模 256 回绕（u8_inc），
 * 比较时双方都在 [0,255]，Z 比较即 C 的 int 提升比较。
 *
 * spec 是纯函数：
 *   输入  was/wals(9 路 fp32 列表) waThr(fp32) pickThr(Z) countPicks(9 路 Z)
 *   输出  (wa_out 的 bits[9], wal' 的 bits[9], countPick'[9])
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

(* IP.h 的 ABS 宏：((a) > 0) ? (a) : -(a) *)
Definition abs_macro (x : fp32) : fp32 :=
  if c_gt x (f32 0) then x else fp32_neg x.

(* unint08 自增：模 256 回绕 *)
Definition u8_inc (x : Z) : Z := (x + 1) mod 256.

(* 单路剔野：返回 (wa_out, wal', countPick') *)
Definition pick_step (wa wal thr : fp32) (cnt pthr : Z)
  : fp32 * fp32 * Z :=
  let d := fp32_sub wa wal in
  let tmpgi := abs_macro d in
  if c_gt tmpgi thr then
    let cnt1 := u8_inc cnt in
    if cnt1 <? pthr then (wal, wal, cnt1)   (* 沿用旧值，计数保留 *)
    else (wa, wa, 0)                        (* 连续野值：采纳新值，清零 *)
  else (wa, wa, 0).                         (* 未超限：采纳新值，清零 *)

Fixpoint pick_loop (was wals : list fp32) (cnts : list Z)
                   (thr : fp32) (pthr : Z) : list (fp32 * fp32 * Z) :=
  match was, wals, cnts with
  | w :: ws, l :: ls, c :: cs =>
      pick_step w l thr c pthr :: pick_loop ws ls cs thr pthr
  | _, _, _ => []
  end.

Definition gyroPick_fun
    (was wals : list fp32) (thr : fp32) (pthr : Z) (cnts : list Z)
  : list Z * list Z * list Z :=
  let rs := pick_loop was wals cnts thr pthr in
  (map (fun t => bits_of_b32 (fst (fst t))) rs,
   map (fun t => bits_of_b32 (snd (fst t))) rs,
   map snd rs).
