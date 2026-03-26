# Viva Prep: Foundation of Information Security

**Student:** Samarth Patel — 2310110258
**Course:** CSD356 — Assignment 1, Set-5
**Key Answer:** SECURESECURE (length 12)

---

## Table of Contents

1. Code Walkthrough — `calc_ic` and `chi_squared`
2. Concept Deep-Dive — Kasiski Test vs Index of Coincidence
3. CIA Triad Mastery — Three Complex Real-World Scenarios
4. Mock Viva Questions (10 challenging questions)
5. Plaintext Summary — PCI DSS, HIPAA, FISMA

---

## 1. Code Walkthrough

### Overview of the attack pipeline

```
Ciphertext
    |
    v
[clean_text]        strips non-alpha, uppercases
    |
    v
[calc_ic loop]      tests key lengths 1..20
    |                 splits text into 'keylen' groups
    v                 computes average IC per length
[KEY_LENGTH = 12]   chosen from IC output
    |
    v
[crack_caesar]      runs on each of the 12 groups
    |                 uses chi_squared to find best shift
    v
KEYWORD = SECURESECURE
    |
    v
[decrypt_vigenere]  applies (C - K) mod 26 per character
    |
    v
PLAINTEXT
```

---

### How `calc_ic` works

The **Index of Coincidence (IC)** measures how non-uniform
a frequency distribution is.

**Formula:**

```
IC = SUM [ f_i * (f_i - 1) ] / [ N * (N - 1) ]
```

Where:
- `f_i` = count of letter i in the text
- `N`   = total number of letters

**What the values mean:**

- IC ≈ 0.038 → random/uniform text (pure noise)
- IC ≈ 0.065 → natural English text
- IC ≈ 0.060+ → strong signal of English structure

**In the script:**

```bash
calc_ic() {
    # counts each letter's frequency into freq[]
    # computes: sum of f*(f-1) for all letters
    # divides by N*(N-1) using bc for float math
}
```

The script loops key lengths 1 to 20. For each candidate
length `k`, it splits the ciphertext into `k` groups
(every k-th character goes to the same group).

If `k` is the correct key length, each group is a simple
Caesar-shifted English text, so its IC will be near 0.065.
The script prints a `<- likely` marker when IC > 0.060.

---

### How `chi_squared` works

Once the correct key length (12) is confirmed, each of the
12 character groups is a Caesar cipher. `chi_squared` finds
which shift makes that group look most like English.

**Formula:**

```
X^2 = SUM [ (observed_i - expected_i)^2 / expected_i ]
```

For every letter A–Z:
- `expected_i` = English frequency of that letter × group length
- `observed_i` = actual count in the shifted group

A **lower** chi-squared score = better match to English.

**In the script:**

```bash
chi_squared() {
    # eng_freq[] holds scaled English letter frequencies
    # e.g. E=127, T=91, A=82, ...
    # loops all 26 shifts via crack_caesar()
    # returns the chi2 score for the current arrangement
}

crack_caesar() {
    # tries all 26 shifts (0..25)
    # calls chi_squared on each decrypted attempt
    # returns the shift with the LOWEST chi2 score
}
```

**How they work together:**

```
Group i (Caesar-shifted English)
    |
    v
crack_caesar: tries shift 0..25
    |
    for each shift:
        decrypt group -> call chi_squared -> store score
    |
    v
best shift = lowest chi2 score
    |
    v
key letter = chr(best_shift + 'A')
```

After running this for all 12 groups, the letters combine
to form the keyword SECURESECURE.

---

### Why the key repeats (SECURE × 2)

The script found key length 12 because the IC peaked there.
SECURE has length 6. Since gcd(6,12) = 6, a key of length
6 used with a text where patterns repeat at distance 12
will appear as a length-12 key. This is expected behavior
and does not affect correctness of decryption.

---

## 2. Concept Deep-Dive

### Kasiski Test (assigned method)

**Core idea:** In a Vigenère cipher, if the same plaintext
segment happens to align with the same keyword segment,
it will produce the same ciphertext segment.

**Steps:**

1. Scan the ciphertext for repeated substrings (length ≥ 3).
2. Record the distance between each repeated occurrence.
3. Compute the GCD of all distances.
4. The GCD is the likely key length.

**Example:**

```
Ciphertext: ...XKW...XKW...
Position 1: 45
Position 2: 105
Distance  : 60

Factors of 60: 1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60
Key length candidates: 6 or 12
```

**Limitation:** Repeated sequences can also occur by
coincidence, producing false positives. More repetitions
give more confidence.

---

### Index of Coincidence (your script's method)

**Core idea:** Mathematical — does not rely on finding
repeated sequences. Instead, it measures the statistical
"Englishness" of each sub-sequence for a given key length.

**Comparison:**

```
Property          Kasiski Test         Index of Coincidence
-----------       ------------         --------------------
Approach          pattern search       statistical measure
Input needed      repeated n-grams     any ciphertext length
Output            list of distances    IC score per key len
Works on short    no (needs repeats)   better suited
text?
Susceptible to    yes (coincidences)   less so
false positives?
Used in script?   no (manual step)     yes (automated)
```

