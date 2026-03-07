# CSD334 — Exam Strategy: Critical Questions by Practice Set

---

## Practice Set 1: Discrete Math Preliminaries

---

**Question 1**
> Consider: A: x is divisible by 3. B: x is divisible by 15.
> Is A a sufficient condition for B? Is A a necessary condition for B?

**Reasoning:** High-yield. Necessary vs. sufficient conditions are the logical
foundation for every proof in this course. Misreading direction (A→B vs. B→A)
is a classic exam trap. The contrapositive and closure arguments throughout the
course rely on this exact reasoning pattern.

---

**Question 2**
> Consider: A: x is a prime greater than 2. B: x is an odd number.
> Is A sufficient for B? Is A necessary for B?

**Reasoning:** Tricky. Students often confuse the direction here. A implies B
(every prime > 2 is odd), but B does not imply A (15 is odd but not prime).
This asymmetry in implication direction is the same logical structure used
in pumping lemma proofs (regular → pumpable, but not the converse).

---

**Question 3**
> Consider: A: x divisible by 3 and 2. B: x divisible by 6.
> Is A sufficient for B? Is A necessary for B?

**Reasoning:** High-yield. This is the biconditional (iff) case — the hardest
to establish cleanly. Recognizing when both directions hold simultaneously is
required for equivalence proofs (e.g. DFA ≡ NFA, CFG ≡ PDA).

---

**Question 5**
> Let A = {x,y,z} and B = {x,w}. Find the power set of B, A∪B, A∩B,
> A△B, and B×B.

**Reasoning:** High-yield. Power sets, Cartesian products, and symmetric
difference all appear in formal automata definitions. The transition function
δ of an NFA maps into P(Q) (the power set of Q). Getting comfortable with
set operations is essential groundwork.

---

**Question 6**
> Describe {2x+1 | x∈Z}, {x² | x∈Z}, their intersection, union,
> and set difference.

**Reasoning:** High-yield for proof technique. The intersection of odd integers
with perfect squares (odd perfect squares) is a non-trivial set that mirrors
the kind of language intersection reasoning used in non-regularity proofs
(e.g. intersecting with a∗b∗c∗ to isolate structured subsets).

---

**Question 8**
> Given f: X→Y and g: X×Y→Y via tables, determine domain/codomain/range,
> evaluate compositions, and test onto/into.

**Reasoning:** Hard and high-yield. The transition function δ of a DFA is
exactly a total function. Understanding onto vs. into (surjective vs. injective)
maps directly to understanding why NFA subset construction works and why
DFA minimization is possible.

---

**Question 9**
> Is f(x) = 1+x³ a bijection for f:N→N? For f:R→R? Find the inverse.

**Reasoning:** Tricky. The same function can be a bijection or not depending
on the domain/codomain. This mirrors the fact that the same transition
structure can be deterministic or non-deterministic depending on context.
The N→N case (not onto) is the easy trap.

---

**Question 10**
> Is f(x,y) ≡ (x−y) is odd: reflexive? symmetric? transitive?

**Reasoning:** High-yield. Equivalence relations underpin the Myhill-Nerode
theorem (even if excluded from your syllabus, the logical mechanics of
reflexive/symmetric/transitive appear in closure proofs). The transitivity
failure here (odd + odd = even) is non-obvious and a good exam trap.

---

**Question 11**
> Is f(x,y) ≡ x < y: reflexive? symmetric? transitive?

**Reasoning:** Tricky contrast to Q10. This relation is transitive but not
symmetric — the opposite profile from Q10. Exams frequently pair these two
to test whether students can distinguish the properties cleanly rather than
pattern-matching.

---

**Question 13**
> G = (V,E), V={A,B,C,D}, E given. Find degrees, a path from C to D,
> a cycle, and how to make it strongly connected.

**Reasoning:** Hard and high-yield. State diagrams of DFAs and PDAs are
directed graphs. The concept of reachability (can we get from C to D?) maps
directly to the question of whether a DFA state is reachable — an issue that
appears explicitly in NFA-to-DFA subset construction when unreachable states
are pruned.

