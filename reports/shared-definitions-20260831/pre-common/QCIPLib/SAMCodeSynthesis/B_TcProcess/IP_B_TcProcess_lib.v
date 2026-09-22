(* ============================================================
 * B_TcProcess 的 Rocq spec
 *
 * C 函数 B_TcProcessFun 经串口与 OBDH 交互，处理模式切换指令：
 *   - 发送取数帧 [0xEB, 0x94]；
 *   - 接收 4 字节应答帧；
 *   - 若帧头为 [0xE1, 0x00] 且校验和正确
 *     （recv[3] == (recv[0]+recv[1]+recv[2]) mod 256），
 *     则按 recv[2] 改写 *workMode：
 *     0 -> SAM_DAMP(0x00)，1 -> SAM_CRUISE(0x33)，其他 -> NOCTRL(0x44)；
 *   - bSucc 字段最终为：recv[0] == 0xE1 时为 1，否则为 UartRecv 的返回值。
 *
 * 本文件定义 annotation 中用到的数学对象：
 *   - decode_mode      : 模式字解码（0->0x00, 1->0x33, 其他->0x44）
 *   - valid_frame      : 应答帧有效性判定（帧头 + 校验和）
 *   - final_workMode   : 返回后的 *workMode
 *   - final_bSucc      : 返回后的 bSucc
 *   - B_TcProcessPost  : 函数后置条件
 *   - UartSendRecord   : UartSend 调用记录（外部驱动占位谓词）
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.micromega.Lia.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import IntLib.

Import ListNotations.
Local Open Scope Z_scope.

(* 模式字（见 INPUT/SAMCodeSynthesis/B_TcProcess/IP.h） *)
Definition SAM_DAMP_VAL : Z := 0.     (* 0x00 *)
Definition SAM_CRUISE_VAL : Z := 51.  (* 0x33 *)
Definition NOCTRL_VAL : Z := 68.      (* 0x44 *)

(* 模式字解码：0 -> SAM_DAMP，1 -> SAM_CRUISE，其他 -> NOCTRL *)
Definition decode_mode (b : Z) : Z :=
  if b =? 0 then SAM_DAMP_VAL
  else if b =? 1 then SAM_CRUISE_VAL
  else NOCTRL_VAL.

(* 帧头有效：recv[0] == 0xE1(225) 且 recv[1] == 0x00 *)
Definition header_ok (l : list Z) : bool :=
  (Znth 0 l 0 =? 225) && (Znth 1 l 0 =? 0).

(* 校验和有效：recv[3] == (recv[0]+recv[1]+recv[2]) mod 256 *)
Definition checksum_ok (l : list Z) : bool :=
  (Znth 3 l 0 =? (Znth 0 l 0 + Znth 1 l 0 + Znth 2 l 0) mod 256).

(* 应答帧有效：帧头与校验和都正确 *)
Definition valid_frame (l : list Z) : bool :=
  header_ok l && checksum_ok l.

(* 返回后的 *workMode：帧有效则为 decode_mode(recv[2])，否则保持原值 *)
Definition final_workMode (old : Z) (l : list Z) : Z :=
  if valid_frame l then decode_mode (Znth 2 l 0) else old.

(* 返回后的 bSucc：recv[0] == 0xE1 时为 1，否则为 UartRecv 的返回值 *)
Definition final_bSucc (ret : Z) (l : list Z) : Z :=
  if (Znth 0 l 0 =? 225) then 1 else ret.

(* 后置条件：返回后的 *workMode 与 bSucc 由输入完全决定 *)
Definition B_TcProcessPost (old_wm : Z) (recv_l : list Z)
                           (ret : Z) (new_wm : Z) (new_bs : Z) : Prop :=
  new_wm = final_workMode old_wm recv_l /\
  new_bs = final_bSucc ret recv_l.

(* UartSend 发送记录：占位谓词（当前对底层驱动不假设更多语义） *)
Definition UartSendRecord (uartno : Z) (l : list Z) : Prop := True.

(* ------------------------------------------------------------------ *)
(* 证明 helpers                                                       *)

(* 长度为 2 的列表连续 replace_Znth 0/1 后等于显式两元素列表。 *)
Lemma replace2 : forall (l : list Z) (a b : Z),
  Zlength l = 2 ->
  replace_Znth 1 b (replace_Znth 0 a l) = [a; b].
Proof.
  intros l a b Hlen.
  rewrite Zlength_correct in Hlen.
  destruct l as [| x [| y [| z l']]]; simpl in Hlen; try lia.
  unfold replace_Znth. simpl. reflexivity.
Qed.

(* 三次 uchar 累加的截断和等于先求和再对 256 取模。
 * symexec 生成的形式是整个和式外层只套一次 unsigned_last_nbits，
 * 与逐步截断在数学上相等（mod 幂等）。 *)
Lemma ulnb_sum3 : forall (a b c : Z),
  unsigned_last_nbits (((0 + a) + b) + c) 8 = (a + b + c) mod 256.
Proof.
  intros a b c.
  unfold unsigned_last_nbits.
  f_equal; lia.
Qed.
