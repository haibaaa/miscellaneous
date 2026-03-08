# Reinforcement Learning Exam Study Guide

Subject: CSD366 — Introduction to Reinforcement Learning
Based on: Sutton & Berto Chapter 2 + Mid-Semester Paper (March 2024)

---

## Exam Pattern Analysis

From the past paper, the examiner tests three distinct skill types:

- **Reasoning about bandit settings** — deterministic vs stochastic rewards,
  choosing the right method given constraints (Q1, Q2).
- **Mathematical formulation** — stating equations precisely and explaining
  them in English (Q3 Bellman).
- **RL problem formulation** — converting real-world problems into the MDP
  framework with full justification (Q4 — 15 marks, the heaviest question).

> Half the paper (15/30 marks) is the formulation question. Master that
> structure first.

Common traps to avoid:

- Confusing deterministic and stochastic reward settings.
- Forgetting to justify why epsilon-greedy keeps wasting pulls long-term.
- Writing the Bellman equation without explaining each variable.
- In formulation questions, omitting transition probabilities or discount
  factor justification.

---

## 1. Core Concepts

### Evaluative Feedback

- **Definition:** Feedback that tells you how good your action was, but not
  whether it was the best or worst possible.
- **Intuition:** A score of 8/10 tells you something, but not whether 10/10
  was achievable.
- **Exam relevance:** Distinguishes RL from supervised learning. Appears as
  context-setter in bandit questions.

### Exploration vs. Exploitation

- **Exploitation** — select the action with the highest current estimate.
- **Exploration** — try a non-greedy action to gather information.
- **Key insight:** Greedy is optimal per step, but exploration can yield
  higher cumulative reward.
- **Exam relevance:** Core of Q1, Q2, and method comparison questions.

```
                  +-------------------+
                  |   Select Action   |
                  +-------------------+
                     /             \
          greedy   /                 \ non-greedy (with prob e)
                  v                   v
             [Exploit]                [Explore]
                   \                 /
                    v               v
                  +------------------+
                  |  Observe Reward  |
                  +------------------+
                         |
                         v
                     [Update Q(a)]
```

### Stationary vs. Nonstationary Problems

- **Stationary** — reward distributions do not change over time.
  Use step size `1/k` (sample average).
- **Nonstationary** — reward distributions drift over time.
  Use constant `alpha` to weight recent rewards more.
- **Exam relevance:** Affects which algorithm to recommend and why.

---

## 2. Multi-Armed Bandits

### Action-Value Estimation

Each action `a` has a true value `q(a)` which is unknown. We estimate it:

```
         R_1 + R_2 + ... + R_N_t(a)
Q_t(a) = ----------------------------
                  N_t(a)
```

- `Q_t(a)` — estimated value of action `a` at time `t`
- `N_t(a)` — number of times action `a` has been selected
- `R_i`    — reward received on the i-th selection of `a`
- As `N_t(a) -> inf`, `Q_t(a) -> q(a)` by the Law of Large Numbers.

### Greedy Selection

```
A_t = argmax Q_t(a)
         a
```

Selects the action with the highest current estimate at every step.

### Epsilon-Greedy

- With probability `1 - epsilon`: exploit (select argmax).
- With probability `epsilon`: explore (select random action).
- **Long-term cost:** epsilon-greedy always wastes `epsilon` fraction of
  pulls on random exploration, even after the optimal arm is identified.
- In a **deterministic** reward setting, this is strictly suboptimal
  compared to pure greedy with optimistic initialisation.

### Incremental Update Rule

Avoids storing all past rewards by computing the running estimate:

```
Q_k+1 = Q_k + (1/k) * [R_k - Q_k]
```

General form:

```
+--------------------------------------------------+
| New Estimate = Old Estimate                      |
|             + StepSize * [Target - Old Estimate] |
+--------------------------------------------------+
```

- `[R_k - Q_k]` is the **error** — how wrong the old estimate was.
- Step size `1/k` gives equal weight to all past rewards (stationary).

### Constant Step-Size (Nonstationary)

```
Q_k+1 = Q_k + alpha * [R_k - Q_k]     alpha in (0, 1], constant
```

Expanding this recurrence produces a weighted average:

```
         K                K
Q_k+1 = (1-a)^K * Q_1 + SUM  a*(1-a)^(K-i) * R_i
                         i=1
```

