Require Import Preloaded.
From Coq Require Arith.
Require Import ArithRing Ring.
Require Import Lia.

Lemma sum_helper: forall n : nat,
    6 * summation (S n) = 6 * summation n + 6 * S n * (2 * S n - 1).
Proof.
  induction n.
  -auto.  
  -rewrite IHn. simpl. ring.
 Qed. 
   
Theorem summation_formula : forall n,
  6 * summation n = n * (n + 1) * (4 * n - 1).
Proof. 
  induction n.
  -auto.
  -rewrite sum_helper. rewrite IHn. ring_simplify.
   (try destruct n); lia.
Qed.   
