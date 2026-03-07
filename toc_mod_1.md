# CSD334 Theory of Computation — Mid-Semester Study Guide

> Tailored to the past year's examination format.
> Excluded topics: NFA/DFA-to-Regex conversion, Myhill-Nerode theorem,
> Ambiguity, Chomsky Normal Form, and PDA/CFG interconversion.

---

# EXAM STRATEGY

The past paper tests six skill types. Allocate your prep accordingly:

- **DFA design** (Q2): arithmetic/counting constraints on binary strings
- **NFA design + NFA→DFA conversion** (Q3, Q4): structural pattern matching
- **Regular language limitations** (Q5, Q6): conceptual explanation
- **Regex membership & pattern matching** (Q6): algorithmic note
- **Regular grammar** (Q8): grammar for counting parity
- **Quotient language L1/L2** (Q9): set-theoretic suffix stripping
- **Pumping lemma** (Q10): non-regularity proof

**Key exam habits:**
- For DFA design, always draw the full transition diagram with a dead/trap
  state for invalid transitions.
- For pumping lemma proofs, the exam says informal is fine — but you must
  cover ALL possible cases for y.
- For NFA→DFA, use the power-set (subset) construction systematically.

---

# MODULE 1: Regular Languages — DFA & NFA

## 1.1 Formal Definitions

A **DFA** is a 5-tuple `(Q, F, Σ, δ, q₀)` where:

- `Q` is the finite set of states
- `F ⊆ Q` is the set of accepting (final) states
- `Σ` is the input alphabet
- `δ: Q × Σ → Q` is the **total** transition function
- `q₀ ∈ Q` is the start state

A DFA must have exactly one transition per state per symbol. It reads the
entire input and accepts iff it ends in a state in `F`.

An **NFA** is a 5-tuple `(Q, F, Σ, δ, q₀)` where:

- `δ: Q × (Σ ∪ {ε}) → P(Q)` maps to a **set** of states
- Multiple transitions on the same symbol are allowed
- ε-transitions (free moves) are allowed
- A string is accepted if **any** computation path ends in `F`

**Key difference:** DFA = one state at a time; NFA = multiple states in
parallel. Both recognize exactly the **regular languages**.

## 1.2 NFA to DFA Conversion (Subset Construction)

**Closure(q, a):** all states reachable from `q` reading symbol `a` (or ε),
followed by any number of further ε-transitions.

**Steps:**

1. Start state of DFA = `Closure(q₀, ε)`
2. For each DFA state `{q₁, q₂, ..., qₖ}` and symbol `a`:
   `δ_DFA({q₁,...,qₖ}, a) = ∪ Closure(qᵢ, a)`
3. A DFA state is **accepting** if it contains any NFA accepting state
4. The empty set `{}` is a dead (non-accepting) trap state

**State blowup:** An NFA with `n` states may require up to `2ⁿ` DFA states.
In practice, only reachable states are needed.

## 1.3 DFA Design Patterns — Exam Focus

### Divisibility by 5 (binary input)

The DFA tracks the current value of the binary string mod 5. Each new bit
doubles the current value and adds the new bit.

```
State qᵢ represents "current value ≡ i (mod 5)"

Transitions:
  δ(qᵢ, 0) = q_{(2i) mod 5}
  δ(qᵢ, 1) = q_{(2i+1) mod 5}

Start: q₀   Accept: q₀
```

ASCII diagram (states = remainder mod 5):

```
         0               1
  +----> q0 <---+    +----> q0
  |      |      |    |
  | 0    | 1    |    |
  v      v      |    |
  q0    q1      |    |
  
  Start & Accept: q0
  
  δ table:
  State | 0  | 1
  ------+----+----
  q0    | q0 | q1
  q1    | q2 | q3
  q2    | q4 | q0
  q3    | q1 | q2
  q4    | q3 | q4
```

Start = q0, Accept = {q0}.

### Exactly 4 zeros and at least 2 ones

Use a 2D state: count zeros (0..4, then dead) × count ones (0, 1, 2+).

```
State: (z, o) where z = #zeros seen (capped at 5=dead), o = #ones (capped at 2)

Accept: states where z == 4 AND o >= 2, i.e., (4, 2)

On reading 0: z' = z+1 (if z < 4, else dead); o unchanged
On reading 1: o' = min(o+1, 2); z unchanged

Dead state: reached when z > 4
```

Practical state count: 5 × 3 + 1 dead = 16 states.

