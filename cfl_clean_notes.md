# Context-Free Languages and Automata Theory

> **Instructor:** Arnab Ganguly
> **Institution:** Department of Computer Science, Shiv Nadar IoE

### Context Free Languages - Part I

**(Push Down Automata)**

**Arnab Ganguly**

**Departmentof Computer Science**

**Shiv Nadar IoE**

### From Regular to More Powerful Languages

**Regular languages are recognizable by**

  - Deterministic Finite Automata (DFA), or

  - Non-deterministic Finite Automata (NFA).

Non-regular languages cannot be recognized by an NFA.

### From Regular to More Powerful Languages

**Regular languages are recognizable by**

  - Deterministic Finite Automata (DFA), or

  - Non-deterministic Finite Automata (NFA).

Non-regular languages cannot be recognized by an NFA.

Natural question:

Are there languages that are not recognizable by an NFA, but rec-

**ognizable by a more powerful machine?**

### From Regular to More Powerful Languages

**Regular languages are recognizable by**

  - Deterministic Finite Automata (DFA), or

  - Non-deterministic Finite Automata (NFA).

Non-regular languages cannot be recognized by an NFA.

Natural question:

Are there languages that are not recognizable by an NFA, but rec-

**ognizable by a more powerful machine?**

**Yes!**

### One important class of such languages is the

**Context-Free Languages (CFLs)**

**Why Are CFLs Important?**

  - More powerful than regular languages.

  - Able to describe richer structural patterns.

  - Appear naturally in many domains:

    - Arithmeticexpressionsinvolving(,),+,−,∗,/,variables,numbers.

    - Natural Language Processing(NLP).

    - Compilerdesignandparsing.

    - Formalmethods.

### CFLs vs Regular Languages

  - Every regular language is context-free.

  - Not every context-free language is regular.

Example:

```
{0n1n | n ≥ 0}
```

  - This language is context-free,

  - But it is not regular.

(Inpractice,thetermcontext-freelanguageusuallyreferstoanon-regularCFL.)

### There are two standard ways to describe a CFL:

  - By a generator: Context-Free Grammar (CFG)

    - Specifiesrulestogenerateallvalidstrings.

    - Similartogrammarrulesinnaturallanguages.

### There are two standard ways to describe a CFL:

  - By a generator: Context-Free Grammar (CFG)

    - Specifiesrulestogenerateallvalidstrings.

    - Similartogrammarrulesinnaturallanguages.

  - By a recognizer: Pushdown Automaton (PDA)

    - PlaysarolesimilartoDFA/NFAforregularlanguages.

    - Usesastacktorecognizenestedstructures.

### Deterministic and Non-deterministic PDAs

Unlike finite automata, Deterministic PDAs (DPDA) are strictly weaker than

Non-deterministic PDAs (NPDA).

Thus, there exist context-free languages that:

  - Can be recognized by an NPDA,

  - But cannot be recognized by any DPDA.

### Deterministic and Non-deterministic PDAs

Unlike finite automata, Deterministic PDAs (DPDA) are strictly weaker than

Non-deterministic PDAs (NPDA).

Thus, there exist context-free languages that:

  - Can be recognized by an NPDA,

  - But cannot be recognized by any DPDA.

**Language Hierarchy**

```
Regular Languages ⊂ DCFL ⊂ NCFL
```

where:

  - DCFL = Deterministic Context-Free Languages,

  - NCFL = Non-deterministic Context-Free Languages.

### Pushdown Automaton (PDA)

**A Pushdown Automaton (PDA) is like a finite automaton, but with**

  - states and transitions (like DFA/NFA),

  - additional memory in the form of a stack.

### Pushdown Automaton (PDA)

**A Pushdown Automaton (PDA) is like a finite automaton, but with**

  - states and transitions (like DFA/NFA),

  - additional memory in the form of a stack.

Two sets of alphabet:

  - Input symbols come from an alphabet Σ.

  - Stack symbols come from an alphabet Γ.

```
Γ may or may not equal Σ.
```

### Pushdown Automaton (PDA)

**Recognition Capability**

The stack allows PDAs to recognize some non-regular languages (and all

regular languages), i.e., the class of context-free languages.

```
Regular Languages ⊂ Context-Free Languages
```

Why the stack helps? An example.

```
Consider the non-regular language L = {0n1n | n ≥ 0}
```

  - Start with an empty stack.

  - Push one symbol for each 0 read and pop one symbol for each 1 read.

  - Do not allow a zero read once we have seen a one.

  - Accept if the stack is empty exactly at the end.

### Pushdown Automaton (PDA)

**Determinism in PDAs**

Pushdown automata can be:

  - Deterministic (DPDA).

  - Non-deterministic (NPDA).

### Pushdown Automaton (PDA)

**Determinism in PDAs**

Pushdown automata can be:

  - Deterministic (DPDA).

  - Non-deterministic (NPDA).

Unlike finite automata:

```
DPDA ⊂ NPDA
```

There exist context-free languages that:

  - can be recognized by an NPDA,

  - but by no DPDA.

Unless stated otherwise, we use PDA to mean NPDA.

### Pushdown Automaton (PDA)

**Formal Definition**

**A (non-deterministic) push-down automaton is a 6-tuple**

```
(Q,F,Σ,Γ,δ,q 0 )
```

where:

  - Q is the set of states,

  - F ⊆ Q is the set of accepting states,

  - Σ is the input alphabet,

  - Γ is the stack alphabet,

  - q ∈ Q is the start state,

  - 0

```
δ : Q×(Σ∪{ε})×(Γ∪{ε}) → P Q×(Γ∪{ε})
```

is the transition function.

### Pushdown Automaton (PDA)

**Computation and Acceptance**

High-level Idea:

  - The PDA starts in that start state.

### Pushdown Automaton (PDA)

**Computation and Acceptance**

High-level Idea:

  - The PDA starts in that start state.

  - At each step, the PDA:

    - readsasymbolfromtheinput(orε),

    - popsasymbol(orε)fromthestack,and

    - movestoanewstateandpushesasymbol(orε)onthestack.

### Pushdown Automaton (PDA)

**Computation and Acceptance**

High-level Idea:

  - The PDA starts in that start state.

  - At each step, the PDA:

    - readsasymbolfromtheinput(orε),

    - popsasymbol(orε)fromthestack,and

    - movestoanewstateandpushesasymbol(orε)onthestack.

  - Accept iff the PDA is in an accepting state after reading the entire input.

### Pushdown Automaton (PDA)

**Computation and Acceptance**

Detailed Computation Steps:

Let W = w 1 w 2 ...w m be the input string.

  - The PDA starts in state r = q with an empty stack.

    - 0 0

**After reading symbol w, i it is in state r. i**

### Pushdown Automaton (PDA)

**Computation and Acceptance**

Detailed Computation Steps:

Let W = w 1 w 2 ...w m be the input string.

  - The PDA starts in state r = q with an empty stack.

    - 0 0

**After reading symbol w, i it is in state r. i**

```
Let s i ∈ Γ∪{ε} be the symbol read from the top of the stack during the
```

transition from r i to r i+1 .

The transition satisfies:

```
(r i+1 ,s i+1 ) ∈ δ(r,w i i+1 ,s) i
```

### Pushdown Automaton (PDA)

**Computation and Acceptance**

Detailed Computation Steps:

Let W = w 1 w 2 ...w m be the input string.

  - The PDA starts in state r = q with an empty stack.

    - 0 0

**After reading symbol w, i it is in state r. i**

```
Let s i ∈ Γ∪{ε} be the symbol read from the top of the stack during the
```

transition from r i to r i+1 .

The transition satisfies:

```
(r i+1 ,s i+1 ) ∈ δ(r,w i i+1 ,s) i
```

  - The PDA accepts W if r ∈ F. Typically, the stack is empty at this point.

**m**

### Pushdown Automaton (PDA)

**Transition Notation**

In PDA diagrams, a transition is labeled as:

**α,β → γ**

meaning:

  - read input symbol α (or ε),

  - pop β (or ε) from the stack, and

  - push γ (or ε) on the stack .

**r i α,β → γ r i+1**

### PDA for {0n1n | n ≥ 0}

```
0,ε → 0 1,0 → ε
```

```
start q 0 ε,ε → $ q 1 1,0 → ε q 2 ε,$ → ε q 3
```

**How does it work?**

  - q is an accepting state; so, ε ∈ L.

  - 0

Initially, the PDA pushes the symbol $ onto the empty stack and moves

to state q 1 . This sentinel character is needed because there is no other

explicit way to check for an empty stack.

### PDA for {0n1n | n ≥ 0}

```
0,ε → 0 1,0 → ε
```

**start q 0 q 1 q 2 q 3**

```
ε,ε → $ 1,0 → ε ε,$ → ε
```

**How does it work (contd...)?**

  - While reading 0’s, the PDA:

    - pushes0ontothestack,

    - doesnotpopanysymbol.

  - When the first 1 is read, the PDA:

    - popsa0,

    - movestostateq 2 .

### PDA for {0n1n | n ≥ 0}

```
0,ε → 0 1,0 → ε
```

**start q 0 q 1 q 2 q 3**

```
ε,ε → $ 1,0 → ε ε,$ → ε
```

**How does it work (contd...)?**

  - In state q 2 , for every 1 read:

    - a0ispoppedfromthestack,

    - nosymbolispushed.

  - When the input is exhausted:

    - ifpoppingreturnsthesentinel$,

    - thePDAmovestotheacceptingstateq 3 .

### PDA for {0n1n | n ≥ 0}

```
0,ε → 0 1,0 → ε
```

**start q 0 q 1 q 2 q 3**

```
ε,ε → $ 1,0 → ε ε,$ → ε
```

**How does it work (contd...)?**

Ifthestringisnotoftheform0∗1∗,orthenumbersof0’sand1’sareunequal,

all computation paths get stuck (dead PDA) and the string is rejected.

### PDA for {aibjck | i = j or i = k}

**High-level Idea**

Push the a’s first. Then, use non-determinism to split into two cases:

  - One branch checks whether i = j,

  - The other branch checks whether i = k.

If either branch leads to acceptance, the input string is accepted.

### PDA for {aibjck | i = j or i = k}

**High-level Idea**

Push the a’s first. Then, use non-determinism to split into two cases:

  - One branch checks whether i = j,

  - The other branch checks whether i = k.

If either branch leads to acceptance, the input string is accepted.

**start q 0**

**ε,ε → $**

```
q 6 ε,$ → ε q 5 ε,ε → ε q 4 ε,ε → ε q 1 ε,ε → ε q 2 ε,$ → ε q 3
```

```
c,a → ε b,ε → ε a,ε → a b,a → ε c,ε → ε
```

### PDA for {aibjck | i = j or i = k}

**start q 0**

**ε,ε → $**

```
q 6 q 5 ε,ε → ε q 4 ε,ε → ε q 1 ε,ε → ε q 2 q 3
```

```
ε,$ → ε ε,$ → ε
```

```
c,a → ε b,ε → ε a,ε → a b,a → ε c,ε → ε
```

**How does it work (contd...)?**

  - From the start state q , the PDA pushes $ and moves to q .

  - In state q , the PDA reads 0 all a’s: 1

    - 1

    - eachaispushedontothestack,

nosymbolispopped.

### PDA for {aibjck | i = j or i = k}

**start q 0**

**ε,ε → $**

```
q 6 ε,$ → ε q 5 ε,ε → ε q 4 ε,ε → ε q 1 ε,ε → ε q 2 ε,$ → ε q 3
```

```
c,a → ε b,ε → ε a,ε → a b,a → ε c,ε → ε
```

**How does it work (contd...)?**

**Branch 1: Testing i = j**

  - The PDA moves from q 1 to q 2 using an ε-transition.

  - In state q 2 , for each b read, one a is popped from the stack.

  - If the stack returns to $, the PDA moves to the accepting state q 3 .

  - In q , any remaining c’s are read without affecting the stack.

**3**

### PDA for {aibjck | i = j or i = k}

**start q 0**

**ε,ε → $**

```
q 6 q 5 ε,ε → ε q 4 ε,ε → ε q 1 ε,ε → ε q 2 q 3
```

```
ε,$ → ε ε,$ → ε
```

```
c,a → ε b,ε → ε a,ε → a b,a → ε c,ε → ε
```

**How does it work (contd...)?**

**Branch 2: Testing i = k**

  - The PDA moves from q to q using an ε-transition.

    - 1 4

In state q 4 , all b’s are ignored.

  - The PDA then moves to q 5 using an ε-transition.

  - In state q 5 , for each c read, one a is popped from the stack.

  - If the stack returns to $, the PDA moves to the accepting state q .

**6**

### PDA for {aibjck | i = j or i = k}

**start q 0**

**ε,ε → $**

```
q 6 ε,$ → ε q 5 ε,ε → ε q 4 ε,ε → ε q 1 ε,ε → ε q 2 ε,$ → ε q 3
```

```
c,a → ε b,ε → ε a,ε → a b,a → ε c,ε → ε
```

**Why isn’t q 0 an accepting state?**

It’s not needed, because without reading any symbols we reach the two

accepting states q 3 and q 6 .

Of course, there is no harm in making q 0 accepting as well.

### PDA for {aibjck | i = j or i = k}

**start q 0**

**ε,ε → $**

```
q 6 q 5 ε,ε → ε q 4 ε,ε → ε q 1 ε,ε → ε q 2 q 3
```

```
ε,$ → ε ε,$ → ε
```

```
c,a → ε b,ε → ε a,ε → a b,a → ε c,ε → ε
```

**Why certain transitions are not allowed even after making q 0 an**

**accepting state?**

  - The transition q 1 → q 2 cannot read b; otherwise, c+ would be rejected.

  - The transition q → q cannot read c; otherwise, b+ would be rejected.

```
4 5 {ancn
```

```
The transition q 1 → q 4 cannot read b; otherwise | n ≥ 0} would
```

be rejected.

### PDA for {wwR | w ∈ {0,1}∗}

**High-level Idea**

The PDA works in two phases:

  - First half: read symbols and push them onto the stack,

  - Second half: pop and match symbols with the input.

The transition from the first to the second half is non-deterministic.

### PDA for {wwR | w ∈ {0,1}∗}

**High-level Idea**

The PDA works in two phases:

  - First half: read symbols and push them onto the stack,

  - Second half: pop and match symbols with the input.

The transition from the first to the second half is non-deterministic.

```
0,ε → 0 0,0 → ε
```

```
1,ε → 1 1,1 → ε
```

```
start q 0 ε,ε → $ q 1 ε,ε → ε q 2 ε,$ → ε q 3
```

### PDA for {wwR | w ∈ {0,1}∗}

```
0,ε → 0 0,0 → ε
```

```
1,ε → 1 1,1 → ε
```

```
start q 0 ε,ε → $ q 1 ε,ε → ε q 2 ε,$ → ε q 3
```

**How does it work (contd...)?**

  - From q , the PDA pushes the sentinel symbol $ onto the empty stack

and moves 0 to q .

    - 1

  - In state q 1 , for each input symbol:

    - pushthesamesymbolontothestack,and

stayinq 1 .

### PDA for {wwR | w ∈ {0,1}∗}

```
0,ε → 0 0,0 → ε
```

```
1,ε → 1 1,1 → ε
```

**start q 0 q 1 ε,ε → ε q 2 q 3**

```
ε,ε → $ ε,$ → ε
```

**How does it work (contd...)?**

At any point, the PDA:

  - guesses that the midpoint has been reached, and

  - moves from q 1 to q 2 without reading input.

### PDA for {wwR | w ∈ {0,1}∗}

```
0,ε → 0 0,0 → ε
```

```
1,ε → 1 1,1 → ε
```

**start q 0 q 1 ε,ε → ε q 2 q 3**

```
ε,ε → $ ε,$ → ε
```

**How does it work (contd...)?**

Assuming a correct midpoint guess:

  - In state q , the PDA compares input symbols with the top of the stack.

    - 2

  - If the symbols match:

    - thestacksymbolispopped,

theinputsymbolisconsumed.

  - If the symbols do not match, the PDA dies.

### PDA for {wwR | w ∈ {0,1}∗}

```
0,ε → 0 0,0 → ε
```

```
1,ε → 1 1,1 → ε
```

```
start q 0 ε,ε → $ q 1 ε,ε → ε q 2 ε,$ → ε q 3
```

**How does it work (contd...)?**

When the input is exhausted:

  - if popping returns the sentinel $,

  - the PDA moves to the accepting state q 3 .

If the midpoint guess is incorrect (or the string length is odd), all computation

paths get stuck, and the string is rejected.

### String Pop

  - We read multiple characters from the top of stack in one shot, at most

onecharacterfromtheinput,andpushatmostonesymbolonthestack.

  - Specifically, we read the symbol α from the input, pop the string

B = β 1 β 2 ...β k from the stack (in left to right order), and push the

symbol γ onto the stack.

**r i r i+k**

**α,B → γ**

**This is realized by a sequence of standard transitions**

```
r α,β =⇒1 →ε r ε,β =2⇒ →ε r ··· ε,β =k⇒ →γ r
```

**i i+1 i+2 i+k**

### PDA for {03n1n | n ≥ 0}

```
0,ε → 0 1,000 → ε
```

**start q 0 q 1 ε,ε → ε q 2 q 3**

```
ε,ε → $ ε,$ → ε
```

  - Wheneverweseea1,weshouldbeabletopopthree0sfromthestack;

we can use a bulk-pop as shown in the PDA below to carry this out.

  - Obviously, we could split the bulk pop into four separate transitions (as

described above), ultimately loop back onto q 2 , but this is an easier way

to represent the same.

### String Push

  - We read at most one character from the top of stack, at most one

character from the input, and push multiple characters on the stack in

one shot.

  - Specifically, we read the symbol α from the input, pop the symbol β

from the stack, and push the string Y = γ 1 γ 2 ...γ k onto the stack (in

right to left order), as shown below.

**r i α,β → Y r i+k**

**This is realized by a sequence of standard transitions**

```
r i α, = β ⇒ →γ k r i+1 ε,ε = → ⇒ γ k−1 r i+2 ··· ε, = ε→ ⇒ γ 1 r i+k
```

### PDA for Binary strings with an equal number of zeroes and ones

**0,1 → ε**

**1,0 → ε**

**start q 0 q 1 q 2**

```
ε,ε → $ ε,$ → ε
```

**0,0 → 00**

**1,1 → 11**

**1,$ → 1$**

**0,$ → 0$**

  - Ifinputsymbolandtopofstackmismatches,thenpopthestack(without

pushing anything).

  - Otherwise,leavethetopofstackunchanged,andpushtheinputsymbol

onto the stack.

### Practice Problems

Construct a PDA for each of the following languages:

  - w | w is a binary string that starts and ends with the same symbol

```
anbm | n ≥ m ≥ 0
```

  - anbmcmdn | m,n > 0

```
The complement of anbn | n ≥ 0
```

  - w | w is a binary string and a palindrome

```
a4nbn | n ≥ 0
```

  - aibjckd- | i +k = j +-

```
w | w ∈ {a,b,c}∗ where #a+#b = #c
```

### Practice Problems

  - w | w is a binary string that starts and ends with the same symbol

```
0,ε → ε 1,ε → ε start 0,ε → ε 1,ε → ε
```

```
1,ε → ε 0,ε → ε
```

```
q 4 0,ε → ε q 3 1,ε → ε q 0 0,ε → ε q 1 1,ε → ε q 2
```

We are assuming that ε is in the language.

### Practice Problems

```
anbm | n ≥ m ≥ 0
```

```
a,ε → a b,a → ε
```

**ε,$ → ε**

```
start q ε,ε → $ q ε,ε → ε q ε,a → ε q
```

**0 1 2 3**

### Practice Problems

  - anbmcmdn | m,n > 0

```
a,ε → a b,ε → ε c,b → ε
```

**start q 0 q 1 q 2 ε,ε → ε q 3**

```
a,ε → $ b,ε → ε
```

**ε,ε → ε**

**q 5 q 4 d,a → ε**

**ε,$ → ε**

### Practice Problems

```
The complement of anbn | n ≥ 0
```

**a,ε → ε**

```
a,ε → ε b,ε → ε b,ε → ε
```

```
q ε,ε → ε q b,ε → ε q a,ε → ε q
```

**start 0 1 2 3**

```
ε,ε → $ b,a → ε
```

```
a,ε → a q ε,ε → ε q ε,a → ε q b,ε → ε
```

**4 5 b,$ → ε 6**

### Practice Problems

  - w | w is a binary string and a palindrome

```
0,ε → 0 0,0 → ε
```

```
1,ε → 1 ε,ε → ε 1,1 → ε
```

**0,ε → ε**

**start q q 1,ε → ε q q**

```
0 ε,ε → $ 1 2 ε,$ → ε 3
```

We are assuming that ε is in the language.

### Practice Problems

```
a4nbn | n ≥ 0
```

**ε,ε → ε**

```
q ε,ε → $ q q q ε,$ → ε q
```

**start 0 1 a,ε → ε 2 5 6**

```
a,ε → # a,ε → ε
```

**b,# → ε**

**q 4 a,ε → ε q 3**

### Practice Problems

```
a4nbn | n ≥ 0 using string pop
```

```
a,ε → a b,aaaa → ε
```

```
start q ε,ε → $ q ε,ε → ε q ε,$ → ε q
```

