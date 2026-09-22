Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import FloatTest.lib.OrbiterNewCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition uart_enabled (xs : list Z) : bool := Z.eqb (nthz 0 xs) 1.
Definition uart_read (xs : list Z) : bool := uart_enabled xs && Z.eqb (nthz 1 xs) 92.
Definition uart_empty_fault (xs : list Z) : bool :=
  uart_enabled xs && Z.eqb (nthz 1 xs) 0 && Z.ltb 2 (nthz 3 xs + 1).
Definition uart_partial_fault (xs : list Z) : bool :=
  uart_enabled xs && negb (Z.eqb (nthz 1 xs) 92) && Z.ltb 0 (nthz 2 xs).
Definition uart_read_fault (xs : list Z) : bool :=
  uart_read xs && (negb (Z.eqb (nthz 4 xs) 0) || negb (Z.eqb (nthz 5 xs) 1)).
Definition uart_fault (xs : list Z) : bool :=
  (uart_empty_fault xs || uart_partial_fault xs || uart_read_fault xs)%bool.
Definition uart_success (xs : list Z) : bool := uart_read xs && negb (uart_read_fault xs).
Definition uart_local_valid (xs : list Z) : Z := if uart_read xs then nthz 5 xs else 0.

Definition ccuUartComm_fun (xs : list Z) : list Z :=
  [if negb (uart_enabled xs) then nthz 2 xs
   else if uart_fault xs || uart_read xs then 0 else nthz 1 xs;
   if negb (uart_enabled xs) then nthz 3 xs
   else if Z.eqb (nthz 1 xs) 0 then
          if Z.ltb 2 (nthz 3 xs + 1) then 0 else nthz 3 xs + 1
        else 0;
   if uart_success xs then nthz 7 xs + 1 else nthz 7 xs;
   if uart_fault xs then nthz 8 xs + 1 else nthz 8 xs;
   if uart_fault xs then nthz 9 xs + 1
   else if uart_success xs then 0 else nthz 9 xs;
   if negb (uart_enabled xs) then 0
   else if uart_read xs || uart_fault xs then uart_local_valid xs else nthz 13 xs;
   if uart_read xs then nthz 4 xs else nthz 11 xs;
   if uart_success xs then nthz 6 xs else nthz 12 xs;
   if uart_enabled xs then 1 else 0;
   if uart_read xs then 1 else 0;
   if uart_read xs then 1 else 0;
   if uart_success xs then 1 else 0;
   if uart_fault xs then 1 else 0;
   if uart_fault xs then 1 else 0;
   1].