**The assignment asks you to do both:**

- Kasiski: manually find repeated trigrams/quadgrams,
  compute distances and their GCD → suggests key length.
- IC: verify computationally that key length 12 gives
  IC ≈ 0.065 per group → confirms the Kasiski result.

> **Viva tip:** Know that Kasiski gives a *candidate* list,
> IC *confirms* one of them. They are complementary.

---

## 3. CIA Triad Mastery

Three scenarios where all three pillars are breached
simultaneously, building on your assignment answers.

---

### Scenario A: Hospital Ransomware Attack

**Setup:** A regional hospital's patient management system
is compromised via a phishing email to a nurse.

**Confidentiality breach:**
Attackers exfiltrate 50,000 patient records (names,
diagnoses, medications) before triggering ransomware.
PHI (Protected Health Information) is now in criminal hands.

**Integrity breach:**
During the lateral movement phase, attackers modify drug
dosage records in the EMR (Electronic Medical Record)
system. They change a patient's insulin dosage entry from
10 units to 100 units. The data now appears legitimate but
is falsified.

**Availability breach:**
Ransomware encrypts the entire EMR database and backup
servers. Doctors cannot access patient histories. The
hospital reverts to paper and cancels non-emergency
procedures for three days.

**Chain reaction:**

```
Phishing email clicked
    |
    v
Credentials stolen       <- Confidentiality breach
    |
    v
Lateral movement + data exfiltration
    |
    v
Record tampering         <- Integrity breach
    |
    v
Ransomware deployed      <- Availability breach
    |
    v
Patient safety risk (all three compound)
```

**CIA mapping:**

- C: stolen credentials → stolen patient data
- I: modified dosage records → risk of patient harm
- A: encrypted EMR → hospital operations halted

---

### Scenario B: BGP Hijacking on a Financial Exchange

**Setup:** An attacker performs a BGP (Border Gateway
Protocol) hijack targeting a stock exchange's IP block.

**Availability breach:**
Legitimate trading traffic is rerouted. The exchange's
order matching engine becomes unreachable for 22 minutes
during peak trading hours. Billions in trades fail.

**Confidentiality breach:**
Traffic flowing through the attacker's network is
intercepted. Institutional traders' pending orders (buy/sell
volumes, price limits) are captured before being rerouted
to the real destination.

**Integrity breach:**
Using knowledge of pending orders (from the sniffed
traffic), the attacker's own trading bots front-run the
market. While no records are modified directly, the
integrity of the market price discovery process is
corrupted — prices no longer reflect fair supply/demand.

**CIA mapping:**

- A: exchange unreachable → trades fail
- C: order data intercepted → confidential strategy leaked
- I: market manipulation → price integrity destroyed

---

### Scenario C: Insider Attack on a University Database

**Setup:** A disgruntled database administrator at a
university misuses their privileged access the night before
grade submission deadlines.

**Integrity breach:**
The admin directly modifies grade records in the university
SIS (Student Information System). Failing grades are
changed to passing, and a rival student's GPA is lowered.

**Confidentiality breach:**
The admin exports the full student database including
Social Security Numbers, financial aid records, and
academic disciplinary history. This data is sold to a
data broker.

**Availability breach:**
To cover their tracks, the admin drops several tables and
corrupts transaction logs. The SIS becomes non-functional
for 36 hours. Grade submission deadline is missed,
affecting financial aid disbursement for 3,000 students.

**CIA mapping:**

- I: grade tampering → academic record corruption
- C: PII export → regulatory breach (FERPA violation)
- A: table drop → system down, deadline missed

---

## 4. Mock Viva Questions

These are the 10 hardest questions a professor might ask.
Answers are included for your preparation.

---

**Q1. Your script uses `bc` for floating point — why not
just use bash arithmetic directly?**

Bash only supports integer arithmetic natively. The IC
formula requires division with decimal precision (e.g.
0.065432). `bc` is a command-line arbitrary-precision
calculator that handles this. Without it, `IC = 0` for
all cases because integer division truncates.

---

**Q2. You hardcoded `KEY_LENGTH=12` after the IC test.
What would break if the IC peak was ambiguous — say,
both 6 and 12 scored above 0.060?**

You would need to try both. Decrypt with key length 6
(finding a 6-letter key) and with key length 12 (finding
a 12-letter key). If the 6-letter key produces valid
plaintext, it is the true key. In this case SECURE (6)
works, and SECURESECURE (12) is just its double — both
produce the same decryption. The correct answer to report
is SECURE.

---

**Q3. Explain line-by-line what `(c_num - k_num + 26) % 26`
computes and why `+26` is necessary.**

```
c_num = position of ciphertext letter (0-25)
k_num = position of key letter (0-25)
```

Vigenère decryption: `p = (c - k) mod 26`

Without `+26`, if `c_num < k_num`, the result is negative.
Bash's modulo of a negative number can return a negative
result (implementation-defined). Adding 26 ensures the
value is always positive before taking mod 26, giving the
correct letter position.

---

**Q4. The Kasiski test is not automated in your script.
If you were to add it, what algorithm would you write?**

