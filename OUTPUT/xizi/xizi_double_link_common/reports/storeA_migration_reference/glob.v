Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.

Record StableGlobVars: Type := {
  (* task / scheduler *)
  taskHead : addr;                  (* ktask.c: global task manage list, DoubleLinklistType xiaoshan_task_head *)
  taskZombie : addr;                (* zombierecycle.c: zombie task list head, DoubleLinklistType KTaskZombie *)
  delayHead : addr;                 (* delay.c: delayed task list head, DoubleLinklistType xiaoshan_delay_head *)
  assign : addr;                    (* assign.c / smp_assign.c: scheduler global state, struct Assign Assign *)

  (* synchronization / IPC object lists *)
  semList : addr;                   (* semaphore.c: global semaphore manage list, DoubleLinklistType k_sem_list *)
  mutexList : addr;                 (* mutex.c: global mutex manage list, DoubleLinklistType k_mutex_list *)
  eventList : addr;                 (* event.c: global event manage list, DoubleLinklistType k_event_list *)
  mqList : addr;                    (* msgqueue.c: global message queue manage list, DoubleLinklistType k_mq_list *)

  (* timer and gather-block lists *)
  timerSortHead : addr;             (* softtimer.c: timer sorted list head, DoubleLinklistType xiaoshan_timer_sort_head *)
  timerList : addr;                 (* softtimer.c: global timer manage list, DoubleLinklistType k_timer_list *)
  memGatherHead : addr;             (* gatherblock.c: memory gather manage list, DoubleLinklistType xiaoshan_memgather_head *)

  (* byte memory managers *)
  byteManager : addr;               (* byte_manage.c: kernel byte memory manager, static struct ByteMemory ByteManager *)
  userByteManager : addr;           (* byte_manage.c: user byte memory manager under SEPARATE_COMPILE, static struct ByteMemory UserByteManager *)
  extByteManager : addr             (* byte_manage.c: external SRAM byte memory managers under MEM_EXTERN_SRAM, static struct ByteMemory ExtByteManager[] *)
}.

(**
  以下对象暂不进入 StableGlobVars：
  - 静态函数表，如 KTaskDone / TimerDone / DynamicBuddyMemoryDone。
  - hook、isrManager、g_service_table 等外设或服务分发表。
  - 局部 static 标量，如 heartbeat_ticks、KTaskOsAssignLockNest。
  后续进入对应 case 时再按依赖边界补充。
*)

Notation "x '.(taskHead)'" := (taskHead x) (at level 1).
Notation "x '.(taskZombie)'" := (taskZombie x) (at level 1).
Notation "x '.(delayHead)'" := (delayHead x) (at level 1).
Notation "x '.(assign)'" := (assign x) (at level 1).
Notation "x '.(semList)'" := (semList x) (at level 1).
Notation "x '.(mutexList)'" := (mutexList x) (at level 1).
Notation "x '.(eventList)'" := (eventList x) (at level 1).
Notation "x '.(mqList)'" := (mqList x) (at level 1).
Notation "x '.(timerSortHead)'" := (timerSortHead x) (at level 1).
Notation "x '.(timerList)'" := (timerList x) (at level 1).
Notation "x '.(memGatherHead)'" := (memGatherHead x) (at level 1).
Notation "x '.(byteManager)'" := (byteManager x) (at level 1).
Notation "x '.(userByteManager)'" := (userByteManager x) (at level 1).
Notation "x '.(extByteManager)'" := (extByteManager x) (at level 1).

Notation "x '.(taskHead)'" := (taskHead x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(taskZombie)'" := (taskZombie x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(delayHead)'" := (delayHead x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(assign)'" := (assign x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(semList)'" := (semList x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(mutexList)'" := (mutexList x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(eventList)'" := (eventList x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(mqList)'" := (mqList x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(timerSortHead)'" := (timerSortHead x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(timerList)'" := (timerList x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(memGatherHead)'" := (memGatherHead x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(byteManager)'" := (byteManager x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(userByteManager)'" := (userByteManager x)
  (in custom lvalue_expr_entry at level 1).
Notation "x '.(extByteManager)'" := (extByteManager x)
  (in custom lvalue_expr_entry at level 1).

Notation "x '.(taskHead)'" := (taskHead x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(taskZombie)'" := (taskZombie x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(delayHead)'" := (delayHead x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(assign)'" := (assign x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(semList)'" := (semList x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(mutexList)'" := (mutexList x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(eventList)'" := (eventList x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(mqList)'" := (mqList x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(timerSortHead)'" := (timerSortHead x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(timerList)'" := (timerList x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(memGatherHead)'" := (memGatherHead x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(byteManager)'" := (byteManager x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(userByteManager)'" := (userByteManager x)
  (in custom rvalue_expr_entry at level 1).
Notation "x '.(extByteManager)'" := (extByteManager x)
  (in custom rvalue_expr_entry at level 1).

Definition TaskID := Z.  (* 任务ID *)
