# Java & Software Architecture: Backend Viva Study Guide

---

## Table of Contents

- Part 1: The Evolution of Paradigms
- Part 2: Java Internals & The Ecosystem
- Part 3: Deep Dive into Java Features

---

# PART 1: THE EVOLUTION OF PARADIGMS

---

## 1.1 The Pre-OOP Era: Procedural & Structural Programming

### What Is Procedural Programming?

Languages like **C** and **Pascal** (1970s) followed the
**procedural paradigm**: programs were sequences of instructions
(procedures/functions) executed top-to-bottom.

The focus was on *how* to do something, not *what* to model.

### The Structural Revolution

**Structural programming** (Dijkstra, 1968) imposed discipline by
replacing `GOTO` jumps with structured control flow:

- `if / else`
- `for / while` loops
- Subroutines / functions

This was a major improvement, but it did not solve deeper problems.

### The Two Core Problems

**1. Spaghetti Code**

Without enforced structure, programs grew into tangled webs of
`GOTO` statements. Control flow was nearly impossible to trace
or maintain as codebases scaled.

```
GOTO line 40
...
line 40: GOTO line 120
...
line 120: GOTO line 40   <- infinite loop, unclear intent
```

**2. The Global State Problem**

In procedural programs, data was typically stored in **global
variables** accessible by any function at any time.

Consequences:

- Any function could corrupt any piece of data
- Bugs were extremely hard to isolate
- Adding features risked breaking unrelated parts
- There was no concept of data "belonging" to a component

```c
// C Example: The Global State Problem
int userBalance = 5000;  // Global — anyone can touch it

void applyDiscount() {
    userBalance -= 100;  // Silent side effect
}

void chargeShipping() {
    userBalance -= 50;   // Another silent side effect
}
```

Both functions silently modify `userBalance`. In a large program
with hundreds of such globals and functions, debugging becomes
a nightmare.

---

## 1.2 The Rise of OOP

### Why OOP Won

**Object-Oriented Programming** emerged from **Simula** (1967) and
**Smalltalk** (1972), and became mainstream through **C++** and
later **Java**.

The key insight: instead of modeling a program as a sequence of
steps, model it as a collection of **objects** that hold their own
data and behavior.

This solved the global state problem directly:

```
Procedural:   Data lives globally. Functions act on it.
OOP:          Data lives INSIDE objects. Objects act on themselves.
```

### Why Industry Adopted It

- **Modeling the real world:** A `BankAccount` object knows its own
  `balance`. Only its own methods can change it.
- **Large teams:** Teams could own separate classes/modules without
  interfering with each other.
- **Frameworks:** Spring, Hibernate, and Java EE were built entirely
  on OOP contracts (interfaces, inheritance hierarchies).
- **Code reuse:** Inheritance allowed shared behavior to be written
  once in a base class.

OOP became the dominant paradigm for enterprise software through the
1990s and 2000s — and Java was its flagship language.

---

## 1.3 The Current Critique: Where OOP Falls Short

### The Inheritance Problem

Deep inheritance hierarchies — common in enterprise Java — can
become fragile and hard to maintain.

```
Animal
  └── Vertebrate
        └── Mammal
              └── Pet
                    └── Dog
                          └── GoldenRetriever
```

Changing behavior at `Mammal` breaks all subclasses. This is known
as the **Fragile Base Class** problem.

### Composition Over Inheritance

Modern languages and frameworks advocate **composition**: instead
of *being* something, an object *has* something.

```java
// Inheritance (tightly coupled)
class SalariedEmployee extends Employee { ... }

// Composition (loosely coupled)
class Employee {
    private PaymentStrategy paymentStrategy; // "has a" strategy
}
```

Go and Rust have **no inheritance** at all. They use:

- **Interfaces / Traits** for polymorphism
- **Struct embedding** (Go) for code reuse

### The Boilerplate Critique

Java OOP often requires enormous amounts of **boilerplate code**:
getters, setters, constructors, `equals()`, `hashCode()`,
`toString()` — all just to hold data.

Modern alternatives:

- **Kotlin** `data class` generates all of this in one line
- **Java Records** (Java 16+) address this within Java itself
- **Lombok** annotations reduce boilerplate via code generation