**0 1 2 3**

### Practice Problems

  - aibjckd- | i +k = j +-

```
b,A → ε c,B → ε
```

```
start a,ε → A b,ε → B c,ε → A d,A → ε
```

```
q ε,ε → $ q ε,ε → ε q ε,ε → ε q ε,ε → ε q ε,$ → ε q
```

**0 1 2 3 4 5**

### Practice Problems

  - aibjckd- | i +k = j +- using string push/pop

**c,$ → c$**

```
b,a → ε c,a → ca
```

```
b,$ → b$ c,b → ε d,a → ε
```

```
start a,ε → a b,b → bb c,c → cc d,c → ε
```

```
q ε,ε → $ q ε,ε → ε q ε,ε → ε q ε,ε → ε q ε,$ → ε q
```

**0 1 2 3 4 5**

### Practice Problems

```
w | w ∈ {a,b,c}∗ where #a+#b = #c
```

**q 2**

```
ε,$ → ε a,c → ε
```

**b,c → ε**

```
start q ε,ε → $ q a,ε → X
```

**0 1 b,ε → X**

**c,X → ε**

**c,ε → c**

### Practice Problems

```
w | w ∈ {a,b,c}∗ where #a+#b = #c using string push/pop
```

**q 2 a,c → ε**

**b,c → ε**

**c,a → ε**

```
ε,$ → ε c,b → ε
```

**a,$ → a$**

```
q ε,ε → $ q b,$ → b$
```

**start 0 1 c,$ → c$**

**a,a → aa**

**b,b → bb**

**c,c → cc**

**a,b → ab**

**b,a → ba**

### Context Free Languages - Part II

**(Context Free Grammar)**

**Arnab Ganguly**

**Departmentof Computer Science**

**Shiv Nadar IoE**

### What’s a Grammar?

**A → 0A1**

**A → B**

**B → ε**

**Eachlineinagrammarisasubstitutionrule(alsocalledaproductionora**

generator rule).

### What’s a Grammar?

**A → 0A1**

**A → B**

**B → ε**

**Eachlineinagrammarisasubstitutionrule(alsocalledaproductionora**

generator rule).

  - The left-hand side contains a variable (usually upper-case letters).

One variable (typically the first one listed) is the start variable.

Here the variables are A and B, with A being the start variable.

### What’s a Grammar?

**A → 0A1**

**A → B**

**B → ε**

**Eachlineinagrammarisasubstitutionrule(alsocalledaproductionora**

generator rule).

  - The left-hand side contains a variable (usually upper-case letters).

One variable (typically the first one listed) is the start variable.

Here the variables are A and B, with A being the start variable.

  - The right-hand side produces a string of variables and symbols

(usually lower-case letters, digits, or special symbols).

Here, the terminals are 0,1,ε.

### Generating Strings

**A → 0A1**

**A → B**

**B → ε**

To generate strings from a grammar:

  - Start with the start variable.

  - Replace a variable using one of its substitution rules.

  - Repeat until no variables remain.

### Generating Strings

**A → 0A1**

**A → B**

**B → ε**

To generate strings from a grammar:

  - Start with the start variable.

  - Replace a variable using one of its substitution rules.

  - Repeat until no variables remain.

For example, one string generated by the grammar above is:

```
A ⇒ 0A1 ⇒ 00A11 ⇒ 000A111 ⇒ 000B111 ⇒ 000111
```

### Derivation

The process of generating strings is called a derivation.

If a rule X → v exists, where v is a string of variables and symbols, then

**uXw ⇒ uvw**

is called a yield step.

### Derivation

The process of generating strings is called a derivation.

If a rule X → v exists, where v is a string of variables and symbols, then

**uXw ⇒ uvw**

is called a yield step.

**We say that u derives w, written**

**u ⇒ ∗ w**

if either:

  - u = w, or

```
there exists a sequence u ⇒ u 1 ⇒ u 2 ⇒ ··· ⇒ u k ⇒ w.
```

### Language of a Grammar

The language of a grammar G, denoted L(G), is the set of all strings that

can be derived from its start variable:

```
L(G) = {w ∈ Σ∗ | S ⇒ ∗ w}
```

where S is the start variable.

### Language of a Grammar

The language of a grammar G, denoted L(G), is the set of all strings that

can be derived from its start variable:

```
L(G) = {w ∈ Σ∗ | S ⇒ ∗ w}
```

where S is the start variable.

**Can you guess what is the language of the following grammar?**

**A → 0A1**

**A → B**

**B → ε**

### Language of a Grammar

The language of a grammar G, denoted L(G), is the set of all strings that

can be derived from its start variable:

```
L(G) = {w ∈ Σ∗ | S ⇒ ∗ w}
```

where S is the start variable.

**Can you guess what is the language of the following grammar?**

**A → 0A1**

**A → B**

**B → ε**

```
{0n1n | n ≥ 0}
```

### Context-Free Grammar (CFG)

**A Context-Free Grammar (CFG) is a quadruple**

(V,Σ,R,S),

where:

  - V is the set of variables, and Σ is the set of terminals, with

```
V ∩Σ = ∅.
```

  - R is a set of substitution rules, where each rule replaces a variable

with a string of variables and terminals.

  - S ∈ V is the unique start variable.

### Example 1

- Considerthegrammar

```
G 1 = {S},{a,b},R,S ,
```

wherethesubstitutionrulesR aregivenby:

```
S →aSb|SS |ε
```

**Canyougiveanexampleofastringgeneratedbythisgrammar?**

### Example 1

- Considerthegrammar

```
G 1 = {S},{a,b},R,S ,
```

wherethesubstitutionrulesR aregivenby:

```
S →aSb|SS |ε
```

**Canyougiveanexampleofastringgeneratedbythisgrammar?**

  - Somestringsgeneratedbythisgrammar: ε, aabb, abab, aababb

  - Thestringaababbcanbegeneratedasfollows:

```
S ⇒aSb⇒aSSb⇒aa SbSb⇒aab Sb⇒aaba Sbb⇒aababb
```

### Example 1

- Considerthegrammar

```
G 1 = {S},{a,b},R,S ,
```

wherethesubstitutionrulesR aregivenby:

```
S →aSb|SS |ε
```

```
Isthelanguageallstringsover{a,b}withequalnumbersofaandb?
```

### Example 1

- Considerthegrammar

```
G 1 = {S},{a,b},R,S ,
```

wherethesubstitutionrulesR aregivenby:

```
S →aSb|SS |ε
```

```
Isthelanguageallstringsover{a,b}withequalnumbersofaandb?
```

No.

  - Giveanexampleofastringhavingequalnumbersofaandbthatisnot

**generatedbythisgrammar?**

### Example 1

- Considerthegrammar

```
G 1 = {S},{a,b},R,S ,
```

wherethesubstitutionrulesR aregivenby:

```
S →aSb|SS |ε
```

```
Isthelanguageallstringsover{a,b}withequalnumbersofaandb?
```

No.

  - Giveanexampleofastringhavingequalnumbersofaandbthatisnot

**generatedbythisgrammar?**

**ba**

  - Then,whatisthelanguage?

### Example 1

- Considerthegrammar

```
G 1 = {S},{a,b},R,S ,
```

wherethesubstitutionrulesR aregivenby:

```
S →aSb|SS |ε
```

```
Isthelanguageallstringsover{a,b}withequalnumbersofaandb?
```

No.

  - Giveanexampleofastringhavingequalnumbersofaandbthatisnot

**generatedbythisgrammar?**

**ba**

  - Then,whatisthelanguage?

Allbalancedparenthesisexpressions,bytreatingaas(andb as).

### Example 2

Consider the grammar G 2 defined by the rules:

```
S → aTa | bTb | ε | a | b
```

```
T → aT | bT | ε
```

  - Can you give an example of a string generated by this grammar?

### Example 2

Consider the grammar G 2 defined by the rules:

```
S → aTa | bTb | ε | a | b
```

```
T → aT | bT | ε
```

  - Can you give an example of a string generated by this grammar?

Some strings generated by this grammar are:

ε, a, b, aaa, aba, bab, babbaab.

  - Then, what is the language?

### Example 2

Consider the grammar G 2 defined by the rules:

```
S → aTa | bTb | ε | a | b
```

```
T → aT | bT | ε
```

  - Can you give an example of a string generated by this grammar?

Some strings generated by this grammar are:

ε, a, b, aaa, aba, bab, babbaab.

  - Then, what is the language?

```
All strings over {a,b} that start and end in the same symbol. (We
```

**assume that ε starts and ends in the same symbol.)**

  - Isn’t this language regular?

### Example 2

Consider the grammar G 2 defined by the rules:

```
S → aTa | bTb | ε | a | b
```

```
T → aT | bT | ε
```

  - Can you give an example of a string generated by this grammar?

Some strings generated by this grammar are:

ε, a, b, aaa, aba, bab, babbaab.

  - Then, what is the language?

```
All strings over {a,b} that start and end in the same symbol. (We
```

**assume that ε starts and ends in the same symbol.)**

  - Isn’t this language regular?

Yes! In fact, every regular language can be represented by a CFG, as

we shall see next. (That proves regular languages to be a strict subset

**of context free languages.)**

### How CFGs generate strings?

A grammar does not generate all strings of its language in a single

execution. Instead:

  - Each derivation from the start variable produces one string.

  - Different derivations produce different strings in the language.

In this sense, a CFG is similar to a DFA or NFA:

  - One traversal from the start state to a final state produces one string.

  - Repeating the process generates the entire language.

### Designing CFGs from CFLs

  - Designing a CFG for a given CFL-much like designing an NFA or DFA

for a regular language requires ingenuity and practice.

  - There is no general formula, algorithm, or fixed set of rules that works in

all cases.

  - That said, we can rely on a few broad guiding ideas.

### Designing CFGs from CFLs

**Union of Simpler CFGs**

Consider the language:

```
{0n1n | n ≥ 0} ∪ {1n0n | n ≥ 0}
```

The respective grammars for the language on either side of the union are:

```
S 1 → 0S 1 1 | ε
```

```
S 2 → 1S 2 0 | ε
```

### Designing CFGs from CFLs

**Union of Simpler CFGs**

Consider the language:

```
{0n1n | n ≥ 0} ∪ {1n0n | n ≥ 0}
```

The respective grammars for the language on either side of the union are:

```
S 1 → 0S 1 1 | ε
```

```
S 2 → 1S 2 0 | ε
```

Since the language consists of strings from the two CFLs, we introduce a

new start variable with the rule:

```
S → S 1 | S 2
```

### Designing CFGs from CFLs

**Union of Simpler CFGs**

Consider the language:

```
{0n1n | n ≥ 0} ∪ {1n0n | n ≥ 0}
```

The corresponding grammar is:

```
S → S 1 | S 2
```

```
S 1 → 0S 1 1 | ε
```

```
S 2 → 1S 2 0 | ε
```

### Designing CFGs from CFLs

**Concatenation of Simpler CFGs**

Consider the language:

```
{ambmcndn | m,n ≥ 0}
```

We can think of it as two separate CFGs:

```
S 1 → aS 1 b | ε
```

```
S 2 → cS 2 d | ε
```

### Designing CFGs from CFLs

**Concatenation of Simpler CFGs**

Consider the language:

```
{ambmcndn | m,n ≥ 0}
```

We can think of it as two separate CFGs:

```
S 1 → aS 1 b | ε
```

```
S 2 → cS 2 d | ε
```

Since the language consists of strings formed by concatenation of the two

CFLs, we introduce a new start variable with the rule:

**S → S 1 S 2**

### Designing CFGs from CFLs

**Concatenation of Simpler CFGs**

Consider the language:

```
{ambmcndn | m,n ≥ 0}
```

The corresponding grammar is:

**S → S 1 S 2**

```
S 1 → aS 1 b | ε
```

```
S 2 → cS 2 d | ε
```

### Designing CFGs from CFLs

**All Regular Languages Are Context-Free (DFA to CFG Conversion)**

```
Given a DFA (Q,Σ,δ,q 0 ,F), construct a CFG as follows:
```

  - For every state q i ∈ Q, add a variable Q i .

### Designing CFGs from CFLs

**All Regular Languages Are Context-Free (DFA to CFG Conversion)**

```
Given a DFA (Q,Σ,δ,q 0 ,F), construct a CFG as follows:
```

  - For every state q i ∈ Q, add a variable Q i .

  - The set of terminals is the DFA alphabet Σ.

### Designing CFGs from CFLs

**All Regular Languages Are Context-Free (DFA to CFG Conversion)**

```
Given a DFA (Q,Σ,δ,q 0 ,F), construct a CFG as follows:
```

  - For every state q i ∈ Q, add a variable Q i .

  - The set of terminals is the DFA alphabet Σ.

  - For each transition δ(q,a) = q, add the rule:

**i j**

**Q i → aQ j**

  - For each final state q i ∈ F, add the rule:

**Q i → ε**

### Designing CFGs from CFLs

**All Regular Languages Are Context-Free (DFA to CFG Conversion)**

```
Given a DFA (Q,Σ,δ,q 0 ,F), construct a CFG as follows:
```

  - For every state q i ∈ Q, add a variable Q i .

  - The set of terminals is the DFA alphabet Σ.

  - For each transition δ(q,a) = q, add the rule:

**i j**

**Q i → aQ j**

  - For each final state q i ∈ F, add the rule:

**Q i → ε**

  - Make Q 0 (corresponding to q 0 ) the start variable.

### Designing CFGs from CFLs

**All Regular Languages Are Context-Free (DFA to CFG Conversion)**

**a b start a b**

**b a**

**q 4 a q 3 b q 0 a q 1 b q 2**

Applying the DFA-to-CFG construction, we obtain the grammar:

```
Q 0 → aQ 1 | bQ 3 | ε
```

```
Q 1 → aQ 1 | bQ 2 | ε
```

```
Q 2 → aQ 1 | bQ 2
```

```
Q 3 → aQ 4 | bQ 3 | ε
```

```
Q 4 → aQ 4 | bQ 3
```

### Designing CFGs from CFLs

One part of the string can be linked to another part of the string

**For example, consider the language**

```
{0n1n | n ≥ 0}
```

The first part of the string consists of 0’s and the second part consists of 1’s,

with the link being that the number of 1’s must equal the number of 0’s.

### Designing CFGs from CFLs

One part of the string can be linked to another part of the string

**For example, consider the language**

```
{0n1n | n ≥ 0}
```

The first part of the string consists of 0’s and the second part consists of 1’s,

with the link being that the number of 1’s must equal the number of 0’s.

**Typically, languages of this sort involve a rule of the form**

**R → uRv**

whereu andv areterminalsymbols,variables,oracombinationofboth,and

the substring derived from v corresponds to the substring derived from u.

### Designing CFGs from CFLs

**Recursive structures within strings**

In some cases, strings may contain structures that appear recursively within

another structure or within the same structure.

We illustrate this using the following example.

```
E → E+T | T
```

```
T → T×F | F
```

```
F → (E) | a
```

Notice the recursion:

```
E ⇒ E+T ⇒ E+T×F ⇒ E+(E)×F
```

### Designing CFGs from CFLs

**Recursive structures within strings**

```
E → E+T | T
```

```
T → T×F | F
```

```
F → (E) | a
```

  - How does this grammar derive a×(a+a)?

```
E ⇒ T ⇒ T ×F ⇒ F ×F ⇒ a×F ⇒ a×(E) ⇒ a×(E +T)
```

```
⇒ a×(T +T) ⇒ a×(F +T) ⇒ a×(a+T) ⇒ a×(a+F)
```

**⇒ a×(a+a)**

  - What language does this grammar describe?

### Designing CFGs from CFLs

**Recursive structures within strings**

```
E → E+T | T
```

```
T → T×F | F
```

```
F → (E) | a
```

  - How does this grammar derive a×(a+a)?

```
E ⇒ T ⇒ T ×F ⇒ F ×F ⇒ a×F ⇒ a×(E) ⇒ a×(E +T)
```

```
⇒ a×(T +T) ⇒ a×(F +T) ⇒ a×(a+T) ⇒ a×(a+F)
```

**⇒ a×(a+a)**

  - What language does this grammar describe?

It generates arithmetic expressions over a with addition, multiplication,

and parentheses.

### Ambiguity

A grammar is ambiguous if a string can be derived using two different

leftmost derivations (equivalently, the string has two distinct parse trees).

A leftmost derivation means at any step, only the leftmost variable is

substituted via one of the rules.

### Ambiguity

A grammar is ambiguous if a string can be derived using two different

leftmost derivations (equivalently, the string has two distinct parse trees).

A leftmost derivation means at any step, only the leftmost variable is

substituted via one of the rules.

**Example grammar**

```
E → E +E | E ×E | (E) | a
```

**String: a×a+a**

### Ambiguity

A grammar is ambiguous if a string can be derived using two different

leftmost derivations (equivalently, the string has two distinct parse trees).

A leftmost derivation means at any step, only the leftmost variable is

substituted via one of the rules.

**Example grammar**

```
E → E +E | E ×E | (E) | a
```

**String: a×a+a**

**Leftmost derivation 1 (interpreted as (a×a)+a)**

```
E ⇒ E +E ⇒ E ×E +E ⇒ a×E +E ⇒ a×a+E ⇒ a×a+a
```

**Leftmost derivation 2 (interpreted as a×(a+a))**

```
E ⇒ E ×E ⇒ a×E ⇒ a×E +E ⇒ a×a+E ⇒ a×a+a
```

### Ambiguity: Why does it matter?

**(a×a)+a a×(a+a)**

**E E**

**E + E E × E**

**E × E a a E + E**

**a a a a**

  - Hence the expression a×a+a can be interpreted in two ways:

**(a×a)+a or a×(a+a)**

  - In compiler design, this leads to different semantic meanings.

  - Hence, we prefer unambiguous grammars.

### Ambiguity

**Unambiguous grammar with precedence**

```
E → E +T | T
```

```
T → T ×F | F
```

```
F → (E) | a
```

This grammar enforces:

  - × has higher precedence than +

  - unique parse tree for every string

Important:

  - Some ambiguous grammars can be rewritten to be unambiguous.

  - Some languages are inherently ambiguous (no unambiguous

grammar exists).

### Chomsky Normal Form (CNF)

A context-free grammar is in Chomsky Normal Form (CNF) if every rule is

of one of the following forms:

```
X → YZ or X → σ
```

**where**

  - X,Y,Z are variables (non-terminals),

```
σ ∈ Σ is a terminal symbol,
```

  - Y and Z cannot be the start variable, and

  - the rule S → ε is allowed if S is the start symbol.

### Chomsky Normal Form (CNF)

A context-free grammar is in Chomsky Normal Form (CNF) if every rule is

of one of the following forms:

```
X → YZ or X → σ
```

**where**

  - X,Y,Z are variables (non-terminals),

```
σ ∈ Σ is a terminal symbol,
```

  - Y and Z cannot be the start variable, and

  - the rule S → ε is allowed if S is the start symbol.

**Theorem: Any CFG can be converted into CNF without changing the**

language it generates.

### Chomsky Normal Form (CNF)

A context-free grammar is in Chomsky Normal Form (CNF) if every rule is

of one of the following forms:

```
X → YZ or X → σ
```

**where**

  - X,Y,Z are variables (non-terminals),

```
σ ∈ Σ is a terminal symbol,
```

  - Y and Z cannot be the start variable, and

  - the rule S → ε is allowed if S is the start symbol.

**Theorem: Any CFG can be converted into CNF without changing the**

language it generates.

Why CNF? CNF is useful for algorithms on CFGs, such as CYK parsing (for

checking if a string is generated by a CFG).

### CFG and PDA Equivalence

To prove that CFG and PDA are equivalent, we rely on the following:

  - Show that any CFG can be converted to a PDA.

This is achieved by showing that a leftmost derivation in CFG can be

simulated by bulk push/pop operations in PDA.

### CFG and PDA Equivalence

To prove that CFG and PDA are equivalent, we rely on the following:

  - Show that any CFG can be converted to a PDA.

This is achieved by showing that a leftmost derivation in CFG can be

simulated by bulk push/pop operations in PDA.

  - Show that any PDA can be converted to a CFG.

This is achieved by showing that if a string x drives a PDA from one

state to another, then the CFG can generate that string.

### CFG to PDA: Main Idea

  - A string derived by a CFG should drive the PDA from start to accept.

  - The PDA simulates a leftmost derivation as follows:

    - Iftopofstackisaterminal,popandmatchitwithinput.

    - Elseiftopis$andinputisempty,accept.

    - Else,popthevariableonthetopofthestackandbulk-pushtheRHSof

therulesontothestack.

### CFG to PDA: PDA Construction

Let CFG have terminals T and variables V. The equivalent PDA is:

  - Input alphabet: Σ = T

```
Stack alphabet: Γ = T ∪V
```

```
States: Q = {q start ,q loop ,q accept }∪E,
```

**where E = additional states for string push/pop**

  - Start state: q start

  - Final state: q accept

  - Transitions:

**1. Start: δ(q start ,ε,ε)=(q loop ,S$)**

```
2. Variablereplacement: δ(q loop ,ε,A)=(q loop ,w)forA→w
```

**3. Terminalmatch: δ(q loop ,σ,σ)=(q loop ,ε)**

**4. Accepton$: δ(q loop ,ε,$)=(q accept ,ε)**

### CFG to PDA: Example

**start q start**