---

## Practice Set 2: Proof Techniques

---

**Question 1**
> Use direct proof to show x³+6x²+11x+6 is not prime for non-negative x.

**Reasoning:** High-yield for direct proof technique. The factorization into
(x+1)(x+2)(x+3) is a clean constructive argument. The same structure —
finding a factor that guarantees divisibility — mirrors how you show a language
is closed under some operation by explicit construction.

---

**Question 3**
> Use contradiction to show a composite n>2 has a divisor x≠1 with x≤√n.

**Reasoning:** Hard and high-yield. This is a proof by contradiction with a
two-variable interaction (p and q=n/p). The structure — assume the opposite,
derive a contradiction via a carefully chosen witness — is exactly the skeleton
of pumping lemma proofs.

---

**Question 4**
> Use induction to prove 1³+2³+...+n³ = n²(n+1)²/4.

**Reasoning:** High-yield. Induction is the workhorse of automata theory
proofs (induction on string length, derivation length, number of steps).
Getting the algebraic manipulation in the inductive step clean is a skill
directly tested in exam proofs.

---

**Question 5**
> Use contraposition to show: if a²(b²-2b) is odd, then a and b are both odd.

**Reasoning:** High-yield for contraposition technique. Contraposition is
the logical engine behind every pumping lemma non-regularity proof:
"regular → pumpable, therefore not pumpable → not regular." This question
gives clean practice on setting up and executing the contrapositive.

---

**Question 6a**
> If ab and a+b are both even, prove a and b are both even.

**Reasoning:** Tricky. This requires case analysis (exactly one odd vs. both
odd) that is easy to get incomplete. The proof-by-contraposition structure
here — showing that if one is odd the conclusion fails — is a direct analog
of showing that pumping must fail for all possible splits, not just some.

---

**Question 6c**
> Show n⁴-4n² is divisible by 3 for n∈N∪{0}.

**Reasoning:** Hard. Requires exhaustive case split on n mod 3 (three cases),
which is the same modular arithmetic structure used to design DFAs that track
divisibility (e.g. the divisible-by-5 DFA in Practice Set 3, Q4).

---

**Question 6d**
> For θ∈[0,π/2], prove sinθ + cosθ ≥ 1.

**Reasoning:** Tricky proof by contradiction. The key move — squaring both
sides after assuming the opposite, then using sin²+cos²=1 to derive 2sinθcosθ<0
— is a good model of how indirect proofs work by algebraic manipulation to
reach a contradiction. Mirrors pumping length arithmetic.

---

**Question 6f**
> If r is a non-zero rational, prove r/√2 is irrational.

**Reasoning:** High-yield. Proof by contradiction involving the irrationality
of √2. This exact structure — assume rational, write as a/b, derive that √2
is rational, contradiction — is a template for many non-regularity proofs
that assume regularity, apply closure, derive a known false statement.

---

**Question 6g**
> Prove 1·2·3 + 2·3·4 + ... + n·(n+1)·(n+2) = n(n+1)(n+2)(n+3)/4 by induction.

**Reasoning:** High-yield for induction fluency. The inductive step requires
recognizing the pattern and factoring cleanly. String induction proofs
(e.g. proving DFA extended transition function is well-defined) use identical
algebraic induction structure.

---

**Question 2**
> Show ∃ irrationals p,q such that pq is rational. (Hint: √2 is irrational.)

**Reasoning:** Hard and memorable. The case split on whether (√2)^√2 is
rational or irrational is a beautiful non-constructive existence proof.
Non-constructive arguments appear in automata theory when proving existence
of a pumping length without specifying it explicitly.

---

## Practice Set 3: Deterministic Finite Automata

---

**Question 3d**
> Construct a DFA for {w | w is any string other than a or aa}.