Older rewards receive weight `(1-a)^(K-i)` — exponentially smaller.
This is called an **exponentially recency-weighted average**.

### Optimistic Initial Values

Setting `Q_1(a)` to a value higher than any realistic reward forces the
agent to explore all arms before settling on the greedy choice.

- **Low initial value** — agent may latch onto first rewarding action.
- **High initial value** — every arm looks worse than expected at first,
  forcing exploration of all arms.

```
[Set Q_1 >> max possible reward]
      |
      v
[All arms appear suboptimal after first pull]
      |
      v
[Agent forced to try every arm]
      |
      v
[Estimates converge toward true q(a)]
      |
      v
[Greedy selection becomes optimal]
```

> Only works for stationary problems. If rewards drift, the initial
> optimism becomes irrelevant quickly.

---

## 3. Key Algorithms

### Algorithm 1 — Epsilon-Greedy

**Idea:** Balance exploration and exploitation probabilistically.

```
[Initialise Q(a) = 0 for all a]
          |
          v
[Generate random number r in (0,1)]
          |
     +----+----+
     |         |
  r > e      r <= e
     |         |
     v         v
[Exploit:   [Explore:
 A=argmax Q] A=random]
     |         |
     +----+----+
          |
          v
  [Observe reward R]
          |
          v
  [Update Q(A) incrementally]
          |
          v
  [Repeat for T steps]
```

**Exam tips:**

- For stochastic rewards, small epsilon works better long-term than
  large epsilon.
- For deterministic rewards, epsilon-greedy always suboptimal long-term.
- State which type of reward setting you are assuming in your answer.

### Algorithm 2 — Greedy with Optimistic Initialisation

**Idea:** Set initial estimates high to force systematic exploration.

```
[Set Q_1(a) = V_high for all a]   (V_high > max possible reward)
          |
          v
[Always select A = argmax Q(a)]
          |
          v
[Observed reward < Q estimate => update pulls estimate down]
          |
          v
[Arm now looks worse => agent tries another arm]
          |
          v
[All arms explored at least once]
          |
          v
[Greedy settles on true best arm]
```

**Exam tips:**

- For deterministic rewards in range (0, 20): set initial estimate to
  40. This guarantees every arm is tried exactly once.
- Then greedy selects the best arm forever — zero wasted steps.
- This beats epsilon-greedy for deterministic settings.

### Algorithm 3 — Policy Iteration

**Idea:** Alternate between evaluating a policy and improving it until
no further improvement is possible.

```
[Initialise policy pi randomly]
          |
          v
[Policy Evaluation: compute V^pi]
  solve: V^pi(s) = R(s) + gamma * SUM P(s'|s,pi(s)) V^pi(s')
          |
          v
[Policy Improvement: for each state s]
  pi(s) = argmax_a SUM_s' P_sa(s') V(s')
          |
          v
  [Policy changed?]
     |          |
    yes         no
     |          v
     +------> [Optimal Policy pi*]
     |
     v
[Return to Policy Evaluation]
```

**Exam tips:**

- State the Bellman equation before describing policy evaluation.
- Step 3 (line 4 in the pseudocode) uses the current `V`, not `V^pi`
  of the new policy — this is key to why it converges.
- Policy iteration always converges for finite MDPs.

---

## 4. Important Equations

### Action-Value Estimate

```
         R_1 + R_2 + ... + R_N_t(a)
Q_t(a) = ----------------------------
                  N_t(a)
```

- `Q_t(a)`: estimated value of action `a` at step `t`
- `N_t(a)`: count of how many times `a` has been selected
- Converges to `q(a)` as count grows (Law of Large Numbers)
- Exam use: derive or cite when justifying arm selection strategies

### Incremental Update Rule

```
Q_k+1 = Q_k + (1/k) * (R_k - Q_k)
```

- Equivalent to sample average but memory-efficient
- `(R_k - Q_k)` is the TD-style error
- Exam use: derive from the averaging formula step-by-step

### Bellman Equation

```
V^pi(s) = R(s) + gamma * SUM_s' P_{s,pi(s)}(s') * V^pi(s')
```

Variable meanings:

- `V^pi(s)`         — expected discounted return from state `s` under `pi`
- `R(s)`            — immediate reward in state `s`
- `gamma`           — discount factor in [0, 1]
- `P_{s,pi(s)}(s')` — probability of transitioning to `s'` from `s`
                       under action `pi(s)`
- `V^pi(s')`        — value of successor state `s'`