```
ε,ε → S$ ε,S → aTb
```

**ε,S → b**

```
S → aTb | b q loop ε ε , , T T → → T ε a
```

```
T → Ta | ε ε,$ → ε a,a → ε
```

**b,b → ε**

**q accept**

### CFG to PDA: Example

    - Examplestring:aaab

    - Stackinitially:S$

**SubstituteS→aTb Stack:aTb$**

- start q start Readterminalaandpop. Stack:Tb$

```
ε,ε → S$ ε,S → aTb SubstituteT →Ta
```

    - ε,S → b Stack:Tab$

```
ε,T → Ta Stack:Taab$ SubstituteT →Ta
```

```
q loop ε,T → ε SubstituteT →ε
```

```
ε,$ → ε a,a → ε Stack:aab$
```

    - b,b → ε Readremaininginputaab,andpopmatching

**terminalsone-by-one. Stack:$**

    - q accept Accept.

**Examplestring: aaaba**

    - Samestepsasabove.

    - Attheend,stackhas$,butinputhasone

remaininga.So,reject.

### PDA to CFG: Main Idea

If a PDA accepts a string, the CFG should generate it.

For every pair of states p,q in the PDA, create a variable:

**A pq**

which generates all strings that drive the PDA from:

  - state p with empty stack

  - to state q with empty stack

Choosing p and q as the start and accept states, the construction

guarantees a correct conversion.

### PDA Assumptions (Normalization)

We assume the PDA:

  - Has a single accepting state

Otherwise, add a new accepting state.

  - Accepts by empty stack

Otherwise, add a pop-only loop at accept state.

  - Each transition either:

    - pushes,or

    - pops,butnotboth

Otherwise, split push+pop transitions into two steps.

### Key Stack Behavior Cases

For a string x driving PDA from p to q with empty stack:

**Case 1: Stack becomes empty in between at state r**

**x = yz, A pq → A pr A rq**

where y drives from p to r, and z drives from r to q.

### Key Stack Behavior Cases

For a string x driving PDA from p to q with empty stack:

**Case 1: Stack becomes empty in between at state r**

**x = yz, A pq → A pr A rq**

where y drives from p to r, and z drives from r to q.

**Case 2: Stack is never empty in between**

First move reads α, pushes symbol u, and we move to state r.

Last move from state s reads symbol β, pops the same symbol u, and we

move to state q.

**x = αyβ, A pq → αA rs β**

where y drives from r to s.

### CFG Construction

Variables:

```
{A pq | p,q are PDA states}
```

Start variable:

**A q 0 qaccept**

Terminals:

**PDA input alphabet Σ**

Rules:

**1. Identity rule: A pp → ε**

**2. Decomposition rule: A pq → A pr A rq for all r**

3. Push-pop matching rule: A pq → αA rs β whenever the PDA contains both

**the transitions**

    - δ(p,α,ε)=(r,u)

    - δ(s,β,u)=(q,ε)

### Example (Start and Identity Rules)

```
0,ε → 0 1,0 → ε
```

```
start q 0 ε,ε → $ q 1 1,0 → ε q 2 ε,$ → ε q 3
```

**S → A 03**

**A 00 → ε**

**A 11 → ε**

**A 22 → ε**

**A 33 → ε**

### Example (Decomposition Rules)

```
0,ε → 0 1,0 → ε
```

```
start q 0 ε,ε → $ q 1 1,0 → ε q 2 ε,$ → ε q 3
```

```
A 00 → A 00 A 00 | A 01 A 10 | A 02 A 20 | A 03 A 30
```

```
A 01 → A 00 A 01 | A 01 A 11 | A 02 A 21 | A 03 A 31
```

```
A 02 → A 00 A 02 | A 01 A 12 | A 02 A 22 | A 03 A 32
```

```
A 03 → A 00 A 03 | A 01 A 13 | A 02 A 23 | A 03 A 33
```

. . .

```
A 30 → A 30 A 00 | A 31 A 10 | A 32 A 20 | A 33 A 30
```

```
A 31 → A 30 A 01 | A 31 A 10 | A 32 A 21 | A 33 A 31
```

```
A 32 → A 30 A 02 | A 31 A 12 | A 32 A 22 | A 33 A 32
```

```
A 33 → A 30 A 03 | A 31 A 13 | A 32 A 23 | A 33 A 33
```

### Example (Push-pop Matching Rule)

```
0,ε → 0 1,0 → ε
```

```
start q 0 ε,ε → $ q 1 1,0 → ε q 2 ε,$ → ε q 3
```

**A 12 → 0A 12 1**

**A 12 → 0A 11 1**

**A 03 → εA 12 ε**

```
δ(q ,0,ε) = (q ,0) and δ(q ,1,0) = (q ,ε)
```

    - 1 1 2 2

```
δ(q 1 ,0,ε) = (q 1 ,0) and δ(q 1 ,1,0) = (q 2 ,ε)
```

```
δ(q 0 ,ε,ε) = (q 1 ,$) and δ(q 2 ,ε,$) = (q 3 ,ε)
```

### Closure Operations

**Context Free Languages are closed under**

  - Union

```
S → S 1 | S 2
```

where S is the start variable of the concatenated grammar, and S 1 and

S 2 are start variables of two context free grammars.

  - Concatenation

**S → S 1 S 2**

where S is the start variable of the concatenated grammar, and S 1 and

S 2 are start variables of two context free grammars.

  - Kleene’s operation

```
S Kleene → ε | SS Kleene
```

where S is the old start variable and S Kleene is the new start variable.

### Closure Operations

**Context Free Languages are not closed under**

  - Intersection

**The following are context-free**

```
{anbnc∗ | n ≥ 0}
```

```
{a∗bncn | n ≥ 0}
```

```
The intersection {anbncn | n ≥ 0} is not.
```

```
Notethat{anbncn |n≥0}isnottheconcatenationoftheCFLs
```

```
{anbn |n≥0}and{cn |n≥0}.
```

```
Rathertheconcatenationis{anbncm |m,n≥0},whichiscontext-free.
```

  - Complement

```
Otherwise, L 1 ∩L 2 = ¬(¬L 1 ∪¬L 2 ) should be context-free.
```

.

### Practice Problems

Construct a CFG for each of the following languages:

```
{}
```

```
anb2n | n ≥ 0 ∪ a2nbn | n ≥ 0
```

  - aibjck | i = j or i = k

  - w | w is a binary string with equal number of zeroes and ones

```
0m1n | m n}
```

```
w | w ∈ {a,b,c}∗ and w is a palindrome
```

```
ambncm+n | m+n ≥ 1}
```

  - aibjckd- | i +k = j +-

### Practice Problems

```
{}
```

**S → S**

```
anb2n | n ≥ 0 ∪ a2nbn | n ≥ 0
```

```
S → A | B
```

```
A → aa Ab | ε
```

```
B → aBbb | ε
```

### Practice Problems

  - aibjck | i = j or i = k

```
S → UV | W
```

```
U → aUb | ε
```

```
V → cV | ε
```

```
W → aWc | X
```

```
X → bX | ε
```

  - w | w is a binary string with equal number of zeroes and ones

```
S → SS | 0S1 | 1S0 | ε
```

### Practice Problems

```
0m1n | m n}
```

```
S → 0S1 | 0U | 1V
```

```
U → 0U | ε
```

```
V → 1V | ε
```

```
w | w ∈ {a,b,c}∗ and w is a palindrome
```

**S → E**

```
E → aEa | bEb | cEc | O | ε
```

```
O → a | b | c
```

### Practice Problems

```
ambncm+n | m+n ≥ 1}
```

```
S → aAc | bBc
```

```
A → aAc | B | ε
```

```
B → bBc | ε
```

  - aibjckd- | i +k = j +-

```
S → aSd | UVW
```

```
U → aUb | ε
```

```
V → bVc | ε
```

```
W → cWd | ε
```

### Non-Regular Languages

**Arnab Ganguly**

**Departmentof Computer Science Shiv Nadar IoE**

### Introduction

**Are there languages not recognizable by DFA/NFA?**

- Yes, for example 0n1n, where n ≥ 0 is an integer.

**▶ Thelanguagerequiresustorememberthenumberofzeroeswhenwe**

- startprocessingtheones.

RememberingisdifficultforNFA/DFAbecausetheyarememoryless.

### Introduction

**Are there languages not recognizable by DFA/NFA?**

- Yes, for example 0n1n, where n ≥ 0 is an integer.

**▶ Thelanguagerequiresustorememberthenumberofzeroeswhenwe**

- startprocessingtheones.

RememberingisdifficultforNFA/DFAbecausetheyarememoryless.

- In a nutshell, if the structure of a language requires a memory, then

NFA/DFA cannot be used.

### Introduction

**Are there languages not recognizable by DFA/NFA?**

- Yes, for example 0n1n, where n ≥ 0 is an integer.

**▶ Thelanguagerequiresustorememberthenumberofzeroeswhenwe**

- startprocessingtheones.

RememberingisdifficultforNFA/DFAbecausetheyarememoryless.

- In a nutshell, if the structure of a language requires a memory, then

NFA/DFA cannot be used.

**▶ Is there a formal way to prove non-regularity?**

### Introduction

**Are there languages not recognizable by DFA/NFA?**

- Yes, for example 0n1n, where n ≥ 0 is an integer.

**▶ Thelanguagerequiresustorememberthenumberofzeroeswhenwe**

- startprocessingtheones.

RememberingisdifficultforNFA/DFAbecausetheyarememoryless.

- In a nutshell, if the structure of a language requires a memory, then

NFA/DFA cannot be used.

**▶ Is there a formal way to prove non-regularity? Yes!**

**▶ Pumping Lemma**

**▶ Closure Operations**

### Introduction

**Are there languages not recognizable by DFA/NFA?**

- Yes, for example 0n1n, where n ≥ 0 is an integer.

**▶ Thelanguagerequiresustorememberthenumberofzeroeswhenwe**

- startprocessingtheones.

RememberingisdifficultforNFA/DFAbecausetheyarememoryless.

- In a nutshell, if the structure of a language requires a memory, then

NFA/DFA cannot be used.

**▶ Is there a formal way to prove non-regularity? Yes!**

**▶ Pumping Lemma**

**▶ Closure Operations**

**▶ Are there more powerful machines for recognizing non-regular**

**languages?**

### Introduction

**Are there languages not recognizable by DFA/NFA?**

- Yes, for example 0n1n, where n ≥ 0 is an integer.

**▶ Thelanguagerequiresustorememberthenumberofzeroeswhenwe**

- startprocessingtheones.

RememberingisdifficultforNFA/DFAbecausetheyarememoryless.

- In a nutshell, if the structure of a language requires a memory, then

NFA/DFA cannot be used.

**▶ Is there a formal way to prove non-regularity? Yes!**

**▶ Pumping Lemma**

**▶ Closure Operations**

**▶ Are there more powerful machines for recognizing non-regular**

languages? Yes! We shall seem them later.

### Introduction

**The General Proof Framework**

- If a language is regular, then the pumping lemma will hold.

**▶ Werelyonthecontrapositive: ifthepumpinglemmadoesnothold,then**

- thelanguageisnon-regular.

**Noticethatifthepumpinglemmaholds,wecannotdrawtheconclusion**

- thatthelanguageisregular.

So,toproveregularity,werelyonDFA/NFAconstruction.

### Introduction

**The General Proof Framework**

- If a language is regular, then the pumping lemma will hold.

**▶ Werelyonthecontrapositive: ifthepumpinglemmadoesnothold,then**

- thelanguageisnon-regular.

**Noticethatifthepumpinglemmaholds,wecannotdrawtheconclusion**

- thatthelanguageisregular.

So,toproveregularity,werelyonDFA/NFAconstruction.

- Suppose,L 1 isaknownregularlanguageandL 2 ’sstatusisunknown.. If

```
L 1 ∩L 2 or L 1 ∪L 2 is non-regular, then L 2 must be non-regular (based on
```

closure properties).

### The Pumping Lemma

**Statement**

If L is a regular language and p > 0 is the pumping length, then EVERY

```
string s ∈ L, where |s| ≥ p, satisfies:
```

**s can be partitioned as s = xyz, such that**

### The Pumping Lemma

**Statement**

If L is a regular language and p > 0 is the pumping length, then EVERY

```
string s ∈ L, where |s| ≥ p, satisfies:
```

**s can be partitioned as s = xyz, such that**

1. xy∗z ∈ L,

### The Pumping Lemma

**Statement**

If L is a regular language and p > 0 is the pumping length, then EVERY

```
string s ∈ L, where |s| ≥ p, satisfies:
```

**s can be partitioned as s = xyz, such that**

1. xy∗z ∈ L,

```
2. y ̸= ε (i.e., |y| > 0), and
```

### The Pumping Lemma

**Statement**

If L is a regular language and p > 0 is the pumping length, then EVERY

```
string s ∈ L, where |s| ≥ p, satisfies:
```

**s can be partitioned as s = xyz, such that**

1. xy∗z ∈ L,

```
2. y ̸= ε (i.e., |y| > 0), and
```

```
3. |xy| ≤ p
```

**What is the pumping length?**

For every regular language, there exists a pumping length p. In particular, if

a DFA recognizing the language has n states, then one may take p = n.

We won’t dwell on this further, but a little bit of light will be shed when we

discuss the proof of the pumping lemma.

### The Pumping Lemma

**How do we make it work?**

- First, do not fix the pumping length. Keep it general, i.e., pumping

length is an arbitrary integer p > 0.

### The Pumping Lemma

**How do we make it work?**

- First, do not fix the pumping length. Keep it general, i.e., pumping

length is an arbitrary integer p > 0.

```
- Next, choose a string s ∈ L, such that |s| ≥ p.
```

- Onehastobecareful/cleveraboutthechoiceofs.

- Justbecauseonestringcanbepumpeddoesnotmean Lisregular.

### The Pumping Lemma

**How do we make it work?**

- First, do not fix the pumping length. Keep it general, i.e., pumping

length is an arbitrary integer p > 0.

```
- Next, choose a string s ∈ L, such that |s| ≥ p.
```

- Onehastobecareful/cleveraboutthechoiceofs.

- Justbecauseonestringcanbepumpeddoesnotmean Lisregular.

```
- Consider all possible partitions such that |xy| ≤ p and y ̸= ε. This is
```

crucial. One string suffices, but all of its partitions must be considered.

### The Pumping Lemma

**How do we make it work?**

- First, do not fix the pumping length. Keep it general, i.e., pumping

length is an arbitrary integer p > 0.

```
- Next, choose a string s ∈ L, such that |s| ≥ p.
```

- Onehastobecareful/cleveraboutthechoiceofs.

- Justbecauseonestringcanbepumpeddoesnotmean Lisregular.

```
- Consider all possible partitions such that |xy| ≤ p and y ̸= ε. This is
```

crucial. One string suffices, but all of its partitions must be considered.

- Lastly show that the string cannot be pumped, i.e., there exists i ≥ 0,

such that xyiz ∈/ L.

### Pumping Lemma Examples

```
L = {0n1n | n ≥ 0}
```

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

### Pumping Lemma Examples

```
L = {0n1n | n ≥ 0}
```

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

- Since y ̸= ε, we have three possibilities:

- y consistsofzeroesonly.

### Pumping Lemma Examples

```
L = {0n1n | n ≥ 0}
```

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

- Since y ̸= ε, we have three possibilities:

- y consistsofzeroesonly.

- Then,xy2z pumpsonlythezeroesandwehavemorezeroesthanones.

y consistsofonesonly.

### Pumping Lemma Examples

```
L = {0n1n | n ≥ 0}
```

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

- Since y ̸= ε, we have three possibilities:

- y consistsofzeroesonly.

- Then,xy2z pumpsonlythezeroesandwehavemorezeroesthanones.

y consistsofonesonly.

- Then,xy2z pumpsonlytheonesandwehavefewerzeroesthanones.

y consistsofbothzeroesandones.

### Pumping Lemma Examples

```
L = {0n1n | n ≥ 0}
```

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

- Since y ̸= ε, we have three possibilities:

- y consistsofzeroesonly.

- Then,xy2z pumpsonlythezeroesandwehavemorezeroesthanones.

y consistsofonesonly.

- Then,xy2z pumpsonlytheonesandwehavefewerzeroesthanones.

y consistsofbothzeroesandones.

Then,xy2z hasonesbeforezeroes.

- In all three possibilities, xy2z ∈/ L. So, the pumping lemma does not

hold, implying L is non-regular.

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones}
```

**Does the same proof from the previous slide work?**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired. All good so far?
```

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones}
```

**Does the same proof from the previous slide work?**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired. All good so far? Yes!
```

- Since y ̸= ε, we have three possibilities:

- Ify consistsofzeroesonly,thenxy2z hasmorezeroesthanones. So,

**xy2z ∈/ L. Isthisclaimcorrect?**

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones}
```

**Does the same proof from the previous slide work?**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired. All good so far? Yes!
```

- Since y ̸= ε, we have three possibilities:

- Ify consistsofzeroesonly,thenxy2z hasmorezeroesthanones. So,

**xy2z ∈/ L. Isthisclaimcorrect? Yes!**

- Ify consistsofonesonly,thenxy2z hasfewerzeroesthanones. So,

**xy2z ∈/ L. Isthisclaimcorrect?**

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones}
```

**Does the same proof from the previous slide work?**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired. All good so far? Yes!
```

- Since y ̸= ε, we have three possibilities:

- Ify consistsofzeroesonly,thenxy2z hasmorezeroesthanones. So,

**xy2z ∈/ L. Isthisclaimcorrect? Yes!**

- Ify consistsofonesonly,thenxy2z hasfewerzeroesthanones. So,

**xy2z ∈/ L. Isthisclaimcorrect? Yes!**

- Ify consistsofbothzeroesandones,thenxy2z hasonesbeforezeroes.

**So,xy2z ∈/ L. Isthisclaimcorrect?**

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones}
```

**Does the same proof from the previous slide work?**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired. All good so far? Yes!
```

- Since y ̸= ε, we have three possibilities:

- Ify consistsofzeroesonly,thenxy2z hasmorezeroesthanones. So,

**xy2z ∈/ L. Isthisclaimcorrect? Yes!**

- Ify consistsofonesonly,thenxy2z hasfewerzeroesthanones. So,

**xy2z ∈/ L. Isthisclaimcorrect? Yes!**

- Ify consistsofbothzeroesandones,thenxy2z hasonesbeforezeroes.

**So,xy2z ∈/ L. Isthisclaimcorrect? No!**

**Having ones before zeroes is no longer a problem!**

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones} –
```

**a correct proof**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

```
- Since |xy| ≤ p and y ̸= ε, we have only one possibility: y consists of
```

**zeroes only. Why?**

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones} –
```

**a correct proof**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

```
- Since |xy| ≤ p and y ̸= ε, we have only one possibility: y consists of
```

**zeroes only. Why?**

- xy makeupthefirstpartofthestringw =xyz.

- So,xy togethercanhouseatmostthefirstp zeroes.

```
- Otherwise,|xy|>p.
```

### Pumping Lemma Examples

```
L = {w | w ∈ {0,1}∗ and w has an equal number of zeroes and ones} –
```

**a correct proof**

- Let p be the pumping length. Choose s = 0p1p. Note that s ∈ L and

```
|s| = 2p > p, as desired.
```

```
- Since |xy| ≤ p and y ̸= ε, we have only one possibility: y consists of
```

**zeroes only. Why?**

- xy makeupthefirstpartofthestringw =xyz.

- So,xy togethercanhouseatmostthefirstp zeroes.

```
- Otherwise,|xy|>p.
```

- Hence, xy2z has more zeroes than ones, and xy2z ∈/ L.

### Pumping Lemma Examples

```
L = {1n2 | n ≥ 0}
```

- Let p be the pumping length. Choose s = 1p2. Note that s ∈ L and

```
|s| = p2 > p, as desired.
```

### Pumping Lemma Examples

```
L = {1n2 | n ≥ 0}
```

- Let p be the pumping length. Choose s = 1p2. Note that s ∈ L and

```
|s| = p2 > p, as desired.
```

- Consider the string xy2z.

```
- Since|xy|≤p,wehave|y|≤p,implyingthat
```

```
|xy2z|=|xyz|+|y|≤p2+p <(p+1)2
```

### Pumping Lemma Examples

```
L = {1n2 | n ≥ 0}
```

- Let p be the pumping length. Choose s = 1p2. Note that s ∈ L and

```
|s| = p2 > p, as desired.
```

- Consider the string xy2z.

```
- Since|xy|≤p,wehave|y|≤p,implyingthat
```

```
|xy2z|=|xyz|+|y|≤p2+p <(p+1)2
```

```
- Since|y|>0,wehave
```

```
|xy2z|=|xyz|+|y|>p2
```

### Pumping Lemma Examples

```
L = {1n2 | n ≥ 0}
```

- Let p be the pumping length. Choose s = 1p2. Note that s ∈ L and

```
|s| = p2 > p, as desired.
```

- Consider the string xy2z.

```
- Since|xy|≤p,wehave|y|≤p,implyingthat
```

```
|xy2z|=|xyz|+|y|≤p2+p <(p+1)2
```

```
- Since|y|>0,wehave
```

```
|xy2z|=|xyz|+|y|>p2
```

- Thus,

```
p2 <|xy2z|≤(p+1)2
```

