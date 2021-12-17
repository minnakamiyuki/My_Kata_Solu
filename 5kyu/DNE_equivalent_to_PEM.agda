{-# OPTIONS --safe #-}
module DndPem where

open import Data.Empty


AxiomPEM : Set1
AxiomPEM = {a b : Set0} -> (a -> b) -> ((a -> ⊥) -> b) -> b

AxiomDNE : Set1
AxiomDNE = {a : Set0} -> ((a -> ⊥) -> ⊥) -> a

from : AxiomDNE -> AxiomPEM
from = λ z {a} {b} z₁ z₂ → z (λ z₃ → z₃ (z₂ (λ z₄ → z₃ (z₁ z₄))))

to : AxiomPEM -> AxiomDNE
to = λ x x₁ → x (λ z → z) λ x₂ → ⊥-elim (x₁ x₂)