> The takeaway: OOP is not wrong — it is powerful when used
> correctly. The critique is against *misuse*: over-engineering
> with deep hierarchies when simple composition would suffice.

---

# PART 2: JAVA INTERNALS & THE ECOSYSTEM

---

## 2.1 The Virtual Machine: JDK, JRE, JVM

### The Hierarchy

```
+---------------------------------------------+
|                    JDK                      |
|  (Java Development Kit — for developers)    |
|                                             |
|   +---------------------------------------+ |
|   |              JRE                      | |
|   |  (Java Runtime Environment — to run)  | |
|   |                                       | |
|   |   +-------------------------------+   | |
|   |   |           JVM                 |   | |
|   |   |  (Java Virtual Machine)       |   | |
|   |   +-------------------------------+   | |
|   +---------------------------------------+ |
+---------------------------------------------+
```

- **JVM** — The engine that executes Java Bytecode. It is
  platform-specific (Windows JVM ≠ Linux JVM), but they all
  execute the same `.class` files.

- **JRE** — The JVM plus the standard class libraries (`java.lang`,
  `java.util`, etc.). End-users install the JRE to *run* Java apps.

- **JDK** — The JRE plus development tools: `javac` (compiler),
  `javadoc`, `jar`, `jdb` (debugger). Developers install the JDK.

### Write Once, Run Anywhere

```
YourCode.java
     |
     | javac (compiler)
     v
YourCode.class  (Bytecode — platform independent)
     |
     | JVM (platform specific)
     v
Native Machine Code (runs on your OS/CPU)
```

The `.class` Bytecode is the key: it is **not machine code** and
**not source code** — it is an intermediate representation that
any JVM on any platform can understand and execute.

---

## 2.2 The JIT Compiler: Deep Dive

### The Problem with Pure Interpretation

Early JVMs were **interpreters**: they read each Bytecode
instruction and executed it one at a time. This was slow —
roughly 10–100x slower than native compiled code.

### What JIT Does

**Just-In-Time (JIT) compilation** is the solution. Instead of
interpreting Bytecode, the JVM compiles frequently-used code
segments to **native machine code** at runtime.

The process:

```
Bytecode
    |
    | JVM starts interpreting
    v
[Profiler monitors execution]
    |
    | Identifies "Hotspots"
    v
[JIT Compiler kicks in]
    |
    | Compiles Hotspot to Native Code
    v
Native Code (cached and reused)
```

### Hotspot Detection

The JVM's **profiler** tracks:

- Which methods are called most frequently
- Which loops iterate the most
- Which branches are almost always taken

A method is considered a **Hotspot** after approximately 10,000
invocations (configurable via `-XX:CompileThreshold`).

### JIT Optimizations Applied

Once a Hotspot is identified, the JIT compiler applies aggressive
optimizations:

- **Inlining:** Replaces a method call with the method's body
  directly, eliminating call overhead.

```java
// Before inlining
int result = add(a, b);

// After inlining (JIT does this in native code)
int result = a + b;
```

- **Dead Code Elimination:** Removes code that can never execute.

- **Loop Unrolling:** Expands loop iterations to reduce branching
  overhead.

- **Escape Analysis:** If an object never leaves a method, the JIT
  may allocate it on the **Stack** instead of the Heap, avoiding
  garbage collection entirely.

### HotSpot JVM Tiers

Modern JVMs (like HotSpot) use **tiered compilation**:

```
Tier 0: Interpreter
Tier 1: C1 Compiler (fast, light optimizations)
Tier 2: C1 with profiling
Tier 3: C1 with full profiling
Tier 4: C2 Compiler (slow, aggressive optimizations)
```

C2 produces the fastest native code but takes longer to compile.
The tiered system gives fast startup (C1) and peak performance (C2).

> This is why Java programs get *faster* the longer they run —
> the JIT progressively optimizes the hottest code paths.

---

## 2.3 Memory Management: Heap, Stack, and GC

### Stack Memory

- Stores **method call frames**, local variables, and references.
- **LIFO** (Last In, First Out) structure.
- Memory is automatically reclaimed when a method returns.
- Each thread has its **own Stack** — thread-safe by design.
- Fast to allocate and deallocate.

### Heap Memory

- Stores all **objects** created with `new`.
- Shared among all threads — requires synchronization for safety.
- Managed by the **Garbage Collector**.
- Subdivided into regions: **Young Generation**, **Old Generation**,
  **Metaspace**.