- So, xy2z ∈/ L, because its length is not a perfect square.

### Pumping Lemma Examples

```
L = {0m1n | m > n}
```

**▶ Let p be the pumping length. What should be the choice of s?**

### Pumping Lemma Examples

```
L = {0m1n | m > n}
```

**▶ Let p be the pumping length. What should be the choice of s?**

```
Choose s = 0p+11p. Note that s ∈ L and |s| = 2p+1 > p, as desired.
```

### Pumping Lemma Examples

```
L = {0m1n | m > n}
```

**▶ Let p be the pumping length. What should be the choice of s?**

```
Choose s = 0p+11p. Note that s ∈ L and |s| = 2p+1 > p, as desired.
```

**▶ What is y made of?**

```
Since y ̸= ε and |xy| ≤ p, y only consists of zeroes.
```

### Pumping Lemma Examples

```
L = {0m1n | m > n}
```

**▶ Let p be the pumping length. What should be the choice of s?**

```
Choose s = 0p+11p. Note that s ∈ L and |s| = 2p+1 > p, as desired.
```

**▶ What is y made of?**

```
Since y ̸= ε and |xy| ≤ p, y only consists of zeroes.
```

```
- Does xyiz ∈ L, where i ≥ 2?
```

Yes, it does. Pumping up does not work in this case.

### Pumping Lemma Examples

```
L = {0m1n | m > n}
```

**▶ Let p be the pumping length. What should be the choice of s?**

```
Choose s = 0p+11p. Note that s ∈ L and |s| = 2p+1 > p, as desired.
```

**▶ What is y made of?**

```
Since y ̸= ε and |xy| ≤ p, y only consists of zeroes.
```

```
- Does xyiz ∈ L, where i ≥ 2?
```

Yes, it does. Pumping up does not work in this case.

**▶ What about xy0z = xz?**

Since y ̸= ε, the string xy0z can consist of at most p ones.

This implies xy0z ∈/ L, because we lose at least one zero on omitting y.

### Pumping Lemma Examples

```
L = {ww | w ∈ {0,1}∗}
```

**▶ What is the length of the strings in the language?**

### Pumping Lemma Examples

```
L = {ww | w ∈ {0,1}∗}
```

**▶ What is the length of the strings in the language?**

Even length strings.

**▶ What other structure do these strings have?**

### Pumping Lemma Examples

```
L = {ww | w ∈ {0,1}∗}
```

**▶ What is the length of the strings in the language?**

Even length strings.

**▶ What other structure do these strings have?**

The second half is the same as the first half.

**▶ Does the string s = 1p1p work?**

### Pumping Lemma Examples

```
L = {ww | w ∈ {0,1}∗}
```

**▶ What is the length of the strings in the language?**

Even length strings.

**▶ What other structure do these strings have?**

The second half is the same as the first half.

- Does the string s = 1p1p work? No, it doesn’t.

- Choosex =ε,y =11,andz =1p−21p.

- Now,xy∗z ∈L.

**▶ Does that mean the language is regular?**

### Pumping Lemma Examples

```
L = {ww | w ∈ {0,1}∗}
```

**▶ What is the length of the strings in the language?**

Even length strings.

**▶ What other structure do these strings have?**

The second half is the same as the first half.

- Does the string s = 1p1p work? No, it doesn’t.

- Choosex =ε,y =11,andz =1p−21p.

- Now,xy∗z ∈L.

- Does that mean the language is regular? No, it doesn’t. Remember:

- Pumpinglemmahastoworkforallstrings.

- Justbecauseitworksdoesn’timplyregularity.

### Pumping Lemma Examples

```
L = {ww | w ∈ {0,1}∗}
```

- Let p be the pumping length. Choose s = 1p01p0. Clearly, s ∈ L (by

```
letting w = 1p0) and |s| ≥ p.
```

```
- Since |xy| ≤ p and y ̸= ε,
```

- y consistsofonesonly.

**▶ Ify =1a,wherea>0,thenxy2z =1p+101p0**

- xy2z cannotbewrittenasww.

### Pumping Lemma Examples

```
L = {ww | w ∈ {0,1}∗}
```

- Let p be the pumping length. Choose s = 1p01p0. Clearly, s ∈ L (by

```
letting w = 1p0) and |s| ≥ p.
```

```
- Since |xy| ≤ p and y ̸= ε,
```

- y consistsofonesonly.

**▶ Ify =1a,wherea>0,thenxy2z =1p+101p0**

- xy2z cannotbewrittenasww.

- So, xy2z ∈/ L.

### Practice Problems (using Pumping Lemma)

  - ▶ L = aibjck | i +j = 2k

  - ▶ L = aibjck | i ·j > k

```
- L = {www | w ∈ {0,1}∗}
```

```
- L = {x 1 0x 2 0x 3 0...x k | k ≥ 0, each x i ∈ 1∗ and x i ̸= x j for i ̸= j}
```

```
- {1kw | w ∈ {0,1}∗ has at most k ones, where k ≥
```

```
1 is any arbitrary integer}
```

### Practice Problems (using Pumping Lemma)

- L = aibjck | i +j = 2k

- Let s = apbpcp be a string, where p > 0 is the pumping length. Clearly,

```
s ∈ L and |s| = 3p > p.
```

### Practice Problems (using Pumping Lemma)

- L = aibjck | i +j = 2k

- Let s = apbpcp be a string, where p > 0 is the pumping length. Clearly,

```
s ∈ L and |s| = 3p > p.
```

```
- If we decompose s = xyz, then y ∈ a+, because y ̸= ε and |xy| ≤ p.
```

### Practice Problems (using Pumping Lemma)

- L = aibjck | i +j = 2k

- Let s = apbpcp be a string, where p > 0 is the pumping length. Clearly,

```
s ∈ L and |s| = 3p > p.
```

```
- If we decompose s = xyz, then y ∈ a+, because y ̸= ε and |xy| ≤ p.
```

**▶ Then, thenumberofainxy2z ismorethanp, butthenumberofbandc**

is p. So, xy2z ∈/ L.

### Practice Problems (using Pumping Lemma)

- L = aibjck | i ·j > k

- Let s = apbp+1cp2 be a string, where p > 0 is the pumping length.

```
Clearly, s ∈ L, because p(p+1) > p2. Also, |s| = 2p+1+p2 > p.
```

### Practice Problems (using Pumping Lemma)

- L = aibjck | i ·j > k

- Let s = apbp+1cp2 be a string, where p > 0 is the pumping length.

```
Clearly, s ∈ L, because p(p+1) > p2. Also, |s| = 2p+1+p2 > p.
```

```
- If we decompose s = xyz, then y ∈ a+, because y ̸= ε and |xy| ≤ p.
```

### Practice Problems (using Pumping Lemma)

- L = aibjck | i ·j > k

- Let s = apbp+1cp2 be a string, where p > 0 is the pumping length.

```
Clearly, s ∈ L, because p(p+1) > p2. Also, |s| = 2p+1+p2 > p.
```

```
- If we decompose s = xyz, then y ∈ a+, because y ̸= ε and |xy| ≤ p.
```

**▶ Then, thenumberofainxy0z isatmost(p−1). So, xy0z ∈/ L,because**

#a·#b ≤ (p−1)(p+1) = p2−1 < p2.

### Practice Problems (using Pumping Lemma)

```
L = {www | w ∈ {0,1}∗}
```

- Let s = 0p10p10p1, where p is the pumping length. If we decompose

s = xyz, then y ̸= ε only consists of 0.

### Practice Problems (using Pumping Lemma)

```
L = {www | w ∈ {0,1}∗}
```

- Let s = 0p10p10p1, where p is the pumping length. If we decompose

s = xyz, then y ̸= ε only consists of 0.

- So, xy2z has the following structure 0p+i10p10p1, where y = 0i.

- Since i > 0, there is no way to choose a string w such that www is the

**same as 0p+i10p10p1**

### Practice Problems (using Pumping Lemma)

```
L = {x 1 0x 2 0x 3 0...x k | k ≥ 0, each x i ∈ 1∗ and x i ̸= x j for i ̸= j}
```

- Let s = 1p01p+101p+20...12p, where p is the pumping length. Clearly

s ∈ L, with k = p > 0.

### Practice Problems (using Pumping Lemma)

```
L = {x 1 0x 2 0x 3 0...x k | k ≥ 0, each x i ∈ 1∗ and x i ̸= x j for i ̸= j}
```

- Let s = 1p01p+101p+20...12p, where p is the pumping length. Clearly

s ∈ L, with k = p > 0.

- Let, y = 1i for some i > 0.

- Then, xy2z = 1p+i01p+101p+20...12p.

### Practice Problems (using Pumping Lemma)

```
L = {x 1 0x 2 0x 3 0...x k | k ≥ 0, each x i ∈ 1∗ and x i ̸= x j for i ̸= j}
```

- Let s = 1p01p+101p+20...12p, where p is the pumping length. Clearly

s ∈ L, with k = p > 0.

- Let, y = 1i for some i > 0.

- Then, xy2z = 1p+i01p+101p+20...12p.

```
- Since 1 ≤ i ≤ p, it follows p+1 ≤ p+i ≤ 2p, which means xy2z
```

contains two runs of 1 symbols that are of equal length.

### Practice Problems (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at most k ones, where k ≥
```

```
1 is any arbitrary integer}
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

### Practice Problems (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at most k ones, where k ≥
```

```
1 is any arbitrary integer}
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

- If we decompose s = xyz, then by the pumping lemma conditions,

y = 1i for some i > 0. Hence, xy0z = 1p−i01p.

### Practice Problems (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at most k ones, where k ≥
```

```
1 is any arbitrary integer}
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

- If we decompose s = xyz, then by the pumping lemma conditions,

y = 1i for some i > 0. Hence, xy0z = 1p−i01p.

- We conclude that xy0z ∈/ L, because any choice of w has at least p

ones, whereas we have fewer than p consecutive ones as the prefix.

### Incorrect Proofs (using Pumping Lemma)

```
L = {ambn | m > n} is a non-regular language.
```

**Why is the following proof incorrect?**

```
- Lets = apbp,wherep isthepumpinglength. Notethat|s| = 2p > p,the
```

pumping length.

- Decomposing s = xyz as per pumping lemma leads to y = ai for some

i > 0. Then, x = aj, such that i +j ≤ p.

- Pump down y to get xy0z = xz = ajap−i−jbp = ap−ibp.

- Since p−i < p, xy0z = xz ∈/ L, which means L is non-regular.

### Incorrect Proofs (using Pumping Lemma)

```
L = {ambn | m > n} is a non-regular language.
```

**Why is the following proof incorrect?**

```
- Lets = apbp,wherep isthepumpinglength. Notethat|s| = 2p > p,the
```

pumping length.

- Decomposing s = xyz as per pumping lemma leads to y = ai for some

i > 0. Then, x = aj, such that i +j ≤ p.

- Pump down y to get xy0z = xz = ajap−i−jbp = ap−ibp.

- Since p−i < p, xy0z = xz ∈/ L, which means L is non-regular.

The initial string s = apbp ∈/ L. We must choose a string from the language.

### Incorrect Proofs (using Pumping Lemma)

L = a∗b∗ is a non-regular language.

**Why is the following proof incorrect?**

- Choose s = ap/2bp/2.

```
- Note that s ∈ L and |s| ≥ p, the pumping length.
```

- We decompose s = xyz. Let y consist of both a and b; this satisfies

conditions 2 and 3.

- Then, xy2z has at least one b before a, which means xy2z ∈/ L. So,

condition 1 is violated and L is not regular.

### Incorrect Proofs (using Pumping Lemma)

L = a∗b∗ is a non-regular language.

**Why is the following proof incorrect?**

- Choose s = ap/2bp/2.

```
- Note that s ∈ L and |s| ≥ p, the pumping length.
```

- We decompose s = xyz. Let y consist of both a and b; this satisfies

conditions 2 and 3.

- Then, xy2z has at least one b before a, which means xy2z ∈/ L. So,

condition 1 is violated and L is not regular.

We only consider the decomposition where y contains both a and b. If you

choose y to contain only a or only b, then the language is pumpable, which

makes sense because L is regular as we already know.

### Incorrect Proofs (using Pumping Lemma)

```
L = {anwan | n ≥ 1 and w ∈ {a,b}∗} is a non-regular language.
```

**Why is the following proof incorrect?**

**▶ Let s = apbap, where p is the pumping length. Note that**

```
s ∈ L and |s| ≥ p, the pumping length.
```

- Decomposing s = xyz as per the pumping lemma conditions leads to

y = ai for some i > 0.

- Pump up y to get xy2z = ap+ibap.

- However, p+i > p; so, xy2z ∈/ L, which means L is non-regular.

### Incorrect Proofs (using Pumping Lemma)

```
L = {anwan | n ≥ 1 and w ∈ {a,b}∗} is a non-regular language.
```

**Why is the following proof incorrect?**

**▶ Let s = apbap, where p is the pumping length. Note that**

```
s ∈ L and |s| ≥ p, the pumping length.
```

- Decomposing s = xyz as per the pumping lemma conditions leads to

y = ai for some i > 0.

- Pump up y to get xy2z = ap+ibap.

- However, p+i > p; so, xy2z ∈/ L, which means L is non-regular.

The claim xy2z = ap+ibap ∈/ L is incorrect. Even though p+i > p, the string

```
ap+ibap ∈ L, because it can be written as apaibap and aib ∈ {a,b}∗.
```

### Incorrect Proofs (using Pumping Lemma)

```
L = {anwan | n ≥ 1 and w ∈ {a,b}∗} is a non-regular language.
```

**Why is the following proof incorrect?**

**▶ Let s = apbap, where p is the pumping length. Note that**

```
s ∈ L and |s| ≥ p, the pumping length.
```

- Decomposing s = xyz as per the pumping lemma conditions leads to

y = ai for some i > 0.

- Pump up y to get xy2z = ap+ibap.

- However, p+i > p; so, xy2z ∈/ L, which means L is non-regular.

The claim xy2z = ap+ibap ∈/ L is incorrect. Even though p+i > p, the string

```
ap+ibap ∈ L, because it can be written as apaibap and aib ∈ {a,b}∗.
```

```
In fact, L is regular. Any string in this language can be written as a{a,b}∗a.
```

### Incorrect Proofs (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at least k ones, where k ≥
```

```
1 is any arbitrary integer} is not regular
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

### Incorrect Proofs (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at least k ones, where k ≥
```

```
1 is any arbitrary integer} is not regular
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

- If we decompose s = xyz, then by the pumping lemma conditions,

y = 1i for some i > 0. Hence, xy2z = 1p+i01p.

### Incorrect Proofs (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at least k ones, where k ≥
```

```
1 is any arbitrary integer} is not regular
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

- If we decompose s = xyz, then by the pumping lemma conditions,

y = 1i for some i > 0. Hence, xy2z = 1p+i01p.

- We conclude that xy2z ∈/ L.

### Incorrect Proofs (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at least k ones, where k ≥
```

```
1 is any arbitrary integer} is not regular
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

- If we decompose s = xyz, then by the pumping lemma conditions,

y = 1i for some i > 0. Hence, xy2z = 1p+i01p.

- We conclude that xy2z ∈/ L.

The claim xy2z = 1p+i01p ∈/ L is incorrect as w can be chosen to be 1i01p.

### Incorrect Proofs (using Pumping Lemma)

```
L = {1kw | w ∈ {0,1}∗ has at least k ones, where k ≥
```

```
1 is any arbitrary integer} is not regular
```

- Let s = 1p01p be a string, where p is the pumping length. Clearly, s ∈ L

```
by choosing w = 01p. Also, notice that |s| = 2p+1 > p.
```

- If we decompose s = xyz, then by the pumping lemma conditions,

y = 1i for some i > 0. Hence, xy2z = 1p+i01p.

- We conclude that xy2z ∈/ L.

The claim xy2z = 1p+i01p ∈/ L is incorrect as w can be chosen to be 1i01p.

In fact, this language is regular. Any string in this language can be written as

1w, where w is a binary string having at least one 1.

### Incorrect Proofs (using Pumping Lemma)

L = a∗b∗ is a regular language.

**Why is the following proof incorrect?**

```
- Choose s = aibj, where i +j ≥ p ≥ 1, where p is the pumping length.
```

Note that s ∈ L.

- We decompose s = xyz.

- If i ̸= 0, let x = ε and y = a. Then, xy∗z belongs to L.

- If i = 0, let x = ε and y = b. Then, xy∗z belongs to L.

- Thus, every string s ∈ L whose length is greater than or equal to the

pumping length satisfies the three conditions of the pumping lemma.

- Hence, L is regular.

### Incorrect Proofs (using Pumping Lemma)

L = a∗b∗ is a regular language.

**Why is the following proof incorrect?**

```
- Choose s = aibj, where i +j ≥ p ≥ 1, where p is the pumping length.
```

Note that s ∈ L.

- We decompose s = xyz.

- If i ̸= 0, let x = ε and y = a. Then, xy∗z belongs to L.

- If i = 0, let x = ε and y = b. Then, xy∗z belongs to L.

- Thus, every string s ∈ L whose length is greater than or equal to the

pumping length satisfies the three conditions of the pumping lemma.

- Hence, L is regular.

The proof on its own is fine, but the conclusion isn’t. Remember that

regularity implies pumping lemma and not the other way around.

### Proof of Pumping Lemma

- Suppose, the DFA for the regular language L has n states.

- We let p = n be the pumping length.

### Proof of Pumping Lemma

- Suppose, the DFA for the regular language L has n states.

- We let p = n be the pumping length.

```
- Consider a string S, such that |S| ≥ p and S ∈ L.
```

- Traverse the DFA using S.

### Proof of Pumping Lemma

- Suppose, the DFA for the regular language L has n states.

- We let p = n be the pumping length.

```
- Consider a string S, such that |S| ≥ p and S ∈ L.
```

- Traverse the DFA using S.

```
- How many states does S visit? |S|+1 ≥ (n+1)
```

### Proof of Pumping Lemma

- Suppose, the DFA for the regular language L has n states.

- We let p = n be the pumping length.

```
- Consider a string S, such that |S| ≥ p and S ∈ L.
```

- Traverse the DFA using S.

```
- How many states does S visit? |S|+1 ≥ (n+1)
```

- So, S repeats a state. Why? Because of the pigeon-hole principle.

- Let r be the first state repeated.

- Partition S = xyz, such that:

- x isthestringusedfortraversingstarttor forthefirsttime.

- y isthestringusedfortraversingr tor cyclefirsttime.

- z isthestringusedfortraversingr tothelast(accepting)state.

### Proof of Pumping Lemma

```
- Then, |xy| ≤ p. Why?
```

### Proof of Pumping Lemma

```
- Then, |xy| ≤ p. Why?
```

**▶ Becausewhenwefinishreadingxy,wehaveonlyrepeatedr onceand**

- nootherstateshavebeenrepeated.

- So,atmost(p+1)stateshavebeenvisited.

Hence,atmostp charactershavebeenread.

**▶ Also, y ̸= ε. Why?**

### Proof of Pumping Lemma

```
- Then, |xy| ≤ p. Why?
```

**▶ Becausewhenwefinishreadingxy,wehaveonlyrepeatedr onceand**

- nootherstateshavebeenrepeated.

- So,atmost(p+1)stateshavebeenvisited.

Hence,atmostp charactershavebeenread.

**▶ Also, y ̸= ε. Why?**

- Because at least one character has to be read to reach r from r itself.

**Finally, xy∗z ∈ L. Why?**

### Proof of Pumping Lemma

```
- Then, |xy| ≤ p. Why?
```

**▶ Becausewhenwefinishreadingxy,wehaveonlyrepeatedr onceand**

- nootherstateshavebeenrepeated.

- So,atmost(p+1)stateshavebeenvisited.

Hence,atmostp charactershavebeenread.

**▶ Also, y ̸= ε. Why?**

- Because at least one character has to be read to reach r from r itself.

**Finally, xy∗z ∈ L. Why?**

- Becauseeachrepetitionofy resultsinreturningbacktor.

- Startingfromr,readingz leadstotheacceptingstate.

### Regular Operations

- Earlier, we saw that regular languages are closed under complement,

union, intersection, and Kleene’s operation.

- Here, we will see that is not the case for non-regular languages. In fact,

non-regular languages are only closed under complement.

**▶ As we shall see, this presents us another technique of proving**

non-regularity.

### Closure of Non-Regular Languages

If L is non-regular language, then so is L′.

- If that is not the case, then L′ is regular.

- Then, L = (L′)′ is regular.

- That leads to a contradiction.

### Closure of Non-Regular Languages

If L is non-regular language, then so is L′.

- If that is not the case, then L′ is regular.

- Then, L = (L′)′ is regular.

- That leads to a contradiction.

**Example 6: Binary strings which are not of the form 0n1n**

- We have earlier seen that 0n1n is non-regular.

**▶ Since non-regular languages are closed under complement, the**

language excluding strings of the form 0n1n is also non-regular.

### Closure of Non-Regular Languages

If L is non-regular, then L∗ may be regular.

- We have seen that 1n2 is non-regular.

**▶ However, (1n2)∗ is the same as 1∗.Why?**

### Closure of Non-Regular Languages

If L is non-regular, then L∗ may be regular.

- We have seen that 1n2 is non-regular.

