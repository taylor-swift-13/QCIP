Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Psatz.
From SimpleC.SL Require Import SeparationLogic.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
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
    (“ (p <> 0) ”) &&
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
    (“ (p <> 0) ”) &&
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
      (“ (p <> 0) ”) &&
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
  ALL (p : Z) (first : Z) (l : (@list Z)) (last : Z),
    TT &&
    (“ (p <> 0) ”) &&
    emp **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next") first)) **
    ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev") last)) **
    ((xizi_dllseg first p p last l)) -*
    TT &&
    emp **
    ((xizi_dll p l))
    ).

Definition xizi_double_link_strategy405 :=
  forall (p : Z),
    TT &&
    emp **
    ((xizi_dll_node p))
    |--
    (
    TT &&
    (“ (p <> 0) ”) &&
    emp **
    ((poly_undef_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next"))) **
    ((poly_undef_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev")))
    ) ** (
    TT &&
    emp -*
    TT &&
    emp
    ).

Definition xizi_double_link_strategy407 :=
  TT &&
  emp
  |--
  (
  TT &&
  emp
  ) ** (
  ALL (p : Z),
    TT &&
    (“ (p <> 0) ”) &&
    emp **
    ((poly_undef_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next"))) **
    ((poly_undef_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev"))) -*
    TT &&
    emp **
    ((xizi_dll_node p))
    ).

Definition xizi_double_link_strategy406 :=
  forall (tail : Z) (p : Z) (l : (@list Z)) (last : Z) (prev : Z),
    TT &&
    (“ (p <> tail) ” || “ (tail <> p) ”) &&
    emp **
    ((xizi_dllseg p prev tail last l))
    |--
    EX (next : Z) (l0 : (@list Z)),
      (
      TT &&
      (“ (p <> tail) ” || “ (tail <> p) ”) &&
      (“ (l = (@cons Z p l0)) ”) &&
      emp **
      ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_next") next)) **
      ((poly_store FET_ptr &( ((p)) # "SysDoubleLinklistNode" ->ₛ "node_prev") prev)) **
      ((xizi_dllseg next p tail last l0))
      ) ** (
      TT &&
      emp -*
      TT &&
      emp
      ).

Definition xizi_double_link_strategy408 :=
  forall (first : Z) (head : Z) (l : (@list Z)),
    TT &&
    emp **
    ((xizi_dll head (@cons Z first l)))
    |--
    EX (next : Z) (last : Z),
      (
      TT &&
      (“ (head <> 0) ”) &&
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
  forall (first : Z) (head : Z),
    TT &&
    (“ (first <> 0) ”) &&
    (“ (first <> head) ”) &&
    emp
    |--
    (
    TT &&
    (“ (first <> 0) ”) &&
    (“ (first <> head) ”) &&
    emp
    ) ** (
    ALL (next : Z) (l : (@list Z)) (last : Z),
      TT &&
      (“ (head <> 0) ”) &&
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
  Axiom xizi_double_link_strategy407_correctness : xizi_double_link_strategy407.
  Axiom xizi_double_link_strategy406_correctness : xizi_double_link_strategy406.
  Axiom xizi_double_link_strategy408_correctness : xizi_double_link_strategy408.
  Axiom xizi_double_link_strategy409_correctness : xizi_double_link_strategy409.

End xizi_double_link_Strategy_Correct.