```
1. Slide a window of size 3 (trigram) across ciphertext
2. Store each trigram and its position in a hash map
3. For each trigram seen more than once:
   - compute distance = pos2 - pos1
   - store all distances
4. Compute GCD of all distances
5. GCD = candidate key length
```

In bash this is feasible but slow for large texts. A Python
implementation using `math.gcd` would be more practical.

---

**Q5. Your chi-squared uses integer arithmetic for the
diff*diff calculation. Can this cause errors?**

Yes. The line `chi2=$((chi2 + diff * diff * 100 / expected))`
performs integer division. For small group sizes, `expected`
can be 0 or 1, making the result unreliable. The `* 100`
is a scaling factor to reduce precision loss, but for a
more accurate implementation, `bc` or Python's floats
should be used for the entire chi-squared computation.

---

**Q6. What is the Index of Coincidence for a purely
random substitution cipher, and why?**

IC ≈ 1/26 ≈ 0.0385.

If each letter appears with equal probability (1/26), then:

```
IC = 26 × (1/26) × (1/26 - 1/(N))
   → 1/26 ≈ 0.038 as N → ∞
```

English has non-uniform frequencies, so its IC is higher
(≈ 0.065). A Vigenère cipher with a very long key
approaches random behavior, giving IC closer to 0.038.

---

**Q7. How would your attack fail if the key length were
a prime number like 7?**

It would not fail — the IC test works for prime key
lengths too. The only concern is that with a prime key
length, there are no divisor ambiguities (unlike 12, which
has divisors 6, 4, 3, 2). The IC loop would show a clear
single peak at 7, making identification easier, not harder.

---

**Q8. The ciphertext contains '1996' — how did your
`clean_text` function handle this, and could it affect
decryption?**

`clean_text` uses `tr -d -c 'A-Za-z'` which deletes all
characters that are NOT letters. The string `1996` is
completely stripped before any analysis. This is correct
behavior — numbers in a Vigenère ciphertext are typically
transmission metadata, not part of the cipher. Keeping
them would misalign the key stream and corrupt decryption.

---

**Q9. Can you explain the difference between usurpation
and deception as threats, and why you mapped usurpation
to both integrity AND availability?**

- Deception: the attacker introduces false data. The system
  still runs, but believes wrong information. Integrity
  is the primary service threatened.

- Usurpation: the attacker takes control of system
  resources or processes. This threatens integrity because
  they can now modify behavior/data, AND availability
  because they can shut down or monopolize services.

Example: a privilege escalation attack (usurpation) lets
an attacker both alter logs (integrity) and kill processes
(availability). Neither integrity nor availability alone
captures this fully.

---

**Q10. If a professor told you that SECURESECURE is wrong
and the real key is just SECURE — how would you defend
your answer?**

Both are correct in practice. The Vigenère cipher with key
SECURE (length 6) is mathematically identical to the same
cipher with key SECURESECURE (length 12), because
SECURESECURE is just SECURE repeated. The script found
length 12 because the IC analysis peaked there — which is
a valid divisor relationship. The "minimal" key is SECURE,
which is the canonical answer the professor likely expects.
I would acknowledge this and state the key as SECURE with
a note that length 12 is a valid (non-minimal) equivalent.

---

## 5. Plaintext Summary

### What the decrypted message says

The decrypted plaintext is a passage about **security
compliance laws and industry standards**. Its core message:

> Security standards vary significantly across industries
> and countries. Organizations operating globally must
> comply with all applicable laws simultaneously.

**Three frameworks mentioned:**

- **PCI DSS** (Payment Card Industry Data Security
  Standard): applies to any company that processes credit
  card payments. Defines minimum security steps to be
  considered compliant.

- **HIPAA** (Health Insurance Portability and
  Accountability Act): applies to organizations handling
  healthcare and patient records in the United States.

- **FISMA** (Federal Information Security Management
  Act): sets security standards for many U.S. federal
  government agencies.

**Key takeaway from the plaintext:**

Whether these standards are *effective* is debatable.
However, following the security standards defined for your
specific industry and operating region is advisable —
and often legally mandated.

**If asked "what was the secret message about?":**

> "The plaintext discussed how legal bodies define security
> standards differently across industries and countries.
> It cited PCI DSS for payment processors, HIPAA for
> healthcare organizations, and FISMA for U.S. federal
> agencies as examples, concluding that organizations
> should follow their industry's defined standards as a
> baseline, whether or not they are mandated."

---

## Quick Reference Card

```
Attack flow:
  IC Test -> Key Length 12
  chi^2 per group -> Key Letter
  12 letters -> SECURESECURE
  Decrypt (C-K) mod 26 -> Plaintext

IC values:
  Random text  : ~0.038
  English text : ~0.065
  Your target  : > 0.060

Kasiski vs IC:
  Kasiski  -> finds repeated n-grams -> GCD of distances
  IC       -> statistical measure    -> confirms length

CIA + Threats:
  Disclosure   -> Confidentiality
  Disruption   -> Availability
  Deception    -> Integrity
  Usurpation   -> Integrity + Availability
```

---

*Good luck on your viva, Samarth.*
