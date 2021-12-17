Require Import Arith.

Theorem invert : forall a b : nat, a + a = b + b -> a = b.
Proof. 
  induction a.
  -intros b H. destruct b.
   +auto.
   +discriminate.
  -intros b H. destruct b.
   +discriminate.
   +inversion H. rewrite <- plus_n_Sm in H1.
    rewrite <- plus_n_Sm in H1.
    inversion H1. rewrite (IHa b H2).
    auto.
Qed.
