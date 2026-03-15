# Upper Confidence Bound Action Selection

---

## Value Estimation

At the t-th time step, action `a` has been chosen `N_a(t)` times prior to `t`,
yielding rewards R_1, R_2, ..., R_{N_t(a)}.

Its value is estimated as the sample average:

```
        R_1 + R_2 + ... + R_{N_t(a)}
Q_t(a) = --------------------------------
                  N_t(a)
```

---

## Greedy Action

The greedy action at time `t` is:

```
A_t = argmax  Q_t(a)
         a
```

However, estimates of action values are uncertain. It would be better to
select among the non-greedy actions according to their potential for
actually being optimal — taking into account:

- how close their estimates are to being maximal
- the uncertainty in those estimates

---

## UCB Action Selection Rule

One effective way to do this is the UCB formula:

```
A_t = argmax  [  Q_t(a)  + c * sqrt( ln(t) / N_a(a) ) ]
         a     |________| |_________________________|
               estimated          uncertainty
                 value              bonus
```

Where:

- `t`       = current time step
- `N_a(a)`  = number of times action `a` was selected prior to `t`
- `c`       = confidence level (controls degree of exploration)

> **Note:** If `N_t(a) = 0`, then `a` is considered a maximizing action.

---
