# Reasoning and Logic
FAQ For Reasoning and Logic
## Table of contents
1. [Disjunctive Normal Form](disjunctive-normal-form)
2. [De Morgan's Law](de-morgans-law)



## Disjunctive Normal Form
Disjunctive Normal Form or DNF for short is the disjunction of conjunctions of literals. Every formula has an equivalent in DNF.

### Examples of DNF
```
A 
	
A ∨ ¬A
	
A ∨ (B ∧ ¬C) ∨ D
```	

### Transformation Algorithm
There are several different methods for transforming an arbitrary formula into DNF. The following is one of the simplest with three steps:

1. Eliminate the connectives for implication (⇒) and equivalence (⇔) by rewriting using the following equivalences:
    * A ⇒ B is equivalent to ¬A ∨ B
    * A ⇔ B is equivalent to (¬A ∨ B) ∧ (A ∨ ¬B)
2. Push negations (¬) inside subformulas as far as possible, applying [De Morgan's Law](de-morgans-law) where possible, and eliminate double negations. We also handle the negation of the propositional constants. We do this by rewriting with the following equivalences: 
    * ¬(¬A) is equivalent to A
    * ¬(A ∧ B) is equivalent to ¬A ∨ ¬B
    * ¬(A ∨ B) is equivalent to ¬A ∧ ¬B
    * ¬t is equivalent to f
    * ¬f is equivalent to t
3. Distribute conjunctions (∧) over disjunctions (∨). We rewrite all applicable subterms of the formula using one of the following two equivalences:
    * A ∧ (B ∨ C) is equivalent to (A ∧ B) ∨ (A ∧ C)
    * (A ∨ B) ∧ C is equivalent to (A ∧ C) ∨ (B ∧ C)

## De Morgan's law
De Morgan's law states the following equivalences:
*   ¬(A ∧ B) ⇔ ¬A ∨ ¬B
*   ¬(A ∨ B) ⇔ ¬A ∧ ¬B

## Arguments
An argument consists of a conclusion and a number of premesis. There can be one, more then one or even zero premesis in an argument. 

An argument is valid if and only if the conclusion is true for all cases (i.e. rows in the truth table) where all propositions are true. For propositional logic it is relatively easy to prove that an argument is valid. You draw out the truth table. You look at the conclusion. If and only if the conclusion is true, you look at the colomn of all the premesis. All premesis have to be true. If this isn't the case, the argument is invalid. Repeat this process for all rows where the conclusion is true. 

For predicate logic, this process is more difficult. You need to use a mathematical proof. I can't explain all mathematical proofs here, because they are different for every argument. Look at the text book, that explains it pretty well.

Special cases

If an argument has no premesis, the conclusion must be a tautology (i.e. always true) for the argument to be valid. A example of a tautology is (p or not p).

Principal of explosion: if one of the premesis is a contradiction (i.e. always false), the argument is always valid. Look at the definition of a valid argument. The conclusion has to be true for all cases where all propositions are true. If there are no cases where the propositions are true, this definition technically holds. It won't win you a debate, but the argument is logically valid.


## Sources
* [DNF](http://www.barrywatson.se/cl/cl_dnf.html)

## Useful Links
* [Logical Equivalence](https://en.wikipedia.org/wiki/Logical_equivalence)

* [Recursion](https://en.wikipedia.org/wiki/Recursion#In_mathematics)
