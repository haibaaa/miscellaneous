# CSD334 Theory of Computation — Study Guide

> **Course:** CSD334 — Theory of Computation
> **Instructor:** Arnab Ganguly, Dept. of Computer Science, Shiv Nadar IoE
> **Focus:** DFA/NFA Design · PDA Design · CFG Construction · Non-Regularity Proofs

---

## Table of Contents

1. Module 1 — Finite Automata (DFA & NFA)
2. Module 2 — Pushdown Automata (PDA)
3. Module 3 — Context-Free Grammars (CFG)
4. Module 4 — Non-Regular Languages
5. Answer Key

---

# Module 1 — Finite Automata (DFA & NFA)

## Overview

Finite automata are the simplest class of computational machines. They
read input symbols one at a time, transition between states, and accept
or reject based on the final state reached.

> **Key insight:** DFAs and NFAs recognize exactly the same class of
> languages — the **regular languages** — despite their structural
> differences.

---

## Core Vocabulary

- **Alphabet (Σ):** A finite set of symbols, e.g. `{0, 1}` or `{a, b, c}`.
- **String:** A finite sequence of symbols from Σ. The empty string is `ε`.
- **Language:** A set of strings over Σ.
- **Σ\*:** All strings over Σ including ε.
- **Σ⁺:** All non-empty strings over Σ.
- **|w|:** Length of string w.
- **Prefix-free language:** No string in L is a proper prefix of another.

---

## Deterministic Finite Automata (DFA)

### Definition

A DFA is a quintuple `(Q, F, Σ, δ, q₀)` where:

- `Q` — finite set of states
- `F ⊆ Q` — set of accepting (final) states
- `Σ` — input alphabet
- `δ : Q × Σ → Q` — transition function (total and deterministic)
- `q₀ ∈ Q` — start state

> **Determinism:** For every state `q` and symbol `a ∈ Σ`, there is
> exactly one next state `δ(q, a)`. No ambiguity, no parallelism.

### How It Works

Given input `w = a₁a₂...aₖ`:

1. Start at state `q₀`.
2. After reading `aᵢ`, move to `qᵢ = δ(qᵢ₋₁, aᵢ)`.
3. **Accept** if `qₖ ∈ F`; otherwise **reject**.

A language `L` is **regular** if there exists a DFA that recognizes it.

### DFA Design Strategy

When designing a DFA, ask: **"What information do I need to remember?"**
Each state encodes a relevant property of the input read so far.

**Design pattern — tracking a count modulo k:**

- Use `k` states, one per residue class.
- Use transitions that update the residue as each symbol is read.

**Design pattern — tracking the last few symbols:**

- Use states that "remember" the relevant suffix of input seen.

---

## Non-Deterministic Finite Automata (NFA)

### Definition

An NFA is also a quintuple `(Q, F, Σ, δ, q₀)`, but the transition
function changes to:

```
δ : Q × (Σ ∪ {ε}) → P(Q)
```

where `P(Q)` is the **power set** of Q.

Key differences from DFA:

- A state can have **multiple transitions** on the same symbol.
- A state **need not** have a transition for every symbol.
- **ε-transitions** allow moves without consuming any input.

### Acceptance Rule

An NFA accepts a string if **at least one** computation path ends in
an accepting state. Think of it as running all possible paths in
parallel simultaneously.

> **Non-determinism ≠ Randomness.** The NFA explores all paths
> in parallel. If any path accepts, the string is accepted.

### NFA Properties

- A state can have multiple outgoing transitions on the same label.
  The NFA moves to all of them in parallel.
- A state may have no transition for some symbol. That branch of
  computation simply terminates (and rejects).
- ε-transitions allow free movement between states without reading
  any symbol from the input.

### DFA vs NFA — The Key Difference

- DFA: `δ(q, a)` returns a **single state**.
- NFA: `δ(q, a)` returns a **set of states** (possibly empty).

### DFA ≡ NFA (Equivalence Theorem)

Every NFA can be converted to an equivalent DFA via **subset
construction**: states of the DFA correspond to subsets of NFA states.