## 1.4 NFA Design Patterns

NFAs shine when the acceptance condition depends on a **fixed suffix or
prefix**, or on **non-deterministic branching**.

**Pattern:** String has `c` in the 2nd position from the left (over {a,b,c}):

```
start --a,b,c--> q0 --c--> q1 --a,b,c--> q2(accept)
```

**Pattern:** String contains `ab` or `ac`:

```
start --a,b,c--> q0 --a--> q1 --b,c--> q2(accept)
         ^-loop---------^
```

**Pattern for Q3 — {a}* with edge-removal trick:**

Build an NFA for `{a}*` such that removing exactly one edge gives `{a}`.
Standard design:

```
  +--a--+
  |     |
  v     |
start -->(q0) accept
         |
         +--ε-->  [self-loop is the removable edge]
```

The trick: design a 2-state NFA where:
- `q0` is start and accept
- `q0 --a--> q0` (self-loop)

Removing the self-loop gives an NFA with no transitions on `a`, which
accepts only `ε` = `{a}⁰` — but that's `{ε}`, not `{a}`.

Better: use a 2-state NFA:

```
start --> (q0) --a--> (q1=accept)
            ^----a----|
```

Both `q0` and `q1` have `a`-transitions back to `q1`. Removing the edge
`q0 --a--> q1` leaves only `q1 --a--> q1`, which accepts `{a}+` — not
right either.

Correct answer design:

```
   q0 (start, accept)  --a-->  q0   [self-loop]
   q0                  --a-->  q1
   q1                  --a-->  q0
```

This accepts `{a}*`. Remove `q1 --a--> q0` edge → only `q0 --a--> q0` and
`q0 --a--> q1` remain → the machine gets "stuck" in `q1` with no way back
except via the removed edge → accepts exactly `{a}` (one `a` leads to `q1`
accept; two or more have no path back to accept from `q1`).

**Correct answer:** 2-state NFA; the removable edge is a "return" arc.

## 1.5 Regular Grammars

A **right-linear grammar** generates a regular language. Rules have form:
`A → aB` or `A → a` (or `A → ε` for the start variable).

**Exam Q8: Grammar for `{w : n_a(w) and n_b(w) are both even}`**

States of the DFA track (parity of a-count, parity of b-count):

- `A`: even a's, even b's (start and accept)
- `B`: odd a's, even b's
- `C`: even a's, odd b's
- `D`: odd a's, odd b's

Right-linear grammar:

```
A → aB | bC | ε
B → aA | bD
C → aC | bA | bA   (simplified: C → aD | bA)

Wait — fix:
  State A = (even a, even b): reading a → B, reading b → C
  State B = (odd a, even b):  reading a → A, reading b → D
  State C = (even a, odd b):  reading a → D, reading b → A
  State D = (odd a, odd b):   reading a → C, reading b → B

Grammar (A is start and final):
  A → aB | bC | ε
  B → aA | bD
  C → aD | bA
  D → aC | bB
```

## 1.6 Quotient Language L₁/L₂

The **right quotient** `L₁/L₂ = { w | ∃x ∈ L₂ such that wx ∈ L₁ }`.

In other words: strip suffixes from `L₁` that belong to `L₂`.

**Exam Q9: `L₁ = L(a*baa*)`, `L₂ = L(ab*)`**

`L₁` = strings of form `aⁿ b aᵐ` where `n ≥ 0`, `m ≥ 1`
`L₂` = strings of form `a bᵏ` where `k ≥ 0` (must start with `a`)

We need: `w` such that `w · x ∈ L₁` for some `x ∈ L₂`.

`x ∈ L₂` means `x = abᵏ` for some `k ≥ 0`.

So `wx = aⁿ b aᵐ` requires that `w` is a prefix of some string in `L₁`
when appended with `abᵏ`.

Cases:
- If `x = a` (k=0): then `wx ∈ L₁` means `w` followed by `a` is in
  `a*baa*`. So `w = aⁿba^(m-1)` where `m ≥ 1`, meaning `w = aⁿb` or
  `w = aⁿbaᵐ⁻¹` with `m ≥ 1`. Simplify: `w ∈ a*b(aa*)? = a*ba*`.
- If `x = abᵏ` with `k ≥ 1`: then `wx` must end in `bᵏ`, but `L₁`
  strings end in `a*`. So `bᵏ` suffix is never in `L₁`. No matches.

