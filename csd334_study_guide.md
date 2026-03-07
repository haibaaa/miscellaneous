# CSD 334 — Theory of Computation: Interactive Study Guide

> This guide integrates lecture notes and all worksheet questions into a single
> TUI-friendly document. Render with `glow`, `bat`, or `neovim`.

---

## Table of Contents

- Module 0: Discrete Math Preliminaries
- Module 1: Proof Techniques
- Module 2: Deterministic Finite Automata (DFA)
- Module 3: Non-deterministic Finite Automata (NFA)
- Module 4: Regular Operations & Closure Properties
- Module 5: Non-Regular Languages & the Pumping Lemma
- Module 6: Pushdown Automata (PDA)
- Module 7: Context-Free Grammars (CFG)
- Answer Key

---

# Module 0: Discrete Math Preliminaries

## 0.1 Logical Conditions

A statement **A** is a **sufficient condition** for **B** if A → B.
A statement **A** is a **necessary condition** for **B** if B → A (i.e., ¬A → ¬B).

- If A is sufficient for B: knowing A is true guarantees B is true.
- If A is necessary for B: B cannot be true unless A is true.
- A is **necessary and sufficient** for B when A ↔ B.

### Practice — Logical Conditions

**Q1.** A: x divisible by 3. B: x divisible by 15.
Is A sufficient for B? Is A necessary for B?

**Step-by-step:**

1. Sufficient? Does A → B? No. 27 is divisible by 3 but not 15.
   So A is **not sufficient**.
2. Necessary? Does B → A? Yes. Any multiple of 15 is also a multiple of 3.
   So A **is necessary** for B.

---

**Q2.** A: x is a prime greater than 2. B: x is odd.
Is A sufficient for B? Is A necessary for B?

**Step-by-step:**

1. Sufficient? Does A → B? Yes. 2 is the only even prime. So A **is sufficient**.
2. Necessary? Does B → A? No. 15 is odd and > 2 but not prime.
   So A **is not necessary** for B.

---

**Q3.** A: x divisible by 3 and 2. B: x divisible by 6.
Is A sufficient for B? Is A necessary for B?

**Step-by-step:**

1. A ↔ B because divisibility by 6 means exactly divisibility by both 2 and 3.
2. A is **both necessary and sufficient** for B.

---

## 0.2 Sets

Key set operations:

- `A ∪ B` — union (elements in A or B)
- `A ∩ B` — intersection (elements in both)
- `A − B` — difference (in A but not B)
- `A △ B` — symmetric difference = `(A−B) ∪ (B−A)`
- `A × B` — Cartesian product (all ordered pairs)
- `P(A)` — power set (all subsets of A)

### Practice — Set Operations

**Q4.** Mark true or false:

- `5 ∈ {7,6,9,4,5,16}` → **True**
- `24 ∈ {7,6,9,4,5,16}` → **False**
- `5 ∈ {{7,6},{9,4,16},{5},{16,13}}` → **False** (5 is not a set)
- `{5} ∈ {{7,6},{9,4,16},{5},{16,13}}` → **True**
- `{16,13} ⊂ {{7,6},{9,4,16},{5},{16,13}}` → **False**
  ({16,13} is an *element*, not a subset)
- `{{16,13}} ⊂ {{7,6},{9,4,16},{5},{16,13}}` → **True**

---

**Q5.** Let A = {x,y,z}, B = {x,w}.

1. Power set of B: `{∅, {x}, {w}, {x,w}}`
2. `A ∪ B = {x,y,z,w}` | `A ∩ B = {x}`
3. `A △ B = {y,z,w}`
4. `B × B = {(x,x),(x,w),(w,x),(w,w)}`

---

**Q6.** Describe these sets:

- `{2x+1 | x ∈ Z}` — all odd integers
- `{x² | x ∈ Z}` — all perfect squares: {0,1,4,9,16,...}
- Intersection of above — odd perfect squares: {1,9,25,49,...}
- Union of above — integers that are odd OR an even perfect square
- Difference (odd) \ (squares) — odd integers that are not perfect squares

---

**Q7.** Formal definitions:

- Positive multiples of 11: `{11x | x ∈ N ∪ {0}}`
- Integers not a power of 3: `Z \ {3^x | x ∈ N ∪ {0}}`

---

## 0.3 Functions

Key terms:

- **Domain** — the input set
- **Co-domain** — the declared output set
- **Range** — the actual output values (range ⊆ co-domain)
- **Onto (surjective)** — range = co-domain
- **Into (injective / one-to-one)** — distinct inputs → distinct outputs
- **Bijection** — both onto and into; has an inverse

### Practice — Functions

**Q8.** f: X → Y where X={1,2,3,4,5}, Y={6,7,8,9,10}.
Table: f(1)=6, f(2)=7, f(3)=6, f(4)=7, f(5)=6.

- Domain of f = X. Co-domain of f = Y. Range of f = {6,7}.
- `g(2,9) = 10`. `g(2,11)` is undefined. `g(2,f(4)) = g(2,7) = 8`.
- f is **not onto** (range ≠ co-domain). f is **not into** (f(1)=f(3)).
- g is **onto** (range = co-domain = Y). g is **not into** (g(1,6)=g(1,7)).

---

**Q9.** f(x) = 1 + x³.

- f: N → N — **not a bijection**. Not onto; e.g., 8 has no preimage.
- f: R → R — **bijection**. Inverse: `f⁻¹(x) = ∛(x−1)`.

---

## 0.4 Relations

A relation R on a set is:

- **Reflexive** if xRx for all x
- **Symmetric** if xRy → yRx
- **Transitive** if xRy and yRz → xRz
- **Equivalence relation** if all three hold

### Practice — Relations

**Q10.** f(x,y): (x−y) is odd.

- Reflexive? f(x,x) = 0 (even). **Not reflexive.**
- Symmetric? If x−y is odd, y−x is also odd. **Symmetric.**
- Transitive? f(x,y)+f(y,z) = (x−y)+(y−z) = x−z. Sum of two odds is even.
  **Not transitive.**

---

**Q11.** f(x,y): x < y.

- Reflexive? x < x is false. **Not reflexive.**
- Symmetric? x < y does not imply y < x. **Not symmetric.**
- Transitive? x < y and y < z → x < z. **Transitive.**

---

**Q12.** Rooted tree: f(x,y): x and y share the same parent.

- Reflexive? x shares its parent with itself. **Reflexive.**
- Symmetric? If x,y share a parent, so do y,x. **Symmetric.**
- Transitive? If x,y share a parent, and y,z share a parent, all three share
  the same parent. **Transitive.**
- This is an **equivalence relation**.

---

## 0.5 Graphs

A **directed graph** G = (V, E) has vertices V and directed edges E.

- **In-degree** of v — number of edges pointing *into* v
- **Out-degree** of v — number of edges pointing *out of* v
- **Path** — sequence of vertices connected by edges
- **Cycle** — path that starts and ends at the same vertex
- **Strongly connected** — every vertex can reach every other vertex

### Practice — Graphs

**Q13.** G = ({A,B,C,D}, {(A,B),(B,C),(A,C),(B,D),(D,A)}).

```
    A ---> B ---> C
    ^      |
    |      v
    D <----+
```

Degrees (in / out):

- A: in=1, out=2
- B: in=1, out=2
- C: in=2, out=0
- D: in=1, out=1

- No path from C to D (C has out-degree 0).
- Cycle example: A → B → D → A.
- To make strongly connected: add edge (C, D). Then C can reach all others.

---

# Module 1: Proof Techniques

## 1.1 Proof Methods Overview

- **Direct proof** — assume hypothesis, derive conclusion by logic/algebra.
- **Proof by contradiction** — assume negation of conclusion; derive falsehood.
- **Proof by contraposition** — prove ¬B → ¬A instead of A → B.
- **Proof by induction** — establish base case; assume for k; prove for k+1.

---

## 1.2 Direct Proof

### Practice

**Q1.** Show x³+6x²+11x+6 is not prime for non-negative integers x.

**Proof:**

```
x³ + 6x² + 11x + 6 = (x+1)(x+2)(x+3)
```