```
Stack (per thread)         Heap (shared)
+-----------------+     +---------------------+
| frame: main()   |     | Young Gen           |
|   ref -> -------|---> |   [obj1] [obj2]     |
+-----------------+     | Old Gen             |
| frame: process()|     |   [long-lived obj]  |
+-----------------+     | Metaspace           |
                         |   [class metadata] |
                         +---------------------+
```

### The Garbage Collector

The **GC** automatically reclaims memory from objects that are no
longer reachable from any live reference.

Key GC algorithms in modern JVMs:

- **G1GC** (default since Java 9): Splits heap into regions, runs
  concurrently with minimal pauses.
- **ZGC / Shenandoah**: Sub-millisecond pause GCs for latency-
  critical applications.

> **Important:** You cannot *force* GC in Java. `System.gc()` is
> only a hint to the JVM. Memory leaks in Java happen when objects
> are unintentionally held by references (e.g., in static maps).

---

# PART 3: DEEP DIVE INTO JAVA FEATURES

---

## 3.1 The Four Pillars of OOP

---

### Pillar 1: Encapsulation

**Concept & Origin:**
Encapsulation bundles data and the methods that operate on it into
a single unit (a class), and **restricts direct access** to internal
state. Pioneered in **Simula** and refined in **Smalltalk**.

It directly solves the Global State problem from the procedural era.

**Industrial Context:**
Prevents invalid state (e.g., a negative account balance). Allows
internal implementation to change without breaking external code.
Critical for API design in backend services.

```java
public class BankAccount {

    // Private field — hidden from outside
    private double balance;

    public BankAccount(double initialBalance) {
        if (initialBalance < 0)
            throw new IllegalArgumentException("Balance cannot be negative");
        this.balance = initialBalance;
    }

    // Controlled access via public method
    public void deposit(double amount) {
        if (amount <= 0)
            throw new IllegalArgumentException("Amount must be positive");
        this.balance += amount;
    }

    public double getBalance() {
        return balance; // Read-only access
    }
}
```

---

### Pillar 2: Abstraction

**Concept & Origin:**
Abstraction hides **implementation complexity** and exposes only
essential behavior. In Java, achieved via **abstract classes** and
**interfaces**. Roots in **Simula**'s class concept.

**Industrial Context:**
Defines contracts between system components. A `PaymentProcessor`
interface hides whether you're using Stripe or PayPal. The
calling code doesn't need to know.

```java
// Abstract definition (the "what")
public interface PaymentProcessor {
    boolean charge(String userId, double amount);
    void refund(String transactionId);
}

// Concrete implementation (the "how")
public class StripeProcessor implements PaymentProcessor {

    @Override
    public boolean charge(String userId, double amount) {
        // Stripe-specific API call
        return true;
    }

    @Override
    public void refund(String transactionId) {
        // Stripe-specific refund logic
    }
}
```

---

### Pillar 3: Inheritance

**Concept & Origin:**
Inheritance allows a class to **acquire properties and behavior**
from a parent class. Introduced in **Simula 67**. Java supports
**single inheritance** for classes (avoiding the C++ diamond
problem).

**Industrial Context:**
Used in frameworks for base entity classes (e.g., `BaseEntity`
with `id`, `createdAt`, `updatedAt` fields shared by all JPA
entities).

```java
// Base entity for all database entities
public abstract class BaseEntity {

    private Long id;
    private LocalDateTime createdAt;

    // Common behavior inherited by all subclasses
    public Long getId() { return id; }
    public LocalDateTime getCreatedAt() { return createdAt; }
}

// Subclass inherits id and createdAt automatically
public class User extends BaseEntity {
    private String username;
    private String email;

    public String getUsername() { return username; }
}
```

---

### Pillar 4: Polymorphism

**Concept & Origin:**
Polymorphism (Greek: "many forms") allows objects of different
types to be treated through a **common interface**. Two forms exist:

- **Compile-time** (method overloading)
- **Runtime** (method overriding via `@Override`)

Roots in **Smalltalk**'s message-passing model.

**Industrial Context:**
Enables the **Open/Closed Principle**: code is open for extension
but closed for modification. A notification service can handle
Email, SMS, and Push without changing its core logic.

