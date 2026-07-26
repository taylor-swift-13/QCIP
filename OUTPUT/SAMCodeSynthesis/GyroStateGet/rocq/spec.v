(* ============================================================
 * GyroStateGet 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/GyroStateGet/IP_GyroStateGet.c。
 * 函数通过 UART 收发取回 48 字节帧（参考侧 stub 总是把向量字节填入
 * 接收缓冲并返回给定的 bSucc），然后：
 *
 *   debugGyro.ErrCode = bSucc;
 *   if (bSucc != 0)  debugGyro.ErrCnt++;
 *   else 若 (sum(b[0..46]) & 0xFF) != b[47] { ErrCode = 0xCC; ErrCnt++; }
 *
 *   // 以下与通讯成败无关，总是执行：
 *   for (i = 0; i < NumGyro; i++) {
 *     wa[i]        = float(b[2+4i..5+4i]);   // 大端重组，同 DSSDataGet
 *     stateFlag[i] = b[38+i];                // unint08 零扩展到 unint32
 *   }
 *   // i >= NumGyro 的元素保持原值（UB 防范：驱动保证 NumGyro <= 9）
 *
 * 注意：本 spec 全程在 bits（Z）域工作——wa 的"浮点"只是字节重组，
 * 不涉及任何浮点运算；重组公式 b0<<24|b1<<16|b2<<8|b3 与 DSSDataGet
 * 相同（USED_WORD 位域在 gcc x86-64 上 Low_l 落最高字节，spike 实测）。
 *
 * 整数语义：ErrCnt 是 unint32，自增模 2^32 回绕（u32_inc）；
 * sum & 0xFF 即 sum mod 256（sum 非负）。
 *
 * spec 是纯函数：
 *   输入  bSucc(Z)  48 字节列表 bs  numGyro(Z)
 *         wa_in bits[9]  stateFlag_in[9]  errCnt(Z)
 *   输出  (wa' bits[9], stateFlag'[9], errCode, errCnt')
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

(* unint32 自增：模 2^32 回绕 *)
Definition u32_inc (x : Z) : Z := (x + 1) mod 4294967296.

(* 大端字节重组：b0 为最高字节 *)
Definition word_be (b0 b1 b2 b3 : Z) : Z :=
  b0 * 16777216 + b1 * 65536 + b2 * 256 + b3.

Definition idxs : list Z := [0; 1; 2; 3; 4; 5; 6; 7; 8].

(* 第 i 路 wa：i < numGyro 时取帧字节重组，否则保持输入 *)
Definition wa_elem (bs wa_in : list Z) (numGyro i : Z) : Z :=
  if i <? numGyro then
    word_be (nth (Z.to_nat (2 + 4 * i)) bs 0)
            (nth (Z.to_nat (3 + 4 * i)) bs 0)
            (nth (Z.to_nat (4 + 4 * i)) bs 0)
            (nth (Z.to_nat (5 + 4 * i)) bs 0)
  else nth (Z.to_nat i) wa_in 0.

(* 第 i 路 stateFlag：i < numGyro 时取 b[38+i]，否则保持输入 *)
Definition sf_elem (bs sfs_in : list Z) (numGyro i : Z) : Z :=
  if i <? numGyro then nth (Z.to_nat (38 + i)) bs 0
  else nth (Z.to_nat i) sfs_in 0.

Definition gyroStateGet_fun (bSucc : Z) (bs : list Z) (numGyro : Z)
    (wa_in sfs_in : list Z) (errCnt : Z)
  : list Z * list Z * Z * Z :=
  let sum := fold_left Z.add (firstn 47 bs) 0 in
  let cksum_bad := negb (sum mod 256 =? nth 47 bs 0) in
  let errCode := if bSucc =? 0 then (if cksum_bad then 204 else 0) else bSucc in
  let errCnt1 :=
    if (negb (bSucc =? 0)) || cksum_bad then u32_inc errCnt else errCnt in
  (map (wa_elem bs wa_in numGyro) idxs,
   map (sf_elem bs sfs_in numGyro) idxs,
   errCode, errCnt1).
