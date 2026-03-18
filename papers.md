
# Algorithm Engineering of Hashing & Approximate Structures

## Overview

This document analyzes multiple research papers in the domain of
hash tables, Bloom filters, and locality-sensitive hashing.

The goal is to understand how algorithms evolve when moving from:

    theoretical models
        ->
    real-world systems

Focus areas include:

- cache efficiency
- concurrency
- data skew
- approximation
- hardware constraints

---

## Phase 1: Abstract Screening

### Paper 1: Hash Adaptive Bloom Filter (HABF)

Core objective:
    Reduce costly false positives using adaptive hashing

Methodology:
    Experimental + theoretical

Primary contribution:
    Per-key customized hash functions using HashExpressor


### Paper 2: Wait-Free Resizable Hash Table

Core objective:
    Build a concurrent hash table with guaranteed progress

Methodology:
    Systems + experimental

Primary contribution:
    Efficient wait-free resizing with high throughput


### Paper 3: FLINNG (Group Testing + LSH)

Core objective:
    Improve approximate nearest neighbor search

Methodology:
    Algorithmic + experimental

Primary contribution:
    Eliminates distance computations using Bloom-filter-like grouping


### Paper 4: LSH for Network Fingerprinting

Core objective:
    Replace ML-based fingerprinting with hashing

Methodology:
    Experimental

Primary contribution:
    Achieves high accuracy without feature engineering or retraining


### Paper 5: Hash Tables for Join Processing

Core objective:
    Optimize hash tables for database joins

Methodology:
    Systems + benchmarking

Primary contribution:
    Combines multiple low-level optimizations for major speedups


### Paper 6: Iceberg Hashing

Core objective:
    Achieve multiple optimal hash table properties simultaneously

Methodology:
    Theoretical + systems

Primary contribution:
    High load factor + cache efficiency + stability in one design


### Paper 7: Slick Hashing (Implementation Study)

Core objective:
    Evaluate practical performance of Slick hash tables

Methodology:
    Experimental

Primary contribution:
    Shows impact of parameter tuning on performance


### Paper 8: Hive GPU Hash Table

Core objective:
    Design hash tables optimized for GPUs

Methodology:
    Systems + experimental

Primary contribution:
    Warp-cooperative hashing with very high throughput


---

## Phase 2: Structural Deep-Dive

### 1. Hash Adaptive Bloom Filter

Problem:
    Standard Bloom filters ignore negative keys and cost variation

Key findings:
    - Custom hash functions reduce false positive cost
    - Two-stage query improves accuracy

Limitations:
    - Requires prior knowledge of negative keys
    - Additional data structure overhead

Insight:
    Moves from uniform randomness to data-aware hashing


### 2. Wait-Free Resizable Hash Table

Problem:
    Concurrent hashing struggles with resizing and contention

Key findings:
    - Lookups are fully parallel
    - Parallelism preserved in common case

Limitations:
    - Slow resizing
    - Complex implementation

Insight:
    Practical cost dominated by contention, not asymptotics


### 3. FLINNG (Group Testing + LSH)

Problem:
    High-dimensional nearest neighbor search is expensive

Key findings:
    - No distance computations required
    - Up to 10x speedup

Limitations:
    - Approximate results
    - Data-dependent performance

Insight:
    Replace computation with hashing + approximation


### 4. LSH for Network Fingerprinting

Problem:
    ML-based systems are expensive and complex

Key findings:
    - ~94% accuracy
    - No feature engineering or retraining

Limitations:
    - Depends on hash design
    - Less flexible than ML

Insight:
    Simple hashing can outperform complex ML systems


### 5. Hash Tables for Join Processing

Problem:
    Generic hash tables fail under skew and asymmetric workloads

Key findings:
    - Combines:
        - partitioning
        - Bloom filters
        - pipelining
    - Up to 20x speedup

Limitations:
    - Workload-specific
    - Not general-purpose

Insight:
    Specialization beats generality in practice


### 6. Iceberg Hashing

Problem:
    Cannot achieve all desired properties simultaneously

Key findings:
    - Introduces waterfall addressing
    - Achieves high load factor + stability

Limitations:
    - Complex design
    - Hard to implement

Insight:
    Fundamental trade-offs in data structure design


### 7. Slick Hashing

Problem:
    Need practical validation of theoretical designs

Key findings:
    - Performance depends on parameters
    - Trade-offs:
        memory vs speed vs cache

Limitations:
    - Requires tuning
    - No universal best config

Insight:
    Implementation details dominate performance


### 8. Hive GPU Hash Table

Problem:
    CPU hash tables fail on GPU architectures

Key findings:
    - Warp-cooperative design reduces contention
    - Billions of operations per second

Limitations:
    - GPU-specific
    - Complex concurrency model

Insight:
    Algorithms must adapt to hardware architecture


---

## Core Pattern Observed

```

Theory:
uniform assumptions
simple models
clean guarantees

Practice:
data-aware
hardware-aware
approximate
heavily engineered

```

---

## Phase 3: Strategic Recommendation

### Best choice: Hash Tables for Join Processing

Reasoning:

- Directly aligns with course theme
- Shows real-world constraints clearly
- Easy to implement and benchmark
- Demonstrates multiple engineering trade-offs


### Suggested project structure

```

Theory:
basic hash table designs

Practical issues:
cache behavior
skewed data
parallelism

Implementation:
multiple hash table variants

Evaluation:
throughput
memory usage
performance under skew

```

---

## Alternative Options

### Option 2: Hash Adaptive Bloom Filter

- Good balance of theory and practice
- Easy to experiment with
- Strong real-world relevance


### Option 3: Hive GPU Hash Table

- Very advanced
- Highly impressive
- More difficult to implement


---

## Final Summary

The key takeaway from all papers:

```

Algorithms do not fail in theory.

They fail in reality due to:

```
memory hierarchy
concurrency
data distribution
hardware constraints
```

```

Modern algorithm design is therefore:

    not just about correctness
    but about engineering trade-offs