```java
public abstract class Notification {
    public abstract void send(String message);
}

public class EmailNotification extends Notification {
    @Override
    public void send(String message) {
        System.out.println("Sending email: " + message);
    }
}

public class SMSNotification extends Notification {
    @Override
    public void send(String message) {
        System.out.println("Sending SMS: " + message);
    }
}

// Polymorphic usage — same code, different behavior
public class NotificationService {
    public void notify(Notification n, String msg) {
        n.send(msg); // Correct method resolved at runtime
    }
}
```

---

## 3.2 Java Beans

### What Is a Java Bean?

A **Java Bean** (or **POJO — Plain Old Java Object**) is a class
that follows three strict rules required by frameworks like Spring,
Hibernate, and JAX-B to introspect and manipulate objects
automatically via **Reflection**.

### The 3 Strict Rules

1. **Default no-argument constructor** must exist.
2. All fields must be **private**.
3. All fields must have **public getters and setters** following the
   `get`/`set` naming convention.

### Why Frameworks Need Them

Frameworks use **Reflection** (`java.lang.reflect`) to:

- Instantiate objects without knowing the class at compile time
- Map database columns to fields (Hibernate ORM)
- Serialize/deserialize JSON (Jackson, Gson)
- Inject dependencies (Spring's `@Autowired`)

If getters/setters don't follow conventions, the framework cannot
find the property.

```java
// A valid Java Bean / POJO
public class ProductDto {

    // Rule 2: private fields
    private Long id;
    private String name;
    private double price;

    // Rule 1: no-argument constructor
    public ProductDto() {}

    // Convenience constructor (optional)
    public ProductDto(Long id, String name, double price) {
        this.id    = id;
        this.name  = name;
        this.price = price;
    }

    // Rule 3: public getters and setters (standard naming)
    public Long getId()            { return id; }
    public void setId(Long id)     { this.id = id; }

    public String getName()           { return name; }
    public void setName(String name)  { this.name = name; }

    public double getPrice()              { return price; }
    public void setPrice(double price)    { this.price = price; }
}
```

> **Note:** Java 16+ `record` types are immutable data carriers
> but are NOT Beans (no setters, no no-arg constructor). Use Beans
> when frameworks need to mutate or inject the object.

---

## 3.3 Interfaces vs. Abstract Classes

### The Rule of Thumb

```
Use an Interface when:
    - You define a CONTRACT (what something can do)
    - Multiple unrelated classes share a capability
    - You expect many implementations

Use an Abstract Class when:
    - You define a BASE (what something IS)
    - Subclasses share common code/state
    - You have a clear "is-a" relationship
```

### Key Differences

```
Feature             Interface           Abstract Class
-----------         ---------           --------------
Instantiation       No                  No
Multiple inherit    Yes (many ifaces)   No (one class)
Fields              Constants only      Any fields
Constructor         No                  Yes
Default methods     Yes (Java 8+)       Yes
Access modifiers    public only         Any
```

### Backend Architecture Example

```java
// INTERFACE: defines capability contract
// Any class can "be" Auditable regardless of hierarchy
public interface Auditable {
    LocalDateTime getCreatedAt();
    String getCreatedBy();
}

// ABSTRACT CLASS: defines shared base implementation
// All services share this retry/logging plumbing
public abstract class BaseService {

    protected final Logger log = LoggerFactory.getLogger(getClass());

    // Shared method: concrete implementation in base
    protected void logOperation(String operation) {
        log.info("Executing: {}", operation);
    }

    // Abstract method: subclass MUST implement
    public abstract void validate(Object input);
}

// Concrete service uses both
public class OrderService extends BaseService implements Auditable {

    @Override
    public void validate(Object input) {
        // Order-specific validation
    }

    @Override
    public LocalDateTime getCreatedAt() {
        return LocalDateTime.now();
    }

    @Override
    public String getCreatedBy() {
        return "system";
    }
}
```

---

## 3.4 Annotations (@)

### Concept & Origin

**Annotations** are **metadata markers** on code elements (classes,
methods, fields). They carry information that is read at compile
time or at runtime via **Reflection**. Java introduced them in
**Java 5 (2004)**, inspired by C#'s Attributes.

Annotations do not change what code *does* — they provide
instructions to **tools, compilers, and frameworks**.

### How Reflection Reads Annotations

```
Source Code + Annotations
         |
         | javac
         v
.class file (metadata retained if @Retention = RUNTIME)
         |
         | Framework reads via java.lang.reflect
         v
Framework acts on the annotation
(e.g., Spring creates a bean, Hibernate maps a table)
```

### Common Standard Annotations

```java
// @Override: tells compiler to verify this is an override
// Causes compile error if parent method doesn't exist
@Override
public String toString() {
    return "User{id=" + id + "}";
}

// @Deprecated: marks as obsolete, triggers compiler warning
@Deprecated
public void oldMethod() { }

// @SuppressWarnings: suppress compiler warnings
@SuppressWarnings("unchecked")
public List getRawList() {
    return new ArrayList();
}
```

### Custom Annotation Example

```java
import java.lang.annotation.*;

// Define a custom annotation
@Retention(RetentionPolicy.RUNTIME)  // Available via reflection at runtime
@Target(ElementType.METHOD)          // Can only annotate methods
public @interface Author {
    String name();
    String date();
    String comment() default "No comment";
}

// Apply it
public class ReportService {

    @Author(name = "Ravi Kumar", date = "2025-06-01",
            comment = "Core billing logic")
    public void generateBillingReport() {
        // ...
    }
}

// Read it via Reflection
Method m = ReportService.class.getMethod("generateBillingReport");
Author a = m.getAnnotation(Author.class);
System.out.println(a.name());    // Ravi Kumar
System.out.println(a.comment()); // Core billing logic
```

### Common Spring/Jakarta Annotations

```
@Component      — marks class as a Spring-managed bean
@Service        — semantic alias for @Component (service layer)
@Repository     — DAO layer; wraps persistence exceptions
@RestController — HTTP controller that returns JSON
@Autowired      — injects a dependency by type
@Transactional  — wraps method in a DB transaction
@Entity         — maps class to a database table (JPA)
```

---

## 3.5 Generics (`<T>`)

### Concept & Origin

**Generics** allow classes and methods to operate on **typed
parameters** rather than raw `Object` types. Introduced in
**Java 5 (2004)**, inspired by **C++ templates** and
**ML/Haskell** type systems.

They provide **compile-time type safety**, catching errors that
would previously only appear at runtime as `ClassCastException`.

### The Problem Before Generics (Java 1.4)

```java
// No generics — raw List holds Object
List names = new ArrayList();
names.add("Alice");
names.add(42);          // No error at compile time!

// ClassCastException thrown at RUNTIME
String name = (String) names.get(1);  // BOOM
```

### The Solution With Generics

```java
// Generics — List is typed to String
List<String> names = new ArrayList<>();
names.add("Alice");
names.add(42);  // COMPILE ERROR — caught before running!

// No cast needed — compiler guarantees the type
String name = names.get(0);
```

### Generic Class Example

```java
// A generic container that works with ANY type T
public class ApiResponse<T> {

    private int statusCode;
    private String message;
    private T data;  // T is resolved at usage time

    public ApiResponse(int statusCode, String message, T data) {
        this.statusCode = statusCode;
        this.message    = message;
        this.data       = data;
    }

    public T getData() { return data; }
}

// Usage: T becomes User
ApiResponse<User> userResponse =
    new ApiResponse<>(200, "OK", new User("Alice"));

// Usage: T becomes List<Order>
ApiResponse<List<Order>> ordersResponse =
    new ApiResponse<>(200, "OK", orderList);
```

### Generic Method & Bounded Type Parameters

```java
// T must extend Comparable — ensures it has compareTo()
public <T extends Comparable<T>> T findMax(List<T> list) {
    T max = list.get(0);
    for (T item : list) {
        if (item.compareTo(max) > 0) max = item;
    }
    return max;
}

int largest    = findMax(List.of(3, 1, 4, 1, 5));  // 5
String longest = findMax(List.of("apple", "zebra")); // zebra
```

---

## 3.6 Collections Framework

### Overview

The **Java Collections Framework** (JCF) provides a unified
architecture for storing and manipulating groups of objects.

```
Collection (interface)
    |
    +-- List (interface)     — ordered, allows duplicates
    |     +-- ArrayList
    |     +-- LinkedList
    |
    +-- Set (interface)      — no duplicates
    |     +-- HashSet
    |     +-- LinkedHashSet
    |     +-- TreeSet
    |
    +-- Queue (interface)    — FIFO processing
          +-- PriorityQueue
          +-- ArrayDeque

Map (separate hierarchy)     — key-value pairs
    +-- HashMap
    +-- LinkedHashMap
    +-- TreeMap
```

### List: Ordered, Duplicates Allowed

```java
// ArrayList: fast random access O(1), slow insert/delete O(n)
List<String> roles = new ArrayList<>();
roles.add("ADMIN");
roles.add("USER");
roles.add("USER");  // Duplicates allowed

// LinkedList: fast insert/delete O(1), slow random access O(n)
List<String> queue = new LinkedList<>();
```

### Set: No Duplicates

```java
// HashSet: O(1) average for add/contains — unordered
Set<String> uniqueEmails = new HashSet<>();
uniqueEmails.add("a@b.com");
uniqueEmails.add("a@b.com"); // Silently ignored
System.out.println(uniqueEmails.size()); // 1

// TreeSet: O(log n) — sorted order
Set<Integer> sorted = new TreeSet<>(Set.of(5, 3, 1, 4));
System.out.println(sorted); // [1, 3, 4, 5]
```

### Map: Key-Value Pairs

```java
// HashMap: O(1) average — unordered
Map<String, Integer> wordCount = new HashMap<>();
wordCount.put("java", 10);
wordCount.put("spring", 5);
wordCount.getOrDefault("python", 0); // 0 — safe default

// Iterating entries
for (Map.Entry<String, Integer> entry : wordCount.entrySet()) {
    System.out.println(entry.getKey() + ": " + entry.getValue());
}

// LinkedHashMap: maintains insertion order
Map<String, String> config = new LinkedHashMap<>();
```

### Choosing the Right Collection

```
Need order + duplicates?         -> ArrayList
Need fast insert at head/tail?   -> LinkedList / ArrayDeque
Need uniqueness?                 -> HashSet
Need sorted uniqueness?          -> TreeSet
Need key-value lookup?           -> HashMap
Need sorted key-value?           -> TreeMap
Need insertion-order map?        -> LinkedHashMap
Need thread safety?              -> ConcurrentHashMap
```

---

## 3.7 Exception Handling

### Concept & Origin

Java's exception model was inspired by **C++** and **Ada**.
Exceptions are objects — all exceptions extend `Throwable`.

```
Throwable
    |
    +-- Error           (JVM-level, don't catch: OutOfMemoryError)
    |
    +-- Exception
          |
          +-- RuntimeException    (Unchecked)
          |     +-- NullPointerException
          |     +-- IllegalArgumentException
          |     +-- ClassCastException
          |
          +-- IOException         (Checked)
          +-- SQLException        (Checked)
```

### Checked vs. Unchecked

**Checked Exceptions:**

- Subclass of `Exception` (but NOT `RuntimeException`)
- **Compiler enforces** handling: must `catch` or declare `throws`
- Represent **recoverable** conditions (file not found, network down)

**Unchecked Exceptions (Runtime):**

- Subclass of `RuntimeException`
- **No compiler enforcement** — can be ignored
- Represent **programming errors** (null pointer, array out of bounds)

```java
// Checked: compiler FORCES you to handle it
public String readFile(String path) throws IOException {
    return Files.readString(Path.of(path));
}

// Unchecked: no compiler requirement
public int divide(int a, int b) {
    if (b == 0)
        throw new IllegalArgumentException("Divisor cannot be zero");
    return a / b;
}
```

### Try-With-Resources

Introduced in **Java 7**. Automatically closes resources that
implement `AutoCloseable` — even if an exception is thrown.
Eliminates resource leaks from `finally` blocks.

```java
// Without try-with-resources (verbose, leak-prone)
BufferedReader br = null;
try {
    br = new BufferedReader(new FileReader("data.txt"));
    System.out.println(br.readLine());
} catch (IOException e) {
    e.printStackTrace();
} finally {
    if (br != null) {
        try { br.close(); } catch (IOException e) { }
    }
}

// With try-with-resources (clean, safe)
try (BufferedReader br = new BufferedReader(new FileReader("data.txt"))) {
    System.out.println(br.readLine());
} catch (IOException e) {
    System.err.println("Failed to read file: " + e.getMessage());
}
// br.close() called AUTOMATICALLY here
```

### Multi-Catch (Java 7+)

```java
try {
    // Operation that may throw multiple exceptions
    processPayment(order);
} catch (InvalidCardException | InsufficientFundsException e) {
    // Handle both the same way
    log.warn("Payment failed: {}", e.getMessage());
    throw new PaymentException("Payment could not be processed", e);
}
```

---

## 3.8 Multithreading Basics

### Concept & Origin

**Multithreading** allows concurrent execution of multiple
sequences of instructions within one process. Threads share the
**Heap** but each has its own **Stack**.

Java's threading model was inherited from POSIX threads (pthreads)
and the early JVM design (1995).

### The Thread Lifecycle

```
[New]
  |
  | start()
  v
[Runnable] <-> [Blocked/Waiting]
  |
  | run() completes
  v
[Terminated]
```

### Two Ways to Create a Thread

```java
// Way 1: Extend Thread class
public class CounterThread extends Thread {

    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}

// Way 2: Implement Runnable (PREFERRED — supports composition)
public class CounterTask implements Runnable {

    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}

// Usage
Thread t1 = new Thread(new CounterTask());
t1.start(); // Never call run() directly — that runs on the CURRENT thread
```

### Thread Safety

**Thread safety** means a class behaves correctly when accessed by
multiple threads simultaneously.

The core problem is the **Race Condition**: two threads read-
modify-write the same data concurrently.

```java
// NOT thread-safe — race condition on 'count'
public class UnsafeCounter {
    private int count = 0;

    public void increment() {
        count++; // NOT atomic: read → add 1 → write (3 steps)
    }
}

// Thread-safe: synchronized ensures only one thread at a time
public class SafeCounter {
    private int count = 0;

    public synchronized void increment() {
        count++; // Now atomic within this lock
    }

    public synchronized int getCount() {
        return count;
    }
}

// Even better: use AtomicInteger (lock-free, faster)
import java.util.concurrent.atomic.AtomicInteger;

public class AtomicCounter {
    private AtomicInteger count = new AtomicInteger(0);

    public void increment()  { count.incrementAndGet(); }
    public int  getCount()   { return count.get(); }
}
```

### ExecutorService (Modern Approach)

In production, avoid creating raw `Thread` objects. Use
`ExecutorService` for a managed thread pool.

```java
import java.util.concurrent.*;

// Create a pool of 4 threads
ExecutorService executor = Executors.newFixedThreadPool(4);

// Submit tasks
for (int i = 0; i < 10; i++) {
    int taskId = i;
    executor.submit(() -> {
        System.out.println("Task " + taskId + " on "
            + Thread.currentThread().getName());
    });
}

// Shut down gracefully
executor.shutdown();
executor.awaitTermination(30, TimeUnit.SECONDS);
```

> **Key Rule:** Shared mutable state is the root of all threading
> bugs. Prefer immutable objects, `final` fields, and
> `java.util.concurrent` classes over manual `synchronized` blocks.

---

# SUMMARY: QUICK REFERENCE

---

## Paradigm Evolution

```
1960s: Procedural (C, Pascal)
  Problem: Spaghetti code, global state

1980s-90s: OOP (Simula, Smalltalk, C++, Java)
  Solution: Encapsulation, inheritance, polymorphism

2010s+: Critique of OOP
  Preference: Composition over Inheritance, traits/interfaces
```

## Java Stack

```
JDK -> JRE -> JVM
Bytecode -> JIT -> Native Code (Hotspots)
Heap (GC-managed) | Stack (per-thread)
```

## Key Feature Decisions

```
Feature needed              Use
------------------------    -----------------------
Contract definition         Interface
Shared implementation       Abstract class
Metadata/config             Annotation
Type-safe container         Generics
Unique elements             HashSet / TreeSet
Key-value lookup            HashMap
Ordered collection          ArrayList
Concurrent counter          AtomicInteger
Managed threads             ExecutorService
Auto-close resources        try-with-resources
```

---

> **Good luck with your viva.**
> Focus on *why* each feature exists — not just *what* it does.
> Examiners value understanding of the problem a feature solves.

---

END OF STUDY GUIDE