**▶ However, (1n2)∗ is the same as 1∗.Why?**

Because that would include the case where n = 1.

- So, (1n2)∗ is regular.

### Closure of Non-Regular Languages

```
If L 1 and L 2 are non-regular, then L 1 ∪L 2 and L 2 ∩L 2 may be regular.
```

- Let L be a non-regular language.

- We know that L′ is also non-regular, because non-regular languages

are closed under complement.

```
- However, L∪L′ = Σ∗ and L∩L′ = ∅ are both regular languages.
```

### Closure of Non-Regular Languages

If L 1 and L 2 are non-regular, then L 1 L 2 may be regular.

```
- We know that L = {1n2 | n ≥ 0} is non-regular.
```

- Let L2 = LL and L4 = L2L2.

Note that L4 = 1a+b+c+d, where a,b,c, and d are all perfect squares.

### Closure of Non-Regular Languages

If L 1 and L 2 are non-regular, then L 1 L 2 may be regular.

```
- We know that L = {1n2 | n ≥ 0} is non-regular.
```

- Let L2 = LL and L4 = L2L2.

Note that L4 = 1a+b+c+d, where a,b,c, and d are all perfect squares.

**▶ Lagrange’s four square theorem states that any integer can be**

expressed as the sum of four non-negative perfect squares.

Therefore, L4 = 1∗ by Lagrange’s four square theorem, which is regular.

### Closure of Non-Regular Languages

If L 1 and L 2 are non-regular, then L 1 L 2 may be regular.

```
- We know that L = {1n2 | n ≥ 0} is non-regular.
```

- Let L2 = LL and L4 = L2L2.

Note that L4 = 1a+b+c+d, where a,b,c, and d are all perfect squares.

**▶ Lagrange’s four square theorem states that any integer can be**

expressed as the sum of four non-negative perfect squares.

Therefore, L4 = 1∗ by Lagrange’s four square theorem, which is regular.

- The claim follows by noting that L2 is either regular or non-regular.

- Inthefirstscenario,concatenationofnon-regular LyieldsregularL2.

- Inthesecondscenario,concatenationofnon-regularL2 yieldsregularL4.

### Proving Non-regularity via Regular Operations

**Key Idea**

- Suppose you have been asked to show that L is non-regular.

### Proving Non-regularity via Regular Operations

**Key Idea**

- Suppose you have been asked to show that L is non-regular.

- Choose M, a known non-regular language (typically one which you

have seen before or can be proven by pumping lemma).

### Proving Non-regularity via Regular Operations

**Key Idea**

- Suppose you have been asked to show that L is non-regular.

- Choose M, a known non-regular language (typically one which you

have seen before or can be proven by pumping lemma).

- Show that M can be obtained by applying regular operations either on L

alone or on L with another regular language.

### Proving Non-regularity via Regular Operations

**Key Idea**

- Suppose you have been asked to show that L is non-regular.

- Choose M, a known non-regular language (typically one which you

have seen before or can be proven by pumping lemma).

- Show that M can be obtained by applying regular operations either on L

alone or on L with another regular language.

- That leads to a contradiction if L is regular (because regular languages

are closed under regular operations).

### Proving Non-regularity via Regular Operations

Example 1: Binary Strings with an equal number of zeroes and ones

- Let L be the language consisting of binary strings with an equal number

of zeroes and ones.

```
- Consider M = {0n1n | n ≥ 0}
```

### Proving Non-regularity via Regular Operations

Example 1: Binary Strings with an equal number of zeroes and ones

- Let L be the language consisting of binary strings with an equal number

of zeroes and ones.

```
- Consider M = {0n1n | n ≥ 0}
```

- Notice that M = L∩0∗1∗, because the intersection ensures only those

strings in L are kept, where the zeroes are before the ones.

### Proving Non-regularity via Regular Operations

Example 1: Binary Strings with an equal number of zeroes and ones

- Let L be the language consisting of binary strings with an equal number

of zeroes and ones.

```
- Consider M = {0n1n | n ≥ 0}
```

- Notice that M = L∩0∗1∗, because the intersection ensures only those

strings in L are kept, where the zeroes are before the ones.

- If L is regular, then M is regular as well, because 0∗1∗ is regular and

regular languages are closed under regular operations.

**▶ That presents a contradiction, because we have proved M to be**

non-regular earlier.

### Proving Non-regularity via Regular Operations

Example 1: Binary Strings with an equal number of zeroes and ones

- Let L be the language consisting of binary strings with an equal number

of zeroes and ones.

```
- Consider M = {0n1n | n ≥ 0}
```

- Notice that M = L∩0∗1∗, because the intersection ensures only those

strings in L are kept, where the zeroes are before the ones.

- If L is regular, then M is regular as well, because 0∗1∗ is regular and

regular languages are closed under regular operations.

**▶ That presents a contradiction, because we have proved M to be**

non-regular earlier.

- So, L must be non-regular.

### Proving Non-regularity via Regular Operations

```
Example 2: {0n1n | n ≥ 0}
```

```
- Let L = {0n1n | n ≥ 0}.
```

```
- Consider M = {0m1n | m > n}.
```

### Proving Non-regularity via Regular Operations

```
Example 2: {0n1n | n ≥ 0}
```

```
- Let L = {0n1n | n ≥ 0}.
```

```
- Consider M = {0m1n | m > n}.
```

- Notice that M = 0+◦L, because the concatenation adds zeroes at the

beginning. This results in the number of zeroes at the beginning being

more than the number of ones later.

### Proving Non-regularity via Regular Operations

```
Example 2: {0n1n | n ≥ 0}
```

```
- Let L = {0n1n | n ≥ 0}.
```

```
- Consider M = {0m1n | m > n}.
```

- Notice that M = 0+◦L, because the concatenation adds zeroes at the

beginning. This results in the number of zeroes at the beginning being

more than the number of ones later.

- If L is regular, then M is regular as well, because 0+ is regular.

**▶ That presents a contradiction, because we have proved M to be**

non-regular earlier.

### Proving Non-regularity via Regular Operations

```
Example 2: {0n1n | n ≥ 0}
```

```
- Let L = {0n1n | n ≥ 0}.
```

```
- Consider M = {0m1n | m > n}.
```

- Notice that M = 0+◦L, because the concatenation adds zeroes at the

beginning. This results in the number of zeroes at the beginning being

more than the number of ones later.

- If L is regular, then M is regular as well, because 0+ is regular.

**▶ That presents a contradiction, because we have proved M to be**

non-regular earlier.

- So, L must be non-regular.

### Practice Problems (using closure operations)

```
- L = {0q | q is not a perfect square}
```

```
- L = {w | w ∈ {a,b,c}∗, where #a = #b = #c}
```

```
- L = {w | w ∈ {a,b,c}∗, where #a+#b = 2#c}
```

```
- L = {0m1n | m ̸= n}
```

### Practice Problems (using closure operations)

```
L = {0q | q is not a perfect square}
```

**▶ Consider the complement of L, which is**

```
L′ = {0q | q is a perfect square}.
```

- We know that L′ is non-regular.

- Since non-regular languages are closed under complement, L is also

non-regular.

### Practice Problems (using closure operations)

```
L = {w | w ∈ {a,b,c}∗, where #a = #b = #c}
```

```
- Let M = {anbncn | n ≥ 0}. We know that M is non-regular.
```

```
- Note that M = a∗b∗c∗∩L. Why?
```

### Practice Problems (using closure operations)

```
L = {w | w ∈ {a,b,c}∗, where #a = #b = #c}
```

```
- Let M = {anbncn | n ≥ 0}. We know that M is non-regular.
```

```
- Note that M = a∗b∗c∗∩L. Why?
```

Listhelanguagewherethenumberofa’s,b’s,andc’sequaleachother.

Intersection with a∗b∗c∗ ensures that a’s appear before b’s before c’s.

**▶ Okay, so how de we complete the proof?**

### Practice Problems (using closure operations)

```
L = {w | w ∈ {a,b,c}∗, where #a = #b = #c}
```

```
- Let M = {anbncn | n ≥ 0}. We know that M is non-regular.
```

```
- Note that M = a∗b∗c∗∩L. Why?
```

Listhelanguagewherethenumberofa’s,b’s,andc’sequaleachother.

Intersection with a∗b∗c∗ ensures that a’s appear before b’s before c’s.

**▶ Okay, so how de we complete the proof?**

**a∗b∗c∗ is regular. Since regular languages are closed under**

intersection, L must be non-regular. Otherwise, the intersection would

have been regular which contradicts the non-regularity of M.

### Practice Problems (using closure operations)

```
L = {w | w ∈ {a,b,c}∗, where #a+#b = 2#c}
```

```
- Let M = {aibjck | i +j = 2k}. We know that M is non-regular.
```

```
- Note that M = a∗b∗c∗∩L. Why?
```

### Practice Problems (using closure operations)

```
L = {w | w ∈ {a,b,c}∗, where #a+#b = 2#c}
```

```
- Let M = {aibjck | i +j = 2k}. We know that M is non-regular.
```

```
- Note that M = a∗b∗c∗∩L. Why?
```

L is the language where the number of a’s and b’s together is twice the

number of c’s. Intersection with a∗b∗c∗ ensures that a’s appear before

b’s before c’s.

**▶ Okay, so how de we complete the proof?**

### Practice Problems (using closure operations)

```
L = {w | w ∈ {a,b,c}∗, where #a+#b = 2#c}
```

```
- Let M = {aibjck | i +j = 2k}. We know that M is non-regular.
```

```
- Note that M = a∗b∗c∗∩L. Why?
```

L is the language where the number of a’s and b’s together is twice the

number of c’s. Intersection with a∗b∗c∗ ensures that a’s appear before

b’s before c’s.

**▶ Okay, so how de we complete the proof?**

**a∗b∗c∗ is regular. Since regular languages are closed under**

intersection, L must be non-regular. Otherwise, the intersection would

have been regular which contradicts the non-regularity of M.

### Practice Problems (using closure operations)

```
L = {0m1n | m ̸= n}
```

```
- Let M = {0m1n | m = n}. We know that M is non-regular.
```

**Note that L is not the complement of M. Why?**

### Practice Problems (using closure operations)

```
L = {0m1n | m ̸= n}
```

```
- Let M = {0m1n | m = n}. We know that M is non-regular.
```

**Note that L is not the complement of M. Why?**

Complement of M also includes 11100 ∈/ L.

```
- Note that M = 0∗1∗∩L′. Why?
```

### Practice Problems (using closure operations)

```
L = {0m1n | m ̸= n}
```

```
- Let M = {0m1n | m = n}. We know that M is non-regular.
```

**Note that L is not the complement of M. Why?**

Complement of M also includes 11100 ∈/ L.

```
- Note that M = 0∗1∗∩L′. Why?
```

L′ includes all strings which have an equal number of 0 and 1 and 0∗1∗

consists of all strings where there is no 1 before a 0.

**▶ Okay, so how de we complete the proof?**

### Practice Problems (using closure operations)

```
L = {0m1n | m ̸= n}
```

```
- Let M = {0m1n | m = n}. We know that M is non-regular.
```

**Note that L is not the complement of M. Why?**

Complement of M also includes 11100 ∈/ L.

```
- Note that M = 0∗1∗∩L′. Why?
```

L′ includes all strings which have an equal number of 0 and 1 and 0∗1∗

consists of all strings where there is no 1 before a 0.

**▶ Okay, so how de we complete the proof?**

0∗1∗ is regular. Since regular languages are closed under intersection,

L′ must be non-regular.

**▶ Non-regular languages are closed under complement. So, L is**

non-regular as well.

### Incorrect Proof

Consider the following two non-regular languages:

```
- L 1 = {ambn | m = n}
```

```
- L 2 = {ambn | m ̸= n}
```

**What’s wrong with the following claims?**

- L 1 ∪L 2 = a∗b∗ is non-regular.

- L 1 ∩L 2 = ∅ is non-regular.

### Incorrect Proof

Consider the following two non-regular languages:

```
- L 1 = {ambn | m = n}
```

```
- L 2 = {ambn | m ̸= n}
```

**What’s wrong with the following claims?**

- L 1 ∪L 2 = a∗b∗ is non-regular.

- L 1 ∩L 2 = ∅ is non-regular.

Non-regular languages are not closed under regular operations like union

and intersection.

### Regular Languages - Part I

**(DFA & NFA)**

**Arnab Ganguly**

**Departmentof Computer Science**

**Shiv Nadar IoE**

### What is a Finite State Machine?

**▶ A computational model simple enough that we can mathematically**

analyze it, yet powerful enough to carry out relevant tasks. Obviously,

like any computer program, it cannot carry out everything.

- Although our discussion may look simplistic, finite state machines

(FSM) are actually quite power and they get used on a daily basis.

- Consider a garage door and a switch that operates it. This is a small

**computer – after all a computer is any machine that carries out**

computation.

### What is a Finite State Machine?

**A Simple FSM**

To understand the basic intuition of an FSM, consider this simple

garage-door opening computer:

**1. It has two states: open and closed**

2. It has a switch that will toggle the door between these two states.

**Toggle**

**Open Closed**

**Toggle**

### What is a Finite State Machine?

**An Elevator System**

Let us consider a slightly more complicated elevator system:

- There are 3 floors and the elevator can be in any one of the floors.

- On pressing the floor number at a particular level, the elevator moves to

that floor.

- The elevator door can be open or closed.

- The elevator cannot move if the door is open.

- The user can enter or exit the elevator only when the door is open.

### What is a Finite State Machine?

**An Elevator System**

**1, 2, 3, O 1, 2, 3, O 1, 2, 3, O**

**EE Open EE Open EE Open**

**F1 F2 F3**

**C O C O C O**

**1**

**Close 1 Close 2 Close**

**F1 2 F2 3 F3**

**3**

**1, C 2, C 3, C**

### What is a Finite State Machine?

**An Elevator System**

- You may be wondering: can we not have a single open state (instead of

**3) where the user can enter or leave?**

- Then, on pressing the close button, we move to the appropriate state in

the bottom row.

### What is a Finite State Machine?

**An Elevator System**

- You may be wondering: can we not have a single open state (instead of

**3) where the user can enter or leave?**

- Then, on pressing the close button, we move to the appropriate state in

the bottom row.

- In an FSM, this is not possible because the FSM does not have a

memory; so, if we move from Floor2-Closed to the Open state, then it

will not remember which floor we moved from.

- The equivalent probabilistic machine is called a Markov chain, where

we do not remember the history.

### Language

- An alphabet is a finite set of symbols; we denote an alphabet by Σ.

### Language

- An alphabet is a finite set of symbols; we denote an alphabet by Σ.

```
- A string over Σ is a finite sequence of symbols from Σ.
```

```
- Forexample,ifΣ={0,1},then0100111isastring.
```

- Theempty-stringisdenotedbyε.

### Language

- An alphabet is a finite set of symbols; we denote an alphabet by Σ.

```
- A string over Σ is a finite sequence of symbols from Σ.
```

```
- Forexample,ifΣ={0,1},then0100111isastring.
```

- Theempty-stringisdenotedbyε.

- A language is a set of strings.

**▶ WedenoteΣ+ todenotethelanguage(inthiscase,aninfiniteset)ofall**

**non-emptystringswithsymbolsfromΣ**

```
Thus,{0,1}+ isthesetofallbinarystrings.
```

```
- Additionally,Σ∗ ={ε}∪Σ+.
```

```
Thus,{0,1}∗ isthesetofallbinarystringsandtheemptystring.
```

### Language

- Let, x and y be two strings.

```
- Wedenoteby|x|thelengthofx.
```

- Thereverseofx isdenotedbyxR.

- Theconcatenationofx andy isxy.

```
- Foranyintegerk ≥0,xk isthestringobtainedbyconcatenatingx
```

k-times;thus,x0 =ε,x1 =x,x2 =xx,andxk =xxk−1.

### Language

- Let, x and y be two strings.

```
- Wedenoteby|x|thelengthofx.
```

- Thereverseofx isdenotedbyxR.

- Theconcatenationofx andy isxy.

```
- Foranyintegerk ≥0,xk isthestringobtainedbyconcatenatingx
```

k-times;thus,x0 =ε,x1 =x,x2 =xx,andxk =xxk−1.

- A string w is a substring of another string z if z can be written as xwy.

Here x or y may be empty.

### Language

- Let, x and y be two strings.

```
- Wedenoteby|x|thelengthofx.
```

- Thereverseofx isdenotedbyxR.

- Theconcatenationofx andy isxy.

```
- Foranyintegerk ≥0,xk isthestringobtainedbyconcatenatingx
```

k-times;thus,x0 =ε,x1 =x,x2 =xx,andxk =xxk−1.

- A string w is a substring of another string z if z can be written as xwy.

Here x or y may be empty.

- We say w is a prefix of z if z = wy and w is a suffix of z if z = xw.

Additionally, w is proper-prefix of z if w is a prefix of z and w ̸= z;

likewise, we define proper-suffix.

### Language

- Let, x and y be two strings.

```
- Wedenoteby|x|thelengthofx.
```

- Thereverseofx isdenotedbyxR.

- Theconcatenationofx andy isxy.

```
- Foranyintegerk ≥0,xk isthestringobtainedbyconcatenatingx
```

k-times;thus,x0 =ε,x1 =x,x2 =xx,andxk =xxk−1.

- A string w is a substring of another string z if z can be written as xwy.

Here x or y may be empty.

- We say w is a prefix of z if z = wy and w is a suffix of z if z = xw.

Additionally, w is proper-prefix of z if w is a prefix of z and w ̸= z;

likewise, we define proper-suffix.

- A language is prefix-free if no (non-empty) string in the language is a

prefix of another string.

### Deterministic Finite Automata

**Definition**

**A Deterministic Finite Automaton (DFA) is a finite state machine**

```
(represented as a directed graph) defined as a quintuple (Q,F,Σ,δ,q 0 ):
```

### Deterministic Finite Automata

**Definition**

**A Deterministic Finite Automaton (DFA) is a finite state machine**

```
(represented as a directed graph) defined as a quintuple (Q,F,Σ,δ,q 0 ):
```

**▶ Q is the set of states (which form the nodes in the graph)**

### Deterministic Finite Automata

**Definition**

**A Deterministic Finite Automaton (DFA) is a finite state machine**

```
(represented as a directed graph) defined as a quintuple (Q,F,Σ,δ,q 0 ):
```

**▶ Q is the set of states (which form the nodes in the graph)**

- F ⊆ Q is the set of final/accepting states (represented typically by

**double circles)**

### Deterministic Finite Automata

**Definition**

**A Deterministic Finite Automaton (DFA) is a finite state machine**

```
(represented as a directed graph) defined as a quintuple (Q,F,Σ,δ,q 0 ):
```

**▶ Q is the set of states (which form the nodes in the graph)**

- F ⊆ Q is the set of final/accepting states (represented typically by

**double circles)**

- Σ, the alphabet, is the set of symbols that form the edge-labels

### Deterministic Finite Automata

**Definition**

**A Deterministic Finite Automaton (DFA) is a finite state machine**

```
(represented as a directed graph) defined as a quintuple (Q,F,Σ,δ,q 0 ):
```

**▶ Q is the set of states (which form the nodes in the graph)**

- F ⊆ Q is the set of final/accepting states (represented typically by

**double circles)**

- Σ, the alphabet, is the set of symbols that form the edge-labels

```
- δ : Q×Σ → Q is the transition function (represented as directed
```

```
edges), which given a state q ∈ Q and a symbol a ∈ Σ moves us to
```

**another state q′ = δ(q,a)**

### Deterministic Finite Automata

**Definition**

**A Deterministic Finite Automaton (DFA) is a finite state machine**

```
(represented as a directed graph) defined as a quintuple (Q,F,Σ,δ,q 0 ):
```

**▶ Q is the set of states (which form the nodes in the graph)**

- F ⊆ Q is the set of final/accepting states (represented typically by

**double circles)**

- Σ, the alphabet, is the set of symbols that form the edge-labels

```
- δ : Q×Σ → Q is the transition function (represented as directed
```

```
edges), which given a state q ∈ Q and a symbol a ∈ Σ moves us to
```

**another state q′ = δ(q,a)**

**▶ q 0 ∈ Q is the start state**

### Deterministic Finite Automata

**How does it work?**

```
- The input to a DFA is a string w = a a a ...a ∈ Σ∗.
```

**1 2 3 k**

### Deterministic Finite Automata

**How does it work?**

```
- The input to a DFA is a string w = a a a ...a ∈ Σ∗.
```

- We start at q and then use the string 1 w 2 3 along k with the transition

function δ to move 0 from one state to another.

### Deterministic Finite Automata

**How does it work?**

```
- The input to a DFA is a string w = a a a ...a ∈ Σ∗.
```

- We start at q and then use the string 1 w 2 3 along k with the transition

function δ to move 0 from one state to another.

- So,afterreadinga 1 ,wewillmovetoq 1 =δ(q 0 ,a 1 ).

- Afterreadinga 2 ,wewillmovetoq 2 =δ(q 1 ,a 2 ).

- Andsoon,untilwereada k andmovetothestateq k =δ(q k−1 ,a k ).

### Deterministic Finite Automata

**How does it work?**

```
- The input to a DFA is a string w = a a a ...a ∈ Σ∗.
```

- We start at q and then use the string 1 w 2 3 along k with the transition

function δ to move 0 from one state to another.

