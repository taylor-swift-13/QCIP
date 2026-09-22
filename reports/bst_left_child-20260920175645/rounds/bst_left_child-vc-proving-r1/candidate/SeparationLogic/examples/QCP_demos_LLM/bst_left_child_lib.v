Require Import Coq.ZArith.ZArith.
Local Open Scope Z_scope.

Definition bst_left_child_result (ret expected : Z) : Prop :=
  ret = expected.