Intuition: value now = immediate reward + discounted expected future value.

### Policy Improvement Step

```
pi(s) := argmax_a  SUM_s'  P_sa(s') * V(s')
```

- For each state, pick the action that maximises expected next-state value.
- `P_sa(s')` — probability of reaching `s'` from `s` under action `a`

---

## 5. RL Problem Formulation

This is the highest-value skill in the exam (15 marks in Q4).

Every real-world RL formulation must define these five components:

```
[Real World Problem]
      |
      v
+---------------------+
| States              |  What situation the agent can be in
+---------------------+
      |
      v
+---------------------+
| Actions             |  What the agent can do in each state
+---------------------+
      |
      v
+---------------------+
| Rewards             |  Signal for desirable/undesirable outcomes
+---------------------+
      |
      v
+---------------------+
| Transition Probs    |  P(s' | s, a) for each (s, a, s') triple
+---------------------+
      |
      v
+---------------------+
| Discount Factor     |  gamma: how much to weight future rewards
+---------------------+
```

### How to Define Each Component

**States:**

- Identify the minimal information needed to make a decision.
- In the inventory problem: stock level {0, 1, 2}.

**Actions:**

- The decisions the agent controls.
- In the inventory problem: {do nothing, restock}.

**Rewards:**

- Positive for desired outcomes (sales), negative for failures
  (stockout, excess cost).
- In the inventory problem: +S for a sale, -X for lost goodwill.

**Transition Probabilities:**

- Derived from the domain's stochastic model.
- In inventory: sales follow Bernoulli(p=0.7).

**Discount Factor:**

- `gamma` close to 1: patient agent, long-term planning.
- `gamma` close to 0: myopic agent, focuses on immediate reward.
- Justify based on domain: high demand/many samples -> high gamma.

### Inventory Problem Worked Solution

States: {0, 1, 2} — current stock level

Actions: {none, restock}

Rewards:
- Sale occurs: +S (profit)
- Customer arrives, stock = 0: -X (lost goodwill)
- No customer: 0

Transition probabilities (p = 0.7 = P(sale)):

```
State  Action   Next  Probability   Reward
  0    none       0    0.7 (sale)    -X
  0    none       0    0.3           0
  0    restock    1    0.3           0
  1    none       0    0.7 (sale)    +S
  1    none       1    0.3           0
  1    restock    2    0.3           0
  2    none       1    0.7 (sale)    +S
  2    none       2    0.3           0
```

Discount factor: high gamma if demand is frequent (enough data to
learn); lower gamma if demand is sparse or environment shifts quickly.

---

## 6. Exam Answer Templates

### Template A — Bandit Reasoning Question

Use this structure for Q1/Q2-style questions.

```
1. Identify reward type: deterministic or stochastic?

2. State implication:
   - Deterministic: each arm needs exactly one pull to know its value.
   - Stochastic: multiple pulls needed to estimate true value.

3. Evaluate each method option:
   - epsilon-greedy: keeps exploring even after best arm is found.
     Long-term cost = epsilon * T wasted steps.
   - Greedy (Q_0 = 0): may never explore suboptimal-looking arms.
   - Greedy (Q_0 = high): forces full exploration then settles.

4. Conclude: state the best method and why it dominates.
```

Example opening sentence:
"Since the rewards are deterministic, each arm needs to be pulled only
once. Therefore, [method X] is optimal because..."

### Template B — Bellman Equation Question

```
1. State the equation:
   V^pi(s) = R(s) + gamma * SUM_s' P_{s,pi(s)}(s') V^pi(s')

2. Define all variables (one sentence each).

3. Explain the two-term structure:
   - First term: immediate reward R(s)
   - Second term: expected discounted future return

4. Conclude: state that this forms a linear system solvable for V^pi.
```

### Template C — Policy Iteration Question

```
1. State Bellman equation (see Template B).

2. Describe the algorithm:
   Step 1: Initialise pi randomly.
   Step 2: Policy Evaluation — compute V^pi by solving Bellman eqs.
   Step 3: Policy Improvement:
     pi(s) = argmax_a SUM_s' P_sa(s') V(s')
   Step 4: If policy changed, return to Step 2. Else stop.

3. State convergence guarantee:
   Policy iteration converges to pi* in finite MDPs.
```

### Template D — RL Formulation Question