Therefore: `L₁/L₂ = L(a*ba*) = {aⁿbaᵐ | n ≥ 0, m ≥ 0}`.

---

## Module 1 Practice Questions

**P1.** Draw a DFA over `{0,1}` accepting all strings whose binary value
is divisible by 3. (Hint: track remainder mod 3.)

**P2.** Convert the following NFA to an equivalent DFA. Show the closure
table and all reachable DFA states.

```
NFA over {0, 1}:
  States: q0 (start), q1, q2 (accept)
  δ(q0, 0) = {q0, q1}
  δ(q0, 1) = {q0}
  δ(q1, 1) = {q2}
  δ(q2, 0) = {q2}
  δ(q2, 1) = {q2}
  No ε-transitions.
```

**P3.** Find `L₁/L₂` where `L₁ = L(0*10*)` and `L₂ = L(0+)`.

---

# MODULE 2: Pushdown Automata (PDA)

## 2.1 Formal Definition

A PDA is a 6-tuple `(Q, F, Σ, Γ, δ, q₀)` where:

- `Q`, `F`, `Σ`, `q₀` are as in NFA
- `Γ` is the **stack alphabet** (may differ from `Σ`)
- `δ: Q × (Σ ∪ {ε}) × (Γ ∪ {ε}) → P(Q × (Γ ∪ {ε}))` is the transition

