Require Import Preloaded.

(* Preloaded:
Inductive tree (A : Type) : Type :=
| leaf : A -> tree A
| branch : A -> tree A -> tree A -> tree A.

Arguments leaf {A}.
Arguments branch {A} _ _ _.

Fixpoint flip_tree {A : Type} (t : tree A) : tree A :=
  match t with
  | leaf _ => t
  | branch a l r => branch a (flip_tree r) (flip_tree l)
  end.
*)

Theorem flip_tree_sym : forall {A : Type} (t : tree A),
    t = flip_tree (flip_tree t).
Proof. 
  intros.
  induction t; simpl.
  -auto.
  -auto. rewrite <- IHt1, <- IHt2. auto.
Qed.
