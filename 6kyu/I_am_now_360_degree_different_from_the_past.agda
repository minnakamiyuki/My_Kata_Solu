{-# OPTIONS --safe #-}
module RevRev where

open import Relation.Binary.PropositionalEquality
open import Data.List
open import Rev

{-
What you've just imported:

-- With this definition, Agda deduces better
rev : ∀ {ℓ} {A : Set ℓ} → List A → List A
rev [] = []
rev (x ∷ xs) = rev xs ++ x ∷ [] 
-}
revlemma : ∀ {ℓ} {A : Set ℓ} (xs : List A) (x : A) → rev (xs ++ x ∷ []) ≡ x ∷ rev xs
revlemma [] x = refl
revlemma (x₁ ∷ xs) x = cong (λ x → x ++ x₁ ∷ []) (revlemma xs x)

revrevid : ∀ {ℓ} {A : Set ℓ} (a : List A) → rev (rev a) ≡ a
revrevid [] = refl
revrevid (x ∷ xs) = trans (revlemma (rev xs) x) (cong (_∷_ x) (revrevid xs)) 