```
Regular Languages = Languages recognized by DFA
                  = Languages recognized by NFA
```

DFAs and NFAs have **equal expressive power**.

### ε-Transitions and Composition

ε-transitions are especially useful when composing machines:

```
[Machine for L₁] --ε--> [Machine for L₂]
```

This lets the combined NFA recognize `L₁ · L₂` (concatenation)
without needing to track where L₁ ends explicitly.

---

## Closure Properties of Regular Languages

Regular languages are closed under:

- **Union:** `L₁ ∪ L₂`
- **Concatenation:** `L₁ · L₂`
- **Kleene star:** `L*`
- **Intersection:** `L₁ ∩ L₂`
- **Complement:** `Σ* \ L`

---

## Module 1 — Practice Questions

**Q1.** Design a DFA over `Σ = {0, 1}` that accepts all strings where
the number of `1`s is divisible by 3. Specify all states, transitions,
and the accepting state(s). How many states are needed?

**Q2.** Design an NFA over `Σ = {a, b, c}` that accepts strings
containing `ab` **or** `ac` as a substring. Briefly explain why
non-determinism simplifies the design compared to a DFA.

**Q3.** Let `L = {w ∈ {0,1}* | w has an odd number of 0s AND ends
in 1}`. Design a DFA for `L`. Hint: track two properties — parity of
0s and the last symbol read.

---

# Module 2 — Pushdown Automata (PDA)

## Overview

A PDA is an NFA augmented with a **stack** — an unbounded
last-in-first-out memory. The stack allows PDAs to recognize languages
requiring counting or matching of nested structures.

```
Regular Languages  ⊂  Det. Context-Free (DCFL)  ⊂  Non-det. CFL
     (DFA/NFA)               (DPDA)                    (NPDA)
```

> **Critical difference:** Unlike finite automata, DPDA is strictly
> weaker than NPDA. Some CFLs require non-determinism to recognize.

---

## Formal Definition

A (non-deterministic) PDA is a 6-tuple `(Q, F, Σ, Γ, δ, q₀)` where:

- `Q` — finite set of states
- `F ⊆ Q` — accepting states
- `Σ` — input alphabet
- `Γ` — stack alphabet (may differ from Σ)
- `q₀ ∈ Q` — start state
- Transition function:
  `δ : Q × (Σ ∪ {ε}) × (Γ ∪ {ε}) → P(Q × (Γ ∪ {ε}))`

**Unless stated otherwise, PDA means NPDA.**

---

## Transition Notation

Transitions are labeled on edges as:

```
α, β → γ
```

Meaning:

- Read input symbol `α` (or `ε` — consume nothing)
- Pop `β` from the top of the stack (or `ε` — pop nothing)
- Push `γ` onto the stack (or `ε` — push nothing)

---

## Computation and Acceptance

Given input `W = w₁w₂...wₘ`:

1. Start in state `q₀` with an **empty stack**.
2. At each step: read symbol (or ε), pop from stack (or ε),
   transition to new state, push onto stack (or ε).
3. **Accept** if the PDA is in an accepting state after all input
   is consumed.

The sentinel character `$` is pushed first to allow the PDA to
detect an empty stack (since there is no direct "is stack empty?"
check).

---

## Classic Example: PDA for `{0ⁿ1ⁿ | n ≥ 0}`

This language is not regular — a DFA cannot count unboundedly.
A PDA can, using the stack.

```
  start [q₀] --ε,ε→$--> [q₁]
              [q₁] self-loop: 0,ε→0
              [q₁] --1,0→ε--> [q₂]
              [q₂] self-loop: 1,0→ε
              [q₂] --ε,$→ε--> [q₃*]
```

Transitions in detail:

- `q₀ → q₁`  on  `ε, ε → $`   (push sentinel)
- `q₁ → q₁`  on  `0, ε → 0`   (push a 0 for each 0 read)
- `q₁ → q₂`  on  `1, 0 → ε`   (first 1 pops a 0)
- `q₂ → q₂`  on  `1, 0 → ε`   (each further 1 pops a 0)
- `q₂ → q₃`  on  `ε, $ → ε`   (stack emptied — accept)