- So,afterreadinga 1 ,wewillmovetoq 1 =δ(q 0 ,a 1 ).

- Afterreadinga 2 ,wewillmovetoq 2 =δ(q 1 ,a 2 ).

- Andsoon,untilwereada k andmovetothestateq k =δ(q k−1 ,a k ).

- The DFA accepts the string w if q k ∈ F, else it rejects the string.

### Regular Language

- A language is recognizable by a DFA if the DFA accepts the strings in

the language (while rejecting strings outside the language).

- More formally, a DFA recognizes language L over an alphabet Σ if

```
L = {w | w ∈ Σ∗ and DFA accepts w}.
```

- A language is called regular if there exists a DFA that recognizes the

language.

### DFA Examples

**Binary-string with an even number of zeroes**

Assuming that the empty string is in the language:

**0**

**start q 0 q 1**

**0**

**1 1**

### DFA Examples

**Binary-string with an even number of zeroes**

Assuming that the empty string is NOT in the language:

**q 2 1**

**0**

**start q 0 0 0**

**1**

**q 1 1**

### DFA Examples

**What language does this DFA recognize?**

**0**

**start q 0 q 1**

**1**

**0 1**

### DFA Examples

**What language does this DFA recognize?**

**0**

**start q 0 q 1**

**1**

**0 1**

**All binary strings that end in 1**

**Is there some other way to define the language?**

### DFA Examples

**What language does this DFA recognize?**

**0**

**start q 0 q 1**

**1**

**0 1**

**All binary strings that end in 1**

Is there some other way to define the language? All odd integers (in

binary representation).

### DFA Examples

**What language does this DFA recognize?**

**0 1 0,1**

**q 1 q 0 q 1 q**

**start 0 1 2 3**

**0**

### DFA Examples

**What language does this DFA recognize?**

**0 1 0,1**

**q 1 q 0 q 1 q**

**start 0 1 2 3**

**0**

**All binary strings containing 101 as a substring**

### DFA Examples

**What language does this DFA recognize?**

**b,c a**

**c a a**

**a a**

**q 0 a c q 1 a b q 2 b q 3 c q 4 c q 5 c q 6**

**b b**

**start b**

**b,c**

### DFA Examples

**What language does this DFA recognize?**

**b,c a**

**c a a**

**a a**

**q 0 a c q 1 a b q 2 b q 3 c q 4 c q 5 c q 6**

**b b**

**start b**

**b,c**

```
A DFA that accepts a string from Σ = {a,b,c} ending in abbccc
```

### How to construct one?

- First, there is no formula. It requires ingenuity, thinking, and scribbling

on paper. Don’t try to do it all in your head.

- There are DFA examples that take me a while to figure out; so, be

patient! As with everything, with practice, you will get better.

- Here’s a step-by-step outline, which I often use.

**▶ FirstrememberthatDFAismemoryless;therefore,youneedastatefor**

- everypossiblescenario(typically).

**▶ Then,atwhatstatedowestartandwhataretheacceptingstates?**

**Finally,understandhowonescenarioonreadingasymbolcantransition**

toanotherscenario.

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

- What could be my states? Hint: Dividing by 3 has three outcomes.

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

- What could be my states? Hint: Dividing by 3 has three outcomes.

The states are 0,1, and 2 – these represent the remainder left on

dividing by 3.

**▶ Where do we start?**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

- What could be my states? Hint: Dividing by 3 has three outcomes.

The states are 0,1, and 2 – these represent the remainder left on

dividing by 3.

**▶ Where do we start?**

Assuming ε is not in the language, we include a starting state q 0

implying no symbol has been read.

**▶ What is/are our accepting state(s)?**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

- What could be my states? Hint: Dividing by 3 has three outcomes.

The states are 0,1, and 2 – these represent the remainder left on

dividing by 3.

**▶ Where do we start?**

Assuming ε is not in the language, we include a starting state q 0

implying no symbol has been read.

**▶ What is/are our accepting state(s)?**

Clearly, 0 is our only accepting state.

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

- We start at the state q 0 .

- If the first symbol is a 1, we will move to state 1, and if the first symbol is

0 then we will move to state 0.

**q 0**

**start 0 0 1 2**

**1**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

- We start at the state q 0 .

- If the first symbol is a 1, we will move to state 1, and if the first symbol is

0 then we will move to state 0.

**q 0**

**start 0 0 1 2**

**1**

**What should be the transitions from state 0?**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

Consider the state 0.

- If we read a 0, then we multiply by 2; so, the number is divisible by 3.

- On the other hand, if we read a 1, then we multiply by 2 and add 1; so, it

will leave a remainder 1.

**0**

**start q 0 0 0 1 1 2**

**1**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

Consider the state 0.

- If we read a 0, then we multiply by 2; so, the number is divisible by 3.

- On the other hand, if we read a 1, then we multiply by 2 and add 1; so, it

will leave a remainder 1.

**0**

**start q 0 0 0 1 1 2**

**1**

**What should be the transitions from state 1?**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

Consider the state 1.

- If we read a 0, the number will leave a remainder 2.

- On the hand, if we read a 1, it will be divisible by 3.

**0**

**1**

**start q 0 0 0 1 1 0 2**

**1**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

Consider the state 1.

- If we read a 0, the number will leave a remainder 2.

- On the hand, if we read a 1, it will be divisible by 3.

**0**

**1**

**start q 0 0 0 1 1 0 2**

**1**

**What should be the transitions from state 2?**

### Construction Example – Step by Step

DFA that accepts all non-empty binary strings so that the underlying

**decimal is divisible by 3**

Consider the state 2.

- If we read a 0, the number will leave a remainder 1.

- On the hand, if we read a 1, it will leave a remainder 2.

**0 1**

**1 0**

**start q 0 0 0 1 1 0 2**

**1**

**Done!**

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

**How many states? What are the start and final state(s)?**

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

How many states? What are the start and final state(s)? One state per

**remainder on dividing by 4**

**0 1**

**2 3**

What are the transitions from state 0? On a 0 input, the remainder is still

0. On a 1 input, the remainder is 1.

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

**0**

**1**

**0 1**

**2 3**

What are the transitions from state 1? On a 0 input, the remainder is 2.

On a 1 input, the remainder is 3.

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

**0**

**1**

**0 1**

**0**

**1**

**2 3**

What are the transitions from state 2? On a 0 input, the remainder is 0.

On a 1 input, the remainder is 1.

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

**0**

**1**

**0 1**

**0**

**0 1 1**

**2 3**

What are the transitions from state 3? On a 0 input, the remainder is 2.

On a 1 input, the remainder is 3.

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

**0**

**1**

**0 1**

**0**

**0 1 1**

**2 3 1**

**0**

**Are we done?**

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

**0**

**1**

**0 1**

**0**

**0 1 1**

**2 3 1**

**0**

Are we done? The DFA does not accept ε. We cannot make 0 the start and

an accepting state because then we accept numbers divisible by 4.

### Construction Example

**DFA that accepts all (possibly empty) binary strings so that the**

**underlying decimal is NOT divisible by 4**

**0 0 1 1**

**0**

**0 1 1**

**start 2 3 1**

**0**

**Done!**

### Practice Problems

```
Construct a DFA for the following languages. Here, Σ = {a,b}.
```

```
1. w | w is the empty string or a, where w ∈ Σ∗-
```

```
2. w | w begins with aab, where w ∈ Σ∗-
```

```
3. w | w has at least 3 occurrences of a, where w ∈ Σ∗-
```

```
4. w | w begins with a and |w| mod 2 = 1, or w begins with b and |w|
```

```
mod 2 = 0, where w ∈ Σ∗-
```

```
5. w | w has an odd number of a and ends with b, where w ∈ Σ∗-
```

### Practice Problems

```
w | w is the empty string or a, where w ∈ Σ∗- with Σ = {a,b}
```

**start**

**a,b q 2 b q 0 a q 1**

**a,b**

### Practice Problems

```
w | w begins with aab, where w ∈ Σ∗- with Σ = {a,b}
```

**start q 0 a q 1 a q 2 b q 3 a,b**

**b b a**

**q 4**

**a,b**

### Practice Problems

```
w | w has at least 3 occurrences of a, where w ∈ Σ∗- with Σ = {a,b}
```

**b b b**

**start q 0 a q 1 a q 2 a q 3 a,b**

### Practice Problems

```
w | w begins with a and |w| mod 2 = 1, or w begins with b and |w|
```

```
mod 2 = 0, where w ∈ Σ∗- with Σ = {a,b}
```

**start**

**a,b a,b**

**q q a q b q q**

**4 3 0 1 2**

**a,b a,b**

### Practice Problems

```
w | w has an odd number of a and ends with b, where w ∈ Σ∗- with
```

```
Σ = {a,b}
```

**start a**

**q a q b q**

**b 0 1 2 b**

**a**

### Non-Deterministic Finite Automata

**Definition**

A Non-deterministic Finite Automaton (NFA) is a finite state machine that

```
can be represented as a quintuple (Q,F,Σ,δ,q 0 ) where
```

**▶ Q is the set of states**

```
- F ⊆ Q is the set of final/accepting states
```

**▶ Σ is the set of symbols that form the edge-labels**

**▶ q ∈ Q is the start state**

**0**

### Non-Deterministic Finite Automata

**Definition**

A Non-deterministic Finite Automaton (NFA) is a finite state machine that

```
can be represented as a quintuple (Q,F,Σ,δ,q 0 ) where
```

**▶ Q is the set of states**

```
- F ⊆ Q is the set of final/accepting states
```

**▶ Σ is the set of symbols that form the edge-labels**

**▶ q ∈ Q is the start state**

**▶ 0**

```
δ : Q×Σ∪{ε} → P(Q) is the transition function, which given a state
```

```
q ∈ Q and a symbol a ∈ Σ∪{ε} moves us to other states δ(q,a) ⊆ Q
```

### Non-Deterministic Finite Automata

**DFA vs NFA: The Main Difference**

```
- In a DFA, for every state q and symbol a ∈ Σ, there is a unique state
```

```
q′ ∈ Q such that q′ = δ(q,a). Hence, a DFA is deterministic. The main
```

concept behind an NFA is non-determinism.

### Non-Deterministic Finite Automata

**DFA vs NFA: The Main Difference**

```
- In a DFA, for every state q and symbol a ∈ Σ, there is a unique state
```

```
q′ ∈ Q such that q′ = δ(q,a). Hence, a DFA is deterministic. The main
```

concept behind an NFA is non-determinism.

- In an NFA, on the other hand, for the same symbol a (which can be ε),

we ▶ can move from q to multiple states; hence, this is non-deterministic.

- Oneshouldnotconfusenon-determinismwithrandomness.

**Inarandomtransition,wehavenocluewherewemovefromq upon**

**receivingaparticularsymbol. InanNFA,ontheotherhand,weknowwith**

- fullcertainty,becausewewillmovetoallthestatesinparallel.

So,wecanthinkofanNFAasaparallelversionofaDFA.

### Non-Deterministic Finite Automata

**DFA vs NFA: The Main Difference**

```
- In a DFA, for every state q and symbol a ∈ Σ, there is a unique state
```

```
q′ ∈ Q such that q′ = δ(q,a). Hence, a DFA is deterministic. The main
```

concept behind an NFA is non-determinism.

- In an NFA, on the other hand, for the same symbol a (which can be ε),

we ▶ can move from q to multiple states; hence, this is non-deterministic.

- Oneshouldnotconfusenon-determinismwithrandomness.

**Inarandomtransition,wehavenocluewherewemovefromq upon**

**receivingaparticularsymbol. InanNFA,ontheotherhand,weknowwith**

- fullcertainty,becausewewillmovetoallthestatesinparallel.

So,wecanthinkofanNFAasaparallelversionofaDFA.

```
- More specifically, in an NFA δ(q,a) ∈ P(Q), where P(Q) is the
```

power-set of Q.

### Non-Deterministic Finite Automata

**NFA Properties**

Let’s quickly summarize the properties that an NFA has:

- A node can have multiple outgoing transitions with the same label.

We move to all states given by each transitions in parallel.

### Non-Deterministic Finite Automata

**NFA Properties**

Let’s quickly summarize the properties that an NFA has:

- A node can have multiple outgoing transitions with the same label.

We move to all states given by each transitions in parallel.

- A node may not have outgoing transitions for every symbol in the

alphabet Σ. So, for these missing symbols, the NFA does not move. If

**suchamissingsymbolisencounteredfromtheinput,thentheparticular**

(replica of the) NFA terminates.

### Non-Deterministic Finite Automata

**NFA Properties**

Let’s quickly summarize the properties that an NFA has:

- A node can have multiple outgoing transitions with the same label.

We move to all states given by each transitions in parallel.

- A node may not have outgoing transitions for every symbol in the

alphabet Σ. So, for these missing symbols, the NFA does not move. If

**suchamissingsymbolisencounteredfromtheinput,thentheparticular**

(replica of the) NFA terminates.

- If the transition from a state q to a state q′ is labeled by ε, then we can

move from q to q′ without reading a symbol from the input.

### Non-Deterministic Finite Automata

**Mechanism**

**start q 0 a q 1 b q 2 b q 3 c q 4 c q 5 c q 6**

**a,b,c**

```
An NFA that accepts a string from Σ = {a,b,c} ending in abbccc
```

```
- The non-determinism is in the state q : (q ,a) → q and (q ,a) → q .
```

- So,whenwereadthesymbola,wewillcreatetwocopies–inonecopy, 0 0 0 0 1

westayatq 0 ,andinanother,movetoq 1 .

- Forinputsb andc,wewillalwaysstayatq 0 .

### Non-Deterministic Finite Automata

**Mechanism**

**start q 0 a q 1 b q 2 b q 3 c q 4 c q 5 c q 6**

**a,b,c**

```
An NFA that accepts a string from Σ = {a,b,c} ending in abbccc
```

```
- The non-determinism is in the state q : (q ,a) → q and (q ,a) → q .
```

- So,whenwereadthesymbola,wewillcreatetwocopies–inonecopy, 0 0 0 0 1

westayatq 0 ,andinanother,movetoq 1 .

- Forinputsb andc,wewillalwaysstayatq 0 .

- For q through q , we have a single transition (from q to q ).

**▶ 1 5 i i+1**

Finally q 6 , the accepting state, has no transition.

### Non-Deterministic Finite Automata

**Mechanism**

**start q 0 a q 1 b q 2 b q 3 c q 4 c q 5 c q 6**

**a,b,c**

The following table summarizes the transitions:

**States**

**q 0 q 1 q 2 q 3 q 4 q 5 q 6**

```
slobmyS a {q 0 ,q 1 } ∅ ∅ ∅ ∅ ∅ ∅
```

```
b {q 0 } {q 2 } {q 3 } ∅ ∅ ∅ ∅
```

```
c {q 0 } ∅ ∅ {q 4 } {q 5 } {q 6 } ∅
```