**Transition label `α, β → γ` means:**
- Read `α` from input (or ε = no input consumed)
- Pop `β` from top of stack (or ε = don't pop)
- Push `γ` onto stack (or ε = don't push)

**Acceptance:** by final state (PDA is in `F` after consuming all input).

**Important:** We work with **non-deterministic PDAs** (NPDA) unless stated
otherwise. DPDA ⊊ NPDA in recognition power.

## 2.2 Key Design Technique: The Sentinel `$`

Always push a bottom-of-stack marker `$` as the first move. This lets you
detect an empty stack (by checking if `$` is at the top).

```
start --> q0 --ε, ε → $--> q1 --> [main logic] --> qf --ε, $ → ε--> qaccept
```

## 2.3 Worked PDA Examples

### Language: `{0ⁿ1ⁿ | n ≥ 0}`

```
ASCII state diagram:

start --> (q0) --ε,ε→$--> (q1) --0,ε→0--> (q1)
                           (q1) --1,0→ε--> (q2) --1,0→ε--> (q2)
                           (q2) --ε,$→ε--> (q3=accept)
```

How it works:
- Push `$` sentinel
- For each `0`: push a `0` (no pop)
- On first `1`: move to q2, pop a `0`
- For each further `1`: pop a `0`
- When stack shows `$`: move to accept
- If 0 is read in q2, or stack runs dry before input ends: dead

### Language: `{wwᴿ | w ∈ {0,1}*}` (even-length palindromes)

```
Phase 1 (q1): push all symbols onto stack
Phase 2 (q2): pop and match with remaining input
Transition q1 → q2: non-deterministic ε-guess of midpoint

start --> q0 --ε,ε→$--> q1

q1 --0,ε→0--> q1   (push 0)
q1 --1,ε→1--> q1   (push 1)
q1 --ε,ε→ε--> q2   (guess midpoint — non-deterministic!)

q2 --0,0→ε--> q2   (match 0 with stack top 0)
q2 --1,1→ε--> q2   (match 1 with stack top 1)
q2 --ε,$→ε--> q3   (accept when stack empty)
```

### Language: `{aⁱbʲcᵏ | i=j or i=k}`

Use non-determinism to split into two independent branches:

```
Branch 1 (i=j): push all a's, pop for each b, skip c's
Branch 2 (i=k): push all a's, skip b's, pop for each c
```

```
start --> q0 --ε,ε→$--> q1

[Branch 1 path: q1 → q2 → q3(accept)]
q1 --ε,ε→ε--> q2     (branch: test i=j)
q2 --b,a→ε--> q2     (pop a for each b)
q2 --ε,$→ε--> q3     (accept when stack empty)
q3 --c,ε→ε--> q3     (skip remaining c's)

[Branch 2 path: q1 → q4 → q5 → q6(accept)]
q1 --ε,ε→ε--> q4     (branch: test i=k)
q4 --b,ε→ε--> q4     (ignore all b's)
q4 --ε,ε→ε--> q5     (start matching c's)
q5 --c,a→ε--> q5     (pop a for each c)
q5 --ε,$→ε--> q6     (accept when stack empty)

All states: q1 --a,ε→a--> q1   (read all a's, push each)
```

### Language: `{0^(3n)1ⁿ | n ≥ 0}` — Bulk Pop

For every `1`, pop THREE `0`s from the stack using intermediate states:

```
q2 --1,0→ε--> r1 --ε,0→ε--> r2 --ε,0→ε--> q2
```

This reads one `1` from input, pops `0`, pops `0`, pops `0` in sequence.

## 2.4 Context-Free Grammars (Reference)

A **CFG** is a 4-tuple `(V, Σ, R, S)`:
- `V` = variables (non-terminals)
- `Σ` = terminals (alphabet)
- `R` = set of production rules `A → w`
- `S ∈ V` = start variable

**CFL Closure Properties:**
- Closed under: union (`S → S₁ | S₂`), concatenation, Kleene's star
- NOT closed under: intersection, complement

**Quick CFG examples from notes:**

```
{aⁿb²ⁿ | n ≥ 0} ∪ {a²ⁿbⁿ | n ≥ 0}:
  S → A | B
  A → aaAb | ε
  B → aBbb | ε

{aⁱbʲcᵏ | i=j or i=k}:
  S → UV | W
  U → aUb | ε      V → cV | ε
  W → aWc | X      X → bX | ε

Binary strings with equal 0s and 1s:
  S → SS | 0S1 | 1S0 | ε
```

---

## Module 2 Practice Questions

**P4.** Construct a PDA for the language `{aⁿbᵐ | n ≥ m ≥ 0}`.
Describe each state's role and give all transitions.

**P5.** Construct a PDA for `{w | w ∈ {a,b,c}* and #a + #b = #c}`.
(Hint: push for a/b, pop for c; use signed counting with the stack.)

**P6.** Construct a CFG for `{0ᵐ1ⁿ | m ≠ n}`. Then verify your grammar
generates `001` and `01`.

---

# MODULE 3: Non-Regular Languages

## 3.1 The Pumping Lemma

**Statement:**
If `L` is regular with pumping length `p > 0`, then every string `s ∈ L`
with `|s| ≥ p` can be partitioned as `s = xyz` satisfying:

1. `xyⁱz ∈ L` for all `i ≥ 0`
2. `|y| > 0` (y is non-empty)
3. `|xy| ≤ p` (the pump is in the first `p` characters)

**To prove NON-regularity** using the lemma:

1. Assume `L` is regular with pumping length `p` (adversary fixes `p`)
2. YOU choose a string `s ∈ L` with `|s| ≥ p`
3. Adversary splits `s = xyz` satisfying conditions 2 and 3
4. YOU show that for some `i`, `xyⁱz ∉ L` — **for ALL valid splits**

**Critical mistake to avoid:** You must handle **all** valid partitions of
`y`, not just one convenient choice. If even one partition lets the string
be pumped, your proof fails.

**Contrapositive logic:**
```
L regular  ⟹  pumping lemma holds
¬(pumping lemma)  ⟹  L is NOT regular
```
Pumping lemma holding does NOT imply regularity.

## 3.2 Choosing the Right String

The choice of `s` is crucial. Guidelines:

- Pick `s` so that `y` is **forced** into a region that "breaks" the
  language structure when pumped.
- Use `|xy| ≤ p` to constrain where `y` must lie.
- If your string allows `y` to be pumped without leaving `L`, pick a
  different string.

## 3.3 Worked Pumping Lemma Proofs

### Proof: `L = {0ⁿ1ⁿ | n ≥ 0}` is not regular

Assume `L` is regular. Let `p` be the pumping length.

Choose `s = 0^p 1^p`. Clearly `s ∈ L` and `|s| = 2p ≥ p`.

For any partition `s = xyz` with `|xy| ≤ p` and `|y| > 0`:
- Since `|xy| ≤ p`, both `x` and `y` lie entirely in the `0`-prefix.
- So `y = 0ⁱ` for some `i > 0` (y is only zeros).

Consider `xy²z`: this pumps extra zeros. Now we have `p+i` zeros but
still `p` ones. So `xy²z ∉ L`. Contradiction. Therefore `L` is not regular.

### Proof: `C = {w | w has equal 0s and 1s}` is not regular (Exam Q10)

Assume `C` is regular. Let `p` be the pumping length.

Choose `s = 0^p 1^p`. Note `s ∈ C` (equal counts) and `|s| = 2p ≥ p`.

For any valid partition `s = xyz` with `|xy| ≤ p` and `|y| > 0`:
- Since `|xy| ≤ p`, the substring `xy` lies entirely within the `0`s
  (the first `p` characters are all `0`s).
- So `y = 0ⁱ` for some `i > 0`.

Consider `xy²z`: it has `p + i` zeros and `p` ones. Since `i > 0`,
the counts are unequal. So `xy²z ∉ C`. Contradiction. Therefore `C` is
not regular.

**Why the naive approach fails:** If you just say "y could be 0s, 1s, or
both" without using the `|xy| ≤ p` constraint, the "both" case is hard
to handle. The constraint forces `y` to be zeros only — use it!

### Proof: `L = {1^(n²) | n ≥ 0}` is not regular

Choose `s = 1^(p²)`. Clearly `s ∈ L` and `|s| = p² ≥ p`.

For any partition with `|xy| ≤ p` and `|y| = i > 0`:

```
|xy²z| = p² + i
```

We know `1 ≤ i ≤ p`. So:
```
p² < p² + i ≤ p² + p < (p+1)²
```

Therefore `p² + i` is strictly between two consecutive perfect squares,
so it is not a perfect square. Thus `xy²z ∉ L`. Contradiction.

### Proof: `L = {0^m 1^n | m > n}` is not regular

Choose `s = 0^(p+1) 1^p`. Then `s ∈ L` (p+1 > p) and `|s| = 2p+1 ≥ p`.

For any valid split, `y = 0ⁱ` for some `i > 0` (same reasoning: `|xy| ≤ p`
constrains `y` to the zero-prefix).

Consider `xy⁰z = xz`: we remove `i` zeros. The string now has `p+1-i`
zeros. Since `i ≥ 1`, we have `p+1-i ≤ p`, meaning zeros ≤ ones. So
`xz ∉ L`. Contradiction.

(Note: pumping UP gives more zeros, which stays in `L`. Pumping DOWN to
`xy⁰z` is the winning move here.)

### Proof: `L = {ww | w ∈ {0,1}*}` is not regular

Wrong string: `s = 1^p 1^p` allows `y = 11` to pump while staying in `L`.

**Correct string:** `s = 1^p 0 1^p 0` (so `w = 1^p 0`). `|s| = 2p+2 ≥ p`.

For any valid split, `y = 1ⁱ` for some `i > 0` (within the first `p` ones).

`xy²z = 1^(p+i) 0 1^p 0`. For this to equal `ww`, both halves must be
identical. But the first half would need to be `1^(p+i) 0` and the second
`1^p 0`, which differ. So `xy²z ∉ L`. Contradiction.

## 3.4 Proving Non-Regularity via Closure Properties

**Key idea:** If `L` is assumed regular and a known non-regular language `M`
can be expressed as a regular operation on `L` and regular languages, then
`L` must be non-regular (since regular languages are closed under regular
operations).

**Template:**
```
Assume L is regular.
Note: M = L ∩ R  (where R is regular and M is known non-regular)
Since L and R are regular and regular languages close under ∩,
M must be regular — contradiction!
Therefore L is non-regular.
```

**Closure facts for non-regular languages:**
- Closed under: **complement** only
- NOT closed under: union, intersection, concatenation, Kleene's star

**Example 1:** Prove `L = {binary strings with equal 0s and 1s}` is
not regular.

```
Let M = {0ⁿ1ⁿ | n ≥ 0}  (known non-regular)
Note: M = L ∩ 0*1*
Since 0*1* is regular, if L were regular, M would be regular. Contradiction.
∴ L is not regular.
```

**Example 2:** Prove `L = {0^m 1^n | m ≠ n}` is not regular.

```
Let L' = complement of L = {strings with equal 0s and 1s that match 0*1*}
          ∪ {all strings NOT of form 0*1*}

Better approach: Let M = {0ⁿ1ⁿ | n ≥ 0}  (non-regular)
Let C = complement(L) — strings where m = n, over 0*1*.

Note: M = 0*1* ∩ C  and  C = complement(L).
If L is regular → C is regular → M = 0*1* ∩ C is regular. Contradiction.
∴ L is not regular.
```

## 3.5 Common Proof Pitfalls

- **Wrong string:** `s ∉ L`, or `s` allows all pumped versions to stay in L
- **Missing cases:** Only handling `y = 0s only`, forgetting `y = 1s only`
  or `y = mixed`. (Often the `|xy| ≤ p` constraint rules these out — USE IT)
- **Conclusion error:** "Pumping lemma holds ⟹ L is regular." WRONG.
- **Pumping direction:** Sometimes pump DOWN (`i=0`) instead of up
- **Free choice of split:** You cannot fix `y`; the adversary splits `s`.
  You must show the contradiction for ALL valid `xyz` splits

---

## Module 3 Practice Questions

**P7.** Use the pumping lemma to prove that `L = {aⁱbʲcᵏ | i+j = 2k}`
is not regular.

**P8.** Use closure properties to prove that
`L = {w ∈ {a,b,c}* | #a = #b = #c}` is not regular.
(Do not use the pumping lemma directly.)

**P9.** Prove that `L = {ww | w ∈ {0,1}*}` is not regular.
Explain why choosing `s = 1^p 1^p` fails and show the correct proof.

---

# MODULE 4: Limitations of Regular Languages & Applications

## 4.1 Limitations of Regular Languages (Exam Q5)

Regular languages (and DFA/NFA) are **memoryless**. This creates fundamental
limitations:

- **No counting:** Cannot verify that #0s = #1s, since this requires
  unbounded memory.
- **No nesting/balancing:** Cannot match `n` opens with `n` closes for
  arbitrary `n`. Parenthesis matching requires a stack (PDA territory).
- **No self-reference:** Cannot describe languages whose structure requires
  comparing the beginning with the end (e.g., palindromes of arbitrary
  length, `ww`, `wwᴿ`).
- **Bounded repetition only:** Can count "at least 3" or "exactly 5 ones"
  but not "as many `a`s as `b`s."

**Formal lower bound:** A DFA with `n` states can only "remember" `n`
distinct situations. Any language requiring memory proportional to input
length cannot be regular.

## 4.2 Regex Membership and Pattern Matching (Exam Q6)

**Membership problem:** Given regex `R` and string `T` of length `n`,
does `T ∈ L(R)`?

Algorithm:
1. Convert `R` to an NFA `N` with `O(|R|)` states using Thompson's
   construction (union = ε-merge; concatenation = ε-chain; Kleene = ε-loop)
2. Simulate `N` on `T` using subset tracking: maintain the set of currently
   active NFA states as each character is processed
3. Accept iff any active state at the end is an accepting state

Time complexity: `O(|R| · n)` — linear in string length for fixed regex.

**Pattern matching problem:** Find all substrings of `T` that match `R`.

Algorithm:
1. Modify the NFA for `R`: add a new start state `q_new` with ε-transitions
   to the original start state AND to all other NFA states — this lets the
   match begin anywhere.
   Alternatively: wrap `R` as `Σ*RΣ*` for a full-string match of any
   containing substring; or use the standard sliding-window simulation.
2. Track all positions where the NFA reaches an accepting state
3. Report match positions and lengths

Both problems are solvable in polynomial time using NFA simulation. DFA-based
approaches run in `O(n)` after an `O(2^|R|)` preprocessing step.

---

# ANSWER KEY

## Module 1 Answers

### P1: DFA for binary strings divisible by 3

States `q0, q1, q2` track the remainder mod 3.

```
δ table:
  State | 0  | 1
  ------+----+----
  q0    | q0 | q1
  q1    | q2 | q0
  q2    | q1 | q2
```

Start = q0, Accept = {q0}.

Verification: "110" = 6: q0→1→q1→1→q0→0→q0 ✓ (6 mod 3 = 0)
"100" = 4: q0→1→q1→0→q2→0→q1 (not accept) ✓ (4 mod 3 = 1)

### P2: NFA to DFA

Closure table (no ε-transitions):

```
NFA state | 0          | 1
----------+------------+-----------
q0        | {q0, q1}   | {q0}
q1        | {}         | {q2}
q2        | {q2}       | {q2}
```

DFA subset states (reachable from `{q0}`):

```
DFA State  | On 0         | On 1      | Accept?
-----------+--------------+-----------+--------
{q0}       | {q0,q1}      | {q0}      | No
{q0,q1}    | {q0,q1}      | {q0,q2}   | No
{q0,q2}    | {q0,q1,q2}   | {q0,q2}   | Yes (q2∈F)
{q0,q1,q2} | {q0,q1,q2}   | {q0,q2}   | Yes (q2∈F)
```

Start = `{q0}`. Accept = `{q0,q2}` and `{q0,q1,q2}`.

Language: all binary strings containing `01` as a substring (then followed
by anything). This is `{0,1}* 01 {0,1}*`.

### P3: Quotient L₁/L₂

`L₁ = L(0*10*) = {0^m 1 0^n | m,n ≥ 0}` (strings with exactly one 1)
`L₂ = L(0+) = {0^k | k ≥ 1}` (nonempty strings of 0s)

`L₁/L₂ = {w | ∃x ∈ L₂ s.t. wx ∈ L₁}`

For `wx ∈ L₁`, we need `wx = 0^m 1 0^n`. Then `x = 0^k` (k ≥ 1) is a
suffix. So `w = 0^m 1 0^(n-k)` for some `k ≤ n`.

For `k = n`: `w = 0^m 1` (zero trailing zeros)
For `k < n`: `w = 0^m 1 0^(n-k)` where `n-k ≥ 1`

So `w` can be any string of form `0^m 1 0^j` where `m ≥ 0, j ≥ 0`, as long
as there exists some `0^k` (k ≥ 1) making the whole thing in `L₁`. That
requires `j+k = n ≥ 0`, possible for any `j ≥ 0` by choosing `k = 1`.

Therefore `L₁/L₂ = L(0*10*) = L₁` itself.

(The quotient doesn't shrink the language here because you can always strip
one or more trailing zeros.)

---

## Module 2 Answers

### P4: PDA for `{aⁿbᵐ | n ≥ m ≥ 0}`

Strategy: Push all a's. When b's arrive, pop an a for each b. Accept if
stack still has a's (or is empty) when input ends.

```
Transitions:
  q0 --ε, ε → $-->  q1       (push sentinel)
  q1 --a, ε → a-->  q1       (push a for each a read)
  q1 --ε, ε → ε-->  q2       (non-det: start matching b's)
  q2 --b, a → ε-->  q2       (pop a for each b)
  q2 --ε, $ → ε-->  q3       (accept: b-count ≤ a-count)
  q3 --a, a → ε-->  q3       (optional: drain remaining a's)
```

Wait — q3 draining is not needed; q2 accepts via q3 when `$` is on top.
The key: when we reach q3 (found `$` after matching), remaining a's in the
word have already been popped for b's. But we need `n ≥ m`, so it's OK if
there are a's left on the stack when `$` is found.

Corrected: q2 reaches `$` when there are no more a's OR all b's have been
matched. Accept immediately when `$` is on top and input is exhausted.

```
q2 --ε, $ → ε-->  qaccept    (accept any time stack hits $ with no input left)
```

Since input may still have unread characters, we must ensure we only accept
when input is fully consumed. The PDA halts when input is exhausted:

- If input done and we find `$` on stack: accept (n ≥ m satisfied)
- If we try to pop a for a b but stack has `$`: reject (b > a)

### P5: PDA for `{w | #a + #b = #c}`

Strategy: Think of a/b as +1 tokens and c as -1 tokens.
Push a symbol `X` for each a or b read. Pop `X` for each c read. Accept when
stack has only `$` (equal counts) at the end.

```
q0 --ε, ε → $-->  q1
q1 --a, ε → X-->  q1     (push X for a)
q1 --b, ε → X-->  q1     (push X for b)
q1 --c, X → ε-->  q1     (pop X for c)
q1 --ε, $ → ε-->  qaccept
```

Accepts when the total number of a's plus b's equals the number of c's,
regardless of order. Note: this requires the PDA to handle interleaved
a, b, c symbols — the stack will fluctuate but must end at empty.

### P6: CFG for `{0^m 1^n | m ≠ n}`

`m ≠ n` means either `m > n` or `m < n`.

```
S → A | B
A → 0A1 | 0A | 0     (more 0s than 1s: m > n ≥ 0)
B → 0B1 | B1 | 1     (more 1s than 0s: n > m ≥ 0)
```

Verify:
- `001`: A → 0A → 00A → 001? No, A only generates strings starting with 0.
  `001`: A → 0A1 → 00(ε)1 → 001? The rule `A → ε` is needed for the base.

Corrected:
```
S  → A | B
A  → 0A1 | 0C     (C generates 0+, the extra zeros)
C  → 0C | 0
B  → 0B1 | D1     (D generates 1+, the extra ones)
D  → D1 | 1
```

Verify `001`: S → A → 0C → 00C → 001? C must end, so `C → 0` final: `A →
0C → 0·0 = 00`; but then A → 0A1 → 0(0C)1 = 00C1 → 001. Yes ✓

Verify `01`: S → A → 0A1 → 0(0C)1 ... no. `01` has `m = n = 1`, so it
should NOT be in L. Correct: `01 ∉ L`, and our grammar won't generate it. ✓

---

## Module 3 Answers

### P7: Pumping lemma proof for `{aⁱbʲcᵏ | i+j = 2k}`

Assume regular with pumping length p. Choose `s = a^p b^p c^p`. Check:
- `s ∈ L` since `p + p = 2p` ✓
- `|s| = 3p ≥ p` ✓

For any partition with `|xy| ≤ p` and `|y| > 0`:
- `y ∈ a+` (y is entirely in the a-prefix since `|xy| ≤ p`)

Consider `xy²z`: a-count becomes `p + |y|`, b and c counts unchanged at p.
New constraint: `(p + |y|) + p = 2p` requires `|y| = 0`. But `|y| > 0`.
Contradiction. Therefore L is not regular.

### P8: Closure proof for `{w ∈ {a,b,c}* | #a = #b = #c}`

Let `L = {w ∈ {a,b,c}* | #a = #b = #c}`.

Let `M = {aⁿbⁿcⁿ | n ≥ 0}`. It is known that M is not regular (provable
by pumping lemma with string a^p b^p c^p).

Observe: `M = L ∩ a*b*c*`.

`a*b*c*` is regular (it has an obvious DFA/regex).

If L were regular, then `L ∩ a*b*c*` = M would also be regular (regular
languages close under intersection). But M is not regular. Contradiction.

Therefore L is not regular. ∎

### P9: `{ww}` pumping lemma proof with correction

**Why `s = 1^p 1^p` fails:** Choose `x = ε`, `y = 11`, `z = 1^(p-2) 1^p`.
Then `xy²z = 1^(p+2) 1^p`. Let `w = 1^(p/2+1)` if `p` is even. Then
`ww = 1^(p+2)` — this works! The string CAN be pumped, so this choice of s
does not yield a contradiction.

**Correct proof:** Choose `s = 1^p 0 1^p 0`. Note `s = ww` with `w = 1^p 0`,
so `s ∈ L`. Also `|s| = 2p + 2 ≥ p`.

For any valid partition with `|xy| ≤ p` and `|y| > 0`:
- `y = 1ⁱ` for some `i > 0` (entirely in the opening `1^p` block)

`xy²z = 1^(p+i) 0 1^p 0`. For this to be in `L = {ww}`:
- Both halves must be equal: first half = second half
- First half length = second half length → total length must be even ✓
  (length = 2p + i + 2; even iff i is even)
- If `i` is odd: length is odd, not in L. Done.
- If `i` is even: half-length = `p + i/2 + 1`. The first half is
  `1^(p+i) 0` (length `p + i + 1`) and must equal the second half `1^p 0`
  (length `p + 1`). These lengths differ (since `i > 0`). So the halves
  cannot be equal. Not in L.

In both cases `xy²z ∉ L`. Contradiction. L is not regular. ∎

---

# QUICK REFERENCE CARD

## Pumping Lemma Checklist

```
□ 1. Assume L is regular with pumping length p (don't fix p)
□ 2. Choose s ∈ L with |s| ≥ p (your strategic choice)
□ 3. For ANY valid xyz split (|xy| ≤ p, |y| > 0):
     □ Determine what y must look like using |xy| ≤ p
     □ Find i such that xyⁱz ∉ L
     □ Cover ALL cases for what y could be
□ 4. Conclude contradiction → L is not regular
```

## PDA Construction Checklist

```
□ 1. Push sentinel $ as first move
□ 2. Identify what goes on the stack (what to count/match)
□ 3. Draw branching ε-transitions for non-deterministic choices
□ 4. Ensure acceptance is by final state after all input consumed
□ 5. Check ε is accepted (if it should be)
```

## DFA Design Checklist

```
□ 1. Identify what information the DFA must "remember"
□ 2. Enumerate equivalence classes → these become states
□ 3. Define transitions for each state/symbol pair
□ 4. Add a dead/trap state for invalid transitions
□ 5. Verify with 2-3 example strings
```

---

*Would you like to move to the next module, or would you like me to*
*elaborate on a specific concept from this one?*