`q₃` is the only accepting state. `q₀` is also accepting (covers
`ε ∈ L`, since ε has n=0).

**How it works step by step for `0011`:**

```
State  Stack    Action
q₀     (empty)  push $  → q₁
q₁     $        read 0, push 0  → q₁, stack: 0$
q₁     0$       read 0, push 0  → q₁, stack: 00$
q₁     00$      read 1, pop 0   → q₂, stack: 0$
q₂     0$       read 1, pop 0   → q₂, stack: $
q₂     $        pop $           → q₃*   ACCEPT
```

---

## PDA Design Strategy

1. Identify what needs to be counted or matched.
2. Use the stack to store "what is owed" to be matched later.
3. Use a sentinel `$` to detect empty stack.
4. Use distinct states to enforce ordering constraints.

**Push phase / Match phase pattern:**

```
Push phase:  read a's, push one symbol per a
Match phase: read b's, pop one symbol per b
Accept:      stack has only $ remaining at end of input
```

---

## More PDA Examples

### `L = {ww^R | w ∈ {0,1}*}` — even-length palindromes

- **Push phase:** self-loops on `q₁`, push each symbol read.
- **Midpoint:** ε-transition to `q₂` (non-deterministic guess).
- **Match phase:** self-loops on `q₂`, pop and match each symbol.
- **Accept:** pop sentinel `$`, move to `q₃*`.

Non-determinism is essential here — the machine "guesses" the midpoint.

### `L = {aⁿb²ⁿ | n ≥ 0}`

Push **two** stack symbols for each `a` read, then pop one per `b`.

```
q₁ → q₁  on  a, ε → AA   (push two A's per a)
q₁ → q₂  on  b, A → ε    (first b starts the match phase)
q₂ → q₂  on  b, A → ε    (each b pops one A)
q₂ → q₃  on  ε, $ → ε    (accept when stack empty)
```

---

## Module 2 — Practice Questions

**Q1.** Design a PDA for `L = {0ᵐ1ⁿ | m ≥ n ≥ 0}`. Describe all
states and transitions. Should you accept when the stack is non-empty
at the end of input? Justify.