```
1. Define states (with justification).
2. Define actions (with justification).
3. Define reward function (positive/negative signals + values).
4. Write transition probability table or matrix.
5. State and justify discount factor choice.
6. Optional: comment on optimality criterion.
```

> For a 15-mark formulation question, spend roughly 3 marks per
> component. Each must include justification, not just a label.

---

## 7. Practice Questions

### Q1 — Bandit Reasoning (5 marks)

You have a 5-armed bandit where each arm's reward follows a Gaussian
distribution with unknown mean and variance 1. You run epsilon-greedy
with epsilon = 0.2 for 500 steps. After that, you switch to pure greedy.

- (a) Will the agent have identified the best arm with high confidence
  by step 500? Justify.
- (b) Is switching to pure greedy after step 500 a good strategy?
  Why or why not?

**Model answer:**

(a) Yes, with high confidence. Each arm will have been pulled
approximately `0.2 * 500 / 5 = 20` times on average. By the Law of
Large Numbers, `Q(a)` converges to `q(a)` as pulls increase. 20 pulls
per arm is generally sufficient for Gaussian rewards with variance 1,
since the standard error = `1/sqrt(20) ≈ 0.22` — small relative to
typical differences in arm means.

(b) Yes, this is a reasonable annealed strategy. After sufficient
exploration, the estimates are accurate, so pure greedy exploits the
best-known arm optimally. This is the intuition behind epsilon-decreasing
schedules, which asymptotically achieve zero regret.

### Q2 — Bandit Reasoning (5 marks)

In a 15-armed bandit with stochastic rewards in the range (0, 10),
compare epsilon-greedy (epsilon = 0.05) vs. greedy with `Q_0 = 15` over
10,000 steps.

- (a) Which accumulates more reward initially (first 100 steps)?
- (b) Which accumulates more reward in the long run?

**Model answer:**

(a) Initially, greedy with `Q_0 = 15` explores all 15 arms
systematically (one by one), as each observed reward falls below the
initial estimate. This may appear cautious early on. Epsilon-greedy
starts exploiting quickly (95% of steps greedy from step 1), but with
unreliable estimates, it may latch onto a suboptimal arm. Neither has
a clear absolute advantage in the first 100 steps.

(b) In the long run (10,000 steps), epsilon-greedy with `e = 0.05`
wastes 5% of all steps on random exploration forever — that is 500
wasted steps. Greedy with `Q_0 = 15` completes exploration in exactly
15 steps (one per arm), then exploits optimally for 9,985 steps. For
stochastic rewards, however, occasional re-exploration may be needed
since estimates can be noisy. Optimistic initialisation does not
re-explore once settled, which is a risk for stochastic settings. In
practice, for near-deterministic stochastic rewards, `Q_0 = 15` wins.

### Q3 — Bellman Equation (5 marks)

State the Bellman equation for a fixed policy pi. Explain what each
term represents and derive how the policy evaluation step of policy
iteration uses it to compute `V^pi`.

**Model answer:**

For a fixed policy `pi`, the value function satisfies:

```
V^pi(s) = R(s) + gamma * SUM_s' P_{s,pi(s)}(s') * V^pi(s')
```

- `V^pi(s)`: expected sum of discounted rewards starting from `s`.
- `R(s)`: immediate reward received upon entering state `s`.
- `gamma`: discount factor in [0, 1], controls patience.
- `P_{s,pi(s)}(s')`: probability of transitioning to `s'` from `s`
  when following policy `pi`.

The first term is the immediate reward. The second is the expected
discounted value of all successor states. Together they express that
the value of a state equals the reward now plus discounted future value.

In policy evaluation, this equation is written for every state `s`,
forming a system of `|S|` linear equations in `|S|` unknowns. Solving
this system (e.g., by a linear solver or iterative methods) gives the
exact `V^pi` for the current policy.

### Q4 — Policy Iteration (5 marks)

Describe the policy iteration algorithm. State when it terminates and
why it is guaranteed to converge.

**Model answer:**

```
1. Initialise pi randomly.
2. Repeat until convergence:
   a. Policy Evaluation:
      Compute V^pi by solving the Bellman equations for current pi.
   b. Policy Improvement:
      For each state s:
        pi(s) = argmax_a  SUM_s'  P_sa(s') * V(s')
3. Return pi as optimal policy.
```

**Termination:** The algorithm terminates when the policy improvement
step produces no changes — i.e., the greedy policy with respect to
`V^pi` is the same as `pi`. At this point, `pi` satisfies the Bellman
optimality conditions and is therefore optimal.

