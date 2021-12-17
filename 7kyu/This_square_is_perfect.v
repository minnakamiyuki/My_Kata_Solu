Require Import Arith.
Require Import ArithRing Ring.

Lemma SnSn : forall n,
    S n = n + 1.
Proof.
  induction n.
  -auto.
  -rewrite IHn. simpl. ring.
Qed.

Theorem expand : forall n, (n + 1) ^ 2 = n ^ 2 + 2 * n + 1.
Proof. 
  induction n.
  -auto.
   -rewrite SnSn. rewrite IHn.
    simpl. ring.
Qed.
