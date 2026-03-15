# RL Formulae Sheet: CSD366

This guide provides a structured overview of the mathematical foundations for
Reinforcement Learning, specifically tailored for TUI-based readers like `glow`
or `neovim`.

---

## 1. Bandit Value Estimation

Equations for estimating action values in multi-armed bandit problems.

### Simple Average (Stationary)
Used when reward distributions do not change over time.


```

```
     R_1 + R_2 + ... + R_N_t(a)

```

Q_t(a) = ----------------------------
N_t(a)

```

- `Q_t(a)`: Estimated value of action `a` at time `t`.
- `N_t(a)`: Number of times action `a` has been selected.
- `R_i`: Reward received on the i-th selection.

### Incremental Update Rule
Memory-efficient version of the sample average.


```

Q_k+1 = Q_k + (1/k) * [R_k - Q_k]

```

- `(R_k - Q_k)`: The error (Target - Old Estimate).
- `1/k`: Step size that weights all rewards equally.

### Constant Step-Size (Nonstationary)
Used when reward distributions drift over time.


```

Q_k+1 = Q_k + alpha * [R_k - Q_k]

```

- `alpha`: Constant in (0, 1].
- Result: Exponentially recency-weighted average.

---

## 2. Action Selection Strategies

### Epsilon-Greedy
Balances exploration and exploitation probabilistically.

- **With probability 1 - e:** Select `argmax Q_t(a)` (Exploit).
- **With probability e:** Select random action (Explore).

### Optimistic Initial Values
Forces systematic exploration in stationary problems.

- **Setting:** `Q_1(a) >> max possible reward`.
- **Effect:** Every arm is tried at least once as estimates fall.

---

## 3. The Bellman Equation

The fundamental recursive definition of the value function.




```

V^pi(s) = R(s) + gamma * SUM_s' P_{s,pi(s)}(s') * V^pi(s')

```

### Variable Definitions
- `V^pi(s)`: Expected discounted return from state `s` under policy `pi`.
- `R(s)`: Immediate reward in state `s`.
- `gamma`: Discount factor in [0, 1].
- `P_{s,pi(s)}(s')`: Transition probability to `s'` under action `pi(s)`.
- `V^pi(s')`: Value of the successor state.

---

## 4. Policy Iteration

Iterative approach to finding the optimal policy.

### Policy Improvement Step
Update the policy to be greedy with respect to the current value function.


```

pi(s) = argmax_a SUM_s' P_sa(s') * V(s')

```

### Algorithm Flow
1. **Initialise:** `pi` randomly.
2. **Evaluate:** Solve the Bellman system for `V^pi`.
3. **Improve:** Update `pi` using the `argmax` rule above.
4. **Loop:** Repeat until `pi` no longer changes.

---

## 5. MDP Formulation (SARTD)

Every RL problem must define these five components:

- **States (S):** Minimal information needed for a decision.
- **Actions (A):** Decisions the agent controls.
- **Rewards (R):** Feedback signals (+ for success, - for failure).
- **Transitions (P):** Probabilities `P(s' | s, a)`.
- **Discount (gamma):** Weight of future rewards (1 = patient, 0 = myopic).


