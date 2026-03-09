# RL Mid-Semester: Deep Analysis & Question Bank
# CSD366 — Introduction to Reinforcement Learning
# Analyst: Deep-Structure Document Analyst v1.0
# Source PDFs: midsem.pdf (Sutton & Barto Ch.2-3) + QP Answer Key

================================================================================

## TABLE OF CONTENTS

  1. Phase 1 — Parsing Summary & Keyword Traps
  2. Phase 2 — Difficulty Audit & Source Mapping
  3. Phase 2 — High-Yield Book Sections (Surgical)
  4. Phase 3 — New Question Bank (5-Mark Category)
  5. Phase 3 — New Question Bank (2-Mark Category)
  6. Phase 3 — New Question Bank (15-Mark Category)
  7. Appendix — Key Formulae Reference Sheet

================================================================================

# PHASE 1: PARSING SUMMARY & KEYWORD TRAPS

--------------------------------------------------------------------------------

## 1.1 Critical Vocabulary — Words That Change Everything

The following terms appeared in the QP and carry heavy semantic weight.
Misreading even one of them can cost full marks.

### DETERMINISTIC

  Source: QP Q1, Q2 | Book: §2.2 (p.33-34)

  When rewards are deterministic, the sample-average method converges in
  exactly ONE pull per arm. There is no noise term, so:

      Q_t(a) = q(a)  after a single observation

  This collapses the exploration problem entirely. You do NOT need ε-greedy,
  UCB, or any stochastic method. One pull per arm suffices.

  TRAP: Students confuse "deterministic rewards" with "deterministic policy."
  They apply standard stochastic bandit logic and suggest pulling each arm
  multiple times — losing all marks for Q1.

### STATIONARY vs. NON-STATIONARY

  Source: Book §2.4 (p.38-39)

  Stationary  → Sample-average (α = 1/k) is appropriate. Converges to q(a).
  Non-stationary → Constant α preferred. Old rewards decay exponentially.

  Convergence conditions (Eq. 2.7):

      ∑_{k=1}^∞ α_k(a) = ∞    [steps large enough to overcome init. cond.]
      ∑_{k=1}^∞ α_k²(a) < ∞   [steps small enough to ensure convergence]

  The constant α = c violates the second condition → never fully converges.
  This is DESIRABLE in non-stationary settings.

  TRAP: Students say "constant α is bad" without specifying the context.
  It is bad for stationary, good for non-stationary.

### "KNOWN BEFOREHAND"

  Source: QP Q1 Answer Key

  The answer key explicitly flags: "this is only possible because the rewards
  were deterministic AND because we knew beforehand that the rewards were
  deterministic."

  If you don't know rewards are deterministic, you cannot trust a single
  sample. The prior knowledge unlocks a different algorithm class entirely.

### INITIAL ESTIMATES vs. STEP SIZE

  Source: Book §2.5 (p.39-40)

  Optimistic initial values work as an exploration mechanism ONLY for
  stationary problems. The "disappointment" mechanism that forces exploration
  is a one-time event tied to the initial state — it cannot handle renewed
  non-stationarity.

  TRAP: Q2 option (d) uses Q_0 = 40 > max_reward = 20. This is optimistic
  initialization. Students who forget the stationary constraint may rank it
  lower than it deserves for the LONG-TERM (deterministic) setting.

### DISCOUNT FACTOR γ

  Source: Book §3.3 (p.59-60), QP Q4

  γ = 0 → Myopic. Only immediate reward matters.
  γ → 1 → Farsighted. All future rewards weighted equally.
  γ = 1 allowed ONLY if the task is episodic (finite T).

  TRAP: Students write γ = 1 for continuing tasks without justification.
  The book explicitly states: "not both T = ∞ and γ = 1" (§3.4, p.62).

--------------------------------------------------------------------------------

## 1.2 Mathematical Integrity Checkpoint

All equations below are transcribed verbatim from midsem.pdf.