**Convergence guarantee:** The number of deterministic policies for a
finite MDP is finite (`|A|^|S|`). Each iteration either strictly
improves the policy or leaves it unchanged (in which case we stop). So
the algorithm must terminate in a finite number of iterations.

### Q5 — RL Formulation (15 marks)

Formulate the following as an RL problem:

A hospital manages ICU beds. Each day it decides whether to admit or
defer a new patient. The ICU has a maximum of 3 beds. A patient arrives
each day with probability 0.6. Treating a patient earns the hospital
Rs. H in revenue. If the hospital defers a critical patient, it incurs
a penalty of Rs. P for harm caused. Define states, actions, rewards,
transition probabilities, and justify the discount factor.

**Model answer:**

**States:** {0, 1, 2, 3} — number of occupied ICU beds.

**Actions:** {admit, defer} — available when a patient arrives.
When no patient arrives, no action is taken (or action = idle).

**Rewards:**
- Patient admitted and treated: +H
- Patient arrives but deferred: -P
- No patient arrives: 0

**Transition Probabilities** (p = 0.6 = P(arrival)):

```
State  Action  Next  Probability    Reward
  0    idle      0    1.0              0
  1    admit     2    0.6             +H
  1    defer     1    0.6             -P
  1    idle      0    0.4              0
  2    admit     3    0.6             +H
  2    defer     2    0.6             -P
  2    idle      1    0.4              0
  3    defer     3    0.6             -P     (full, must defer)
  3    idle      2    0.4              0
```

When beds = 3 and a patient arrives, only defer is available.

**Discount factor:** Use a high `gamma` (e.g., 0.95) since the hospital
operates continuously over a long horizon and future patient welfare has
real long-term value. A low gamma would encourage short-term revenue
maximisation at the cost of long-term reputation and outcomes.

---

## 8. Final Revision Cheatsheet

### Key Formulas

```
Action-value estimate:
  Q_t(a) = [R_1 + ... + R_N] / N_t(a)

Incremental update (stationary):
  Q_k+1 = Q_k + (1/k)(R_k - Q_k)

Constant step-size (nonstationary):
  Q_k+1 = Q_k + alpha*(R_k - Q_k)

Weighted average expansion:
  Q_k+1 = (1-a)^K * Q_1 + SUM_i a*(1-a)^(K-i) * R_i

Bellman equation:
  V^pi(s) = R(s) + gamma * SUM_s' P_{s,pi(s)}(s') V^pi(s')

Policy improvement:
  pi(s) = argmax_a SUM_s' P_sa(s') V(s')
```

### Algorithm Summaries

Epsilon-greedy:
- Explore with prob `e`, exploit with prob `1-e`.
- Suboptimal for deterministic rewards (wastes `e*T` steps forever).

Greedy + optimistic init:
- Set `Q_0 >> max reward`, always exploit.
- Forces one pass of full exploration, then pure exploitation.
- Best for deterministic rewards.

Policy iteration:
- Alternate: evaluate policy -> improve policy -> repeat.
- Terminates when policy stops changing.
- Guaranteed to find optimal policy for finite MDPs.

### Core Definitions

- **Greedy action:** `argmax_a Q_t(a)`
- **Exploitation:** select greedy action
- **Exploration:** select non-greedy action
- **Stationary problem:** reward distributions fixed over time
- **Nonstationary problem:** reward distributions change over time
- **Discount factor gamma:** weight on future rewards; near 1 = patient

### Common Exam Traps

- Stating "pull each arm once" for stochastic rewards — wrong. Only
  valid for deterministic rewards.
- Recommending epsilon-greedy for deterministic settings — wrong.
  Optimistic initialisation dominates.
- Forgetting to justify the discount factor in formulation questions.
- Writing the Bellman equation without defining `P_{s,pi(s)}(s')`.
- Omitting the transition probability table in formulation questions.
- Confusing step size `1/k` (stationary) with constant `alpha`
  (nonstationary) — they have different convergence properties.

### Quick Recall Mnemonics

- **SARTD** — States, Actions, Rewards, Transitions, Discount
  (5 components of any RL formulation)
- **"Error times stepsize"** — every update rule has this structure
- **"High init = forced tour"** — optimistic init visits all arms once
- **"Eval then improve"** — policy iteration order never reverses

---

*End of Study Guide*