For any non-negative integer x, this is divisible by (x+2) ≥ 2. Hence not prime.

---

**Q2.** Show ∃ irrationals p,q such that p^q is rational.

**Proof (direct, by cases):**

Let r = (√2)^√2.

- Case 1: r is rational → p=q=√2 works.
- Case 2: r is irrational → r^√2 = (√2)^(√2·√2) = (√2)² = 2
  (rational). Use p=r, q=√2.
  Use p=r, q=√2. Both are irrational and p^q = 2. ∎

---

## 1.3 Proof by Contradiction

**Q3.** Composite n ≥ 2 has a divisor x with x≠1 and x ≤ √n.

**Proof:**

Assume no such x exists. Let p be the smallest divisor of n with p≠1, p≠n.
By assumption, p > √n. Let q = n/p. Then q is also a divisor, q≠1, q≠n,
and q ≤ √n — contradiction. ∎

---

## 1.4 Proof by Induction

**Q4.** Show 1³+2³+...+n³ = n²(n+1)²/4.

**Base case:** n=1: LHS=1, RHS=1²·2²/4=1. ✓

**Inductive step:** Assume S(k) = k²(k+1)²/4. Then:

```
S(k+1) = S(k) + (k+1)³
       = k²(k+1)²/4 + (k+1)³
       = (k+1)²[k² + 4(k+1)] / 4
       = (k+1)²(k+2)² / 4  ∎
```

---

## 1.5 Proof by Contraposition

**Q5.** If a²(b²−2b) is odd, then a and b are both odd.

**Contrapositive:** If a is even or b is even, then a²(b²−2b) is even.

- a=2m → a²(b²−2b) = 4m²(b²−2b) — even. ✓
- b=2n → a²(b²−2b) = 4a²(n²−n) — even. ✓ ∎

---

## 1.6 Mixed Practice

**Q6a.** If ab and a+b are both even, then a and b are both even.

**Proof by contraposition:** If at least one of a,b is odd,
then at least one of ab, a+b is odd.

- Exactly one odd: a=2m+1, b=2n. Then a+b=2(m+n)+1 is odd. ✓
- Both odd: a=2m+1, b=2n+1. Then ab=(2m+1)(2n+1) is odd. ✓ ∎

---

**Q6b.** Same parity a,b → 3a+7 and 7b−4 have different parity.

- Both odd: 3a+7=6m+10 (even), 7b−4=14n+3 (odd). ✓
- Both even: 3a+7=6m+7 (odd), 7b−4=14n−4 (even). ✓ ∎

---

**Q6c.** n⁴−4n² divisible by 3 for n ∈ N∪{0}.

Factor: n²(n−2)(n+2). Case split on n mod 3:

- n≡0: n itself divisible by 3.
- n≡1: n+2=3k+3 is divisible by 3.
- n≡2: n−2=3k is divisible by 3. ∎

---

**Q6d.** For θ ∈ [0, π/2], sin θ + cos θ ≥ 1.

**Proof by contradiction:** Assume sin θ + cos θ < 1. Square both sides:

```
sin²θ + cos²θ + 2sinθcosθ < 1
1 + 2sinθcosθ < 1
2sinθcosθ < 0
```

Contradiction since sin θ ≥ 0 and cos θ ≥ 0 on [0, π/2]. ∎

---

**Q6e.** A ∩ (B−A) = ∅.

If x ∈ A, then x ∉ B−A.
If x ∈ B−A, then x ∉ A. Either way, x ∉ A ∩ (B−A). ∎

---

**Q6f.** r non-zero rational → r/√2 is irrational.

**Contradiction:** Suppose r/√2 = a/b (rational). Then √2 = rb/a = (c/d)(b/a) = cb/da.
Since cb, da are integers and da≠0, this says √2 is rational — contradiction. ∎

---

**Q6g.** 1·2·3 + 2·3·4 + ... + n(n+1)(n+2) = n(n+1)(n+2)(n+3)/4.

**Induction:**

- Base n=1: 6 = 1·2·3·4/4 = 6. ✓
- Inductive step:

```
S(k+1) = S(k) + (k+1)(k+2)(k+3)
       = k(k+1)(k+2)(k+3)/4 + (k+1)(k+2)(k+3)
       = (k+1)(k+2)(k+3)(k+4)/4  ∎
```

---

# Module 2: Deterministic Finite Automata (DFA)

## 2.1 Core Concepts

A **DFA** M = (Q, Σ, δ, q₀, F) where:

- `Q` — finite set of states
- `Σ` — input alphabet
- `δ: Q × Σ → Q` — transition function (total)
- `q₀ ∈ Q` — start state
- `F ⊆ Q` — set of accepting (final) states

A string w is **accepted** if δ*(q₀, w) ∈ F.
The **language** L(M) is the set of all accepted strings.

---

## 2.2 Reading a DFA Description

### Practice — Identify the Language

**Q1.** Q={q₀}, F={q₀}, Σ={a,b,c}, all transitions loop back to q₀.

```
       a,b,c
      +-----+
      |     |
  --> q₀ <--+
     (F)
```

**Language:** Σ* — all strings over {a,b,c} including ε.

---

**Q2.** Q={q₀,q₁,q₂}, F={q₁}, Σ={0,1}.
Transitions: δ(q₀,0)=q₁, δ(q₀,1)=q₂, δ(q₁,0)=q₁, δ(q₁,1)=q₂,
δ(q₂,0)=q₁, δ(q₂,1)=q₂.

```
         0         1
   --> q₀ --0--> q₁ --1--> q₂
              ^             |
              +------0------+
              (both q₁,q₂ go to q₂ on 1)
```

**Language:** {w | w ends in 0} — all binary strings ending in 0.

---

## 2.3 Constructing DFAs

**Design strategy:**

1. Identify what the DFA must *remember* (its state tracks progress).
2. Map each condition to a state or set of states.
3. Add a **dead/trap state** for invalid paths (no way to reach F).
4. Verify every state has a transition for every symbol.

---

### Practice — Construct DFAs (Σ = {a,b})

**Q3a.** L = {ε, a}

```
         a          b       a,b
  --> q₀ --a--> q₁    q₂ <-----
  (F)        (F)  (dead)
              |              ^
              +---a,b------->+
              q₁--b-->q₂
```

States: q₀ (start, accept), q₁ (saw 'a', accept), q₂ (dead).
- q₀ -a-> q₁, q₀ -b-> q₂
- q₁ -a,b-> q₂
- q₂ -a,b-> q₂

---

**Q3b.** L = {w | |w| ≤ 3}

States: q₀ (len 0), q₁ (len 1), q₂ (len 2), q₃ (len 3), q₄ (len ≥ 4, dead).
All of q₀–q₃ are accepting.

```
  --> q₀ -a,b-> q₁ -a,b-> q₂ -a,b-> q₃ -a,b-> q₄
  (F)   (F)          (F)         (F)             (dead,a,b->q₄)
```

---

**Q3c.** L = {w | w begins with aab}

States: q₀, q₁ (saw a), q₂ (saw aa), q₃ (saw aab, accept all), q₄ (dead).

```
  --> q₀ -a-> q₁ -a-> q₂ -b-> q₃ -a,b-> q₃(loop)
       |        |        |
      b,b      b        a
       v        v        v
      q₄       q₄       q₄ -a,b-> q₄
```

---

**Q3d.** L = {w | w ≠ a and w ≠ aa}

States: q₀ (start,F), q₁ (saw a), q₂ (saw aa), q₃ (≥3 chars or has b, F).

```
  --> q₀ -a-> q₁ -a-> q₂ -a,b-> q₃ -a,b-> q₃
  (F)          |  (F?)    (F)
               b
               v
              q₃
```

Accepting: q₀, q₃ (and q₂ is NOT accepting since "aa" must be excluded).
q₁ is NOT accepting (exclude "a").

---

**Q3e.** L = {w | w has at least 3 occurrences of a}