**Reasoning:** Tricky. The complement/exclusion approach — accepting everything
except two specific short strings — requires careful state design to handle
exactly the strings `a` and `aa` as dead-end cases while letting everything
else through. Easy to get the reject states wrong.

---

**Question 3g**
> DFA for: w begins with a and has odd length, OR w begins with b and has
> even length.

**Reasoning:** Hard. This requires tracking two independent properties
(first symbol AND length parity) simultaneously, then combining them with OR.
The state space is a cross-product of {starts-with-a, starts-with-b} ×
{odd-length, even-length}, with careful initialization.

---

**Question 4**
> Construct a DFA for {w ∈ {0,1}* | decimal value of w is divisible by 5}.

**Reasoning:** Hard and high-yield. This is the canonical modular arithmetic
DFA. States represent the remainder mod 5, and transitions simulate how
appending a bit updates the remainder (r → 2r mod 5, or 2r+1 mod 5).
This exact technique applies to any divisibility DFA and is a standard exam
question type.

---

**Question 5**
> DFA for {w ∈ {a,b,c}* | |w|≥3 and every 3rd symbol is c}.

**Reasoning:** Hard. Requires a cyclic state structure that tracks position
mod 3 AND enforces the constraint only at position 3, 6, 9... The interaction
between the "at least 3" condition and the periodic constraint makes the
dead state logic non-trivial.

---

**Question 6**
> DFA for {w ∈ {a,b,c}* | w contains substring accb}.

**Reasoning:** High-yield. The substring-matching DFA is a foundational
pattern. The tricky part is correctly handling "partial match" states —
e.g. after reading `ac`, seeing `a` again should reset to the state after
reading just `a`, not all the way to the start.

---

**Question 8**
> DFA for {w ∈ {a,b,c}* | w starts with a, and has at most one b}.

**Reasoning:** Tricky. Requires combining a prefix constraint (starts with a)
with a counting constraint (at most one b) and a permanent reject state for
strings not starting with a. The interaction between these two conditions
and the alphabet {a,b,c} makes this harder than it looks.

---

**Question 9**
> DFA for {w ∈ {a,b,c}* | w is any string other than a or b}.

**Reasoning:** Tricky. Similar to 3d but over a 3-symbol alphabet. The
reject states for exactly `a` and exactly `b` must be correctly distinguished
from the accept states for longer strings beginning with `a` or `b`. Easy
to conflate the "seen exactly a" state with the "seen a then more" state.

---

**Question 11**
> DFA for {w ∈ {0,1}* | w = x0000y, where x,y ∈ {0,1}*}.

**Reasoning:** High-yield. This is the substring-matching DFA for `0000`.
The 5-state chain with careful self-loop placement when the matched prefix
is "broken" by a 1 is the cleanest version of the pattern-matching DFA
and a reliable exam staple.

---

**Question 3h**
> DFA for {w | w has an odd number of a and ends with b}.

**Reasoning:** Hard. Requires tracking two simultaneous properties: parity
of `a` count AND the last symbol seen. The state space is
{even-a, odd-a} × {last-was-a, last-was-b}, making it a 4-state machine.
Getting the transitions on `a` (which flips parity AND updates last-symbol)
correct simultaneously is where students lose marks.

---

**Question 3e**
> DFA for {w | w has at least 3 occurrences of a}.

**Reasoning:** High-yield. The counting-up-to-threshold DFA is one of the
most commonly tested DFA patterns. The key insight — once the threshold is
reached, a self-looping sink accept state handles the rest — is reusable
for any "at least k" constraint.

---

## Practice Set 4: Non-deterministic Finite Automata

---

**Question 1d**
> Construct an NFA for a*(bac)*bca+.

**Reasoning:** Hard. This requires composing multiple sub-NFAs using
ε-transitions: a self-loop for a*, a cycle for (bac)*, a fixed path for bca,
and a+ at the end. The ε-transition wiring between components and ensuring
the a+ requires at least one `a` (not zero) are the key difficulty points.

---

