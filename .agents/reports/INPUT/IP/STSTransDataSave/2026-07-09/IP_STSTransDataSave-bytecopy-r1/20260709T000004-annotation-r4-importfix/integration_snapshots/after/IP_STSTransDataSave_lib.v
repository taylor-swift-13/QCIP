Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
From AUXLib Require Import ListLib.

Local Open Scope Z_scope.
Local Open Scope list_scope.

(* Predicate-first byte-copy post-state relation for STSTransDataSave.
   It states the mathematical SRAM-window effect without mirroring C control
   flow or the Memcpyx implementation algorithm.  The scratch C uses
   CharArray because all available local examples use CharArray for byte
   buffers; unsigned-char signedness remains a review item for main. *)

Definition STS_PACKET_BASE : Z := 1074343936.
Definition STS_PACKET_WINDOW_LEN : Z := 1024.
Definition STS_COPY_LEN : Z := 248.
Definition STS_DATABUF_LEN : Z := 256.
Definition STS_PTR_LIMIT : Z := 776.

Definition STSTransDataSavePost
    (old_ptr new_ptr copy_len : Z) : Prop :=
  copy_len = STS_COPY_LEN /\
  ((old_ptr < STS_PTR_LIMIT /\ new_ptr = old_ptr + copy_len) \/
   (old_ptr >= STS_PTR_LIMIT /\ new_ptr = old_ptr)).

Definition STSSramAfterCopy
    (old_ptr : Z) (data_buf old_sram new_sram : list Z) : Prop :=
  Zlength data_buf = STS_DATABUF_LEN /\
  Zlength old_sram = STS_PACKET_WINDOW_LEN /\
  Zlength new_sram = STS_PACKET_WINDOW_LEN /\
  0 <= old_ptr /\ old_ptr <= STS_PACKET_WINDOW_LEN /\
  ((old_ptr < STS_PTR_LIMIT /\
    new_sram =
      sublist 0 old_ptr old_sram ++
      sublist 0 STS_COPY_LEN data_buf ++
      sublist (old_ptr + STS_COPY_LEN) STS_PACKET_WINDOW_LEN old_sram) \/
   (old_ptr >= STS_PTR_LIMIT /\ new_sram = old_sram)).

Definition STSTransDataSaveBytePost
    (old_ptr new_ptr : Z) (data_buf old_sram new_sram : list Z) : Prop :=
  STSTransDataSavePost old_ptr new_ptr STS_COPY_LEN /\
  STSSramAfterCopy old_ptr data_buf old_sram new_sram.