**Q2.** Design a PDA for `L = {w ∈ {a,b}* | #a(w) = #b(w)}`.
Hint: use two different stack symbols (`A` for excess a's and `B` for
excess b's). Describe how the stack evolves on input `aabb`.

**Q3.** Can an NPDA or DPDA recognize `L = {aⁿbⁿcⁿ | n ≥ 0}`?
Justify your answer by explaining what the stack can and cannot track.

---

# Module 3 — Context-Free Grammars (CFG)

## Overview

A CFG is the **generative** description of a CFL. A PDA is the
**recognizing** description. They are equivalent formalisms.

> **Why CFGs matter:** They naturally express recursive structures —
> arithmetic expressions, nested parentheses, and programming languages.

---

## Formal Definition

A CFG is a 4-tuple `(V, Σ, R, S)` where:

- `V` — finite set of **variables** (non-terminals)
- `Σ` — finite set of **terminals** (disjoint from V)
- `R` — finite set of **production rules** `A → w`,
  where `A ∈ V` and `w ∈ (V ∪ Σ)*`
- `S ∈ V` — the **start variable**

A string `w ∈ Σ*` is in `L(G)` if `S ⟹* w` via the production rules.

```
L(G) = {w ∈ Σ* | S ⟹* w}
```

---

## CFG Design Strategies

### Strategy 1: Matching / Counting

For languages like `{aⁿbⁿ}`, use recursion to wrap symbols:

```
S → aSb | ε
```

Generates: ε, ab, aabb, aaabbb, ...

### Strategy 2: Union of Sub-languages

For `L₁ ∪ L₂`, introduce separate start variables:

```
S → A | B
A → ... (rules for L₁)
B → ... (rules for L₂)
```

### Strategy 3: Free Counting (any order)

For `{w | #0(w) = #1(w)}` (equal 0s and 1s, any interleaving):

```
S → SS | 0S1 | 1S0 | ε
```

### Strategy 4: Disjoint Cases with Shared Structure

For `{aⁱbʲcᵏ | i = j or i = k}` (two separate matching conditions):

```
S → UV | W
U → aUb | ε        (matches i = j)
V → cV  | ε        (free c's appended)
W → aWc | X        (matches i = k)
X → bX  | ε        (free b's inserted)
```

---

## Key CFG Examples

### Palindromes over `{a, b, c}`

```
S → E
E → aEa | bEb | cEc | O | ε
O → a | b | c
```

`E` nests symmetric pairs; `O` handles the single middle character
in odd-length palindromes.

### Arithmetic Expressions (with precedence)

```
E → E+T | T
T → T×F | F
F → (E) | a
```

This grammar enforces operator precedence (`×` binds tighter than `+`)
and produces a unique parse tree for each valid expression.

### `{aᵐbⁿcᵐ⁺ⁿ | m+n ≥ 1}`

```
S → aAc | bBc
A → aAc | B | ε
B → bBc | ε
```

Each `a` is matched with a `c`, and each `b` is also matched with
a `c`. The total count of `c`s equals the sum of `a`s and `b`s.

### `{aibjckdl | i+k = j+l}`

```
S → aSd | UVW
U → aUb | ε
V → bVc | ε
W → cWd | ε
```

---

## Closure Properties of CFLs

CFLs are **closed** under:

- **Union:** `S → S₁ | S₂`
- **Concatenation:** `S → S₁S₂`
- **Kleene star:** `S_new → ε | S S_new`

CFLs are **NOT closed** under:

- **Intersection:** `{aⁿbⁿc*} ∩ {a*bⁿcⁿ} = {aⁿbⁿcⁿ}` (not a CFL).
- **Complement:** If closed under complement, then by De Morgan's law
  also closed under intersection — a contradiction.

---

## Language Hierarchy

```
Regular Languages
       |
       | (strictly contained in)
       v
Det. Context-Free Languages (DCFL)
       |
       | (strictly contained in)
       v
Non-det. Context-Free Languages (NCFL)
```

Every regular language is context-free. Not every CFL is regular.
The canonical separator is `{0ⁿ1ⁿ | n ≥ 0}`.

---

## Module 3 — Practice Questions

**Q1.** Construct a CFG for each of the following languages:

- (a) `{w ∈ {0,1}* | w has equal number of 0s and 1s}`
- (b) `{0ᵐ1ⁿ | m ≠ n}` — strings with unequal counts.
  Hint: split into `m > n` and `m < n` separately.

**Q2.** Construct a CFG for `L = {w ∈ {a,b,c}* | w is a palindrome}`.
Then trace the derivation of `abcba` step by step from the start
variable.

**Q3.** Prove that `L = {aⁿbⁿ | n ≥ 0} ∪ {aⁿb²ⁿ | n ≥ 0}` is
context-free by writing a CFG. Then argue why `L` is not regular,
using either the Pumping Lemma or a closure-based argument.

---

# Module 4 — Non-Regular Languages

## Overview

Not all languages are regular. Two main techniques prove non-regularity:

- **The Pumping Lemma** — direct contradiction via string pumping.
- **Closure-based arguments** — indirect contradiction via operations.

> **Logical structure:**
> Regular → Pumping Lemma holds.
> Contrapositive: Pumping Lemma fails → Not regular.
> Pumping Lemma holding does NOT imply regularity.

---

## The Pumping Lemma

### Statement

If `L` is a regular language, then there exists a **pumping length**
`p > 0` such that every string `s ∈ L` with `|s| ≥ p` satisfies:

`s` can be partitioned as `s = xyz` where:

1. `xyⁱz ∈ L` for all `i ≥ 0`
2. `|y| > 0`
3. `|xy| ≤ p`

**Intuition behind the pumping length:** If a DFA has `p` states and
reads a string of length `≥ p`, by the Pigeonhole Principle it must
revisit some state. The portion of the string between two visits to
the same state can be repeated (pumped) while still being recognized.

---

## Proof Template for Non-Regularity

To prove `L` is **not** regular using the Pumping Lemma:

1. Assume `L` is regular with pumping length `p` (treat `p` as
   arbitrary — do not fix it).
2. Choose `s ∈ L` with `|s| ≥ p`. Choose carefully so that any
   valid split is forced into a contradiction.
3. Consider **all** valid splits `xyz` satisfying `|xy| ≤ p`,
   `|y| > 0`. The constraint `|xy| ≤ p` often limits `y` to a
   specific region of `s`.
4. For each possible split, find `i ≥ 0` such that `xyⁱz ∉ L`.
5. Conclude: Pumping Lemma fails → `L` is not regular.

> **Common mistake:** Checking only one split. You must cover ALL
> valid splits or use `|xy| ≤ p` to rule out cases.

---

## Pumping Lemma — Worked Examples

### Example 1: `L = {0ⁿ1ⁿ | n ≥ 0}`

**Choose** `s = 0ᵖ1ᵖ`. Then `s ∈ L` and `|s| = 2p ≥ p`.

Since `|xy| ≤ p` and `s` starts with `p` zeros, `xy` lies entirely
within the zero block. So `y` consists of zeros only (`|y| ≥ 1`).

- `xy²z` has more zeros than ones → not in `L`.

**Conclusion:** Pumping Lemma fails → `L` is not regular.

---

### Example 2: `L = {w ∈ {0,1}* | #0(w) = #1(w)}`

**Wrong approach:** Arguing y could have both 0s and 1s, and pumping
preserves the count. This is wrong — `|xy| ≤ p` prevents `y` from
containing ones.

**Correct approach:**

**Choose** `s = 0ᵖ1ᵖ`. Since `|xy| ≤ p`, `x` and `y` are both
within the first `p` zeros. So `y` consists of zeros only.

- `xy²z` has more zeros than ones → not in `L`.

**Conclusion:** Not regular.

---

### Example 3: `L = {1^(n²) | n ≥ 0}` (perfect square lengths)

**Choose** `s = 1^(p²)`. Then `s ∈ L` and `|s| = p² ≥ p`.

Since `|y| ≤ p` and `|y| ≥ 1`:

```
|xy²z| = p² + |y|

Upper bound:  p² + |y| ≤ p² + p < (p+1)²
Lower bound:  p² + |y| > p²
```

So `p² < |xy²z| < (p+1)²` — strictly between two consecutive perfect
squares, hence not a perfect square → `xy²z ∉ L`.

**Conclusion:** Not regular.

---

### Example 4: `L = {0ᵐ1ⁿ | m > n}`

**Choose** `s = 0^(p+1) 1ᵖ`. Then `|s| = 2p+1 ≥ p`.

Since `|xy| ≤ p`, `y` consists of zeros only.

- Pumping up (`i ≥ 2`): adds more zeros → still in L. No contradiction.
- Pumping down (`i = 0`): `|xy⁰z|` loses `|y| ≥ 1` zeros, leaving
  at most `p` zeros vs `p` ones → `m ≤ n` → `∉ L`. Contradiction.

**Conclusion:** Not regular.

---

### Example 5: `L = {ww | w ∈ {0,1}*}`

**Choose** `s = 0ᵖ1ᵖ0ᵖ1ᵖ`. Then `s ∈ L` and `|s| = 4p ≥ p`.

Since `|xy| ≤ p`, `y` lies in the first block of zeros only.
So `y = 0ʲ` for some `j ≥ 1`.

- `xy²z = 0^(p+j) 1ᵖ 0ᵖ 1ᵖ`.
  For `ww` structure, both halves must be equal. First half has
  more zeros than second → not of the form `ww` → `∉ L`.

**Conclusion:** Not regular.

---

## Proving Non-Regularity via Closure Properties

### Key Idea

To prove `L` is non-regular via closure:

1. Assume `L` is regular.
2. Apply closure operations using a known regular language `R`.
3. Show the result is a known non-regular language `M`.
4. Contradiction: regular languages are closed under those operations.

### Proof Template

```
Assume L is regular.
Let R be a known regular language.
Then:  M = L ∩ R   (or  M = L · R,  or  M = complement(L))
       ^--- should be regular (by closure)
But M is known to be non-regular. CONTRADICTION.
Therefore L is not regular.
```

---

## Closure-Based Examples

### Example 1: Equal 0s and 1s

Let `L = {w ∈ {0,1}* | #0(w) = #1(w)}`.

- Let `M = {0ⁿ1ⁿ | n ≥ 0}` (known non-regular by pumping lemma).
- Observe: `M = L ∩ 0*1*`.
- `0*1*` is regular. If `L` were regular, `M` would be regular.
- Contradiction → `L` is not regular.

### Example 2: `{0ⁿ1ⁿ}` via concatenation

Let `L = {0ⁿ1ⁿ | n ≥ 0}` (to show it's non-regular).

- Let `M = {0ᵐ1ⁿ | m > n}` (shown non-regular by pumping lemma).
- Observe: `M = 0⁺ · L`.
- `0⁺` is regular. If `L` were regular, `M` would be regular.
- Contradiction → `L` is not regular.

### Example 3: Non-perfect-square lengths

Let `L = {0^q | q is not a perfect square}`.

- Complement of `L` is `L' = {0^q | q is a perfect square}`.
- `L'` is known non-regular (by pumping lemma).
- If `L` were regular, then `L'` (its complement) would also be
  regular, because regular languages are closed under complement.
- Contradiction → `L` is not regular.

---

## Summary of Non-Regularity Strategies

- Use **pumping lemma** when a direct counting argument is cleanest.
- Use **closure arguments** when `L` is close to a known non-regular
  language via a simple regular operation.
- Never use the pumping lemma to prove regularity — construct a
  DFA/NFA instead.

---

## Module 4 — Practice Questions

**Q1.** Prove that `L = {0^(2ⁿ) | n ≥ 0}` is not regular using the
Pumping Lemma. Choose `s = 0^(2ᵖ)` and show that pumping up produces
a length strictly between two consecutive powers of 2.

**Q2.** Prove that `L = {ww^R | w ∈ {0,1}*}` (even-length palindromes)
is not regular. Use the Pumping Lemma with `s = 0ᵖ1ᵖ1ᵖ0ᵖ`. Show any
valid split leads to a non-palindrome after pumping.

**Q3.** Use a closure-based argument to prove that
`L = {0ⁿ1ⁿ0ⁿ | n ≥ 0}` is not regular. Identify a known non-regular
language `M`, a regular language `R`, and a regular operation
connecting them to produce a contradiction.

---

# Answer Key

---

## Module 1 Answers

### A1: DFA for strings where count of 1s is divisible by 3

Use 3 states tracking count of 1s modulo 3:

- `q₀` — count ≡ 0 mod 3  ← **accepting state**
- `q₁` — count ≡ 1 mod 3
- `q₂` — count ≡ 2 mod 3

Transitions:

- `δ(qᵢ, 0) = qᵢ` for all i  (reading 0 doesn't change count)
- `δ(q₀, 1) = q₁`
- `δ(q₁, 1) = q₂`
- `δ(q₂, 1) = q₀`

Start state: `q₀`. Accepting states: `{q₀}`. Total states: **3**.

---

### A2: NFA for strings containing `ab` or `ac`

States: `q₀` (start), `q₁` (just saw `a`), `q₂*` (saw `ab`),
`q₃*` (saw `ac`). Self-loops on `q₀` and accepting states handle
the arbitrary prefix and suffix.

Transitions:

- `q₀ → q₀` on `a, b, c`  (self-loop — skip prefix)
- `q₀ → q₁` on `a`         (non-deterministic: guess pattern starts)
- `q₁ → q₂*` on `b`
- `q₁ → q₃*` on `c`
- `q₂* → q₂*` on `a, b, c` (accept anything after `ab`)
- `q₃* → q₃*` on `a, b, c` (accept anything after `ac`)

Non-determinism handles the "guess" of when the pattern begins.
A DFA would need explicit states tracking whether an `a` was most
recently seen AND whether the pattern was found — more states overall.

---

### A3: DFA for odd #0s AND ends in 1

Track two bits: parity of 0s (even/odd) and last symbol seen.

States: `(parity, last)` pairs:

- `q_e0` — even 0s, last was 0
- `q_e1` — even 0s, last was 1
- `q_o0` — odd 0s, last was 0
- `q_o1` — odd 0s, last was 1  ← **accepting state**

Start: `q_e1` (0 zeros, no last symbol — treat as "ended in 1").

Transitions on `0` (flips parity, sets last=0):

- `δ(q_e0, 0) = q_o0`
- `δ(q_e1, 0) = q_o0`
- `δ(q_o0, 0) = q_e0`
- `δ(q_o1, 0) = q_e0`

Transitions on `1` (preserves parity, sets last=1):

- `δ(q_e0, 1) = q_e1`
- `δ(q_e1, 1) = q_e1`
- `δ(q_o0, 1) = q_o1`
- `δ(q_o1, 1) = q_o1`

Accepting states: `{q_o1}` only.

---

## Module 2 Answers

### A1: PDA for `{0ᵐ1ⁿ | m ≥ n ≥ 0}`

States: `q₀ (start), q₁ (push 0s), q₂ (pop for 1s), q₃* (accept)`.

Transitions:

- `q₀ → q₁`  on  `ε, ε → $`
- `q₁ → q₁`  on  `0, ε → 0`
- `q₁ → q₂`  on  `1, 0 → ε`
- `q₂ → q₂`  on  `1, 0 → ε`
- `q₁ → q₃`  on  `ε, $ → ε`  (n=0: all 0s with no 1s — ok)
- `q₂ → q₃`  on  `ε, $ → ε`  (n=m: stack exactly emptied)
- `q₂ → q₃`  on  `ε, 0 → 0`  (m > n: extra 0s remain — also ok)

**Yes, you should accept when the stack is non-empty** (still has
0s above `$`) — this corresponds to `m > n`, which satisfies `m ≥ n`.
The last transition handles this: move to `q₃` via ε even if 0s
remain, once all input is consumed.

---

### A2: PDA for `{w ∈ {a,b}* | #a(w) = #b(w)}`

Use stack symbols `A` (excess a) and `B` (excess b).

Transitions from `q_loop` (main loop state):

- Read `a`, top is `A` or `$`: push `A`  (add to excess a count)
- Read `a`, top is `B`: pop `B`           (cancel one excess b)
- Read `b`, top is `B` or `$`: push `B`  (add to excess b count)
- Read `b`, top is `A`: pop `A`           (cancel one excess a)
- End of input, top is `$`: accept

**Stack trace for `aabb`:**

```
Input: a  Stack: A$   (push A)
Input: a  Stack: AA$  (push A)
Input: b  Stack: A$   (pop A — cancel)
Input: b  Stack: $    (pop A — cancel)
End:   top is $ → ACCEPT
```

---

### A3: PDA / DPDA for `{aⁿbⁿcⁿ | n ≥ 0}`

**Neither an NPDA nor a DPDA can recognize this language.**

`{aⁿbⁿcⁿ}` is **not context-free**. The intuition:

- To match `a`s with `b`s, the PDA pushes symbols for `a`s, then
  pops them while reading `b`s. After reading all `b`s, the stack
  is empty (or at sentinel `$`).
- Now there is no memory left to count the `c`s and verify they
  equal `n`.
- The stack is a single channel of memory — it cannot simultaneously
  remember the count for two separate matching requirements once the
  first match is complete.

This language lies strictly outside the CFL hierarchy. It is
context-sensitive, not context-free.

---

## Module 3 Answers

### A1: CFGs

**(a) `{w ∈ {0,1}* | #0(w) = #1(w)}`**

```
S → SS | 0S1 | 1S0 | ε
```

**(b) `{0ᵐ1ⁿ | m ≠ n}` — split into two cases:**

```
S → A | B
A → 0A1 | 0U       (m > n: at least one extra 0)
U → 0U  | ε
B → 0B1 | V1       (m < n: at least one extra 1)
V → V1  | ε
```

---

### A2: CFG for palindromes and derivation of `abcba`

```
S → E
E → aEa | bEb | cEc | O | ε
O → a | b | c
```

**Derivation of `abcba`:**

```
S ⟹ E ⟹ aEa ⟹ abEba ⟹ abOba ⟹ abcba
```

Steps:

1. `S → E`
2. `E → aEa`  (wrap with a...a)
3. `E → bEb`  (wrap inner E with b...b)
4. `E → O`    (middle character handled by O)
5. `O → c`    (produce c)

---

### A3: CFG for `{aⁿbⁿ} ∪ {aⁿb²ⁿ}` and non-regularity

**CFG:**

```
S → X | Y
X → aXb | ε        (generates aⁿbⁿ)
Y → aYbb | ε       (generates aⁿb²ⁿ)
```

**Non-regularity argument (Pumping Lemma):**

Assume `L` is regular with pumping length `p`. Choose `s = aᵖbᵖ ∈ L`.
Since `|xy| ≤ p`, `y` consists of `a`s only: `y = aʲ` for `j ≥ 1`.

After pumping up: `xy²z = a^(p+j) bᵖ`.

For this to be in `L`, we need either `p+j = p` (impossible since
`j ≥ 1`) or `p+j = p/2` (impossible for `j ≥ 1` and integer `p`).

Therefore `xy²z ∉ L` → Pumping Lemma fails → `L` is not regular.

---

## Module 4 Answers

### A1: Pumping Lemma for `{0^(2ⁿ)}`

**Choose** `s = 0^(2ᵖ)`. Then `s ∈ L` and `|s| = 2ᵖ ≥ p`.

Since `1 ≤ |y| ≤ p`:

```
|xy²z| = 2ᵖ + |y|

Lower bound: 2ᵖ < 2ᵖ + |y|
Upper bound: 2ᵖ + |y| ≤ 2ᵖ + p < 2ᵖ + 2ᵖ = 2^(p+1)   (since p < 2ᵖ)
```

So `2ᵖ < |xy²z| < 2^(p+1)` — strictly between two consecutive powers
of 2, so `|xy²z|` is not a power of 2 → `xy²z ∉ L`.

**Conclusion:** Not regular.

---

### A2: Pumping Lemma for even-length palindromes

**Choose** `s = 0ᵖ1ᵖ1ᵖ0ᵖ`. This is a palindrome (symmetric), so
`s ∈ L`. Length is `4p ≥ p`.

Since `|xy| ≤ p`, both `x` and `y` lie in the first block of `p`
zeros. So `y = 0ʲ` for some `j ≥ 1`.

After pumping up:

```
xy²z = 0^(p+j) 1ᵖ 1ᵖ 0ᵖ
```

For this to be a palindrome, the string reversed must equal itself.
The first block has length `p+j`, but the last block has length `p`.
Since `j ≥ 1`, they differ → `xy²z` is not a palindrome → `∉ L`.

**Conclusion:** Not regular.

---

### A3: Closure argument for `{0ⁿ1ⁿ0ⁿ | n ≥ 0}`

We use the Pumping Lemma directly on `L = {0ⁿ1ⁿ0ⁿ}`:

**Choose** `s = 0ᵖ1ᵖ0ᵖ`. Then `s ∈ L` and `|s| = 3p ≥ p`.

Since `|xy| ≤ p`, `x` and `y` lie within the first zero block only.
So `y = 0ʲ` for some `j ≥ 1`.

After pumping up:

```
xy²z = 0^(p+j) 1ᵖ 0ᵖ
```

For this to be in `L`, the three segment lengths must all equal some
`n`. But `p+j ≠ p` (since `j ≥ 1`), so the counts are unequal →
`xy²z ∉ L`.

**Conclusion:** `L` is not regular.

**Bonus closure framing:** Alternatively, let `R = 0*1*0*` (regular).
Note `L ⊆ R`. If `L` were regular, the simpler structure `L ∩ R = L`
gives nothing new. But consider projecting onto the first two blocks:
the homomorphism `h` erasing the trailing 0-block maps `L` to
`{0ⁿ1ⁿ}`, a known non-regular language. If `L` is regular and `h`
is a regular operation, `h(L)` is regular — contradiction.

---

> Would you like to move to the next module, or would you like me to
> elaborate on a specific concept from this one?