**Question 1e**
> Construct an NFA for (bb)*(a+ ∪ (ccc)*).

**Reasoning:** Hard. Requires a union branch after the (bb)* cycle, with
one branch being a+ (non-zero repetitions) and the other (ccc)* (cyclic
three-step loop). The ε-transition from the (bb)* accepting state to both
union branches, and correctly making ε the acceptance of (ccc)* (for n=0),
are non-trivial.

---

**Question 1h**
> NFA for {w | w contains ab or ac, where w ∈ Σ*}.

**Reasoning:** High-yield and tricky. This is the clearest demonstration
of non-determinism: the machine non-deterministically "guesses" when the
pattern ab or ac begins. Students often over-engineer this. The clean
solution uses just a self-loop start state + two short branches, making
it an ideal question for testing whether the student truly understands
NFA acceptance semantics.

---

**Question 1j**
> NFA for {w | length of w is odd and every even position has a}.
> Base-1 indexing.

**Reasoning:** Hard. The constraint "every even position has a" combined
with "odd total length" requires careful state cycling. Under base-1 indexing,
position 2, 4, 6,... must be `a`. The NFA naturally alternates between
"any symbol" and "must be a" states, but the odd-length termination condition
interacts with this cycle in a way that is easy to get wrong.

---

**Question 2**
> Convert a given NFA to DFA: fill closure table, transition table,
> draw simplified DFA after removing unreachable states.

**Reasoning:** Hard and high-yield. Subset construction is the most
technically demanding topic in the finite automata section. The ε-closure
computation, power-set state labeling, and unreachable state pruning all
appear here. Getting the final DFA wrong by including unreachable states
is a common exam error.

---

**Question 1c**
> NFA for {w | |w|≥4 and w has c in second position from right}.

**Reasoning:** Tricky. The "second from right" constraint requires the NFA
to non-deterministically guess when it is 4 symbols from the end. The
minimum length constraint (|w|≥4) must be enforced via the chain length,
not a separate counter. Easy to build an NFA that accepts strings shorter
than 4.

---

**Question 1f**
> Construct an NFA for a*bc(ac)+.

**Reasoning:** High-yield for ε-transition composition. The language has
a prefix (a*), a required fixed segment (bc), and a required suffix with
at least one repetition ((ac)+). The (ac)+ requires at least one cycle —
using + not * — which students often get wrong by using ε to make the
first repetition optional.

---

**Question 1g**
> NFA for (bb)*(a* ∪ (ccc)*).

**Reasoning:** Tricky contrast to 1e. The difference between a+ and a*
in the union branch changes the acceptance condition significantly. Here
a* accepts ε, which means the (bb)* portion alone suffices for acceptance
(via the a* branch accepting ε). Students who do not notice this produce
an incorrect machine.

---

**Question 1i**
> NFA for {w | w has c in the second position from left, where w ∈ Σ*}.

**Reasoning:** Tricky contrast to 1c (second from right vs. second from
left). "Second from left" is straightforward to implement but easy to
confuse with 1c. The NFA is just two transitions: read anything, then
read c, then loop. The subtlety is that the first symbol can be anything
including c, and the length can be exactly 2 or more.

---

## Practice Set 5: Regular Operations

---

