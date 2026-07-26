(* ============================================================
 * DSSDataGet 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/SAMCodeSynthesis/DSSDataGet/IP_DSSDataGet.c。
 * 函数通过 UART 收发取回 11 字节帧（参考侧 stub 总是把向量字节填入
 * 接收缓冲并返回给定的 bSucc），然后：
 *
 *   debugDss.ErrCode = bSucc;
 *   if (bSucc != 0)  debugDss.ErrCnt++;
 *   else 若 (sum(b[0..9]) & 0xFF) != b[10] { ErrCode = 0xCC; ErrCnt++; }
 *
 *   // 以下与通讯成败无关，总是执行：
 *   royaw = float(b[0..3]); piyaw = float(b[4..7]);   // 见"字节重组"
 *   flgSP = (b[8] == 1 || b[9] == 1) ? 1 : 0;
 *
 * 字节重组（USED_WORD 联合）：gcc x86-64 上位域从 LSB 起分配，Byte 结构
 * 声明序 High_h..Low_l 使 Low_l 落在字最高字节；C 按 Low_l=b0、Low_h=b1、
 * High_l=b2、High_h=b3 赋值后
 *   word = b0<<24 | b1<<16 | b2<<8 | b3        （大端组装，首字节为 MSB）
 * （.tmp endian spike 实测：Low_l=0x11..High_h=0x44 得 0x11223344。）
 *
 * 整数语义：ErrCnt 是 unint32，自增模 2^32 回绕（u32_inc）；
 * sum & 0xFF 即 sum mod 256（sum 非负）。
 *
 * spec 是纯函数：
 *   输入  bSucc(Z)  11 字节列表 bs  errCnt(Z)
 *   输出  (royaw bits, piyaw bits, flgSP, errCode, errCnt')
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
Definition assemble_be (b0 b1 b2 b3 : Z) : fp32 :=
  b32_of_bits (b0 * 16777216 + b1 * 65536 + b2 * 256 + b3).

Definition dssDataGet_fun (bSucc : Z) (bs : list Z) (errCnt : Z)
  : Z * Z * Z * Z * Z :=
  let royaw := assemble_be (nth 0 bs 0) (nth 1 bs 0) (nth 2 bs 0) (nth 3 bs 0) in
  let piyaw := assemble_be (nth 4 bs 0) (nth 5 bs 0) (nth 6 bs 0) (nth 7 bs 0) in
  let flg := if (nth 8 bs 0 =? 1) || (nth 9 bs 0 =? 1) then 1 else 0 in
  let sum := fold_left Z.add (firstn 10 bs) 0 in
  let cksum_bad := negb (sum mod 256 =? nth 10 bs 0) in
  let errCode := if bSucc =? 0 then (if cksum_bad then 204 else 0) else bSucc in
  let errCnt1 :=
    if (negb (bSucc =? 0)) || cksum_bad then u32_inc errCnt else errCnt in
  (bits_of_b32 royaw, bits_of_b32 piyaw, flg, errCode, errCnt1).
