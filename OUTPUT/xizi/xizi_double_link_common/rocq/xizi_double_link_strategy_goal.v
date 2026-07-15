Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Definition xizi_double_link_strategy401 :=
  forall (p : Z),
    TT &&
    emp **
    ((xizi_dll p (@nil Z)))
    |--
    (
    TT &&
    emp **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next") p)) **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev") p))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition xizi_double_link_strategy402 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z),
    TT &&
    emp **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next") p)) **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev") p)) -*
    TT &&
    emp **
    ((xizi_dll p (@nil Z)))
    ).

Definition xizi_double_link_strategy403 :=
  forall (p : Z) (l : (@list Z)),
    TT &&
    emp **
    ((xizi_dll p l))
    |--
    EX (first : Z) (last : Z),
      (
      TT &&
      emp **
      ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next") first)) **
      ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev") last)) **
      ((xizi_dllseg first p p last l))
      ) ** (
      TT &&
      emp -*
      TT &&
      emp
      ).

Definition xizi_double_link_strategy404 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z) (l : (@list Z)) (first last : Z),
    TT &&
    emp **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next") first)) **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev") last)) **
    ((xizi_dllseg first p p last l)) -*
    TT &&
    emp **
    ((xizi_dll p l))
    ).

Definition xizi_double_link_strategy405 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (l : (@list Z)) (p prev : Z),
    TT &&
    (“ (l = (@nil Z)) ”) &&
    emp -*
    TT &&
    emp **
    ((xizi_dllseg p prev p prev l))
    ).

Definition xizi_double_link_strategy406 :=
  forall (p tail prev last : Z) (l : (@list Z)),
    TT &&
    (“ (p <> tail) ” || “ (tail <> p) ”) &&
    emp **
    ((xizi_dllseg p prev tail last l))
    |--
    EX (nxt : Z) (l0 : (@list Z)),
      (
      TT &&
      (“ (p <> tail) ” || “ (tail <> p) ”) &&
      (“ (l = (@cons Z p l0)) ”) &&
      emp **
      ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next") nxt)) **
      ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev") prev)) **
      ((xizi_dllseg nxt p tail last l0))
      ) ** (
      TT &&
      emp -*
      TT &&
      emp
      ).

Definition xizi_double_link_strategy407 :=
  forall (p prev : Z) (l : (@list Z)),
    TT &&
    emp **
    ((xizi_dllseg p prev p prev l))
    |--
    (
    TT &&
    (“ (l = (@nil Z)) ”) &&
    emp
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition xizi_double_link_strategy408 :=
  forall (head first : Z) (l : (@list Z)),
    TT &&
    emp **
    ((xizi_dll head (@cons Z first l)))
    |--
    EX (next last : Z),
      (
      TT &&
      (“ (first <> 0) ”) &&
      (“ (first <> head) ”) &&
      emp **
      ((poly_store FET_ptr &( ((head)) # "SysDoubleLinklistNode" ->ₛ "node_next") first)) **
      ((poly_store FET_ptr &( ((head)) # "SysDoubleLinklistNode" ->ₛ "node_prev") last)) **
      ((poly_store FET_ptr &( ((first)) # "SysDoubleLinklistNode" ->ₛ "node_next") next)) **
      ((poly_store FET_ptr &( ((first)) # "SysDoubleLinklistNode" ->ₛ "node_prev") head)) **
      ((xizi_dllseg next first head last l))
      ) ** (
      TT &&
      emp -*
      TT &&
      emp
      ).

Definition xizi_double_link_strategy409 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (head first next last : Z) (l : (@list Z)),
    TT &&
    (“ (first <> 0) ”) &&
    (“ (first <> head) ”) &&
    emp **
    ((poly_store FET_ptr &( ((head)) # "SysDoubleLinklistNode" ->ₛ "node_next") first)) **
    ((poly_store FET_ptr &( ((head)) # "SysDoubleLinklistNode" ->ₛ "node_prev") last)) **
    ((poly_store FET_ptr &( ((first)) # "SysDoubleLinklistNode" ->ₛ "node_next") next)) **
    ((poly_store FET_ptr &( ((first)) # "SysDoubleLinklistNode" ->ₛ "node_prev") head)) **
    ((xizi_dllseg next first head last l)) -*
    TT &&
    emp **
    ((xizi_dll head (@cons Z first l)))
  ).

Module Type xizi_double_link_Strategy_Correct.

  Axiom xizi_double_link_strategy401_correctness : xizi_double_link_strategy401.
  Axiom xizi_double_link_strategy402_correctness : xizi_double_link_strategy402.
  Axiom xizi_double_link_strategy403_correctness : xizi_double_link_strategy403.
  Axiom xizi_double_link_strategy404_correctness : xizi_double_link_strategy404.
  Axiom xizi_double_link_strategy405_correctness : xizi_double_link_strategy405.
  Axiom xizi_double_link_strategy406_correctness : xizi_double_link_strategy406.
  Axiom xizi_double_link_strategy407_correctness : xizi_double_link_strategy407.
  Axiom xizi_double_link_strategy408_correctness : xizi_double_link_strategy408.
  Axiom xizi_double_link_strategy409_correctness : xizi_double_link_strategy409.

End xizi_double_link_Strategy_Correct.
