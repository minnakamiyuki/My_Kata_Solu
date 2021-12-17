{-# OPTIONS --safe #-}
module Mod where

open import Data.Fin using (Fin; zero; suc; toℕ; fromℕ; inject₁; inject≤)

open import Data.Nat as ℕ
  using (ℕ; zero; suc; z≤n; s≤s; _+_; _≤_)
open import Data.Nat.DivMod using (_%_; a%n<n)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

private variable k : ℕ

last : Fin (suc k)
last {k = zero} = zero
last {k = suc _} = suc last

addn : ∀ (d : ℕ) → Fin d → Fin d → ℕ
addn zero m n = zero
addn (suc d) m n = (toℕ m + toℕ n) % (suc d)

add : Fin k -> Fin k -> Fin k
add {suc k} n m = inject≤ (fromℕ (addn (suc k) m n)) (a%n<n (toℕ m + toℕ n) k)

negate : Fin k -> Fin k
negate zero = zero
negate (suc zero) = last
negate (suc n) = inject₁ (negate n)

subt : Fin k -> Fin k -> Fin k
subt n m = add n (negate m)

multn : ∀ {m n} → Fin m → Fin n → Fin n 
multn zero zero = zero
multn zero (suc finN) = zero
multn (suc finM) zero = zero
multn (suc finM) (suc finN) = add (suc finN) (multn finM (suc finN))

mult : Fin k -> Fin k -> Fin k
mult n m = multn n m