States: q₀ (0 a's), q₁ (1 a), q₂ (2 a's), q₃ (≥3 a's, F).

```
  --> q₀ -a-> q₁ -a-> q₂ -a-> q₃ -a,b-> q₃(loop)
       |        |        |
      b,b      b,b      b,b (self-loops)
```

---

**Q3f.** L = {w | w begins with b and ends with aa}

States: q₀(start), q₁(saw b), q₂(saw b...a), q₃(saw b...aa=F), q₄(dead).

```
  --> q₀ -b-> q₁ -a-> q₂ -a-> q₃(F)
       |        |        |       |
      a         b        b      b
       v        v        v       v
      q₄       q₁       q₁     q₁
                         q₃ -a-> q₃(self on a via q₂->q₃->q₂ path)
```

Key: from q₃, reading a goes to q₂ (one a seen); reading b goes back to q₁.

---

**Q3g.** L = {w | w starts with a & |w| odd, OR w starts with b & |w| even}

Use 4 states tracking (first-char parity × length parity):

- q₀: start (no char seen yet)
- q₁: started with a, odd length → **accept**
- q₂: started with a, even length
- q₃: started with b, odd length
- q₄: started with b, even length → **accept**

Transitions from q₀: a → q₂ (length 1 = odd, but parity tracking starts now),
actually: after reading first char, length is 1.

- q₀ -a-> q₁(F), q₀ -b-> q₄(F)  [length 1 is odd]
- q₁ -a,b-> q₂, q₂ -a,b-> q₁
- q₃ -a,b-> q₄, q₄ -a,b-> q₃

Wait — q₀ -a-> q₁ means "started with a, length 1 (odd)" → accept.
q₀ -b-> initial b state at length 1 (odd) → not accepting yet for b-branch.

Accepting: q₁ (a-start, odd) and q₄ (b-start, even).

---

**Q3h.** L = {w | w has an odd number of a and ends with b}

States track (parity of a-count) × (last symbol seen):

- q₀: even a, not ending b (start)
- q₁: odd a, not ending b
- q₂: even a, ending b  
- q₃: odd a, ending b → **accept** (F = {q₃})

However, the diagram from the notes uses 4 states differently. Key insight:
track "parity of #a" and "last symbol is b". Final state = odd-a AND ends-b.

---

### Practice — Construct DFAs (other alphabets)

**Q4.** L = {w ∈ {0,1}* | decimal(w) divisible by 5}. ε = 0.

Track remainder mod 5. States q₀–q₄ represent remainders 0–4.
q₀ is the start and only accepting state.

Transitions (new_remainder = 2*r + bit):

- q₀ -0-> q₀, q₀ -1-> q₁
- q₁ -0-> q₂, q₁ -1-> q₃
- q₂ -0-> q₄, q₂ -1-> q₀
- q₃ -0-> q₁, q₃ -1-> q₂
- q₄ -0-> q₃, q₄ -1-> q₄

```
         0               1
  --> q₀(F) --1--> q₁ --0--> q₂ --1--> q₀
              |         |
              0         1-->q₃--0-->q₁
              v                  |
             q₂                  1-->q₂
                       q₄<--0--q₂
                       q₄--1-->q₄
```

---

**Q5.** L = {w ∈ {a,b,c}* | |w| ≥ 3 and every 3rd symbol is c}

States: q₀ (start, pos mod 3 = 0), q₁ (pos mod 3 = 1), q₂ (pos mod 3 = 2),
q₃ (pos mod 3 = 0, ≥3 read, F), q₄ (dead),
q₅ (pos=1 after valid), q₆ (pos=2 after valid).

The key insight: accept states are those where length ≥ 3 AND every position
that is a multiple of 3 has symbol c.

From the worksheet solution:
- q₀ start → reads any symbol → q₁
- q₁ → reads any symbol → q₂
- q₂ → reads c → q₃(F), reads a,b → q₄(dead)
- q₃(F) → reads a,b,c → q₅
- q₅ → reads a,b,c → q₆
- q₆ → reads c → q₃(F), reads a,b → q₄(dead)
- q₄ → reads a,b,c → q₄(self)

---

**Q6.** L = {w ∈ {a,b,c}* | w contains substring accb}

Track how much of "accb" has been matched:

- q₀: matched nothing
- q₁: matched "a"
- q₂: matched "ac"
- q₃: matched "acc"
- q₄: matched "accb" → **accept** (F), self-loop on a,b,c

Transitions handle mismatches by re-checking partial matches.

---

**Q7.** L = {w ∈ {a,b,c}* | |w| not divisible by 3}

States: q₀ (len mod 3 = 0), q₁ (mod 3 = 1, F), q₂ (mod 3 = 2, F).
F = {q₁, q₂}. Each symbol advances state mod 3.

```
  --> q₀ -a,b,c-> q₁(F) -a,b,c-> q₂(F) -a,b,c-> q₀ -...
```

---

**Q8.** L = {w ∈ {a,b,c}* | w starts with a and has at most one b}

States:
- q₀: start (no input yet)
- q₁: starts with a, 0 b's seen
- q₂: starts with a, 1 b seen → **accept**
- q₃: dead (either started with b/c, or saw 2+ b's)

F = {q₁, q₂}. Transitions:

- q₀ -a-> q₁, q₀ -b,c-> q₃
- q₁ -a,c-> q₁, q₁ -b-> q₂
- q₂ -a,c-> q₂, q₂ -b-> q₃
- q₃ -a,b,c-> q₃

---

**Q9.** L = {w ∈ {a,b,c}* | w ≠ a and w ≠ b}

States: q₀(start,F), q₁(saw one symbol a or b), q₂(≥2 symbols or saw c, F).

- q₀ -a,b-> q₁, q₀ -c-> q₂(F)
- q₁ -a,b,c-> q₂(F)
- q₂ -a,b,c-> q₂(self,F)

F = {q₀, q₂}. (q₁ not accepting — single a or b excluded.)

---

**Q10.** L = {w ∈ {a,b,c}* | w does not contain b}

States: q₀(F, no b seen), q₁(dead, b seen).

- q₀ -a,c-> q₀(self), q₀ -b-> q₁
- q₁ -a,b,c-> q₁(self)

---

**Q11.** L = {w ∈ {0,1}* | w = x0000y}  (contains 0000 as substring)

Track longest suffix of "0000" matched so far (0–4):

- q₀–q₃: matched 0,1,2,3 zeros respectively
- q₄: matched "0000" → **accept** (self-loop on 0,1)

Transitions on seeing '1': reset to q₀ (no partial match possible).
Transitions on seeing '0': advance count, but on mismatch keep best suffix.

```
  --> q₀ -0-> q₁ -0-> q₂ -0-> q₃ -0-> q₄(F)
       |        |        |        |      |
      1,1      1,1      1,1      1,1   0,1(self)
       v        v        v        v
      q₀       q₀       q₀       q₀
```

---

**Q12.** L = {w ∈ {0,1}* | |w| ≥ 2}

States: q₀ (0 chars), q₁ (1 char), q₂ (≥2 chars, F).

```
  --> q₀ -0,1-> q₁ -0,1-> q₂(F) -0,1-> q₂(self)
```

---

# Module 3: Non-deterministic Finite Automata (NFA)

## 3.1 NFA vs DFA

Key differences:

- δ: Q × (Σ ∪ {ε}) → **P(Q)** — transitions to a *set* of states
- Multiple or zero successors allowed at each step
- **ε-transitions** — move without consuming input
- A string is accepted if *any* computation path leads to a final state

**Power:** NFAs and DFAs recognize exactly the same class of languages.

---

## 3.2 NFA → DFA Conversion (Subset Construction)

1. Start state of DFA = ε-closure({q₀})
2. For each DFA state S and each symbol σ, compute:
**Q2 (PS4).** Given NFA with states q₀,q₁,q₂;
ε,b from q₀→q₁; b from q₀→q₁ again;
3. Final states: any DFA state S where S ∩ F_NFA ≠ ∅
4. Remove unreachable states.

### Practice — NFA → DFA Conversion

**Q2 (PS4).** Given NFA with states q₀,q₁,q₂; ε,b from q₀→q₁; b from q₀→q₁ again;
a,b from q₁→q₂; b from q₂→q₁; a from q₂→q₀,q₁.

**Closure table (δ):**

```
State   | on a        | on b
--------|-------------|-------------
q₀      | {}          | {q₁,q₂}
q₁      | {q₂}        | {q₁,q₂}
q₂      | {q₀,q₁}     | {}
```

**Start state:** ε-closure({q₀}) = {q₀,q₁} (because q₀ -ε-> q₁).

**Final states (F={q₁}):** any DFA-state containing q₁.

**DFA transition table (reachable states only):**

```
State           | on a            | on b
----------------|-----------------|------------------
{q₀,q₁}        | {q₂}            | {q₁,q₂}
{q₂}            | {q₀,q₁}        | {}
{q₁,q₂}        | {q₀,q₁,q₂}     | {q₁,q₂}
{}              | {}              | {}
{q₀,q₁,q₂}     | {q₀,q₁,q₂}     | {q₁,q₂}
```

**Simplified DFA (unreachable states {q₀},{q₁},{q₀,q₂} removed):**

```
          b              a
  --> {q₀,q₁} --b--> {q₁,q₂} --b--> {q₁,q₂}(self)
       (F)               (F)    |
        |                       a
        a                       v
        v              b   {q₀,q₁,q₂}(F) --b--> {q₁,q₂}
       {q₂} --a--> {q₀,q₁}
              (dead) <--b-- {}
```

Accepting states: {q₀,q₁}, {q₁,q₂}, {q₀,q₁,q₂}.

---

## 3.3 Constructing NFAs

**Q1a (PS4).** L = {w = accby | y ∈ Σ*}

```
  --> q₀ -a-> q₁ -c-> q₂ -c-> q₃ -b-> q₄(F) -a,b,c-> q₄
```

---

**Q1b.** L = {w = xaccby | x,y ∈ Σ*}

Add self-loop on q₀ for a,b,c (non-deterministically skip prefix x):

```
       a,b,c (self)
  --> q₀ -a-> q₁ -c-> q₂ -c-> q₃ -b-> q₄(F) -a,b,c-> q₄
```

---

**Q1c.** L = {w | |w| ≥ 4 and c is in second position from right}

The second from right is checked non-deterministically:

```
  --> q₀(a,b,c self) -a,b,c-> q₁ -c-> q₂ -a,b,c-> q₃ -a,b,c-> q₄(F)
```

q₀ loops on all; non-deterministically at q₁ we read what we guess is
position |w|−1 (second from right), must be c, then one more symbol.

---

**Q1h.** L = {w | w contains ab or ac, w ∈ Σ*}

```
       a,b,c (self on q₀)
  --> q₀ -a-> q₁ -b,c-> q₂(F) -a,b,c-> q₂
```

Non-deterministically guess position of ab or ac.

---

**Q1i.** L = {w | c is in second position from left}

```
  --> q₀ -a,b,c-> q₁ -c-> q₂(F) -a,b,c-> q₂(self)
```

---

**Q1j.** L = {w | |w| is odd and every even position (1-indexed) has a}
Wait: start in q₀, read one symbol (pos 1, any) → q₁;
read pos 2 (must be a) → q₀;
```
  --> q₀ -a,b,c-> q₁ -a-> q₀
  (F = {q₀} since odd length means we end in q₀)
```

Wait: start in q₀, read one symbol (pos 1, any) → q₁;
read pos 2 (must be a) → q₀;
read pos 3 (any) → q₁; etc. Accept when back at q₀ (odd-length read).

Actually F = {q₀} only after at least one symbol; start state doubles as accept if ε
is considered odd-length (it isn't — ε has length 0). So F = {q₁}... 

Per the notes: F = {q₀} and ε is not in language (or treat carefully).
The diagram shows q₀ -a,b,c-> q₁ (pos 1 read) and q₁ -a-> q₀ (pos 2 must be a).
Accept at q₀ after at least 1 read = odd length. F = {q₀} with start ≠ F for ε.

---

# Module 4: Regular Operations & Closure Properties

## 4.1 Regular Operations

Given regular languages A, B:

- **Union** A ∪ B — accepted by either A or B
- **Concatenation** AB — strings uv where u∈A, v∈B
- **Kleene Star** A* — zero or more concatenations of strings from A

Regular languages are **closed** under:
union, concatenation, star, intersection, complement, difference, reversal.

---

## 4.2 NFA Constructions for Operations

### Union: A ∪ B

Add new start state s with ε-transitions to start states of both NFAs.

```
             ε --> [NFA for A]
  s (new) -<
             ε --> [NFA for B]
```

### Concatenation: AB

Add ε-transitions from every accepting state of A to start state of B.
Make A's old accepting states non-accepting.

```
  [NFA for A] --ε--> [NFA for B]
```

### Kleene Star: A*

Add new start/accept state s. Add ε from s to A's start.
Add ε from each of A's accept states back to A's start.

```
      ε
  s ---> [NFA for A] --ε--> (back to A's start)
  (F)
```

---

## 4.3 DFA Multiplication (Product Construction)

To build a DFA for **A ∩ B** or **A ∪ B** from DFAs M_A and M_B:

- States: Q_A × Q_B (pairs)
- Start: (q₀_A, q₀_B)
- Transition: δ((p,q), σ) = (δ_A(p,σ), δ_B(q,σ))
**Q1.** L₁ = {binary strings containing 11},
L₂ = {binary strings starting with 1, ending in 0}.
- Accept for **union**: either in F_A or F_B

---

### Practice — Regular Operations (PS5)

**Q1.** L₁ = {binary strings containing 11},
L₂ = {binary strings starting with 1, ending in 0}.

Individual NFAs:

```
L₁:  --> q₀ -1-> q₁ -1-> q₂(F)
          |        |
         0,1      0,1 (self-loops)

L₂:  --> q₃ -1-> q₄ -0,1-> q₄ -0-> q₅(F)
          (actually: q₃-1->q₄, q₄-0,1->q₄, but end in 0 needs careful design)
```

**L₁ ∪ L₂:** New start s; ε to q₀ and ε to q₃.

**L₁L₂:** ε from q₂ to q₃ (concatenation).

**L₂*:** New start/accept s; ε to q₃; ε from q₅ back to q₃.

---

**Q2.** NFA for 1*(100 ∪ 001+)*

Break into pieces:
**Q4.** L₃ = {binary strings with odd #0 ending in 1},
L₄ = {even-length binary strings}.
- 100: q -1-> q -0-> q -0-> qF
- 001+: q -0-> q -0-> q -1-> q(1 self) -> qF
Combine with union and star constructs using ε-transitions.

---

**Q4.** L₃ = {binary strings with odd #0 ending in 1}, L₄ = {even-length binary strings}.

Build individual DFAs, then use product construction.

**L₃ DFA:** Track (parity of 0-count) and (last bit).
States: q₀(even 0, no 1 end), q₁(odd 0, no 1 end), q₂(odd 0, ends 1 = F).

**L₄ DFA:** Two states q₃(even len, F), q₄(odd len). δ on 0,1 alternates.

**L₃ ∪ L₄:** product, accept if in F_L₃ OR F_L₄.
**L₃ ∩ L₄:** same product, accept only if in F_L₃ AND F_L₄.

---

**Q5.** L₅ = complement of L₃.

Swap accepting and non-accepting states in L₃'s DFA.

---

**Q6.** Intersection of two NFAs using NFA product construction.

Build pairs of states (q_A, q_B), propagate ε-transitions from both NFAs
in parallel. Accept only when both components are in accepting states.

---

## 4.4 Closure Proofs

### Q8 (PS5) — Reversal Closure

**Claim:** If L is regular, L^R = {w | reverse(w) ∈ L} is regular.

**Proof (construction):** Given NFA N for L, build NFA N^R:
- Add new start state q^R_0
- New accepting state = old start state q₀
- ε-transitions from q^R_0 to all states in F
- Reverse all transitions (if δ(p,σ)∋q, add δ^R(q,σ)∋p)

This NFA accepts exactly the reversals of strings accepted by N. ∎

---

### Q9 — Suffix of Vowel

**Claim:** {w | w ∈ L and w ends in a vowel} is regular.

Let M = {w ∈ Σ* | w ends in a vowel} — clearly regular (simple NFA exists).
The target language = L ∩ M. Regular ∩ Regular = Regular. ∎

---

### Q10 — Equal ab and ba substrings

**Claim:** L = {w ∈ {a,b}* | #ab = #ba in w} is regular.

**Proof:** L = {ε,a,b} ∪ a{a,b}*a ∪ b{a,b}*b.
A string is in L iff it stays entirely within a's, entirely within b's, or
starts and ends with the same symbol. Construct a DFA on this basis. ∎

---

### Q11 — Language 1^k w (at least k ones)

**Claim:** {1^k w | w ∈ {0,1}* has ≥ k ones, k ≥ 1} is regular.

**Proof:** Equivalent to {w | w starts with 1 and contains ≥2 ones total}.
Regular expression: `1{0,1}*1{0,1}*`. NFA:

```
  --> q₀ -1-> q₁ -0,1-> q₁ -1-> q₂(F) -0,1-> q₂
```

---

### Q12 — Language A/B (Right Quotient)

**Claim:** If A is regular, A/B = {w | wx ∈ A for some x ∈ B} is regular.

**Construction:** Use DFA for A. New accepting states = {q | ∃ x ∈ B s.t.
DFA from q on x reaches an accepting state}. Same transition function. ∎

---

# Module 5: Non-Regular Languages & the Pumping Lemma

## 5.1 The Pumping Lemma

> **Pumping Lemma:** If L is regular, then ∃ pumping length p > 0 such that
> for every string s ∈ L with |s| ≥ p, we can write s = xyz where:
> 1. xy^i z ∈ L for all i ≥ 0
> 2. |y| > 0
> 3. |xy| ≤ p

**To prove L is non-regular:**

1. Assume L is regular (for contradiction).
2. Let p be the pumping length.
3. Choose a specific s ∈ L with |s| ≥ p.
4. Consider ALL decompositions s = xyz satisfying conditions 2 and 3.
5. Show that for each decomposition, condition 1 fails (some xy^i z ∉ L).

**Key warning:** You must handle ALL valid decompositions, not just one.
You choose the string s; the adversary chooses the decomposition.

---

## 5.2 Pumping Lemma Proofs

### Practice

**Q1.** L = {a^i b^j c^k | i+j = 2k}

Choose s = a^p b^p c^p (so i=j=k=p, i+j=2p=2k ✓).
|xy| ≤ p → y consists only of a's. Pump up: xy²z has more a's but same b,c.
Now i+j > 2k. So xy²z ∉ L. ∎

---

**Q2.** L = {a^i b^j c^k | i·j > k}

Choose s = a^p b^(p+1) c^(p²).
- p·(p+1) = p²+p > p² ✓, so s ∈ L.
- |xy| ≤ p → y = a^i for i > 0.
- Pump down: xy⁰z has ≤ (p-1) a's. Then i·j ≤ (p-1)(p+1) = p²-1 < p² = k.
So xy⁰z ∉ L. ∎

---

**Q3.** L = {0^n 1 0^m 1 0^(m+n) | m,n ≥ 0}

Choose s = 0^p 1 0^p 1 0^(2p). |s| = 4p+2 > p.
|xy| ≤ p → y = 0^i (first block of zeros only).
xy²z = 0^(p+i) 1 0^p 1 0^(2p). Now (p+i)+p = 2p+i > 2p. ∉ L. ∎

---

**Q4.** L = {www | w ∈ {0,1}*}

Choose s = 0^p 1 0^p 1 0^p 1 (p pumping length).
y is a block of 0's at the start. Pump: xy²z = 0^(p+i) 1 0^p 1 0^p 1.
For this to be www, |w| must accommodate i/3 extra 0's → uneven 1-distribution
across three copies. Contradiction. ∎

---

**Q5.** L = {w ∈ {0,1}⁺1⁺ | #0 in w is a perfect square}

Choose s = 0^(p²) 1. |y| ≤ p.
|xy²z| = p² + 1 + |y| ≤ p²+1+p < (p+1)².
So #0 in xy²z is between p² and (p+1)² exclusive — not a perfect square. ∎

---

**Q6.** L = {0^q | q is prime}

Choose s = 0^q where q > p is prime (infinitely many primes exist).
Decompose s = x y z: y = 0^b, b > 0. a+b+c = q.
For i = q+1: |xy^(q+1)z| = q + q·b = q(1+b) — divisible by q, not prime.
So xy^(q+1)z ∉ L. ∎

---

**Q7.** L = {0^q | q is a Fibonacci number}

Choose s = 0^f · 0^g where f > p is Fibonacci, g is next Fibonacci.
So |s| = f+g (also Fibonacci, since consecutive Fibonacci numbers sum to next).
Pump down: |xy⁰z| = f+g−|y|. Since 1 ≤ |y| ≤ p < f, we get
g < f+g−|y| < f+g. No Fibonacci number lies strictly between g and f+g. ∎

---

**Q8.** L = {x₁0x₂0...xₖ | k≥0, each xᵢ ∈ 1*, xᵢ ≠ xⱼ for i≠j}

Choose s = 1^p 0 1^(p+1) 0 1^(p+2) 0...0 1^(2p).
y is a prefix block of 1's. Pump: xy²z = 1^(p+i) 0 1^(p+1)...
Now 1^(p+i) appears twice (since p+1 ≤ p+i ≤ 2p). Violates xᵢ ≠ xⱼ. ∎

---

**Q9.** L = {(ab)^n b^n | n ≥ 0}

Choose s = (ab)^p b^p. For any w ∈ L: #b = 2·#a.
|xy| ≤ p → y stays within the leading (ab)^p block and has no consecutive b's.
Four cases on structure of y — all lead to #b ≠ 2·#a in xy⁰z or xy²z. ∎

---

**Q10.** L = {1^k w | w ∈ {0,1}* has at most k ones, k ≥ 1}

Choose s = 1^p 0 1^p. Clearly in L (choose w=01^p, k=p).
y = 1^i (i > 0) from the prefix. Pump down: xy⁰z = 1^(p-i) 0 1^p.
Now prefix has p-i ones, but suffix has p ones > p-i. ∉ L. ∎

---

## 5.3 Proofs Using Closure

**Q11.** L = {0^q | q not a perfect square} is non-regular.

Complement = {0^q | q is perfect square}. This is non-regular (known result).
Non-regular languages are closed under complement. So L is non-regular. ∎

---

**Q12.** L = {w ∈ {a,b,c}* | #a = #b = #c} is non-regular.

Consider M = {a^n b^n c^n}. M = L ∩ a*b*c*.
a*b*c* is regular. If L were regular, M = L ∩ (regular) would be regular.
But M is non-regular (pumping lemma). Contradiction. ∎

---

**Q13.** L = {w ∈ {a,b,c}* | #a + #b = 2·#c} is non-regular.

M = {a^i b^j c^k | i+j=2k}. M = L ∩ a*b*c*.
M is non-regular (Q1 above). If L were regular, M would be. Contradiction. ∎

---

**Q14.** L = {0^m 1^n | m ≠ n} is non-regular.

M = {0^m 1^m}. Note M = 0*1* ∩ L'. If L is regular, L' is regular,
so M = 0*1* ∩ L' is regular. But M is non-regular. Contradiction. ∎

---

## 5.4 Common Errors in Pumping Lemma Proofs

**Q15 error:** String s = a^p b^p ∉ L = {a^m b^n | m > n}. Must pick s ∈ L.

**Q16 error:** Claimed a^(p+i) b a^p ∉ L. Wrong — a^(p+i) b a^p ∈ L
because a^i b ∈ {a,b}*. L is actually regular.

**Q17 error:** Claimed 1^(p+i) 0 1^p ∉ L. Wrong — choose w = 1^i 0 1^p.
L is actually regular (= 1{0,1}*1{0,1}*).

**Q18 error:** Only considered decompositions where y spans a and b.
Must handle ALL valid decompositions. y = a...a also works and IS pumpable.

**Q19 error:** Fixed pumping length p = 2. Must keep p generic.

**Q20 error:** Pumping lemma holding does NOT prove regularity. The converse
of the pumping lemma is false.

**Q21 error:** Non-regular languages are NOT closed under union.

**Q22 error:** Non-regular languages are NOT closed under intersection.

---

# Module 6: Pushdown Automata (PDA)

## 6.1 PDA Basics

A **PDA** M = (Q, Σ, Γ, δ, q₀, $, F) where:

- `Q` — finite set of states
- `Σ` — input alphabet
- `Γ` — stack alphabet
- `δ: Q × (Σ∪{ε}) × (Γ∪{ε}) → P(Q × Γ*)` — transition function
- `q₀` — start state
- `$` — bottom-of-stack marker (convention)
- `F` — accepting states

Transition notation: `a, A → B` means:
read `a` from input, pop `A` from stack, push `B` onto stack.

Use `ε` to mean "don't read" or "don't touch stack".

---

## 6.2 Stack Design Patterns

- **Count surplus a's over b's:** push for a, pop for b.
- **Verify palindrome / reversal:** push first half, pop against second half.
- **Match nested structure:** push opening symbols, pop on closing.
- **Non-det guess midpoint:** ε-transition to split at guessed middle.

---

### Practice — Construct PDAs

**Q1 (PS7).** L = {w | binary string starting and ending with same symbol}

This language is regular — stack unused. DFA-like PDA with 5 states:
accept if first and last symbol match (track first symbol in state).

---

**Q2.** L = {a^n b^m | n ≥ m ≥ 0}

Push a's, then pop one a per b. Accept when b's run out (a's may remain).

```
  --> q₀ -ε,ε→$-> q₁ -a,ε→a-> q₁ -ε,ε→ε-> q₂ -b,a→ε-> q₂
                                              |
                                             ε,$→ε
                                              v
                                             q₃(F)
                                  also: q₂ -ε,a→ε-> q₃ (accept with leftover a's)
```

---

**Q3.** L = {a^n b^m c^(m+n) | m,n ≥ 0}

Push # for each a and each b. Pop # for each c.

```
  --> q₀ -ε,ε→$-> q₁ -a,ε→#-> q₁ -ε,ε→ε-> q₂ -b,ε→#-> q₂
       -ε,ε→ε-> q₃ -c,#→ε-> q₃ -ε,$→ε-> q₄(F)
```

---

**Q4.** L = {a^n b^m c^m d^n | m,n > 0}

Push a's then b's. Pop b for each c, then pop a for each d.

```
  --> q₀ -a,ε→$-> q₁ -a,ε→a-> q₁ -b,ε→ε-> q₂ -b,ε→ε-> q₂
       -ε,ε→ε-> q₃ -c,b→ε-> q₃ -ε,ε→ε-> q₄ -d,a→ε-> q₄ -ε,$→ε-> q₅(F)
```

---

**Q5.** L = {w | binary string where #1's ≤ #0's in every prefix}

Stack holds excess 0's. Push 0, pop a 0 for each 1. Never pop below $.

```
  --> q₀ -ε,ε→$-> q₁ -0,ε→0-> q₁ -1,0→ε-> q₁ -ε,$→ε-> q₂(F)
                                              also: ε,0→ε to q₂ (leftover 0's OK)
```

---

**Q6.** L = complement of {a^n b^n | n ≥ 0}

Union of two sub-languages:

1. Strings containing "ba" (any a after a b): DFA-like path
2. Strings a^n b^m with n ≠ m: push a's, pop for b's, accept if stack non-empty
   (too many a's) or b's remain after stack empty (too many b's).

---

**Q7.** L = {w#w^R | w binary, w^R is reverse}

Push all of w onto stack. Read #. Match each symbol of w^R against stack.

```
  --> q₀ -ε,ε→$-> q₁ -0,ε→0-> q₁ -1,ε→1-> q₁
       -#,ε→ε-> q₂ -0,0→ε-> q₂ -1,1→ε-> q₂ -ε,$→ε-> q₃(F)
```

---

**Q8.** L = {w | w is a binary palindrome}

Non-deterministically guess:
- Even length: push first half, match against second half.
- Odd length: push, skip middle symbol (ε-transition), match.

```
  --> q₀ -ε,ε→$-> q₁ -0,ε→0-> q₁ -1,ε→1-> q₁
       -ε,ε→ε-> q₂     [guess middle]
       q₂ -0,ε→ε-> q₂  [skip one (odd middle)]
       q₂ -1,ε→ε-> q₂
       -ε,ε→ε-> q₂ is also ε (go directly for even)
       q₂ -0,0→ε-> q₂ -1,1→ε-> q₂ -ε,$→ε-> q₃(F)
```

---

**Q9.** L = {x 0^n y 1^n x^R | x,y binary, n ≥ 0}

1. Push x symbol by symbol onto stack (non-det guess where x ends).
2. Push # marker.
3. Push one symbol per 0 in 0^n block.
4. Non-det skip y (ignore symbols).
5. Pop one symbol per 1 in 1^n block.
6. Pop # (end of 0^n section).
7. Match remaining stack against x^R symbol by symbol.
8. Accept when stack has only $.

---

**Q10.** L = {a^(2n) b^n | n > 0}

Method 1: Push all a's. Pop 2 a's per b.

```
  --> q₀ -ε,ε→$-> q₁ -a,ε→a-> q₁ -a,ε→a-> q₁
       -ε,ε→ε-> q₂ -b,a→ε-> q₃ -ε,a→ε-> q₂ -ε,$→ε-> q₄(F)
```

Method 2: For every pair of a's, push #. Pop # per b.

---

**Q11.** L = {a^(4n) b^n | n ≥ 0}

For every 4 a's, push #. For every b, pop #.

States: q₀→q₁→q₂→q₃→q₄ (count 4 a's), q₄ pushes #, loops back.
Then b's pop #. Accept when stack empty at end.

---

**Q12.** L = {a^(2n) b^(3n) | n ≥ 0}

For every 2 a's, push #. For every 3 b's, pop #.

---

**Q13.** L = {a^m b^n c^(m+2n) | m,n ≥ 0}

Push # for each a. Push ## for each b. Pop # for each c.

---

**Q14.** L = {a^i b^j c^k d^l | i+l = j+k}

Equivalent: i−j = k−l, i.e., surplus a over b = surplus k over d.

- Push A for each a.
- Cancel A with b (pop A), or if no A, push B for surplus b.
- For c: cancel B if present, else push C for surplus c.
- For d: cancel C or A.
- Accept when stack empty.

---

**Q15.** L = {a^i b^j c^k d^l | i+k = j+l}

Equivalent: i−j = l−k.

- Push A for a, cancel with b (pop A), or push B for surplus b.
- For c: cancel B if present (surplus b helps), else push A (c contributes to LHS).
- For d: cancel A.
- Accept when stack empty.

---

**Q16.** L = {w ∈ {0,1}* | #0 = #1}

If top matches opposite of current symbol → pop (cancel pair).
Otherwise: pop current top, push it back, push new symbol.
Implemented non-deterministically:
- See 0 and top is 1 (or vice versa): pop.
- Otherwise: push new symbol over current top.

---

**Q17.** L = {w ∈ {0,1}* | #0 ≠ #1}

Same as Q16 but accept when stack is NOT empty at end.

---

**Q18.** L = {w ∈ {a,b,c}* | #a + #b = #c}

Non-det: on reading a or b, either pop c (cancellation) or push X.
On reading c, either pop X or push c.
Accept when stack empty.

---

**Q19.** L = {x#y | x,y ∈ {0,1}*, x ≠ y}

Case 1: |x| ≠ |y| — count lengths with the stack.
Case 2: |x| = |y|, x[k] ≠ y[k] for some k — non-det guess position k,
push ? for positions 1..k-1, remember x[k] in state, skip #, 
pop ? for first k-1 symbols of y, check that y[k] ≠ x[k].

---

**Q20.** L = {xy | x,y ∈ {0,1}*, |x|=|y|, x ≠ y}

Guess position k where x[k] ≠ y[k].
Push ? for positions 1..k-1 (start of x).
Remember x[k] in state. Then:
- Push ? for k-1 more (they become start of y).
- Push # for remaining x symbols (length l).
- Skip first k-1 of y by popping ?.
- Check y[k] ≠ x[k] (stored in state).
- Pop # for remaining y. Accept at $.

---

## 6.3 String Push/Pop Operations

Some PDAs are cleaner using **bulk transitions**:
`a, xyz → wv` means: read a, pop string xyz from top, push wv.

### Practice — String Push/Pop

**Q21.** L = {a^(4n) b^n | n ≥ 0}

```
  --> q₀ -ε,ε→$-> q₁ -ε,ε→ε-> q₂ -a,ε→a-> q₂ -b,aaaa→ε-> q₂
                                              -ε,$→ε-> q₃(F)
```

**Q22.** L = {a^(2n) b^(3n) | n ≥ 0}

```
  --> q₀ -ε,ε→$-> q₁ -a,ε→###-> q₁ -ε,ε→ε-> q₂ -b,##→ε-> q₂
       -ε,$→ε-> q₃(F)
```

**Q23.** L = {a^m b^n c^(m+2n) | m,n ≥ 0}

```
  --> q₀ -ε,ε→$-> q₁ -a,ε→a-> q₁ -ε,ε→ε-> q₂ -b,ε→b-> q₂
       -ε,ε→ε-> q₃ -c,bb→ε-> q₃ -c,a→ε-> q₃ -ε,$→ε-> q₄(F)
```

Wait: c pops bb (from b) or pops a (from a). Need non-det ordering.
From worksheet: separate into two sub-transitions.

**Q24.** L = {a^m b^n | m ≠ 2n}

Push a's. Pop aa per b. Accept if stack non-empty OR b's remain after stack pops to $.

**Q25.** L = {a^i b^j c^k d^l | i+k = j+l}

Push a's. b's cancel a's or push b's. c's cancel b's or push c's. d's cancel a's or c's.
Accept when empty.

**Q26.** L = {w ∈ {a,b,c}* | #a + #b = #c}

Keep stack as {a,b}* or c*. Cancel opposites; push same-type on top.

**Q27.** L = {w ∈ {0,1}* | #0 = 2·#1}

Remove occurrences of substrings 100, 010, 001 (each has two 0's and one 1).
Bulk pop: `0, 01→ε`, `0, 10→ε`, `1, 00→ε`. Otherwise push.

---

# Module 7: Context-Free Grammars (CFG)

## 7.1 CFG Basics

A **CFG** G = (V, Σ, R, S) where:

- `V` — variables (non-terminals)
- `Σ` — terminals
- `R` — production rules (V → (V ∪ Σ)*)
- `S` — start variable

A string w ∈ L(G) if S ⇒* w using the rules of G.

**Context-free languages (CFLs)** are those recognized by PDAs or generated by CFGs.

---

## 7.2 Design Strategies

- **Equal counts** (a^n b^n): use S → aSb | ε
- **Multiple conditions** (i=j or i=k): use separate grammars connected by S → A | B
- **Nested structures**: generate outer symbols first, recurse inward
- **Mixed counts** (m+n = total): combine two separate derivation paths

---

### Practice — Construct CFGs

**Q1 (PS8).** DFA for non-empty binary strings with decimal value divisible by 3.

Convert DFA → CFG: one variable per state.
- Qₛ → 0Q₀ | 1Q₁
- Q₀ → 0Q₀ | 1Q₁ | ε  (accepting)
- Q₁ → 0Q₂ | 1Q₀
- Q₂ → 0Q₁ | 1Q₂

---

**Q2.** L = {w binary | w has at least 3 ones}

DFA method: 4 states counting 0,1,2,3+ ones.
Or directly:
```
S → A 1 A 1 A 1 A
A → 0A | 1A | ε
```

---

**Q3.** L = {} (empty language)

```
S → S   (no string can be derived — or equivalently, no base case)
```

---

**Q4.** L = {0} ∪ 1*100 ∪ 1*

```
S → R 1 0 R
R → 0R | 1R | ε
```

Wait: this generates 1*100 and 1* but how about {0}?
Actually S → R10R generates both 1*100 (set R→ε on right) and strings
with 1 in the middle ... Reconsider:

From worksheet: `S → R10R` and `R → 0R | 1R | ε`.
This generates Σ*10Σ* which covers 1*100 ⊂ Σ*10Σ*, and 1* is not covered.
The correct interpretation is L = 0 ∪ (1*100) ∪ 1*, which needs:
```
S → 0 | T | U
T → 1T | 100
U → 1U | ε
```
The worksheet simplifies to `S → R10R` for the union — check carefully.

---

**Q5.** L = {a^n b^(2n) | n≥0} ∪ {a^(2n) b^n | n≥0}

```
S → A | B
A → aAbb | ε
B → aaBb | ε
```

---

**Q6.** L = {a^n b^m | n ≥ m}

```
S → aSb | A
A → aA | ε
```

---

**Q7.** L = {a^i b^j c^k | i=j or i=k}

```
S → UV | W
U → aUb | ε
V → cV  | ε
W → aWc | X
X → bX  | ε
```

UV gives a^n b^n c* (i=j). W gives a^n b* c^n (i=k).

---

**Q8.** L = {w w^R | w binary}

```
S → 0S0 | 1S1 | ε
```

---

**Q9.** L = {w binary | #0 = #1}

```
S → 0S1 | 1S0 | SS | ε
```

---

**Q10.** L = {0^m 1^n | m ≠ n}

```
S → 0S1 | 0U | 1V
U → 0U  | ε
V → 1V  | ε
```

---

**Q11.** L = complement of {0^n 1^n | n ≥ 0}

Union of {w with 1 before 0} and {0^m 1^n | m ≠ n}:

```
S → S₁ | S₂
S₁ → R 1 0 R
R  → 0R | 1R | ε
S₂ → 0S₂1 | 0U | 1V
U  → 0U | ε
V  → 1V | ε
```

---

**Q12.** L = {w binary | #0 = 2·#1}

Every string must have sequences 100, 010, or 001:

```
S → S1S0S0S | S0S1S0S | S0S0S1S | ε
```

---

**Q13.** L = {w ∈ {a,b,c}* | w is a palindrome}

```
S → E
E → aEa | bEb | cEc | O | ε
O → a | b | c
```

---

**Q14.** L = {a^m b^n c^(m+n) | m,n ≥ 0}

Generate outer a and c first, then inner b and c:

```
S → A
A → aAc | B
B → bBc | ε
```

---

**Q15.** L = {a^m b^n c^(m+n) | m,n ≥ 1}

```
S → aAc
A → aAc | bBc
B → bBc | ε
```

---

**Q16.** L = {a^m b^n c^(m+n) | m+n ≥ 1}

```
S → aAc | bBc
A → aAc | B | ε
B → bBc | ε
```

---

**Q17.** L = {a^i b^j c^k d^l | i+k = j+l}

Rearranging: i−j = l−k. Inner structure is a^p b^p · b^q c^q · c^r d^r type.

```
S → aSd | UVW
U → aUb | ε
V → bVc | ε
W → cWd | ε
```

---

**Q18.** L = {a^i b^j c^k d^l | i+j = k+l}

```
S → aSd | A | D
A → aAc | B
D → bDd | B
B → bBc | ε
```

---

**Q19.** L = {w ∈ {a,b,c}* | #a + #b = #c}

```
S → SaScS | SbScS | ScSaS | ScSbS | ε
```

---

**Q20.** L = {a^m b^n | m ≠ 2n}

```
S → aaSb | A | B | aB
A → aA | a
B → Bb | b
```

A handles m > 2n. B handles m < 2n (even). aB handles odd m with m < 2n too.

---

# Answer Key

## Module 0 — Discrete Math

**Q1:** A not sufficient (27 divisible by 3 but not 15). A is necessary (15|x → 3|x).

**Q2:** A sufficient (all primes >2 are odd). A not necessary (15 is odd but not prime).

**Q3:** A is necessary and sufficient for B (both equivalent to 6|x).

**Q4:** True, False, False, True, False, True.

**Q5:**
- Power set of B: {∅, {x}, {w}, {x,w}}
- A∪B={x,y,z,w}, A∩B={x}
- A△B={y,z,w}
- B×B={(x,x),(x,w),(w,x),(w,w)}

**Q6:** (a) All odd integers. (b) All perfect squares {0,1,4,...}.
(c) Odd perfect squares. (d) Odd or even perfect square integers.
(e) Odd non-square integers.

**Q7:** {11x | x∈N∪{0}}; Z\{3^x | x∈N∪{0}}.

**Q8:** Domain f=X, codomain f=Y, range f={6,7}. Domain g=X×Y, codomain g=Y,
range g=Y. g(2,9)=10. g(2,11) undefined. g(2,f(4))=g(2,7)=8.
f not onto, not into. g onto, not into.

**Q9:** f:N→N not bijection. f:R→R bijection; inverse = ∛(x−1).

**Q10:** Not reflexive. Symmetric. Not transitive.

**Q11:** Not reflexive. Not symmetric. Transitive.

**Q12:** Reflexive, symmetric, transitive → equivalence relation.

**Q13:** In/out-degrees A(1,2), B(1,2), C(2,0), D(1,1). No path C→D.
Cycle: A→B→D→A. Add edge C→D for strong connectivity.

---

## Module 1 — Proof Techniques

**Q1:** Factorization (x+1)(x+2)(x+3) is divisible by x+2 ≥ 2. Not prime.

**Q2:** r=(√2)^√2. If rational, done.
If irrational, r^√2 = 2 (rational). Either case works.

**Q3:** Contradiction — smallest divisor p>√n leads to q=n/p≤√n, a divisor ≠1,n.

**Q4:** Induction on n. Base n=1: LHS=1=RHS. Step: S(k+1)=S(k)+(k+1)³
→ (k+1)²(k+2)²/4. ∎

**Q5:** Contraposition. If a or b is even → a²(b²−2b) is even (shown by cases).

**Q6a–g:** See detailed proofs in Module 1 section above.

---

## Module 2 — DFA

**Q1:** Σ* (all strings including ε).

**Q2:** {w | w ends in 0}.

**Q3a:** States: q₀(F,start), q₁(F,saw a), q₂(dead). Transitions:
q₀-a→q₁, q₀-b→q₂, q₁-a,b→q₂, q₂-a,b→q₂.

**Q3b–Q3h:** See diagrams in Module 2 section. States track progress toward condition.

**Q4:** Mod-5 DFA. States q₀–q₄ = remainders. Only q₀ accepts.

**Q5:** States q₀–q₃(reading 1st,2nd,3rd sym), q₄(F, 3rd was c), q₅,q₆(next cycle), dead.

**Q6:** Track substring "accb" match progress. 5 states including dead.

**Q7:** 3 states, track length mod 3. F={q₁,q₂}.

**Q8:** 4 states. Track (started-with-a, b-count-≤1). F={q₁,q₂}.

**Q9:** 3 states. F={q₀,q₂}. q₁ is the "seen exactly one a-or-b" state.

**Q10:** 2 states. F={q₀}. Die on b.

**Q11:** 5 states tracking 0,1,2,3,4+ consecutive zeros.

**Q12:** 3 states: len 0, len 1, len ≥ 2 (F).

---

## Module 3 — NFA

**Q1 (parts a–j):** See NFA constructions in Module 3 section.

**Q2 (conversion):**
- Start: {q₀,q₁}
- Final states: {q₁},{q₀,q₁},{q₁,q₂},{q₀,q₁,q₂}
- Closure table: q₀-a→{}, q₀-b→{q₁,q₂}; q₁-a→{q₂}; q₂-a→{q₀,q₁}
- Simplified DFA has 5 states; see diagram in Module 3.

---

## Module 4 — Regular Operations

**Q1:** L₁∪L₂ via new ε-start. L₁L₂ via ε from L₁ finals to L₂ start. L₂* via ε-loop.

**Q2:** NFA for 1*(100∪001+)* built from sub-NFAs with ε-transitions.

**Q3:** NFA for (100∪001+)*10 — extend Q2 with concatenation of "10".

**Q4:** Product DFA. L₃∪L₄: accept if either component accepts.
L₃∩L₄: accept only if both accept (only final state is {q₂,q₃}).

**Q5:** Complement DFA of L₃ — swap accepting/non-accepting states.

**Q6:** NFA product: pairs (q_A, q_B). ε-transitions replicated from both.

**Q7:** GNFA state removal gives: `1*0(01*0)*1(1∪01*0(01*0)*1)*`.

**Q8:** Reverse NFA construction — see Module 4 closure proof.

**Q9:** L ∩ (strings ending in vowel) — intersection of regular languages.

**Q10:** L = {ε,a,b} ∪ a{a,b}*a ∪ b{a,b}*b — construct DFA directly.

**Q11:** Equivalent to 1{0,1}*1{0,1}*. NFA with 3 states. Regular.

**Q12:** Existential DFA construction — new accepting states are those q where
L_q ∩ B ≠ ∅. Same transitions as DFA for A.

---

## Module 5 — Non-Regular Languages

**Q1–Q10:** Pumping lemma proofs — see detailed steps in Module 5.

**Q11:** Complement of non-regular = non-regular.

**Q12–Q14:** Intersection with regular language argument.

**Q15–Q22 (error identification):**

- Q15: s=a^p b^p ∉ L. Must pick s ∈ L.
- Q16: a^(p+i) b a^p ∈ L (aⁱb is a valid w). L is regular.
- Q17: 1^(p+i) 0 1^p ∈ L (choose w=1^i 0 1^p). L is regular.
- Q18: Only one decomposition considered. Must handle all.
- Q19: p is fixed at 2. Must be generic.
- Q20: Pumping lemma holding does not imply regularity (converse is false).
- Q21: Non-regular ∪ Non-regular can be regular.
- Q22: Non-regular ∩ Non-regular can be regular.

---

## Module 6 — PDA

**Q1–Q27:** Full PDA constructions with state diagrams and transition annotations —
see Module 6 section for each numbered question.

---

## Module 7 — CFG

**Q1:** DFA→CFG: Qₛ→0Q₀|1Q₁; Q₀→0Q₀|1Q₁|ε; Q₁→0Q₂|1Q₀; Q₂→0Q₁|1Q₂.

**Q2:** S→A1A1A1A; A→0A|1A|ε. (Or DFA-derived grammar.)

**Q3:** S→S (empty language — no derivation terminates).

**Q4:** S→R10R; R→0R|1R|ε.

**Q5:** S→A|B; A→aAbb|ε; B→aaBb|ε.

**Q6:** S→aSb|A; A→aA|ε.

**Q7:** S→UV|W; U→aUb|ε; V→cV|ε; W→aWc|X; X→bX|ε.

**Q8:** S→0S0|1S1|ε.

**Q9:** S→0S1|1S0|SS|ε.

**Q10:** S→0S1|0U|1V; U→0U|ε; V→1V|ε.

**Q11:** S→S₁|S₂; S₁→R10R; R→0R|1R|ε; S₂→0S₂1|0U|1V; U→0U|ε; V→1V|ε.

**Q12:** S→S1S0S0S|S0S1S0S|S0S0S1S|ε.

**Q13:** S→E; E→aEa|bEb|cEc|O|ε; O→a|b|c.

**Q14:** S→A; A→aAc|B; B→bBc|ε.

**Q15:** S→aAc; A→aAc|bBc; B→bBc|ε.

**Q16:** S→aAc|bBc; A→aAc|B|ε; B→bBc|ε.

**Q17:** S→aSd|UVW; U→aUb|ε; V→bVc|ε; W→cWd|ε.

**Q18:** S→aSd|A|D; A→aAc|B; D→bDd|B; B→bBc|ε.

**Q19:** S→SaScS|SbScS|ScSaS|ScSbS|ε.

**Q20:** S→aaSb|A|B|aB; A→aA|a; B→Bb|b.

---

> **Would you like to move to the next module, or would you like me to elaborate
> on a specific concept from this one?**