**Question 4**
> L3 = {odd #0 and ends in 1}, L4 = {even length}. Use DFA multiplication
> to draw DFAs for L3∪L4 and L3∩L4.

**Reasoning:** Hard and high-yield. DFA product construction is the most
important technique for intersection and union of regular languages. The
state space is the cross-product of both DFAs' state sets. Getting the
accepting states right for union (either accepting) vs. intersection (both
accepting) is a frequent source of exam errors.

---

**Question 5**
> Draw a DFA for L5 = {even #0 OR does not end in 1}.
> Hint: use complement of L3.

**Reasoning:** Tricky. L5 is the complement of L3. Students must recognize
that "even #0 OR does not end in 1" = NOT("odd #0 AND ends in 1") = NOT L3.
The complement is obtained by flipping accepting and non-accepting states
in the DFA for L3. This question tests whether students can identify a
language as a complement rather than building from scratch.

---

**Question 8**
> Prove that L^R = {w | reverse of w ∈ L} is regular if L is regular.

**Reasoning:** Hard and high-yield. This is a construction-based proof:
reverse all transitions in the NFA for L, swap start and accept states,
and add a new start state with ε-transitions to the old accept states.
The formal rigor required — defining Q^R, F^R, δ^R precisely — is
exactly the style expected in exam proofs.

---

**Question 10**
> Show L = {w ∈ {a,b}* | substrings ab and ba occur same number of times}
> is regular. E.g. aba ∈ L, abab ∉ L.

**Reasoning:** Hard and tricky. The key insight is recognizing that this
language equals {ε,a,b} ∪ a{a,b}*a ∪ b{a,b}*b — strings that start and
end with the same symbol (or are single/empty). This structural insight
is non-obvious and requires thinking about what the equal-occurrence
condition actually implies about the shape of the string.

---

**Question 12**
> Let A/B = {w | wx ∈ A for some x ∈ B}. If A is regular, prove A/B
> is regular. (Note: B need not be regular.)

**Reasoning:** Hard and high-yield. This is the "quotient" or "left
derivative" language construction. The proof requires modifying the DFA
for A by changing its accepting states to those from which some x∈B can
reach an accepting state. The subtlety that B is not required to be regular
makes this question deeper than standard closure proofs.

---

**Question 9**
> L is regular over Σ={a..z}. Prove {w | w∈L and w ends in a vowel}
> is regular.

**Reasoning:** High-yield for closure argument style. The proof is clean:
M = {strings ending in a vowel} is regular (NFA exists); the target language
is L∩M; regular languages are closed under intersection. This is the exact
template students should use for closure-based regularity proofs.

---

**Question 11**
> Prove {1^k w | w∈{0,1}* has at least k ones, k≥1} is regular.

**Reasoning:** Tricky. This language looks like it requires counting k,
which suggests non-regularity — but it is actually regular. The key insight
is that the language equals 1{0,1}*1{0,1}* (any string starting with 1
and containing at least one more 1). Recognizing when a language that looks
complex is actually captured by a simple regular expression is a critical
exam skill.

---

**Question 1**
> L1 = strings containing 11. L2 = strings beginning with 1 ending in 0.
> Draw NFAs for L1∪L2, L1L2, and L2*.

**Reasoning:** High-yield. Constructing NFAs for union (ε to both), concatenation
(ε from L1's accept to L2's start), and Kleene star (ε loop from accept back
to start + new start state) tests all three core NFA composition techniques
in one question. The Kleene star construction for L2* is the most error-prone.

---

**Question 6**
> Draw the NFA capturing the intersection of two given NFAs (one is a
> single self-loop, the other has ε-transitions and accepts via L2*).

**Reasoning:** Hard. Intersection of NFAs via product construction is
technically demanding when one of the NFAs contains ε-transitions. The
product state space is Q1×Q2, and ε-transitions must be handled carefully
— they propagate through one component without consuming input. Getting
the start and accepting states of the product correct is non-trivial.

---

## Practice Set 6: Non-Regular Languages

---

**Question 2**
> Prove L = {a^i b^j c^k | i·j > k} is non-regular.

**Reasoning:** Hard. The string choice s = a^p b^(p+1) c^(p²) is non-obvious
and requires careful arithmetic to verify s∈L. The pump-down argument
(i=0) produces i·j ≤ (p-1)(p+1) = p²-1 < p² = k, which is a clean but
non-trivial inequality. Students who choose s = a^p b^p c^(p²-1) get the
wrong membership condition.

---

**Question 3**
> Prove L = {0^n 1 0^m 1 0^(m+n) | m,n≥0} is non-regular.

**Reasoning:** Hard. The string s = 0^p 1 0^p 1 0^(2p) has a complex
structure and the pumping argument must track how pumping the leading 0s
destroys the m+n balance in the last block. The proof requires explicit
tracking of the indices i and j in the decomposition xyz to show the
final block count becomes p+i+p ≠ 2p.

---

**Question 4**
> Prove L = {www | w ∈ {0,1}*} is non-regular.

**Reasoning:** Hard and high-yield. The string s = 0^p 1 0^p 1 0^p 1
is carefully constructed so pumping the first block of 0s forces the three
copies to have unequal lengths. The divisibility argument (i must be divisible
by 3) combined with the one-distribution-of-1s constraint is intricate and
a top exam challenge.

---

**Question 6**
> Prove L = {0^q | q is prime} is non-regular.

**Reasoning:** Hard and memorable. The pump choice i = q+1 gives length
q + q·b = q(1+b), which is composite (divisible by q). This is an elegant
number-theoretic argument that does not follow the usual "pump and count"
template. It is a standard exam question type for testing whether students
can adapt the pumping lemma beyond simple counting arguments.

---

**Question 9**
> Prove L = {(ab)^n b^n | n≥0} is non-regular.

**Reasoning:** Very hard. The proof requires an exhaustive four-case
analysis on the structure of y (starts/ends in a or b), with each case
requiring its own count argument. This is the most technically involved
pumping lemma proof in the set and is ideal for distinguishing top students.

---

**Question 14**
> Prove L = {0^m 1^n | m≠n} is non-regular using closure operations.

**Reasoning:** Hard and tricky. The proof cannot use complement directly
because the complement of L (strings with m=n) is not the same as L'
which also includes strings like `11100`. The correct route is to show
M = {0^n 1^n} = 0*1* ∩ complement(L), then use closure of regular
languages under intersection to derive a contradiction.

---

**Question 15 (Find the Error)**
> Proof that L = {a^m b^n | m>n} is non-regular. Find the error.

**Reasoning:** High-yield and tricky. The error is that s = a^p b^p ∉ L
(since p is not > p). This tests whether students check the most basic
requirement: the chosen string must actually be in the language. This
category of error is among the most common in exam submissions.

---

**Question 16 (Find the Error)**
> Proof that L = {a^n w a^n | n≥1, w∈{a,b}*} is non-regular. Find error.

**Reasoning:** Hard and tricky. The error is that a^(p+i) b a^p ∈ L because
the string can be rewritten as a^p (a^i b) a^p where a^i b ∈ {a,b}*.
This tests deep understanding of what it means for a string to be in L
— the n prefix and suffix don't have to be maximal; any split works.

---

**Question 19 (Find the Error)**
> Proof that L = a+b+ is non-regular using fixed pumping length p=2.
> Find the error.

**Reasoning:** High-yield. The error is fixing the pumping length at p=2.
The pumping length must remain generic (arbitrary p>0). This is one of
the most common structural errors in pumping lemma proofs and is tested
explicitly here.

---

**Question 20 (Find the Error)**
> Proof that a*b* is regular using pumping lemma. Find the error.

**Reasoning:** High-yield conceptual trap. The error is in the conclusion:
even if a language satisfies the pumping lemma for all strings, that does
not prove it is regular. The pumping lemma is one-directional. This question
directly targets the most common misconception about the pumping lemma.

---

## Practice Set 7: Push-Down Automata

---

**Question 3**
> Construct a PDA for {a^n b^m c^(m+n) | m,n≥0}.

**Reasoning:** Hard and high-yield. The key insight is to push one marker
for each `a` AND each `b`, then pop one marker for each `c`. This requires
recognizing that the sum m+n maps to a single stack count rather than two
separate counters. A common wrong approach pushes `a`s and `b`s differently.

---

**Question 4**
> Construct a PDA for {a^n b^m c^m d^n | m,n>0}.

**Reasoning:** Hard. This is a nested matching problem: a's must match d's
(outer pair) and b's must match c's (inner pair). The key is to use the
stack for both matchings sequentially — push a's, then push b's, then pop
b's for c's, then pop a's for d's. The ordering of push/pop phases is the
difficult design decision.

---

**Question 6**
> Construct a PDA for the complement of {a^n b^n | n≥0}.

**Reasoning:** Very hard. The complement requires accepting all strings NOT
of the form a^n b^n. This breaks into two sub-languages: strings containing
`ba` as a substring (any `b` before an `a`), and strings of the form a^n b^m
with n≠m. The PDA is a union of these two machines via ε-transitions.

---

**Question 9**
> Construct a PDA for {x 0^n y 1^n x^R | x,y binary strings, n≥0}.

**Reasoning:** Very hard. This is the most complex PDA in the set. It
requires non-deterministically guessing three boundaries: where x ends,
where 0^n ends (start of y), and where y ends (start of 1^n x^R). The
use of two separator markers ($ and #) on the stack to distinguish the
x-segment from the 0^n-segment is a sophisticated design.

---

**Question 14**
> Construct a PDA for {a^i b^j c^k d^l | i+l = j+k}.

**Reasoning:** Hard. Rewriting the condition as i-j = k-l reveals that
the "surplus a's over b's" must equal the "surplus c's over d's." The
PDA uses two stack symbols (A and B) to track which side has the surplus,
and non-deterministically switches between two phases. The proof that
non-determinism here picks exactly the right computation is subtle.

---

**Question 16**
> Construct a PDA for {w ∈ {0,1}* | same number of 0s and 1s}.

**Reasoning:** Hard. The language has no fixed ordering of 0s and 1s
(unlike a^n b^n), so the PDA cannot simply push then pop. The correct
approach uses two stack symbols (0 and 1) to track excess — when a
symbol matches the top of stack it cancels; otherwise it pushes.
The need to peek at the stack before deciding to push or pop requires
careful state design.

---

**Question 17**
> Construct a PDA for {w ∈ {0,1}* | #0 ≠ #1}.

**Reasoning:** Tricky complement of Q16. Accepting when the stack is
NOT empty at the end (either some 0s or some 1s remain). The PDA is
almost identical to Q16 but the accepting condition changes: accept
when the stack still has a 0 or 1 on top (not empty). Getting the
final-state transitions right is easy to get wrong.

---

**Question 19**
> Construct a PDA for {x#y | x,y ∈ {0,1}*, x≠y}.

**Reasoning:** Very hard. The language uses non-determinism to guess
a position k where x[k] ≠ y[k]. The PDA pushes k-1 markers while
reading x[1..k-1], "remembers" x[k] via state, ignores the rest of x,
reads through #, pops the k-1 markers while reading y[1..k-1], then
checks that y[k] has opposite parity to x[k]. Multi-phase, multi-marker.

---

**Question 18**
> Construct a PDA for {w ∈ {a,b,c}* | #a + #b = #c}.

**Reasoning:** Hard and high-yield. The language has no fixed ordering
of symbols. The clean solution uses non-determinism: on reading a or b,
non-deterministically either pop c from stack OR push X; on reading c,
either pop X OR push c. Accept when only $ remains. This non-deterministic
trick is an elegant and important PDA design pattern.

---

**Question 5**
> PDA for {w | #1s in any prefix of w ≤ #0s in that prefix}.

**Reasoning:** High-yield. This is the Dyck language / balanced-parentheses
variant. The invariant "stack always looks like $0*" must be maintained
throughout the computation, not just at the end. The design discipline of
maintaining a stack invariant (rather than just checking at the end) is
an important PDA design skill.

---

## Practice Set 8: Context-Free Grammars

---

**Question 7**
> CFG for {a^i b^j c^k | i=j or i=k, where i,j,k≥0}.

**Reasoning:** Hard and high-yield. This requires two separate sub-grammars
for the two conditions, combined via a union production S→UV|W. The U
sub-grammar handles i=j (with free c's via V), and the W sub-grammar handles
i=k (with free b's via X). Getting both sub-grammars correct and cleanly
separated is the key challenge.

---

**Question 10**
> CFG for {0^m 1^n | m≠n}.

**Reasoning:** High-yield. The trick is to handle m>n and m<n as separate
cases in the grammar: S→0S1 (the equal part) followed by either excess 0s
via U or excess 1s via V. This grammar structure — using a shared "balanced"
rule plus two "overflow" rules — is reusable for many unequal-count languages.

---

**Question 12**
> CFG for {w | w is a binary string with twice as many 0s as 1s}.

**Reasoning:** Hard. The grammar requires generating strings where #0=2·#1
in any interleaving. The solution S → S1S0S0S | S0S1S0S | S0S0S1S | ε
enumerates all relative orderings of one 1 and two 0s as atomic units.
This is a non-obvious grammar design that requires understanding string
decomposition rather than just recursive wrapping.

---

**Question 14**
> CFG for {a^m b^n c^(m+n) | m,n≥0}.

**Reasoning:** Hard and high-yield. The key insight in the answer is to
generate a's and c's first (outer wrap), then b's and c's (inner wrap).
If you try to generate a's and b's first, you cannot match the total number
of c's. This ordering insight — always generate the outermost symbols first —
is a fundamental CFG design principle.

---

**Question 17**
> CFG for {a^i b^j c^k d^l | i+k = j+l}.

**Reasoning:** Hard. The condition i+k=j+l can be rewritten as i-j = l-k.
The grammar generates equal a's and d's as an outer wrap (S→aSd), then
within that generates a concatenation of a^p b^p, b^q c^q, and c^r d^r
blocks (via U, V, W sub-grammars). Understanding this three-part inner
decomposition is the key insight.

---

**Question 18**
> CFG for {a^i b^j c^k d^l | i+j = k+l}.

**Reasoning:** Very hard. This requires recognizing that after generating
equal a's and d's, there are two structural cases: if #a > #d, the surplus
a's balance with c's; if #a ≤ #d, the surplus d's balance with b's. Then
remaining b's and c's are generated in equal numbers. The two-case sub-grammar
(A and D) is non-obvious.

---

**Question 19**
> CFG for {w ∈ {a,b,c}* | #a + #b = #c}.

**Reasoning:** Hard. Unlike Q12, this language allows any interleaving of
three symbol types. The grammar S → SaScS | SbScS | ScSaS | ScSbS | ε
works by always "pairing" each a or b with exactly one c, in any relative
order. Understanding why this grammar works requires thinking about the
balanced-pairs decomposition, not just syntactic pattern matching.

---

**Question 20**
> CFG for {a^m b^n | m ≠ 2n}.

**Reasoning:** Hard. The grammar must handle both m>2n and m<2n. The
solution uses a base of a^(2n) b^n via S→aaSb, then breaks symmetry:
adding extra a's alone covers m>2n; adding extra b's covers even-m part
of m<2n; adding a single a then extra b's covers the odd-m part of m<2n.
The aB branch (which covers the odd-overshoot case) is easy to miss.

---

**Question 11**
> CFG for the complement of {0^n 1^n | n≥0}.

**Reasoning:** High-yield and hard. The complement breaks into two cases:
strings with a 1 before a 0 anywhere (captured by R10R), and strings of
the form 0^m 1^n with m≠n (from Q10). The grammar is a union of these two
sub-grammars. Recognizing that "not 0^n 1^n" splits into these two
structural cases — rather than a single complement rule — is the key insight.

---

**Question 1**
> Convert the given DFA (binary strings divisible by 3) into a CFG.

**Reasoning:** High-yield. The DFA-to-CFG conversion is a clean mechanical
process: one variable per state, one production per transition, ε-productions
for accepting states. The divisible-by-3 DFA is a good example because it
has three states with non-trivial transitions, making the resulting grammar
non-trivial to verify by hand.

---