### Bellman Equation for v_π (Eq. 3.12, p.71):

    v_π(s) = Σ_a π(a|s) Σ_{s',r} p(s',r|s,a) [r + γ v_π(s')]

### Bellman Optimality for v* (Eq. 3.17, p.76):

    v*(s) = max_{a∈A(s)} Σ_{s',r} p(s',r|s,a) [r + γ v*(s')]

### Bellman Optimality for q* (p.76):

    q*(s,a) = Σ_{s',r} p(s',r|s,a) [r + γ max_{a'} q*(s',a')]

### UCB Action Selection (Eq. 2.8, p.41):

    A_t = argmax_a [ Q_t(a) + c * sqrt( ln(t) / N_t(a) ) ]

    where:
      Q_t(a)   = estimated value of action a at step t
      N_t(a)   = number of times a has been selected prior to t
      c > 0    = exploration parameter (confidence level)
      ln(t)    = natural logarithm

### Incremental Update (Eq. 2.3, p.37):

    Q_{k+1} = Q_k + (1/k) [R_k - Q_k]

### Exponential Recency-Weighted Average (Eq. 2.6, p.38):

    Q_{k+1} = (1-α)^k Q_1 + Σ_{i=1}^{k} α(1-α)^{k-i} R_i

================================================================================

# PHASE 2: DIFFICULTY AUDIT & SOURCE MAPPING

--------------------------------------------------------------------------------

## Q1 — 10-Armed Bandit, Deterministic Rewards [5 Marks]

  Difficulty: 4/10

  Surface Complexity: Low. The question looks like a standard bandit problem.

  Semantic Trap (HIGH RISK):
    The word "deterministic" is the entire key. Without noticing it, a student
    applies standard stochastic reasoning and writes "pull each arm ~30 times"
    or calculates a confidence interval. This scores 0/5.

  Correct Logic Chain:
    1. Rewards deterministic → Q_t(a) = q(a) after ONE pull.
    2. Pull each of 10 arms exactly once (10 total pulls).
    3. Select arm with maximum observed reward.
    4. This gives 100% certainty of the best arm — exceeding 95%.
    5. Note: "95% probability" is a red herring since determinism gives 100%.

  Source Mapping: DIRECT
    → Book §2.2 p.33: "true value of action a as q(a)"
    → Book §2.2 p.34: sample-average method, Eq. 2.1
    → Answer Key explicitly cites determinism as the pivotal condition.

  Lost-Mark Pattern:
    Most students lose marks by not JUSTIFYING why one pull suffices. The
    answer key expects the causal chain: deterministic → no variance →
    single sample = true value.

--------------------------------------------------------------------------------

## Q2 — 20-Armed Bandit, Best Long-Term Method [5 Marks]

  Difficulty: 6/10

  Options Analysis:

    (a) ε-greedy, ε=0.1
        Explores 10% of time FOREVER. In a deterministic setting, this
        wastes 10% of all pulls on already-known arms. Sub-optimal long-term.

    (b) ε-greedy, ε=0.01
        Wastes 1% of pulls. Better than (a), but still sub-optimal long-term.

    (c) Greedy, Q_0 = 0
        Never explores arms that were tried once and gave reward > 0.
        If the first tried arm is decent but not optimal, it locks in.
        Catastrophically sub-optimal.

    (d) Greedy, Q_0 = 40 (> max reward 20)  ← CORRECT ANSWER
        Optimistic initialization forces each arm to be tried at least once
        (since any real reward < 40 causes "disappointment" → exploration).
        After all 20 arms tried, greedy selects the maximum. Then exploits
        FOREVER with 0% exploration waste.

  Source Mapping: DIRECT
    → Book §2.5 p.39-40: Optimistic Initial Values
    → Figure 2.2, p.40: Performance of optimistic greedy vs ε-greedy
    → Answer Key: "initial reward higher than all possible rewards ensures
      each arm is selected at least once"

  Semantic Trap (HIGH RISK):
    Students confuse "long term" with "needs continuous exploration."
    For DETERMINISTIC rewards, continuous exploration is pure waste.
    The optimistic greedy converges to zero wasted pulls after 20 initial
    explorations. ε-greedy methods NEVER stop wasting pulls.

  Secondary Trap:
    Rewards are in range (0, 20) — open interval. Q_0 = 40 is STRICTLY
    greater than any possible reward, guaranteeing exploration. Q_0 = 20
    would NOT work since a reward of 20 is possible.

--------------------------------------------------------------------------------

## Q3 — Bellman Equation + Policy Iteration [2+3=5 Marks]

  Difficulty: 5/10

  Part (a): Bellman Equation [2 Marks]

    The QP answer key uses a slightly condensed form (deterministic reward R(s)
    and transition P_{sπ(s)}):

        V^π(s) = R(s) + γ Σ_{s'∈S} P_{sπ(s)}(s') V^π(s')

    Full stochastic form from book (Eq. 3.12):

        v_π(s) = Σ_a π(a|s) Σ_{s',r} p(s',r|s,a) [r + γ v_π(s')]

    Semantic Trap: Writing v*(s) instead of v^π(s). The Bellman equation
    for a FIXED policy differs from the Bellman OPTIMALITY equation.
    These are different objects — confusing them costs 1-2 marks.

  Part (b): Policy Iteration [3 Marks]

    Algorithm (from answer key):

      1. Initialize π randomly.
      2. Repeat until convergence:
         a. Policy Evaluation: Compute V := V^π
            (solve linear system V^π(s) = R(s) + γ Σ P_{sπ(s)}(s')V^π(s'))
         b. Policy Improvement: For each state s, set
            π(s) := argmax_{a∈A} Σ_{s'} P_{sa}(s') V(s')
      3. Return π.

    Lost-Mark Pattern:
      Students describe value iteration instead of policy iteration.
      The distinction: policy iteration alternates between FULL evaluation
      (solve the system exactly) and improvement. Value iteration does
      one Bellman backup per state per iteration.

  Source Mapping: DIRECT
    → Book §3.7 p.70-72: Value Functions, Bellman Equation (3.12)
    → Book §3.8 p.75-76: Optimal Value Functions
    → [External Logic]: Full policy iteration pseudocode is in Ch.4 of
      Sutton & Barto (not included in midsem.pdf). Answer key provides it.

--------------------------------------------------------------------------------

## Q4 — Inventory Problem as MDP [15 Marks]

  Difficulty: 7/10

  This is a design/formulation question. Marks are split across:
    - State space identification
    - Action space identification
    - Reward function with correct signs
    - Transition probability matrix (TPM)
    - Discount factor justification

  Semantic Traps:

    TRAP 1 — Missing the "restock" action from state 0:
      The answer key shows state 0 can take action "restock" → goes to
      state 1 with prob (1-p_sale). Many students forget this because
      "you have 0 stock, why restock to only 1?"

    TRAP 2 — Reward signs:
      Loss of goodwill = -X (negative). Profit = +S (positive). Students
      sometimes make both positive or flip the signs.

    TRAP 3 — State 0 with no sale:
      P(no sale | state=0) = 1 - 0.7 = 0.3, reward = 0 (nothing to sell
      and no one came). But P(sale attempt | state=0) = 0.7, reward = -X
      (goodwill loss). These are two SEPARATE rows in the TPM.

    TRAP 4 — Discount factor justification:
      The answer key says: "huge demand → high γ (enough samples to learn),
      low demand → low γ." This is a conceptual justification students
      often skip.

  Source Mapping: INDIRECT
    → Book §3.6 p.67-69: MDP formulation, recycling robot example
    → Book §3.7 p.70: Value functions defined over state-action pairs
    → Table 3.1 p.69: Structure of TPM (the template to follow)

  The recycling robot (Example 3.7) is the DIRECT template for this
  question. The inventory shop maps to it nearly 1-to-1:

```
  Recycling Robot  ←→  Inventory Shop
  ─────────────────────────────────────────────────────
  States: {high, low}  ←→  States: {0, 1, 2}
  Actions: search/wait/recharge  ←→  Actions: none/restock
  Battery depletion  ←→  Stockout (goodwill loss)
  Expected cans = reward  ←→  Profit per sale = reward
```

================================================================================

# PHASE 2: HIGH-YIELD BOOK SECTIONS (SURGICAL)

--------------------------------------------------------------------------------

  The following sections provide the maximum marks-per-page value.
  Read these FIRST and THOROUGHLY before anything else.

  ┌─────────────────────────────────────────────────────────────────────────┐
  │  RANK │ SECTION          │ PAGES  │ TOPICS COVERED                      │
  ├─────────────────────────────────────────────────────────────────────────┤
  │  #1   │ §2.2             │ 33-36  │ Action-value methods, ε-greedy,     │
  │       │                  │        │ greedy, sample-average. Core of Q1  │
  │       │                  │        │ and Q2.                             │
  ├─────────────────────────────────────────────────────────────────────────┤
  │  #2   │ §2.5             │ 39-41  │ Optimistic Initial Values. Direct   │
  │       │                  │        │ source of Q2(d). Figure 2.2.        │
  ├─────────────────────────────────────────────────────────────────────────┤
  │  #3   │ §3.6             │ 67-69  │ Finite MDP definition, recycling    │
  │       │                  │        │ robot, Table 3.1 TPM. Template for  │
  │       │                  │        │ Q4.                                 │
  ├─────────────────────────────────────────────────────────────────────────┤
  │  #4   │ §3.7             │ 70-72  │ Value functions, Bellman equation   │
  │       │                  │        │ (3.12). Core of Q3.                 │
  ├─────────────────────────────────────────────────────────────────────────┤
  │  #5   │ §2.6             │ 41-42  │ UCB action selection, Eq. 2.8.      │
  │       │                  │        │ New syllabus topic.                 │
  ├─────────────────────────────────────────────────────────────────────────┤
  │  #6   │ §3.8             │ 75-78  │ Optimal value functions, Bellman    │
  │       │                  │        │ optimality equations (3.16-3.17).   │
  ├─────────────────────────────────────────────────────────────────────────┤
  │  #7   │ §2.4             │ 38-39  │ Non-stationary tracking, constant   │
  │       │                  │        │ α, convergence conditions (2.7).    │
  └─────────────────────────────────────────────────────────────────────────┘

  SKIP (for exam purposes): §2.7 Gradient Bandits, §2.8 Associative Search,
  §3.5 Markov Property (theoretical), §3.9 Optimality and Approximation.
  These are unlikely exam targets given the QP pattern.

================================================================================

# PHASE 3: NEW QUESTION BANK

================================================================================

## CATEGORY A: 5-MARK QUESTIONS (Pattern: Tricky wording, conceptual depth)

--------------------------------------------------------------------------------

### NEW Q1 [5 Marks] — UCB vs ε-Greedy: Deterministic Rewards

  Suppose you have a 5-armed bandit problem where the rewards are
  deterministic and in the range (0, 10). You run two agents:

    Agent A: UCB with c = 2, starting from Q_1(a) = 0 for all a.
    Agent B: ε-greedy with ε = 0.05, starting from Q_1(a) = 0 for all a.

  (i)  How many total pulls does Agent A need before it can guarantee
       optimal exploitation? Justify.

  (ii) In the long run (t → ∞), which agent accumulates more total reward?
       Justify by analyzing the exploration frequency of each method.

  SOLUTION:

  (i) UCB Action Selection (Eq. 2.8):

        A_t = argmax_a [ Q_t(a) + c * sqrt(ln(t) / N_t(a)) ]

      When N_t(a) = 0, the action is treated as maximizing (it has infinite
      upper bound). So UCB will try each arm at least once before settling.

      For 5 arms: Agent A needs exactly 5 pulls (one per arm, since any
      untried arm has effectively infinite UCB value). After 5 pulls, since
      rewards are deterministic, Q_t(a) = q(a) exactly.

      After the initial 5 pulls, the exploration term sqrt(ln(t)/N_t(a))
      shrinks for frequently selected arms. The optimal arm will eventually
      dominate, but UCB continues to occasionally revisit sub-optimal arms
      (since ln(t) grows). The agent is NOT guaranteed to exploit purely
      after t = 5.

      ANSWER: UCB with deterministic rewards cannot be said to "guarantee
      pure exploitation" at any finite t — it will always occasionally
      explore. This is a key weakness: UCB is designed for stochastic
      rewards. For deterministic rewards, 5 pulls suffice to IDENTIFY the
      best arm, but UCB's formula keeps exploring.

  (ii) Agent B (ε-greedy, ε = 0.05) also learns the best arm quickly (within
      ~5/0.95 ≈ 6 pulls on average), then wastes 5% of all future pulls.

      Long-run total reward comparison at time T:

        Agent B wasted pulls ≈ 0.05 * T (exploring non-optimal arms)
        Agent A wasted pulls ≈ O(ln T) (UCB exploration decays logarithmically)

      Since O(ln T) << O(T), Agent A (UCB) accumulates MORE total reward
      in the long run.

      Source: Book §2.6 p.41-42: "UCB generally performs better than
      ε-greedy action selection" (Figure 2.3). The UCB regret is bounded
      by O(ln T) while ε-greedy has linear regret.

  KEY INSIGHT: For deterministic rewards specifically, even a plain greedy
  method with optimistic initialization (Q_0 > 10) beats both, since it
  achieves 0 wasted pulls after 5 initial explorations.

--------------------------------------------------------------------------------

### NEW Q2 [5 Marks] — Convergence of Step-Size Sequences

  For each of the following step-size sequences {α_k(a)}, determine whether
  the action-value estimates Q_k are guaranteed to converge to the true
  values q(a). State which of the two conditions in (2.7) is violated (if any).

    (a) α_k = 1/k
    (b) α_k = 0.1 (constant)
    (c) α_k = 1/k²
    (d) α_k = 1/(k log k)    [for k ≥ 2]

  The convergence conditions (from §2.4, Eq. 2.7):

      Condition 1: Σ_{k=1}^∞ α_k = ∞
      Condition 2: Σ_{k=1}^∞ α_k² < ∞

  SOLUTION:

  (a) α_k = 1/k  [Sample-average method]

      Σ 1/k = ∞       → Condition 1: SATISFIED (harmonic series)
      Σ 1/k² = π²/6   → Condition 2: SATISFIED (Basel problem)
      VERDICT: CONVERGES. This is the standard sample-average method.

  (b) α_k = 0.1 (constant)

      Σ 0.1 = ∞       → Condition 1: SATISFIED
      Σ 0.01 = ∞      → Condition 2: VIOLATED
      VERDICT: DOES NOT CONVERGE to true values. Estimates continue to
      track recent rewards — desirable for non-stationary, problematic
      for stationary environments.

  (c) α_k = 1/k²

      Σ 1/k² = π²/6 < ∞  → Condition 1: VIOLATED (converges to finite value)
      Σ 1/k⁴ < ∞          → Condition 2: SATISFIED
      VERDICT: DOES NOT CONVERGE. Steps become too small too quickly.
      Initial conditions are never overcome.

  (d) α_k = 1/(k log k)  for k ≥ 2

      Σ 1/(k log k) = ∞   → Condition 1: SATISFIED (integral test:
                             ∫ 1/(x ln x) dx = ln(ln x) → ∞)
      Σ 1/(k log k)² < ∞  → Condition 2: SATISFIED
      VERDICT: CONVERGES. Though slow, both conditions are met.

  TRAP: Students often assume any α_k → 0 implies convergence. Case (c)
  shows this is false — the rate of decay matters.

  Source: Book §2.4 p.39, Eq. 2.7.

--------------------------------------------------------------------------------

### NEW Q3 [5 Marks] — UCB Exploration Parameter c

  In the UCB action selection formula:

      A_t = argmax_a [ Q_t(a) + c * sqrt(ln(t) / N_t(a)) ]

  (i)  What happens to the agent's behavior as c → 0? As c → ∞?
  (ii) Suppose at time t = 100, action a* has been selected 80 times
       (Q_100(a*) = 7.5) and action a has been selected 5 times
       (Q_100(a) = 7.0). With c = 2, compute A_100 (which action is
       selected at t = 101)?

  SOLUTION:

  (i) As c → 0:

      The uncertainty term vanishes. UCB collapses to pure greedy:
          A_t = argmax_a Q_t(a)
      The agent exploits only. No exploration occurs. Risk: sub-optimal
      arm locked in if initial estimates are misleading.

    As c → ∞:

      The uncertainty term dominates. The agent explores maximally,
      always preferring the least-tried action regardless of estimated
      value. In the limit, becomes round-robin (uniform exploration).
      Long-run reward is poor because exploitation is neglected.

  (ii) Compute UCB scores at t = 100 (evaluating for t+1 = 101):

    For a*:
      UCB(a*) = Q(a*) + c * sqrt(ln(100) / N(a*))
             = 7.5 + 2 * sqrt(4.605 / 80)
             = 7.5 + 2 * sqrt(0.05756)
             = 7.5 + 2 * 0.2399
             = 7.5 + 0.4798
             = 7.980

    For a:
      UCB(a) = Q(a) + c * sqrt(ln(100) / N(a))
             = 7.0 + 2 * sqrt(4.605 / 5)
             = 7.0 + 2 * sqrt(0.921)
             = 7.0 + 2 * 0.9597
             = 7.0 + 1.9194
             = 8.919

    Since UCB(a) = 8.919 > UCB(a*) = 7.980, the agent selects action a
    despite its lower estimated value.

  KEY INSIGHT: UCB proactively selects the less-explored action because
  its uncertainty bound is much larger. This is the "optimism in the face
  of uncertainty" principle.

  Source: Book §2.6 p.41, Eq. 2.8.

--------------------------------------------------------------------------------

### NEW Q4 [5 Marks] — Episodic vs. Continuing Tasks

  For each scenario below, classify the task as EPISODIC or CONTINUING.
  For episodic tasks, identify the terminal state. For continuing tasks,
  specify whether γ < 1 is required and why.

    (a) A robot learns to navigate a maze. It receives reward +1 upon
        exit, 0 otherwise. It is reset after each exit.

    (b) A thermostat control system that runs indefinitely to maintain
        room temperature at 22°C.

    (c) A chess-playing agent. It receives +1 for win, -1 for loss, 0
        for draw.

    (d) A stock trading agent that executes trades every second,
        indefinitely, to maximize portfolio value.

  SOLUTION:

  (a) EPISODIC
      Terminal state: Robot reaches maze exit.
      Episode: One maze traversal. Reset to start after each exit.
      Return: G_t = Σ_{k=0}^{T-t-1} R_{t+k+1} (finite sum, Eq. 3.1)
      γ = 1 is permissible since T < ∞.

  (b) CONTINUING
      No natural terminal state. System runs indefinitely.
      γ < 1 is REQUIRED to ensure the infinite sum G_t = Σ γ^k R_{t+k+1}
      converges (Eq. 3.2). Without discounting, returns diverge if rewards
      are consistently non-zero.

  (c) EPISODIC
      Terminal state: Game ends (checkmate, draw, or resignation).
      Each game is one episode. Standard in game-playing RL.
      Returns: sum of rewards until terminal state.

  (d) CONTINUING
      No terminal state; interaction is indefinite.
      γ < 1 required. Reflects the economic intuition that near-term
      profits are valued more than distant ones.

  TRAP: Students classify chess as "continuing" because tournaments go on.
  The KEY is whether any single instance of agent-environment interaction
  has a natural end. A chess GAME has a terminal state; the tournament
  is external context.

  Source: Book §3.3 p.59-60.

--------------------------------------------------------------------------------

### NEW Q5 [5 Marks] — Bellman Equation Numerical Verification

  Consider a simple 3-state MDP with states {A, B, C}. State C is terminal
  (v_π(C) = 0). The agent follows an equiprobable random policy (π = 0.5
  for each action). Transition dynamics and rewards are:

```
  From A: 
    action a1 → state B with p=1.0, reward = +3
    action a2 → state C with p=1.0, reward = +1

  From B:
    action a1 → state A with p=0.5, reward = +2
                state C with p=0.5, reward = 0
    action a2 → state C with p=1.0, reward = +4
```

  With γ = 0.9, use the Bellman equation (3.12) to set up and solve the
  system of equations for v_π(A) and v_π(B).

  SOLUTION:

  The Bellman equation: v_π(s) = Σ_a π(a|s) Σ_{s',r} p(s',r|s,a)[r + γv_π(s')]

  For state A (π(a1|A) = π(a2|A) = 0.5):

    v_π(A) = 0.5 * [1.0 * (3 + 0.9 * v_π(B))]    ← action a1
           + 0.5 * [1.0 * (1 + 0.9 * v_π(C))]    ← action a2
           = 0.5 * (3 + 0.9 v_π(B))
           + 0.5 * (1 + 0.9 * 0)
           = 1.5 + 0.45 v_π(B) + 0.5
           = 2.0 + 0.45 v_π(B)   ... (i)

  For state B (π(a1|B) = π(a2|B) = 0.5):

    v_π(B) = 0.5 * [0.5*(2 + 0.9*v_π(A)) + 0.5*(0 + 0.9*0)]  ← a1
           + 0.5 * [1.0 * (4 + 0.9 * 0)]                       ← a2
           = 0.5 * [0.5*(2 + 0.9 v_π(A))]
           + 0.5 * 4
           = 0.25 * (2 + 0.9 v_π(A)) + 2
           = 0.5 + 0.225 v_π(A) + 2
           = 2.5 + 0.225 v_π(A)   ... (ii)

  Substitute (ii) into (i):

    v_π(A) = 2.0 + 0.45 * (2.5 + 0.225 v_π(A))
           = 2.0 + 1.125 + 0.10125 v_π(A)
           = 3.125 + 0.10125 v_π(A)

    v_π(A)(1 - 0.10125) = 3.125
    v_π(A) * 0.89875 = 3.125
    v_π(A) = 3.125 / 0.89875 ≈ 3.477

  From (ii):
    v_π(B) = 2.5 + 0.225 * 3.477
           = 2.5 + 0.782
           ≈ 3.282

  ANSWERS: v_π(A) ≈ 3.48,  v_π(B) ≈ 3.28

  Source: Book §3.7 p.70-72, Eq. 3.12.

================================================================================

## CATEGORY B: 2-MARK QUESTIONS (Pattern: Definition + one-line justification)

--------------------------------------------------------------------------------

### NEW Q6 [2 Marks] — State the UCB formula and define each term.

  SOLUTION:

      A_t = argmax_a [ Q_t(a) + c * sqrt(ln(t) / N_t(a)) ]

    Q_t(a)   : Estimated action value at time t (exploitation term).
    c        : Exploration parameter. Controls confidence interval width.
    ln(t)    : Natural log of total steps taken.
    N_t(a)   : Number of times action a has been selected up to time t.
    sqrt(...) : Uncertainty/variance estimate for action a's value.

  The formula balances exploitation (Q_t) with directed exploration
  (uncertainty term grows for infrequently tried actions).

--------------------------------------------------------------------------------

### NEW Q7 [2 Marks] — What is the Markov Property? Give one example.

  SOLUTION:

  A state signal S_t has the Markov property if and only if:

      p(s', r | s, a) = Pr{R_{t+1}=r, S_{t+1}=s' | S_t, A_t}

  i.e., the future is independent of the past GIVEN the present state.
  The complete history provides no additional predictive power beyond S_t.

  Example: The position and velocity of a cannonball at time t is a
  Markov state — it completely predicts future trajectory regardless of
  how the cannonball was launched (§3.5, p.64).

  Non-example: A card player's hand in draw poker is NOT Markov without
  including observed bets, discards, and opponent behavior (§3.5, p.66).

--------------------------------------------------------------------------------

### NEW Q8 [2 Marks] — Distinguish v*(s) from v_π(s).

  SOLUTION:

  v_π(s):  Expected return starting from s, following policy π thereafter.

      v_π(s) = E_π[G_t | S_t = s]

  v*(s):  The MAXIMUM possible expected return from s over ALL policies.

      v*(s) = max_π v_π(s)

  Key distinction: v_π is policy-specific. v* is policy-independent —
  it is the value achieved by the OPTIMAL policy π*.

  A greedy policy with respect to v* is always an optimal policy (§3.8).

--------------------------------------------------------------------------------

### NEW Q9 [2 Marks] — Incremental Update Rule

  Write the incremental update rule for action-value estimation and
  explain the role of the "error" term.

  SOLUTION:

  From Eq. 2.3:

      Q_{k+1} = Q_k + (1/k) [R_k - Q_k]

  General form (Eq. 2.4):

      NewEstimate ← OldEstimate + StepSize * [Target - OldEstimate]

  The term [R_k - Q_k] is the PREDICTION ERROR — the difference between
  the observed reward and the current estimate. The update moves Q toward
  R_k by a fraction (1/k) of the error. When R_k > Q_k, the estimate
  increases; when R_k < Q_k, it decreases.

--------------------------------------------------------------------------------

### NEW Q10 [2 Marks] — Discount Factor and Myopia

  An agent is trained with γ = 0. Describe its behavior and identify one
  real-world scenario where this would be appropriate.

  SOLUTION:

  With γ = 0 (Eq. 3.2):

      G_t = Σ_{k=0}^∞ γ^k R_{t+k+1} = R_{t+1}

  The agent is MYOPIC — it only maximizes the immediate next reward,
  completely ignoring all future rewards. It takes the locally greedy
  action at every step.

  Appropriate scenario: Real-time bidding in online advertising, where
  each ad impression decision must be made in milliseconds, future
  impressions are independent, and only the immediate click probability
  matters.

  TRAP: Students say "γ = 0 means no learning." This is wrong. The agent
  still learns — it just learns to maximize immediate rewards only.

================================================================================

## CATEGORY C: 15-MARK QUESTION (Pattern: MDP Formulation Design)

--------------------------------------------------------------------------------

### NEW Q11 [15 Marks] — Hospital Bed Management as MDP

  A hospital manages ICU beds. At any given time, the ICU has 0, 1, or 2
  patients (maximum capacity = 2). Each day, with probability p = 0.6, a
  new patient arrives requiring ICU admission. If an arriving patient cannot
  be admitted (ICU full), the hospital incurs a critical care penalty of
  Rs. P. Each admitted patient generates Rs. R in daily revenue. The hospital
  can take one action per day: "prepare" (make a free bed available by early
  discharge, cost Rs. C) or "wait" (take no action). Assume a discharged
  patient always recovers and counts as 0 occupancy contribution.

  Formulate this as a finite MDP. Define:
    (a) State space S
    (b) Action space A(s) for each state
    (c) Reward function with justification
    (d) Transition probability matrix (complete)
    (e) Suitable discount factor with justification

  SOLUTION:

  (a) STATE SPACE:

      S = {0, 1, 2}  representing current ICU occupancy.

      State 0: No patients
      State 1: One patient
      State 2: Two patients (at capacity)

  (b) ACTION SPACE:

      A(0) = {wait}             [no one to discharge]
      A(1) = {wait, prepare}    [can discharge 1 patient]
      A(2) = {wait, prepare}    [must prepare if admission expected]

      Note: "prepare" in state 0 is meaningless (no patient to discharge),
      so it is excluded. This mirrors the recycling robot where "recharge"
      is excluded from the "high battery" state (Table 3.1, p.69).

  (c) REWARD FUNCTION:

      Revenue from existing patients (per day):
        R * (current occupancy after action)

      Arrival event (Bernoulli, p = 0.6):
        If patient arrives AND bed available: +R (admitted, adds revenue)
        If patient arrives AND no bed: -P (penalty)
        If no patient arrives: 0

      Prepare action cost: -C (paid when prepare is chosen)

      Combined reward is computed as EXPECTED reward per transition.

  (d) TRANSITION PROBABILITY MATRIX:

  Let p = 0.6 (arrival probability), q = 1 - p = 0.4.

  Notation: s = current state, a = action, s' = next state.

```
  ╔══════╦═════════╦════════╦═══════╦══════════════════════════╗
  ║  s   ║    a    ║   s'   ║  p(.) ║         Reward           ║
  ╠══════╬═════════╬════════╬═══════╬══════════════════════════╣
  ║  0   ║  wait   ║   1    ║  0.6  ║  +R (arrival, admitted)  ║
  ║  0   ║  wait   ║   0    ║  0.4  ║   0 (no arrival)         ║
  ╠══════╬═════════╬════════╬═══════╬══════════════════════════╣
  ║  1   ║  wait   ║   2    ║  0.6  ║  +R (arrival, admitted)  ║
  ║  1   ║  wait   ║   1    ║  0.4  ║   0 (no arrival)         ║
  ║  1   ║ prepare ║   1    ║  0.6  ║  -C+R (cost - arrival)   ║
  ║  1   ║ prepare ║   0    ║  0.4  ║  -C   (cost, no arrival) ║
  ╠══════╬═════════╬════════╬═══════╬══════════════════════════╣
  ║  2   ║  wait   ║   2    ║  0.6  ║  -P (penalty, no bed)    ║
  ║  2   ║  wait   ║   2    ║  0.4  ║   0 (no arrival)         ║
  ║  2   ║ prepare ║   2    ║  0.6  ║  -C+R (freed+arrival)    ║
  ║  2   ║ prepare ║   1    ║  0.4  ║  -C (freed, no arrival)  ║
  ╚══════╩═════════╩════════╩═══════╩══════════════════════════╝
```

  ASCII Transition Diagram:

```
                         p=0.6, +R                p=0.6, -P
                        ┌──────────────────────┐  ┌────────┐
                        │                      │  │        │
  [State 0] ──wait──>   │  [State 1] ──wait──> │  [State 2]
      │       p=0.4,0   │      │     p=0.4,0   │     │
      └────────────────>┘      │     ──────────┘     │ wait
                               │                     │ p=0.4, 0
                               │ prepare             └──────> [State 2]
                               │ p=0.6,-C+R
                               └──────────────────> [State 1]
                                 p=0.4, -C
                                 └──────────────────> [State 0]

  [State 2] ──prepare──> [State 2] p=0.6, -C+R (freed bed fills)
                          [State 1] p=0.4, -C   (freed, no arrival)
```

  (e) DISCOUNT FACTOR JUSTIFICATION:

      γ should be close to 1 (e.g., 0.95-0.99) because:

      1. Hospital ICU management is a CONTINUING task (no natural terminal
         state). γ < 1 is required to ensure the return converges.

      2. ICU decisions have long-term consequences — a bed decision today
         affects capacity for weeks. A high γ ensures the agent considers
         future admission capacity, not just today's revenue.

      3. Low γ (e.g., 0.5) would make the agent myopic — it would avoid
         preparing beds because the -C immediate cost outweighs unseen
         future benefits of having capacity.

      γ = 0.95 is a reasonable choice: future rewards ~20 steps ahead still
      carry 0.95^20 ≈ 36% weight.

  Source Template: Recycling Robot (Book §3.6-3.7, Table 3.1, p.68-69).

================================================================================

# APPENDIX: KEY FORMULAE REFERENCE SHEET

--------------------------------------------------------------------------------

## A. Bandit Algorithms

  Sample Average:
      Q_t(a) = (R_1 + R_2 + ... + R_{N_t(a)}) / N_t(a)

  Incremental Update (stationary):
      Q_{k+1} = Q_k + (1/k)[R_k - Q_k]

  Incremental Update (non-stationary, constant α):
      Q_{k+1} = Q_k + α[R_k - Q_k],  α ∈ (0, 1]

  ε-Greedy Action Selection:
      A_t = argmax_a Q_t(a)  with prob (1 - ε)
      A_t = uniform random   with prob ε

  UCB Action Selection:
      A_t = argmax_a [ Q_t(a) + c * sqrt(ln(t) / N_t(a)) ]

  Convergence Conditions for {α_k}:
      Σ α_k = ∞    AND    Σ α_k² < ∞

## B. MDP Core

  State-Value Function:
      v_π(s) = E_π[G_t | S_t = s]
             = E_π[Σ_{k=0}^∞ γ^k R_{t+k+1} | S_t = s]

  Action-Value Function:
      q_π(s,a) = E_π[G_t | S_t = s, A_t = a]

  Bellman Equation for v_π (Eq. 3.12):
      v_π(s) = Σ_a π(a|s) Σ_{s',r} p(s',r|s,a) [r + γ v_π(s')]

  Bellman Optimality for v* (Eq. 3.17):
      v*(s) = max_{a∈A(s)} Σ_{s',r} p(s',r|s,a) [r + γ v*(s')]

  Bellman Optimality for q* (p.76):
      q*(s,a) = Σ_{s',r} p(s',r|s,a) [r + γ max_{a'} q*(s',a')]

  Optimal Policy (from v*):
      π*(s) = argmax_{a∈A(s)} Σ_{s',r} p(s',r|s,a) [r + γ v*(s')]

  Discounted Return (Eq. 3.2):
      G_t = Σ_{k=0}^∞ γ^k R_{t+k+1},  0 ≤ γ ≤ 1

## C. Dynamics Model

  Full MDP dynamics: p(s', r | s, a) = Pr{S_{t+1}=s', R_{t+1}=r | S_t=s, A_t=a}

  Expected reward:   r(s,a) = Σ_r r Σ_{s'} p(s',r|s,a)

  Transition prob:   p(s'|s,a) = Σ_r p(s',r|s,a)

================================================================================
# END OF DOCUMENT
# Generated from: midsem.pdf (Sutton & Barto Ch.2-3) + RL_Midterm_QP_answer_key.pdf
# External Logic used: Q3 policy iteration pseudocode (Ch.4 not in provided PDF)
================================================================================