**ε ∅ ∅ ∅ ∅ ∅ ∅ ∅**

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b
```

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c
```

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b
```

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b (q 0 ) →a
```

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b (q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →b
```

```
(q 0 ,q 3 ) →c (q 0 ,q 4 ) →c (q 0 ,q 5 ) →c
```

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b (q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →b
```

```
(q 0 ,q 3 ) →c (q 0 ,q 4 ) →c (q 0 ,q 5 ) →c (q 0 ,q 6 )
```

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b (q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →b
```

```
(q 0 ,q 3 ) →c (q 0 ,q 4 ) →c (q 0 ,q 5 ) →c (q 0 ,q 6 )
```

Simulate on the string abcbabbccca:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b (q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →b
```

```
(q 0 ,q 3 ) →c (q 0 ,q 4 ) →c (q 0 ,q 5 ) →c (q 0 ,q 6 ) →a
```

### Non-Deterministic Finite Automata

**Mechanism**

**start q a q b q b q c q c q c q**

**0 1 2 3 4 5 6**

**a,b,c**

Simulate on the string abcbabbccc:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b (q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →b
```

```
(q 0 ,q 3 ) →c (q 0 ,q 4 ) →c (q 0 ,q 5 ) →c (q 0 ,q 6 )
```

Simulate on the string abcbabbccca:

```
(q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →c (q 0 ) →b (q 0 ) →a (q 0 ,q 1 ) →b (q 0 ,q 2 ) →b
```

```
(q 0 ,q 3 ) →c (q 0 ,q 4 ) →c (q 0 ,q 5 ) →c (q 0 ,q 6 ) →a (q 0 ,q 1 )
```

### Non-Deterministic Finite Automata

**Role of ε**

We want to build an NFA for the language (001)∗(010)∗.

First, we build an NFA for recognizing (001)∗ and another for recognizing

(010)∗; see figures below left and right respectively.

**start q 0 start q 3**

**1 0 0 0**

**q 0 q q 1 q**

**2 1 5 4**

### Non-Deterministic Finite Automata

**Role of ε**

We add an ε transition from q 0 to q 3 , resulting in the following (almost) NFA.

**ε**

**start q 0 start q 3**

**1 0 0 0**

**q 0 q q 1 q**

**2 1 5 4**

This not yet an NFA because we cannot have two start states.

### Non-Deterministic Finite Automata

**Role of ε**

Notice that we can always have (010)∗ after (001)∗, but it cannot happen the

other way around. So, q 0 should be our starting state.

**ε**

**start q 0 q 3**

**1 0 0 0**

**q 2 0 q 1 q 5 1 q 4**

### Non-Deterministic Finite Automata

**Role of ε**

An ε transition allows us to move from one state to another without reading

any symbol from the input. Let’s look at another example:

**1 start 0,1**

**q 1 ε q 0 ε q 2 0 q 3**

**What’s the language the NFA above recognizes?**

### Non-Deterministic Finite Automata

**Role of ε**

An ε transition allows us to move from one state to another without reading

any symbol from the input. Let’s look at another example:

**1 start 0,1**

**q 1 ε q 0 ε q 2 0 q 3**

What’s the language the NFA above recognizes? All binary strings that

end in a zero or has no zero.

### Non-Deterministic Finite Automata

One thing to keep in mind is that there is no unique FSM for a language.

For example, the following DFA accepts the same language as the NFA in

the previous slide. In other words, this DFA accepts the empty string, binary

strings containing only ones, and binary strings that end in zero.

**1 0 1**

**0**

**start q 0 0 q 1 1 q 2**

However, if two FSMs (DFA or NFA) recognize the same language, then we

call them equivalent.

### Non-Deterministic Finite Automata

One thing to keep in mind is that there is no unique FSM for a language.

For example, the following DFA accepts the same language as the NFA in

the previous slide. In other words, this DFA accepts the empty string, binary

strings containing only ones, and binary strings that end in zero.

**1 0 1**

**0**

**start q 0 0 q 1 1 q 2**

However, if two FSMs (DFA or NFA) recognize the same language, then we

call them equivalent.

**AretherelanguageswhichcanberecognizedbyanNFAbutnotbyany**

DFA, or vice-versa? We shall show soon that the recognition power of

NFAs is the same as DFAs.

### NFA Examples

```
w | w = accby, where y ∈ Σ∗- with Σ = {a,b,c}
```

**start q a q c q c q b q a,b,c**

**0 1 2 3 4**

### NFA Examples

```
w | w = accby, where y ∈ Σ∗- with Σ = {a,b,c}
```

**start q a q c q c q b q a,b,c**

**0 1 2 3 4**

```
w | w = xaccby, where x,y ∈ Σ∗- with Σ = {a,b,c}
```

**a,b,c q a q c q c q b q a,b,c**

**0 1 2 3 4**

**start**

### NFA Examples

```
What language does this NFA recognize? Assume Σ = {a,b,c}
```

**a,b,c q a,b,c q a,b,c q c q a,b,c q**

**0 1 2 3 4**

**start**

**▶ What is the criteria on the length?**

### NFA Examples

```
What language does this NFA recognize? Assume Σ = {a,b,c}
```

**a,b,c q a,b,c q a,b,c q c q a,b,c q**

**0 1 2 3 4**

**start**

```
- What is the criteria on the length? ≥ 4
```

**▶ What does the c on q 2 → q 3 signify?**

### NFA Examples

```
What language does this NFA recognize? Assume Σ = {a,b,c}
```

**a,b,c q a,b,c q a,b,c q c q a,b,c q**

**0 1 2 3 4**

**start**

```
- What is the criteria on the length? ≥ 4
```

- What does the c on q 2 → q 3 signify? The second character from the

right must be c.

**Therefore, the language is**

```
w | w has c in the second position from right and |w| ≥ 4, where w ∈ Σ∗-
```

### Practice Problems

```
Construct an NFA for the following languages. Here, Σ = {a,b,c}.
```

**1. a∗bc(ac)+**

```
2. (bb)∗- a∗∪(ccc)∗-
```

```
3. w | w contains ab or ac, where w ∈ Σ∗-
```

```
4. w | w has c in the second position from left, where w ∈ Σ∗-
```

```
5. w | length of w is odd and every even position has a, where w ∈ Σ∗- .
```

Assume base-1 indexing.

### Practice Problems

**a∗bc(ac)+**

**start q b q c q a q c q**

**0 1 2 3 4**

**a c a**

**q 5**

### Practice Problems

```
(bb)∗- a∗∪(ccc)∗-
```

**start**

**q ε q ε q**

**2 0 3**

**b b c c**

**a**

**q 1 q 5 c q 4**

### Practice Problems

```
w | w contains ab or ac, where w ∈ Σ∗-
```

**a,b,c**

**start q a q b,c q a,b,c**

**0 1 2**

### Practice Problems

```
w | w has c in the second position from left, where w ∈ Σ∗-
```

**start q a,b,c q c q a,b,c**

**0 1 2**

### Practice Problems

```
w | length of w is odd and every even position has a, where w ∈ Σ∗- .
```

Assume base-1 indexing.

**a**

**start q 0 q 1**

**a,b,c**

### Equivalence of NFA and DFA

WewanttoshowthattherecognitioncapabilityofNFAandDFAisthesame.

- Any DFA is an NFA without non-determinism or ε transitions. So,

anything a DFA can do an NFA can do as well. Therefore, in terms of

**recognition capability**

```
DFA ⊆ NFA
```

### Equivalence of NFA and DFA

WewanttoshowthattherecognitioncapabilityofNFAandDFAisthesame.

- Any DFA is an NFA without non-determinism or ε transitions. So,

anything a DFA can do an NFA can do as well. Therefore, in terms of

**recognition capability**

```
DFA ⊆ NFA
```

- We are interested in the other direction. Specifically, we want to show

**that in terms of recognition capability**

```
NFA ⊆ DFA
```

**In other words, given any NFA, there is an equivalent DFA which**

recognizes the same language.

### NFA to DFA

**Closure Operation**

```
For any state q ∈ Q and a ∈ Σ∪{ε}, define Closure(q,a) as:
```

**▶ all states reachable from q using the symbol a, or**

**▶ using a followed by an arbitrary number of ε**

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

**▶ What is Closure(q 2 ,0)?**

### NFA to DFA

**Closure Operation**

```
For any state q ∈ Q and a ∈ Σ∪{ε}, define Closure(q,a) as:
```

**▶ all states reachable from q using the symbol a, or**

**▶ using a followed by an arbitrary number of ε**

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

```
- What is Closure(q 2 ,0)? {q 0 ,q 2 }
```

**▶ What is Closure(q ,1)?**

**2**

### NFA to DFA

**Closure Operation**

```
For any state q ∈ Q and a ∈ Σ∪{ε}, define Closure(q,a) as:
```

**▶ all states reachable from q using the symbol a, or**

**▶ using a followed by an arbitrary number of ε**

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

```
- What is Closure(q 2 ,0)? {q 0 ,q 2 }
```

```
- What is Closure(q ,1)? {}
```

**▶ 2**

**What is Closure(q 0 ,ε)?**

### NFA to DFA

**Closure Operation**

```
For any state q ∈ Q and a ∈ Σ∪{ε}, define Closure(q,a) as:
```

**▶ all states reachable from q using the symbol a, or**

**▶ using a followed by an arbitrary number of ε**

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

```
- What is Closure(q 2 ,0)? {q 0 ,q 2 }
```

```
- What is Closure(q ,1)? {}
```

**▶ 2**

```
What is Closure(q 0 ,ε)? {q 0 ,q 2 }
```

### NFA to DFA

**States of the DFA**

**InanNFA,wecanbeinmultiplestatessimultaneously. So,wecanbeinany**

possible subsets of the states of the NFA.

Hence, the states of the DFA is the power-set of the states of the NFA.

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

**▶ What are the states of the DFA equivalent of the NFA above?**

### NFA to DFA

**States of the DFA**

**InanNFA,wecanbeinmultiplestatessimultaneously. So,wecanbeinany**

possible subsets of the states of the NFA.

Hence, the states of the DFA is the power-set of the states of the NFA.

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

**▶ What are the states of the DFA equivalent of the NFA above?**

```
{{},{q 0 },{q 1 },{q 2 },{q 0 ,q 1 },{q 0 ,q 2 },{q 1 ,q 2 },{q 0 ,q 1 ,q 2 }}
```

```
- What does the state {} imply?
```

### NFA to DFA

**States of the DFA**

**InanNFA,wecanbeinmultiplestatessimultaneously. So,wecanbeinany**

possible subsets of the states of the NFA.

Hence, the states of the DFA is the power-set of the states of the NFA.

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

**▶ What are the states of the DFA equivalent of the NFA above?**

```
{{},{q 0 },{q 1 },{q 2 },{q 0 ,q 1 },{q 0 ,q 2 },{q 1 ,q 2 },{q 0 ,q 1 ,q 2 }}
```

```
- What does the state {} imply? A dead NFA.
```

### NFA to DFA

**Final States of the DFA**

In an NFA, we accept a string if at the end at least one of the states that we

are in is a final state.

Hence, the final states of the DFA are those states which contains a final

state of the original NFA.

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

What are the final states of the DFA equivalent of the NFA above?

### NFA to DFA

**Final States of the DFA**

In an NFA, we accept a string if at the end at least one of the states that we

are in is a final state.

Hence, the final states of the DFA are those states which contains a final

state of the original NFA.

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

What are the final states of the DFA equivalent of the NFA above?

```
{{q 0 },{q 0 ,q 1 },{q 0 ,q 2 },{q 0 ,q 1 ,q 2 }}
```

### NFA to DFA

**Start State of the DFA**

In an NFA, when we start, not only are we in the start state but we are also

in any other state reachable by ε transitions.

Hence,thestartstateoftheDFAis Closure(q 0 ,ε),whereq 0 isthestartstate

of the NFA.

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

**What is the start state of the DFA equivalent of the NFA above?**

### NFA to DFA

**Start State of the DFA**

In an NFA, when we start, not only are we in the start state but we are also

in any other state reachable by ε transitions.

Hence,thestartstateoftheDFAis Closure(q 0 ,ε),whereq 0 isthestartstate

of the NFA.

**start q 0**

**1 0**

**ε**

**0 q 1 0,1 q 2**

```
What is the start state of the DFA equivalent of the NFA above? {q 0 ,q 2 }
```

### NFA to DFA

**Transitions of the DFA**

In an NFA, since we are in multiple states simultaneously, a transition using

a symbol is applied on all of these states. Moreover, the transition can be

followed by any number of ε transitions.

```
Hence, given a state {q 1 ,q 2 ,q 3 ,...,q k } in the DFA, the transition
```

```
δ({q 1 ,q 2 ,q 3 ,...,q k },a) = ∪k i=1 Closure(q,a) i
```

**States**

**slobmyS q 0 q 1 q 2**

```
0 ∅ {q 1 ,q 2 } {q 0 ,q 2 }
```

```
1 {q 1 } {q 2 } ∅
```

**Given the closure table above, evaluate the transitions**

```
- {q 2 } →0
```

### NFA to DFA

**Transitions of the DFA**

In an NFA, since we are in multiple states simultaneously, a transition using

a symbol is applied on all of these states. Moreover, the transition can be

followed by any number of ε transitions.

```
Hence, given a state {q 1 ,q 2 ,q 3 ,...,q k } in the DFA, the transition
```

```
δ({q 1 ,q 2 ,q 3 ,...,q k },a) = ∪k i=1 Closure(q,a) i
```

**States**

**slobmyS q 0 q 1 q 2**

```
0 ∅ {q 1 ,q 2 } {q 0 ,q 2 }
```

```
1 {q 1 } {q 2 } ∅
```

**Given the closure table above, evaluate the transitions**

```
- {q 2 } →0 {q 0 ,q 2 }
```

```
- {q 2 } →1
```

### NFA to DFA

**Transitions of the DFA**

In an NFA, since we are in multiple states simultaneously, a transition using

a symbol is applied on all of these states. Moreover, the transition can be

followed by any number of ε transitions.

```
Hence, given a state {q 1 ,q 2 ,q 3 ,...,q k } in the DFA, the transition
```

```
δ({q 1 ,q 2 ,q 3 ,...,q k },a) = ∪k i=1 Closure(q,a) i
```

**States**

**slobmyS q 0 q 1 q 2**

```
0 ∅ {q 1 ,q 2 } {q 0 ,q 2 }
```

```
1 {q 1 } {q 2 } ∅
```

**Given the closure table above, evaluate the transitions**

```
- {q 2 } →0 {q 0 ,q 2 }
```

```
- {q 2 } →1 {}
```

### NFA to DFA

**Transitions of the DFA**

In an NFA, since we are in multiple states simultaneously, a transition using

a symbol is applied on all of these states. Moreover, the transition can be

followed by any number of ε transitions.

```
Hence, given a state {q 1 ,q 2 ,q 3 ,...,q k } in the DFA, the transition
```

```
δ({q 1 ,q 2 ,q 3 ,...,q k },a) = ∪k i=1 Closure(q,a) i
```

**States**

**slobmyS q 0 q 1 q 2**

```
0 ∅ {q 1 ,q 2 } {q 0 ,q 2 }
```

```
1 {q 1 } {q 2 } ∅
```

**Given the closure table above, evaluate the transitions**

```
- {q 1 ,q 2 } →0
```

### NFA to DFA

**Transitions of the DFA**

In an NFA, since we are in multiple states simultaneously, a transition using

a symbol is applied on all of these states. Moreover, the transition can be

followed by any number of ε transitions.

```
Hence, given a state {q 1 ,q 2 ,q 3 ,...,q k } in the DFA, the transition
```

```
δ({q 1 ,q 2 ,q 3 ,...,q k },a) = ∪k i=1 Closure(q,a) i
```

**States**

**slobmyS q 0 q 1 q 2**

```
0 ∅ {q 1 ,q 2 } {q 0 ,q 2 }
```

```
1 {q 1 } {q 2 } ∅
```

**Given the closure table above, evaluate the transitions**

```
- {q 1 ,q 2 } →0 Closure(q 1 ,0)∪Closure(q 2 ,0) = {q 0 ,q 1 ,q 2 }
```

```
- {q 1 ,q 2 } →1
```

### NFA to DFA

**Transitions of the DFA**

In an NFA, since we are in multiple states simultaneously, a transition using

a symbol is applied on all of these states. Moreover, the transition can be

followed by any number of ε transitions.

```
Hence, given a state {q 1 ,q 2 ,q 3 ,...,q k } in the DFA, the transition
```

```
δ({q 1 ,q 2 ,q 3 ,...,q k },a) = ∪k i=1 Closure(q,a) i
```

**States**

**slobmyS q 0 q 1 q 2**

```
0 ∅ {q 1 ,q 2 } {q 0 ,q 2 }
```

```
1 {q 1 } {q 2 } ∅
```

**Given the closure table above, evaluate the transitions**

```
- {q 1 ,q 2 } →0 Closure(q 1 ,0)∪Closure(q 2 ,0) = {q 0 ,q 1 ,q 2 }
```

```
- {q 1 ,q 2 } →1 Closure(q 1 ,1)∪Closure(q 2 ,1) = {q 2 }
```

### NFA to DFA

**0,1**

```
{} 0 {q } 1 {q } {q ,q }
```

**0 1 0 1**

**1 1 1 0 0,1**

**0**

```
{q 2 } 0 {q 0 ,q 2 } 0 {q 1 ,q 2 } {q 0 ,q 1 ,q 2 }
```

**1 1**

**start**

**0**

### NFA to DFA

**start**

```
0,1 {} 0 {q 0 ,q 2 } 1 {q 1 }
```

**1 1 0**

**0 0**

```
{q 2 } {q 1 ,q 2 } {q 0 ,q 1 ,q 2 } 0
```

**1 1**

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

- The formal proof is in the notes. I will sketch the intuition here.

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

- The formal proof is in the notes. I will sketch the intuition here.

```
- Consider the language {0,1}∗1{0,1}2 – binary strings that contain a 1
```

in the third position from right.

- Equivalent NFA:

**start q 0 1 q 1 0,1 q 2 0,1 q 3**

**0,1**

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

- Equivalent DFA:

**start**

**0**

**0 q 0 q 0 q q**

**000 100 010 110**

**1 1 0 0**

**0 1 0**

**q q 1 q q**

**001 101 1 011 1 111 1**

**1**

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

**▶ There cannot exist a DFA with fewer than 8 states. Why?**

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

**▶ There cannot exist a DFA with fewer than 8 states. Why?**

- Consider ≥ 3-length binary strings. (Any valid input has at least 3-bits.)

So, there are ≥ 8 possible inputs to the DFA.

- If there are fewer than 8 states, there exists at least two 3-length unique

strings that lead to the same state (by pigeonhole principle).

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

**▶ There cannot exist a DFA with fewer than 8 states. Why?**

- Consider ≥ 3-length binary strings. (Any valid input has at least 3-bits.)

So, there are ≥ 8 possible inputs to the DFA.

- If there are fewer than 8 states, there exists at least two 3-length unique

strings that lead to the same state (by pigeonhole principle).

- Consider two 3-length unique strings w and w′, which end up in the

samestateoftheDFA.Sincew ̸= w′,theymustdifferinatleastonebit.

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

- They differ in the 3rd bit from right.

```
Let w ∈ 1{0,1}2 and w′ ∈ 0{0,1}2 – w is accepted whereas w′ isn’t
```

accepted – contradiction (because a state cannot be simultaneously

**final and non-final)!**

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

- They differ in the 3rd bit from right.

```
Let w ∈ 1{0,1}2 and w′ ∈ 0{0,1}2 – w is accepted whereas w′ isn’t
```

accepted – contradiction (because a state cannot be simultaneously

**final and non-final)!**

- They differ in the 2nd bit from right.

```
Let w ∈ {0,1}1{0,1} and w′ ∈ {0,1}0{0,1} – w0 is accepted whereas
```

w′0 isn’t accepted – contradiction (because starting from the same

**state, the same string cannot lead to two different states)!**

### NFA vs DFA Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**Proof Intuition**

- They differ in the 3rd bit from right.

```
Let w ∈ 1{0,1}2 and w′ ∈ 0{0,1}2 – w is accepted whereas w′ isn’t
```

accepted – contradiction (because a state cannot be simultaneously

**final and non-final)!**

- They differ in the 2nd bit from right.

```
Let w ∈ {0,1}1{0,1} and w′ ∈ {0,1}0{0,1} – w0 is accepted whereas
```

w′0 isn’t accepted – contradiction (because starting from the same

**state, the same string cannot lead to two different states)!**

- They differ in the last bit.

```
Let w ∈ {0,1}21 and w′ ∈ {0,1}20 – w00 is accepted whereas w′00
```

**isn’t accepted – contradiction (same reason as above)!**

### NFA vs DFA Computational Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**How to generalize the proof?**

```
- Construct NFA with (n+1) states for {0,1}∗1{0,1}n−1.
```

### NFA vs DFA Computational Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**How to generalize the proof?**

```
- Construct NFA with (n+1) states for {0,1}∗1{0,1}n−1.
```

- Consider ≥ n-length binary strings as input. If DFA has < 2n states, two

strings lead to the same state.

### NFA vs DFA Computational Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**How to generalize the proof?**

```
- Construct NFA with (n+1) states for {0,1}∗1{0,1}n−1.
```

- Consider ≥ n-length binary strings as input. If DFA has < 2n states, two

strings lead to the same state.

- Let w and w′ be two n-length unique binary strings which differ in the

```
ith-bit from right, where i ∈ [1,n]. Specifically, w ∈ {0,1}n−i1{0,1}i−1
```

```
and w ∈ {0,1}n−i0{0,1}i−1
```

### NFA vs DFA Computational Efficiency

**Thereexistsalanguageconsistingofstringsoflengthatleastn,which**

can be recognized by an NFA having (n+1) states but requires a DFA

having 2n states for recognition.

**How to generalize the proof?**

```
- Construct NFA with (n+1) states for {0,1}∗1{0,1}n−1.
```

- Consider ≥ n-length binary strings as input. If DFA has < 2n states, two

strings lead to the same state.

- Let w and w′ be two n-length unique binary strings which differ in the

```
ith-bit from right, where i ∈ [1,n]. Specifically, w ∈ {0,1}n−i1{0,1}i−1
```

```
and w ∈ {0,1}n−i0{0,1}i−1
```

- Now, w0n−i is accepted but w′0n−i is rejected, which is a contradiction.

### Regular Languages - Part II

**(Regular Operations & Expressions)**

**Arnab Ganguly**

**Departmentof Computer Science**

**Shiv Nadar IoE**

### Regular Operations

- Earlier we have seen that DFA and NFA are equivalent.

- We have also seen that they describe/recognize regular languages.

### Regular Operations

- Earlier we have seen that DFA and NFA are equivalent.

- We have also seen that they describe/recognize regular languages.

- Here, we will see that regular languages (and hence DFA/NFA) can also

be described by regular expressions (abbreviated Reg Ex).

Thus,

**Regular Language ≡ DFA ≡ NFA ≡ Regular Expression**

### Regular Operations

We shall first see that regular languages are closed under certain

operations. These operations are:

**▶ Union**

**▶ Kleene’s Closure**

**▶ Concatenation**

**▶ Complement**

**▶ Intersection**

Here, closed means that when these operations are applied to one (or two)

regular languages, the result is also a regular language.

### Regular Operations

**Union**

If L 1 and L 2 are regular languages, then L 1 ∪L 2 is also regular.

- Let N 1 be the NFA for L 1 . Let N 2 be the NFA for L 2 .

- Construct a new NFA as follows:

**▶ Createastartstateq s**

**▶ Drawεtransitionsfromq s tothestartstatesofN 1 andN 2**

**a**

**start**

**b**

**start**

```
NFAfor{a}and{b}respectively
```

### Regular Operations

**Union**

If L 1 and L 2 are regular languages, then L 1 ∪L 2 is also regular.

- Let N 1 be the NFA for L 1 . Let N 2 be the NFA for L 2 .

- Construct a new NFA as follows:

**▶ Createastartstateq s**

**▶ Drawεtransitionsfromq s tothestartstatesofN 1 andN 2**

**a ε a**

**start**

**start**

**b ε**

**start b**

```
NFAfor{a}and{b}respectively NFAfor(a∪b)
```

### Regular Operations

**Kleene’s Closure**

If L is a regular languages, then L∗ is also regular.

**▶ Let N be the NFA for L**

- Construct a new NFA as follows:

- DrawεtransitionsfromthefinalstatesofN toitsstartstate.

- Createanewstateq . Makeitafinalstateaswell.

- Drawaεtransitionfromq s totheoriginalstartstateofN.

**s**

**a**

**ε**

**start**

**ε**

**b**

```
NFAfor(a∪b)
```

### Regular Operations

**Kleene’s Closure**

If L is a regular languages, then L∗ is also regular.

**▶ Let N be the NFA for L**

- Construct a new NFA as follows:

- DrawεtransitionsfromthefinalstatesofN toitsstartstate.

- Createanewstateq . Makeitafinalstateaswell.

- Drawaεtransitionfromq s totheoriginalstartstateofN.

**s**

**a**

**ε ε a**

**start start ε**

**ε ε ε**

**b ε**

**b**

```
NFAfor(a∪b) NFAfor(a∪b)∗
```

### Regular Operations

**Don’t invent your own rules!**

Suppose, we use the strategy of not creating a new start state and instead

just make the old start state an accepting state. For example:

**ε a ε a**

**start start ε**

**ε**

**ε ε**

**b b**

```
NFAfor(a∪b) NFAfor(a∪b)∗
```

### Regular Operations

**Don’t invent your own rules!**

Suppose, we use the strategy of not creating a new start state and instead

just make the old start state an accepting state. For example:

**ε a ε a**

**start start ε**

**ε**

**ε ε**

**b b**

```
NFAfor(a∪b) NFAfor(a∪b)∗
```

**▶ Does it work in this example?**

### Regular Operations

**Don’t invent your own rules!**

Suppose, we use the strategy of not creating a new start state and instead

just make the old start state an accepting state. For example:

**ε a ε a**

**start start ε**

**ε**

**ε ε**

**b b**

```
NFAfor(a∪b) NFAfor(a∪b)∗
```

**▶ Does it work in this example? Yes!**

**▶ Does it work in general?**

### Regular Operations

**Don’t invent your own rules!**

Suppose, we use the strategy of not creating a new start state and instead

just make the old start state an accepting state. For example:

**ε a ε a**

**start start ε**

**ε**

**ε ε**

**b b**

```
NFAfor(a∪b) NFAfor(a∪b)∗
```

**▶ Does it work in this example? Yes!**

**▶ Does it work in general? No!**

### Regular Operations

**Don’t invent your own rules!**

**Applythestrategyofnotcreatinganewstartstateandinsteadjustmakethe**

old start state an accepting state. For example:

**c c,ε**

**start a b start a**

**b**

### Regular Operations

**Don’t invent your own rules!**

**Applythestrategyofnotcreatinganewstartstateandinsteadjustmakethe**

old start state an accepting state. For example:

**c c,ε**

**start a b start a**

**b**

**▶ What is the language on the left?**

### Regular Operations

**Don’t invent your own rules!**

**Applythestrategyofnotcreatinganewstartstateandinsteadjustmakethe**

old start state an accepting state. For example:

**c c,ε**

**start a b start a**

**b**

**▶ What is the language on the left? (abc)∗ab**

**▶ What is the Kleene’s closure of the language?**

### Regular Operations

**Don’t invent your own rules!**

**Applythestrategyofnotcreatinganewstartstateandinsteadjustmakethe**

old start state an accepting state. For example:

**c c,ε**

**start a b start a**

**b**

**▶ What is the language on the left? (abc)∗ab**

  - ▶ What is the Kleene’s closure of the language? (abc)∗ab

**▶ Does abc belong to the Kleene’s closure?**

### Regular Operations

**Don’t invent your own rules!**

**Applythestrategyofnotcreatinganewstartstateandinsteadjustmakethe**

old start state an accepting state. For example:

**c c,ε**

**start a b start a**

**b**

**▶ What is the language on the left? (abc)∗ab**

  - ▶ What is the Kleene’s closure of the language? (abc)∗ab

**▶ Does abc belong to the Kleene’s closure? No!**

**▶ Does the NFA on the right accept abc?**

### Regular Operations

**Don’t invent your own rules!**

**Applythestrategyofnotcreatinganewstartstateandinsteadjustmakethe**

old start state an accepting state. For example:

**c c,ε**

**start a b start a**

**b**

**▶ What is the language on the left? (abc)∗ab**

  - ▶ What is the Kleene’s closure of the language? (abc)∗ab

**▶ Does abc belong to the Kleene’s closure? No!**

**▶ Does the NFA on the right accept abc? Yes!**

### Regular Operations

**Concatenation**

If L 1 and L 2 are regular languages, then L 1 L 2 is also regular.

- Let N 1 be the NFA for L 1 . Let N 2 be the NFA for L 2 .

- Construct a new NFA as follows:

- DrawεtransitionsfromthefinalstatesofN 1 tothestartstateofN 2 .

- MakethefinalstatesofN 1 non-final.

**a**

**ε a b b**

**start ε ε ε start**

**ε**

**b NFAforabb**

```
NFAfor(a∪b)∗
```

### Regular Operations

**Concatenation**

If L 1 and L 2 are regular languages, then L 1 L 2 is also regular.

- Let N 1 be the NFA for L 1 . Let N 2 be the NFA for L 2 .

- Construct a new NFA as follows:

- DrawεtransitionsfromthefinalstatesofN 1 tothestartstateofN 2 .

- MakethefinalstatesofN 1 non-final.

**a**

**ε**

**start ε ε ε**

**ε ε ε a b b**

**ε b**

```
NFAfor(a∪b)∗abb
```

### Regular Operations

**Complement**

If the language L is regular, then so is ¬L.

- Construct a DFA for L.

- Swap its final and non-final states.

### Regular Operations

**Complement**

If the language L is regular, then so is ¬L.

- Construct a DFA for L.

- Swap its final and non-final states.

Why can’t we directly complement an NFA by swapping its final and

**non-final states?**

### Regular Operations

**Complement**

If the language L is regular, then so is ¬L.

- Construct a DFA for L.

- Swap its final and non-final states.

Why can’t we directly complement an NFA by swapping its final and

**non-final states?**

- This is an NFA that accepts only a.

**a**

**start**

- Its complement should accept aa but it clearly doesn’t.

**a**

**start**

### Regular Operations

**Complement**

If the language L is regular, then so is ¬L.

- Construct a DFA for L.

- Swap its final and non-final states.

Why can’t we directly complement an NFA by swapping its final and

**non-final states?**

- This is an NFA that accepts only a.

**a**

**start**

- Its complement should accept aa but it clearly doesn’t.

**a**

**start**

Because all transitions are not necessarily defined.

### Regular Operations

**Intersection**

If L 1 and L 2 are regular languages, then L 1 ∩L 2 is also regular.

```
L 1 ∩L 2 = ¬ ¬L 1 ∪¬L 2
```

So, we can do the following:

### Regular Operations

**Intersection**

If L 1 and L 2 are regular languages, then L 1 ∩L 2 is also regular.

```
L 1 ∩L 2 = ¬ ¬L 1 ∪¬L 2
```

So, we can do the following:

- Construct NFAs for ¬L 1 and ¬L 2 .

### Regular Operations

**Intersection**

If L 1 and L 2 are regular languages, then L 1 ∩L 2 is also regular.

```
L 1 ∩L 2 = ¬ ¬L 1 ∪¬L 2
```

So, we can do the following:

- Construct NFAs for ¬L 1 and ¬L 2 .

- Construct the NFA for ¬L ∪¬L .

**1 2**

### Regular Operations

**Intersection**

If L 1 and L 2 are regular languages, then L 1 ∩L 2 is also regular.

```
L 1 ∩L 2 = ¬ ¬L 1 ∪¬L 2
```

So, we can do the following:

- Construct NFAs for ¬L 1 and ¬L 2 .

- Construct the NFA for ¬L ∪¬L .

**▶ 1 2**

Convert the NFA to DFA.

### Regular Operations

**Intersection**

If L 1 and L 2 are regular languages, then L 1 ∩L 2 is also regular.

```
L 1 ∩L 2 = ¬ ¬L 1 ∪¬L 2
```

So, we can do the following:

- Construct NFAs for ¬L 1 and ¬L 2 .

- Construct the NFA for ¬L ∪¬L .

**▶ 1 2**

Convert the NFA to DFA.

- Complement the DFA.

### Regular Operations

**Intersection**

If L 1 and L 2 are regular languages, then L 1 ∩L 2 is also regular.

```
L 1 ∩L 2 = ¬ ¬L 1 ∪¬L 2
```

So, we can do the following:

- Construct NFAs for ¬L 1 and ¬L 2 .

- Construct the NFA for ¬L ∪¬L .

**▶ 1 2**

Convert the NFA to DFA.

- Complement the DFA.

**Any simpler way? Yes, we can use DFA/NFA product!**

### DFA Product

```
Given two DFAs (Q 1 ,F 1 ,Σ,δ 1 ,q 1 ) and (Q 2 ,F 2 ,Σ,δ 2 ,q 2 ), their product is the
```

```
DFA (Q,F,Σ,δ,q) constructed as
```

**▶ Q = Q ×Q**

**▶ 1 2**

**q = (q 1 ,q 2 )**

### DFA Product

```
Given two DFAs (Q 1 ,F 1 ,Σ,δ 1 ,q 1 ) and (Q 2 ,F 2 ,Σ,δ 2 ,q 2 ), their product is the
```

```
DFA (Q,F,Σ,δ,q) constructed as
```

**▶ Q = Q ×Q**

**▶ 1 2**

**q = (q 1 ,q 2 )**

```
- δ : Q×Σ → Q is defined as: for any (s 1 ,s 2 ) ∈ Q and a ∈ Σ,
```

```
δ (s 1 ,s 2 ),a = δ 1 (s 1 ,a),δ 1 (s 2 ,a)
```

### DFA Product

```
Given two DFAs (Q 1 ,F 1 ,Σ,δ 1 ,q 1 ) and (Q 2 ,F 2 ,Σ,δ 2 ,q 2 ), their product is the
```

```
DFA (Q,F,Σ,δ,q) constructed as
```

**▶ Q = Q ×Q**

**▶ 1 2**

**q = (q 1 ,q 2 )**

```
- δ : Q×Σ → Q is defined as: for any (s 1 ,s 2 ) ∈ Q and a ∈ Σ,
```

```
δ (s 1 ,s 2 ),a = δ 1 (s 1 ,a),δ 1 (s 2 ,a)
```

- F ⊆ Q is the set of final states, which depends on the operation that we

want to achieve using the product DFA.

### DFA Product

**Final States for DFA Union**

The union of two DFAs is the product of the two DFAs with the accepting

**states defined as**

```
F = (s 1 ,s 2 ) | s 1 ∈ F 1 OR s 2 ∈ F 2 = (F 1 ×Q 2 )∪(Q 1 ×F 2 )
```

### DFA Product

**Final States for DFA Union**

The union of two DFAs is the product of the two DFAs with the accepting

**states defined as**

```
F = (s 1 ,s 2 ) | s 1 ∈ F 1 OR s 2 ∈ F 2 = (F 1 ×Q 2 )∪(Q 1 ×F 2 )
```

**Final States for DFA Union Intersection**

The union of two DFAs is the product of the two DFAs with the accepting

**states defined as**

```
F = (s ,s ) | s ∈ F AND s ∈ F = F ×F
```

**1 2 1 1 2 2 1 2**

### DFA Union

**Example**

**0 0**

**start q 0 q 1 start q 0 q 1**

**0 1**

**1 1 0 1**

### DFA Union

**Example**

**0 0**

**start q 0 q 1 start q 0 q 1**

**0 1**

**1 1 0 1**

**start q 0 q 0 1 q 0 q 1 1**

**0**

**0 0**

**0**

**1 q 1 q 1 1 q 1 q 0**

### DFA Intersection

**Example**

**0 0**

**start q 0 q 1 start q 0 q 1**

**0 1**

**1 1 0 1**

### DFA Intersection

**Example**

**0 0**

**start q 0 q 1 start q 0 q 1**

**0 1**

**1 1 0 1**

**start q 0 q 0 1 q 0 q 1 1**

**0**

**0 0**

**0**

**1 q 1 q 1 1 q 1 q 0**

### NFA Intersection

```
Given two NFAs (Q 1 ,F 1 ,Σ,δ 1 ,q 1 ) and (Q 2 ,F 2 ,Σ,δ 2 ,q 2 ), their intersection is
```

```
the NFA (Q,F,Σ,δ,q) constructed as
```

**▶ Q = Q 1 ×Q 2**

**▶ q = (q ,q )**

**▶ 1 2**

**F = F 1 ×F 2**

### NFA Intersection

```
Given two NFAs (Q 1 ,F 1 ,Σ,δ 1 ,q 1 ) and (Q 2 ,F 2 ,Σ,δ 2 ,q 2 ), their intersection is
```

```
the NFA (Q,F,Σ,δ,q) constructed as
```

**▶ Q = Q 1 ×Q 2**

**▶ q = (q ,q )**

**▶ 1 2**

**F = F 1 ×F 2**

```
- δ : Q×Σ → P(Q) is defined as follows.
```

```
- Forany(s 1 ,s 2 )∈Q anda∈Σ,δ (s 1 ,s 2 ),a =δ 1 (s 1 ,a)×δ 2 (s 2 ,a)
```

```
Ifδ 1 (s 1 ,a)orδ 2 (s 2 ,a)isundefined,thenδ (s 1 ,s 2 ),a isundefined.
```

### NFA Intersection

```
Given two NFAs (Q 1 ,F 1 ,Σ,δ 1 ,q 1 ) and (Q 2 ,F 2 ,Σ,δ 2 ,q 2 ), their intersection is
```

```
the NFA (Q,F,Σ,δ,q) constructed as
```

**▶ Q = Q 1 ×Q 2**

**▶ q = (q ,q )**

**▶ 1 2**

**F = F 1 ×F 2**

```
- δ : Q×Σ → P(Q) is defined as follows.
```

```
- Forany(s 1 ,s 2 )∈Q anda∈Σ,δ (s 1 ,s 2 ),a =δ 1 (s 1 ,a)×δ 2 (s 2 ,a)
```

```
Ifδ 1 (s 1 ,a)orδ 2 (s 2 ,a)isundefined,thenδ (s 1 ,s 2 ),a isundefined.
```

```
- Forany(s ,s )∈Q,δ (s ,s ),ε = δ (s ,ε)×{s } ∪ {s }×δ (s ,ε) .
```

**1 2 1 2 1 1 2 1 2 2**

### NFA Intersection

**Example**

**start b,c b start a,b,c**

**a**

**b,c q q q ε q ε q c q**

**0 1 2 3 4 5**

**a**

### NFA Intersection

**Example**

**start b,c b start a,b,c**

**a**

**b,c q q q ε q ε q c q**

**0 1 2 3 4 5**

**a start b,c**

**b q q ε q q ε q q c q q**

**0 2 0 3 0 4 0 5**

**a a**

**b q 1 q 2 ε q 1 q 3 ε q 1 q 4 c q 1 q 5**

**b,c**

### NFA Intersection

**Example**

**start b,c b start a,b,c**

**a**

**b,c q q q ε q ε q c q**

**0 1 2 3 4 5**

**a start b,c**

**b q q ε q q ε q q c q q**

**0 2 0 3 0 4 0 5**

**a a**

**q 1 q 4 c q 1 q 5**

**b,c**

### DFA/NFA to RegEx

Earlier we have seen that any Regular Expression can be converted to an

**NFA. So, we know that**

```
Reg Ex ⊆ NFA
```

Now, we are interested in the other direction. Specifically, we want convert

**any NFA to a regular expression and establish**

```
NFA ⊆ Reg Ex
```

This will establish that NFA and regular expressions are equivalent ways of

defining regular languages.

### DFA/NFA to Regex

**Generalized NFA (GNFA)**

In GNFA, we allow regular expressions as edge labels, instead of just

```
symbols. Specifically, a GNFA is a quintuple (Q,q f ,Σ,δ,q s ), where
```

**▶ Q is the set of states**

**▶ Σ is the set of symbols that form the edge-labels**

### DFA/NFA to Regex

**Generalized NFA (GNFA)**

In GNFA, we allow regular expressions as edge labels, instead of just

```
symbols. Specifically, a GNFA is a quintuple (Q,q f ,Σ,δ,q s ), where
```

**▶ Q is the set of states**

**▶ Σ is the set of symbols that form the edge-labels**

- q f is the (unique) final state, which does not have any outgoing edge.

- q is the (unique) start state, which does not have any incoming edge.

**s**

### DFA/NFA to Regex

**Generalized NFA (GNFA)**

In GNFA, we allow regular expressions as edge labels, instead of just

```
symbols. Specifically, a GNFA is a quintuple (Q,q f ,Σ,δ,q s ), where
```

**▶ Q is the set of states**

**▶ Σ is the set of symbols that form the edge-labels**

- q f is the (unique) final state, which does not have any outgoing edge.

- q is the (unique) start state, which does not have any incoming edge.

**▶ s**

```
δ : (Q\{q f })×(Q\{q s }) → R(Σ) is the transition function, where
```

```
R(Σ) is the set of all regular expressions over the alphabet Σ.
```

### DFA/NFA to Regex

**Generalized NFA (GNFA)**

In GNFA, we allow regular expressions as edge labels, instead of just

```
symbols. Specifically, a GNFA is a quintuple (Q,q f ,Σ,δ,q s ), where
```

**▶ Q is the set of states**

**▶ Σ is the set of symbols that form the edge-labels**

- q f is the (unique) final state, which does not have any outgoing edge.

- q is the (unique) start state, which does not have any incoming edge.

**▶ s**

```
δ : (Q\{q f })×(Q\{q s }) → R(Σ) is the transition function, where
```

```
R(Σ) is the set of all regular expressions over the alphabet Σ.
```

- Specifically,giventwostatesq 1 andq 2 ,whereq 1 ̸=q f andq 2 ̸=q s ,if

δ(q 1 ,q 2 )=R,thenR istheregularexpressionontheedgefromq 1 toq 2 .

### DFA/NFA to Regex

**Generalized NFA (GNFA)**

In GNFA, we allow regular expressions as edge labels, instead of just

```
symbols. Specifically, a GNFA is a quintuple (Q,q f ,Σ,δ,q s ), where
```

**▶ Q is the set of states**

**▶ Σ is the set of symbols that form the edge-labels**

- q f is the (unique) final state, which does not have any outgoing edge.

- q is the (unique) start state, which does not have any incoming edge.

**▶ s**

```
δ : (Q\{q f })×(Q\{q s }) → R(Σ) is the transition function, where
```

```
R(Σ) is the set of all regular expressions over the alphabet Σ.
```

- Specifically,giventwostatesq 1 andq 2 ,whereq 1 ̸=q f andq 2 ̸=q s ,if

δ(q 1 ,q 2 )=R,thenR istheregularexpressionontheedgefromq 1 toq 2 .

- Noticethatthedomainisallpairsofstates(q 1 ,q 2 ),whereq 1 ̸=q f and

**q 2 ̸=q s ;hence,inaGNFA,thereisanedgefromeverynon-finalstateto**

everynon-startstate.

### DFA/NFA to Regex

**Preprocessing Step**

- First change the automaton to the following NFA:

- addingastartstateq s withanedgefromq s tothe(original)startstate.

- addingafinalstateq f withedgesfromthe(original)finalstate(s)toq f .

- thelabelontheseedgesisε.

### DFA/NFA to Regex

**Preprocessing Step**

- First change the automaton to the following NFA:

- addingastartstateq s withanedgefromq s tothe(original)startstate.

- addingafinalstateq f withedgesfromthe(original)finalstate(s)toq f .

- thelabelontheseedgesisε.

**▶ Compute the regular expression by calling Compute(NFA) and**

returning the value.

### DFA/NFA to Regex

**Preprocessing Step – Example**

**start 1**

**0**

**q 0 q 1**

**0**

**1 0**

**1**

**q 2**

### DFA/NFA to Regex

**Preprocessing Step – Example**

**start 1 start 1**

**0 0**

**q q q ε q q**

**0 0 1 s 0 0 1**

**1 0 1 0 ε**

**1 1**

**q 2 q 2 ε q f**

### DFA/NFA to Regex

**The Recursive Algorithm**

```
- Let n be the number of states in the GNFA (Q,q ,Σ,δ,q s ).
```

**▶ f**

If (n = 2), then the GNFA has q s with an edge to q f .

The label on this edge is the final regular expression.

### DFA/NFA to Regex

**The Recursive Algorithm**

```
- Let n be the number of states in the GNFA (Q,q ,Σ,δ,q s ).
```

**▶ f**

If (n = 2), then the GNFA has q s with an edge to q f .

The label on this edge is the final regular expression.

```
- Select a state q rip from Q\{q s ,q f }.
```

### DFA/NFA to Regex

**The Recursive Algorithm**

```
- Let n be the number of states in the GNFA (Q,q ,Σ,δ,q s ).
```

**▶ f**

If (n = 2), then the GNFA has q s with an edge to q f .

The label on this edge is the final regular expression.

```
- Select a state q rip from Q\{q s ,q f }.
```

**▶ Convert the GNFA to another GNFA, denoted as**

```
GNFA′(Q′,q f ,Σ,δ′,q s ), which is defined as follows:
```

```
- Q′ =Q\{q rip }
```

```
- Foranyq i ∈Q′\{q f }andq j ∈Q′\{q s },
```

```
δ′(q,q)=R i j 1 R∗R 2 3 ∪R 4
```

```
whereR 1 =δ(q,q i rip ),R 2 =δ(q rip ,q rip ),R 3 =δ(q rip ,q),andR j 4 =δ(q,q). i j
```

### DFA/NFA to Regex

**The Recursive Algorithm**

```
- Let n be the number of states in the GNFA (Q,q ,Σ,δ,q s ).
```

**▶ f**

If (n = 2), then the GNFA has q s with an edge to q f .

The label on this edge is the final regular expression.

```
- Select a state q rip from Q\{q s ,q f }.
```

**▶ Convert the GNFA to another GNFA, denoted as**

```
GNFA′(Q′,q f ,Σ,δ′,q s ), which is defined as follows:
```

```
- Q′ =Q\{q rip }
```

```
- Foranyq i ∈Q′\{q f }andq j ∈Q′\{q s },
```

```
δ′(q,q)=R i j 1 R∗R 2 3 ∪R 4
```

```
whereR 1 =δ(q,q i rip ),R 2 =δ(q rip ,q rip ),R 3 =δ(q rip ,q),andR j 4 =δ(q,q). i j
```

- Recursively Compute(GNFA′) and return the value.

### DFA/NFA to Regex

**State Reduction Visualization**

**R 4**

```
q q q R 1 R∗R 2 3 ∪R 4 q
```

**i j i j**

**R 1 R 3**

**q rip**

**R 2**

### DFA/NFA to Regex

**State Reduction Simulation: q rip = q 0**

**start 1**

**0**

**q s ε q 0 q 1**

**0**

**1 1 0 ε**

**q 2 ε q f**

### DFA/NFA to Regex

**State Reduction Simulation: q rip = q 0**

```
start start 00∪1
```

**1**

**0**

**ε q s 0 q 1**

**q s q 0 0 q 1 01**

**1 1 0 ε 1 ε**

```
0∪10
```

**q 2 ε q f**

**11 q 2 ε q f**

### DFA/NFA to Regex

**State Reduction Simulation: q rip = q 1**

```
start 00∪1
```

**q 0 q**

**s 1**

**01**

```
1 0∪10 ε
```

**11 q 2 ε q f**

### DFA/NFA to Regex

**State Reduction Simulation: q rip = q 1**

```
start 00∪1
```

```
start 11∪(0∪10) 00∪1 01
```

**q 0 q**

```
s 1 0 00∪1 01∪1
```

**01 q s q 2**

```
1 0∪10 ε
```

```
0 00∪1 ε∪(0∪10)(00∪1)∗
```

**11 q 2 ε q f q**

**f**

### DFA/NFA to Regex

**State Reduction Simulation: q rip = q 2**

```
0 00∪1 01∪1
```

```
start q s q 2 11∪(0∪10) 00∪1 01
```

```
0 00∪1 ε∪(0∪10)(00∪1)∗
```

**q f**

### DFA/NFA to Regex

**State Reduction Simulation: q rip = q 2**

```
0 00∪1 01∪1
```

```
start q s q 2 11∪(0∪10) 00∪1 01
```

```
0 00∪1 ε∪(0∪10)(00∪1)∗
```

**q f**

**start q R q**

**s f**

- R =

```
0 00∪1 ∪ 0 00∪1 01∪1 11∪(0∪10) 00∪1 01 ε∪(0∪10)(00∪1)∗
```
