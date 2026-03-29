# SWE Study Guide: Lectures 9–13
### Quiz Preparation — UML Class Relations, State Machines,
### Interaction Diagrams, and OOAD

---

## How to Use This Guide

Each lecture section follows this structure:

- **Core Objective** — one sentence summary
- **Detailed Concept Breakdown** — expanded explanations
- **Mental Models / Diagrams** — ASCII diagrams for key concepts
- **Comparison Tables** — side-by-side comparisons
- **Quiz Questions** — 5 "check for understanding" items

---

# Lecture 9 — UML Class Relations

## Core Objective

Understand the three structural relationships between
classes — Aggregation, Composition, and Dependency —
and how to represent and implement them in UML and code.

---

## Detailed Concept Breakdown

### 1. Aggregation

Aggregation represents a **whole-part** (has-a) relationship
where the whole *contains* its parts, but the parts can
exist independently.

**UML symbol:** Empty (hollow) diamond at the aggregator end.

Key characteristics:

- The aggregate **usually creates** its component objects
- The aggregate **usually invokes the same operations** on all
  its components (e.g., same method call to all parts)
- The aggregate is **usually the owner**, but parts may be
  shared with other objects
- Lifelines of aggregate and component are **independent**
- Restricted to a **tree hierarchy** — no circular inclusion
  (A cannot aggregate B if B aggregates A)

**Real-world hint:** "is part of" / "has a" relationship.
Example: A Company employs many Persons. A Club has many
Members. A Person can exist even after the Company dissolves.

**Multiplicity example from slides:**

```
Company  1 ---employs--- *  Person
Club     1 ---memberOf-- *  Person
```

Both Company and Club aggregate Person.
A Person can belong to both — shared aggregation.

**Code implementation:**
Aggregation is typically represented as a data field
(often a collection) in the aggregating class.

```java
public class CarShop {
    private ArrayList<Car> cars = new ArrayList<Car>();
    private ArrayList<SalesPerson> people = new ArrayList<>();
}
```

The CarShop doesn't create the Cars — they exist elsewhere
and are merely held by CarShop.

---

### 2. Composition

Composition is a **stronger form of aggregation** where
the part belongs exclusively to one whole and cannot exist
without it.

**UML symbol:** Filled (solid) diamond at the composite end.

Key characteristics:

- A component can belong to **only one** composite at a time
- The **lifetime of the part is bound** to the lifetime of
  the whole — if the whole is destroyed, so are its parts
- The composite is **solely responsible** for creating and
  destroying its parts
- Parts cannot be shared between different composites

**Real-world hint:** "is made of" / physical assembly.
Example: A Car is composed of 4 Wheels, 1 Engine, 2 Doors,
etc. If the Car is destroyed (scrapped), its Wheels also
cease to exist as "car wheels."

**Code implementation:**
The composite creates its parts inside its own constructor.

```java
public class Car {
    private Wheel wheels[4];
    public Car() {
        wheels[0] = new Wheel();
        wheels[1] = new Wheel();
        wheels[2] = new Wheel();
        wheels[3] = new Wheel();
    }
}
```

The Wheel objects are born and die with the Car object.

---

### 3. When to Choose Composition vs. Aggregation

Use **Composition** when:

- The lifetime of the part is bound within the composite
- There is an obvious physical or logical assembly
- Some properties of the composite propagate to parts
  (e.g., location, color)
- Operations on the composite propagate to parts
  (e.g., destruction, movement)

Use **Aggregation** when:

- Parts have an independent existence
- Parts may be shared among multiple wholes
- Order items can be changed or deleted after placing an order
  (the Items are not permanently locked to the Order)

**Order example from slides:**
- **Composition** if order items cannot be changed once placed
- **Aggregation** if items can be modified or substituted

---

### 4. Class Dependency

A **dependency** exists when one class (the dependent)
requires knowledge of another class (the independent)
in order to function. Any change to the independent class
may force a change in the dependent class.

**UML symbol:** Dashed arrow pointing from dependent to
independent class.

A dependency can arise because class X:

- Has an **attribute** of class Y
- Has a **method parameter** of class Y (input or output)
- Has a **local variable** of class Y inside a method
- Has a **return value** of class Y
- Has a **template parameter** of class Y

**Code example:**

```java
class A {
    B foo(B x) {     // parameter: dependency on B
        B y = new B(); // local variable: dependency on B
        return y;      // return value: dependency on B
    }
}
```

Class A depends on Class B in three ways simultaneously.

---

### 5. Summary: Association Types Hierarchy

All three build on Association:

```
Association
    |
    +-- Aggregation (empty diamond)
    |       |
    |       +-- Composition (filled diamond)
    |
    +-- Dependency (dashed arrow)
```

- **Association** — general relationship ("uses")
- **Aggregation** — whole-part, parts can survive alone
- **Composition** — whole-part, parts cannot survive alone
- **Dependency** — one class references another temporarily

---

### 6. Text Analysis → Class Diagrams (Dennis 2002)

When reading a requirements document, use these rules:

- **Common/improper noun** → class (e.g., "book" → Book)
- **Proper noun** → object/instance (e.g., "CSE Dept" → object)
- **Adjective** → attribute (e.g., "price of book")
- **"Doing" verb** → operation/method or relationship
  (e.g., "student issues Book" → issues() method or
  association)
- **"Having" verb** → aggregation relationship
  (e.g., "department has students")
- **Adverb** → attribute of an operation
  (e.g., "fast loading" → loading has speed attribute)

---

## Mental Models

### Aggregation vs. Composition Lifetime

```
AGGREGATION                    COMPOSITION
-----------                    -----------

[Company]                      [Car]
    |                              |
    | (diamond empty)              | (diamond filled)
    |                              |
[Person]                       [Engine]

Person exists independently.   Engine dies with Car.
Company goes bankrupt →        Car scrapped →
Person still exists.           Engine is gone too.
```

### Full UML Notation Reference

```
+------------------+        +------------------+
|  Notation        |        | Meaning          |
+------------------+        +------------------+
  --------->                 Association
  ----o>                     Dependency (dashed)
  <>-------                  Aggregation (empty diamond)
  <+>------                  Composition (filled diamond)
  -------|>                  Generalization (inheritance)
```

---

## Comparison Table

| Feature          | Aggregation        | Composition          |
|------------------|--------------------|----------------------|
| Diamond symbol   | Empty (hollow)     | Filled (solid)       |
| Ownership        | Shared possible    | Exclusive (sole)     |
| Lifetime         | Independent        | Part dies with whole |
| Sharing          | Part can be shared | Part belongs to one  |
| UML phrase       | "is part of"       | "is made of"         |
| Code pattern     | Field / collection | Created in constructor |
| Example          | Person in Club     | Wheel in Car         |
| Circular OK?     | No (tree only)     | No                   |

---

## Quiz Questions — L9

1. A `Window` has a `Frame` that cannot exist independently.
   Is this aggregation or composition? How do you implement
   it in Java?

2. What are the three ways a dependency between class X and
   class Y can arise? Give a code example of each.

3. In UML, what is the difference in the diamond symbol
   for aggregation vs. composition?

4. Using Dennis's text analysis rules, identify the classes
   and relationships in: "A student borrows many books from
   the library. Each book has a title and an author."

5. Why is aggregation restricted to a tree hierarchy
   (no circular inclusion)?

---

---

# Lecture 10 — State Machine Diagrams

## Core Objective

Model event-driven, state-dependent object behavior using
UML State Machine Diagrams, including FSM limitations and
advanced features of Statecharts (Harel, 1990).

---

## Detailed Concept Breakdown

### 1. Stateless vs. Stateful Objects

**Stateless (state-independent / modeless):**
Objects that always respond the same way to any event,
regardless of prior history.
Example: A pure mathematical function, a Department class.

**Stateful (state-dependent / modal):**
Objects that react **differently** to the same event
depending on their current state.
Example: A Lamp (on/off), a Modem (dialing/sending/
receiving), a RentalVideo (rented/inStore/overDue).

**Why model state?** State machines help:

- Tackle complexity in event-driven systems
- Generate code automatically from the model
- Generate test cases systematically
- Document behavior for review and communication

---

### 2. Finite State Automaton (FSA/FSM)

A **Finite State Machine** captures the idea that an
object's behavior depends not just on the current input
but also on **past history** of inputs (captured as
internal state).

An FSM is characterized by:

- A finite set of **states**
- A set of **events** (inputs)
- **Transition function**: (state, event) → next state
- Optional: **actions** on transitions or in states

**Two standard FSM variants:**

| Variant | Output associated with    |
|---------|---------------------------|
| Moore   | States (entry into state) |
| Mealy   | Transitions               |

Example from slides (Lamp):

```
Moore:
  LampOff --on--> LampOn  (entry: display("on"))

Mealy:
  LampOff --on/display("on")--> LampOn
```

---

### 3. UML State Machine Diagram Syntax

**State:** Rounded rectangle with 3 compartments:

```
+--------------------+
|   State Name       |
|--------------------|
|  state variables   |
|--------------------|
| entry/ action      |
| exit/  action      |
| do/    activity    |
+--------------------+
```

**Predefined action labels:**

- `entry/` — Action performed when entering the state
- `exit/` — Action performed when leaving the state
- `do/` — Ongoing activity while in the state; runs until
  either the activity completes or the state is exited

**Transition:** Labeled arrow between states:

```
event [guard] / action
```

- `event` — what triggers the transition
- `[guard]` — Boolean condition that must be true
- `/action` — what to do when transition fires

**Special states:**

```
Initial pseudostate:   filled circle  (●)
Final state:           filled circle inside larger circle (⊙)
```

---

### 4. Event Types in UML

| Event Type | Description                          | Example           |
|------------|--------------------------------------|-------------------|
| Call event | Synchronous method invocation        | startAutopilot()  |
| Signal event | Asynchronous signal received       | collision signal  |
| Time event | After(duration) or When(time)        | after(2 seconds)  |
| Change event | When a boolean expression becomes true | when(temp>100) |

---

### 5. Guards

Guards are **Boolean predicates** that allow conditional
execution of transitions. Multiple transitions from the
same state on the same event can have different guards
— only the matching one fires.

```
Selling --bid[value < 100]--> Unhappy   (reject bid)
Selling --bid[value >= 200]--> Happy    (sell)
Selling --bid[(v>=100)&(v<200)]--> Happy (conditional sell)
```

---

### 6. Extended FSM (EFSM)

A plain FSM has only states and transitions. An **Extended
FSM** adds **variables** (memory) to the model, dramatically
reducing the number of states needed.

```
Example: Counting lamp presses
State: LampOn, LampOff
Variable: ctr (integer)

LampOff --on/ctr=ctr+1--> LampOn
```

Without EFSM, you would need separate states for
LampOn_1stPress, LampOn_2ndPress, etc.

The nested parenthesis example:

```
(/count=1      (/count++

Wait  <------  OK  (start)
  |    )[count==1]/count=0
  |    )[count>1]/count--
  v
 end
```

This is an EFSM because of the `count` variable.

---

### 7. Statecharts (Harel, 1990) — Beyond FSM

Standard FSMs suffer from:

- **State explosion:** For a Robot with N binary state
  variables, you need 2^N states. (Slides show ~12 variables
  → thousands of states)
- **No concurrent states:** Can't model two orthogonal
  behaviors simultaneously

Statecharts introduce:

**a) Hierarchy (Nested / Composite States)**

- **Superstate** contains substates (OR relationship)
- A transition from a superstate applies to ALL its substates
- This eliminates duplicated transitions
- History state (`H` or `H*`) lets the machine resume
  from where it was interrupted

```
[LampOff] --on--> [LampOn]
                      |
         +----------+--+----------+
         |                        |
    [FlashOff] --1sec--> [FlashOn]
```

A transition from the superstate `LampOn` with `off/`
covers all substates inside it.

**b) Orthogonal Regions (AND States)**

- Model **concurrent** aspects of the same object
- Separated by dotted lines within a composite state
- All regions react to the same events "simultaneously"

```
Person
+--------------------+---------+
| legalStatus        | financialStatus
|                    |
|  LawAbiding        |  Poor
|  Outlaw            |  Rich
+--------------------+---------+
```

Both regions are active simultaneously.
`robBank` event triggers a transition in BOTH regions.

**Common misuse:** Don't use orthogonal regions for
independent objects (two different Persons). Use them
only for two aspects of the **same** object.

**c) History State**

Allows resuming a nested state machine from where it
was interrupted (like "suspend/resume" logic).

```
Diagnosing
+-------------------------------------------+
|                                           |
| [Step11] -> [Step12]   [Step21] -> [Step22]|
|                                           |
+-------------------------------------------+
      ^  resume/
      |
    [H*]
      |
 suspend/ --> suspended
```

---

### 8. OR State vs. AND State

| Feature       | OR (Composite) State        | AND (Orthogonal) State    |
|---------------|-----------------------------|---------------------------|
| Also called   | Hierarchical / nested state | Concurrent / parallel state |
| Substates     | One active at a time        | All active simultaneously |
| Separator     | Normal UML regions          | Dotted lines              |
| Use case      | Alternative behaviors       | Independent parallel behaviors |
| Example       | Phone: Dialling vs Encoding | Person: age + legalStatus |

---

## Mental Model: Cruise Controller

```
           ignition On
[Idle] ----------------> [Initial]
  ^                           |
  | ignition Off              | Accel Pedal Pressed
  |                           v
  +<--ignition Off-- [Accelerating]
                         |        ^
            Cruise ON    v        | Brake / Cruise OFF
                    [Cruising] ---+
                         ^
                         | Cruise ON (resume)
                         +----------+
```

---

## Quiz Questions — L10

1. What are the two major limitations of standard FSMs
   that Statecharts (Harel 1990) overcome?

2. Explain the difference between a Moore automaton and
   a Mealy automaton. Which associates output with
   transitions and which with states?

3. In a UML state machine, what is the difference between
   `entry/`, `exit/`, and `do/` action labels?

4. A robot has 8 binary state variables. How many states
   does a standard FSM need? How does an EFSM help?

5. What is the difference between a superstate transition
   (group transition) and individual substate transitions?
   Why are group transitions preferable?

---

---

# Lecture 11 — Encoding State Machines &
#              Introduction to Interaction Diagrams

## Core Objective

Translate UML State Machine models into working code using
three approaches (nested switch, state table, design pattern),
and begin modeling object interactions with sequence diagrams.

---

## Detailed Concept Breakdown

### 1. Three Approaches to Encode FSMs

#### Approach 1: Doubly Nested Switch in Loop

```
while (TRUE) {
    switch (state) {
        case state1:
            switch (event) {
                case event1: state = state2; action(); break;
                case event2: ...
            }
        case state2: ...
    }
}
```

- The outer switch discriminates on **current state**
- The inner switch discriminates on **event type**
- State stored as a scalar variable (enum)
- **Drawback:** Difficult to handle concurrent states,
  composite states, and history states

#### Approach 2: State Table

A lookup table with columns: Present State, Event,
Next State, Actions.

```
| Present State | Event | Next State | Actions               |
|---------------|-------|------------|-----------------------|
| BTN_off       | e2    | BTN_on     | set red LED flashing  |
| BTN_on        | e2    | BTN_off    | reset red LED flashing|
```

- Clean and data-driven
- Easy to modify transitions without changing code logic

#### Approach 3: State Design Pattern

- Each **state is a class**
- **Transitions are handled by methods** in those classes
- The context object delegates to the current state object
- Most flexible for complex state machines with OO languages

---

### 2. General Code Generation Pattern

Any state machine generates code following this lifecycle:

```
Initialize Object
      |
      v
Wait for Event
      |
      v
Handle Event  <---(loop)
      |
      v
Terminate Object
```

---

### 3. Interaction Diagrams — Introduction

**What they model:** How a group of objects **collaborate**
to realize some behavior (a use case).

**Three kinds:**

| Diagram Type               | Focus                          |
|----------------------------|--------------------------------|
| Sequence Diagram           | Time ordering of messages      |
| Communication Diagram      | Object structure + messages    |
| Interaction Overview Diagram | Flow of control between interactions |

**Rule of thumb:** Draw **one sequence diagram per use case**.

---

### 4. Elements of a Sequence Diagram

```
         :ObjectA          :ObjectB
             |                 |
             |---message()---> |   <- synchronous (filled head)
             |                 |
             |<- - - return - -|   <- return (dashed)
             |                 |
             |===message()====>|   <- asynchronous (open head)
             |                 |
             |  <<create>>     :ObjectC  <- new object created
             |                 |
             X                     <- object destroyed
```

Key elements:

- **Lifeline:** Dashed vertical line below object box
- **Activation box:** Thick rectangle on lifeline —
  object is actively executing (method on stack)
- **Synchronous message:** Filled arrowhead —
  sender blocks and waits for return
- **Asynchronous message:** Open arrowhead —
  sender continues without waiting (callbacks)
- **Return:** Dashed arrow — optional, omit if obvious
- **`<<create>>`:** Object creation mid-diagram
- **`<<destroy>>`:** Object destruction (X at lifeline end)
- **`*`prefix:** Iteration (e.g., `*draw()` = loop)

---

### 5. Synchronous vs. Asynchronous Messages

**Synchronous:** The sender is **blocked** — it cannot
proceed until the receiver finishes handling the message.
Typical for method calls within a single thread.

**Asynchronous:** The sender **continues** executing
without waiting. Typical for event callbacks, timers,
message queues.

**Timer example from slides:**
A Timer object fires `actionPerformed()` to an
ActionListener **asynchronously** — the listener
registered itself and continued working while waiting.
When the Timer fires, the "callback" occurs.

---

## Mental Model: Sequence Diagram Structure

```
:Actor       :BoundaryObj    :Controller    :EntityObj
   |               |               |              |
   |---request()-->|               |              |
   |               |---process()-->|              |
   |               |               |---getData()-->|
   |               |               |<--data--------|
   |               |<--result------|              |
   |<--display()-  |               |              |
```

This is the classic Boundary → Controller → Entity
pattern (MVC-style).

---

## Quiz Questions — L11

1. What are the three approaches to encoding a state machine?
   When would you prefer State Design Pattern over nested
   switch?

2. In a sequence diagram, what is the visual difference
   between a synchronous and asynchronous message arrow?

3. What does an activation box (thick rectangle on a
   lifeline) represent?

4. Why is `<<destroy>>` rarely needed in Java sequence
   diagrams?

5. What is the "one sequence diagram per use case" rule,
   and why is it important for design consistency?

---

---

# Lecture 12 — Sequence Diagrams, OOAD, and
#              Domain Modelling

## Core Objective

Master advanced sequence diagram notation (frames,
combined fragments), derive class methods from interaction
diagrams, and apply the three-object-type model
(Boundary, Controller, Entity) in OOAD.

---

## Detailed Concept Breakdown

### 1. Sequence Diagram Frames

A **frame** wraps a sequence diagram or part of it.

Structure of a frame:

```
+------------------------------------------+
| sd  frame_name                           |
|                                          |
|  :obj1       :obj2       :obj3           |
|    |           |           |             |
|    |--msg1()-->|           |             |
|    |           |--msg2()-->|             |
+------------------------------------------+
```

A frame has:
1. **Operator** (top-left label, e.g., `sd`, `loop`, `alt`)
2. **Participants** with lifelines
3. **Messages** between participants

---

### 2. Combined Fragments — Frame Operators

Combined fragments allow sequence diagrams to model
programming control structures.

| Operator  | Meaning                                          |
|-----------|--------------------------------------------------|
| `alt`     | Alternative (if/else) — only matching guard runs |
| `loop`    | Repeat while guard is true; `loop(n)` = n times  |
| `opt`     | Optional — executes only if guard is true         |
| `par`     | Parallel — fragments execute concurrently         |
| `region`  | Critical — only one thread runs inside            |
| `ref`     | Reference — links to another sequence diagram     |
| `break`   | Interrupt — like a break in a loop               |
| `assert`  | Assertion — must always be true                  |

**Alt fragment example:**

```
alt
  [new_cust = yes]
    cr_custinfo()
  [new_cust = no]
    get_custinfo()
```

**Loop fragment + break example:**

```
loop
  [hasNext]
    item = getNext()
    test(item)
    [found]
      break
        process(item)
```

Equivalent Java:

```java
while (repository.hasNext()) {
    item = repository.getNext();
    if (test(item)) {
        process(item);
        break;
    }
}
```

---

### 3. Deriving Class Methods from Sequence Diagrams

This is a critical OOAD step: **the methods of a class
are determined from the messages sent TO that class
across all sequence diagrams.**

Rule: For every message arrow arriving at an object in
a sequence diagram → the receiving class must have that
method.

Example:

```
:RegistrationForm --addCourse(student, course)--> :RegistrationManager
```

Therefore `RegistrationManager` must have:
`addCourse(Student s, Course c)`

---

### 4. Collaboration / Communication Diagram

A **Communication Diagram** (called Collaboration Diagram
in UML 1.x) shows:

- **Structure:** Objects as boxes, links as lines
- **Behavior:** Messages as labeled arrows on links,
  prefixed with sequence numbers

It is **semantically equivalent** to a sequence diagram
but emphasizes **who talks to whom** rather than timing.

```
Sequence diagram          Communication diagram
(emphasizes time)         (emphasizes structure)

:A  :B  :C                :A ---1:msg1()--- :B
  |   |   |                      |
  1:msg1()                       |
      |   2:msg2()         :C ---2:msg2()---+
```

Use sequence diagrams when timing/order matters.
Use communication diagrams to show object network topology.

---

### 5. OOAD Process Overview

OOAD is **Iterative and Incremental**:

```
SRS Document
    |
    v
Use Case Diagram  --->  Domain Model  --->  Class Diagram
    |                                            |
    v                                            v
Interaction Diagram (Sequence)              Code
    |
    v
GUI Prototype
```

**OOA vs. OOD:**

| Phase | Focus                              | Implementation? |
|-------|------------------------------------|-----------------|
| OOA   | Elaboration of requirements        | No              |
| OOD   | Refinement of analysis model       | Yes (constraints)|

---

### 6. Three Types of Objects in Domain Model

#### Boundary Objects

- Handle **interaction between system and actors**
- Implemented as: screens, menus, forms, dialogs
- **Do NOT** perform processing; only validate/format
- One boundary object per **actor-use case pair**

#### Entity Objects

- Hold **persistent information** (long-term data)
- Examples: Book, BookRegister, Member
- "Dumb servers" — store, fetch, search, sort data
- Identified from **common nouns** in requirements

#### Controller Objects

- **Realize use case behavior**
- Interface between boundary and entity objects
- Contain **most business logic**
- One controller per use case (initially)
- Named after Smalltalk's MVC "Controller" concept

---

### 7. Entity Class Identification (Noun Analysis)

Steps:

1. Extract all **common nouns** from requirements
2. Eliminate:
   - **Actors/users** (external to system — e.g., accountant)
   - **Passive verbs / events** (e.g., acknowledgment)
   - Nouns with no **attributes** to store
   - Nouns with no **methods** to perform
3. Remaining nouns are candidate entity classes

**Example from slides:**

```
Requirements text:
"...product by its primary characteristics, including
name and product number. If bar code does not match...
error to message window and entered into error log.
Summary report of all transactions..."
```

Candidate nouns: user, product, bar code, error,
message window, error log, summary report, transaction

After filtering:

| Name           | Keep/Discard | Reason                     |
|----------------|--------------|----------------------------|
| User           | Discard      | Actor (external)           |
| Product        | Keep         | Has name, number, bar code |
| Error          | Keep         | Has id, message, timestamp |
| Transaction    | Keep         | Has id, date, quantity     |
| Message Window | Discard      | Boundary class (UI)        |
| Summary Report | Discard      | Output view (boundary)     |

---

## Mental Model: Boundary–Controller–Entity

```
       Actor
         |
         v
  [Boundary Object]      <-- UI: screens, forms, dialogs
         |
         v
  [Controller Object]    <-- Business logic, use case coord
       /    \
      v      v
[Entity]  [Entity]       <-- Data: store, fetch, search
```

One use case is realized through exactly this triangle.

---

## Comparison Table: Boundary vs. Controller vs. Entity

| Property         | Boundary           | Controller             | Entity              |
|------------------|--------------------|------------------------|---------------------|
| Purpose          | Interface with actor| Coordinate use case   | Store/manage data   |
| Business logic   | None / minimal     | Most of it             | Minimal             |
| Persistence      | No                 | No                     | Yes (long-term)     |
| Created per      | Actor-use case pair| Use case               | Problem domain noun |
| Examples         | LoginForm, OrderUI | OrderController        | Order, Customer     |
| Implementation   | Screen, dialog     | Service class          | Entity/model class  |
| UML stereotype   | `<<boundary>>`     | `<<control>>`          | `<<entity>>`        |

---

## Quiz Questions — L12

1. What are the five most important combined fragment
   operators in sequence diagrams? Give one example of
   each in pseudocode.

2. Explain how sequence diagrams determine which methods
   a class must have. Give a concrete example.

3. What is the key difference between a Sequence Diagram
   and a Communication Diagram? When would you choose one
   over the other?

4. In OOAD, what are the three object types in a domain
   model? What responsibility does each have?

5. Using noun analysis on the text: "A customer places
   an order for multiple products. Each product has a
   price and a stock level." — identify entity classes,
   and explain what you discard and why.

---

---

# Lecture 13 — OOAD in Depth & CRC Cards

## Core Objective

Apply the full OOAD process end-to-end on realistic
problems, and use CRC Cards to systematically assign
responsibilities to classes during complex use case
realization.

---

## Detailed Concept Breakdown

### 1. OOAD Design Process (Full Pipeline)

```
Start
  |
  v
SRS Document  --->  Glossary
  |
  v
Use Case Diagram
  |
  v
Domain Model  (identify Boundary, Controller, Entity)
  |
  v
Interaction Diagram (Sequence Diagram per use case)
  |
  v
Class Diagram  (methods from interaction diagrams)
  |
  v
Code
  |
  v
GUI Prototype / User Interface
```

This process is **iterative** — you cycle back as you
discover missing classes or responsibilities.

---

### 2. Identification Rules Summary

**Boundary Objects:**

- One per **actor-use case pair**
- If a use case has 2 actors, it has 2 boundary objects
- Named: `<UseCase><Actor>Boundary` or `<UseCase>Form`

**Controller Objects:**

- One per **use case** (initially)
- May be split if controller has too many responsibilities
- May be removed if use case is simple (no logic needed)
- Named: `<UseCase>Controller`

**Entity Objects:**

- From common nouns in requirements
- Must have both **attributes** (data to store) AND
  **methods** (operations to perform)
- Aggregate objects often correspond to "registers" in the
  physical world (e.g., CustomerRegister contains many
  CustomerRecords)
- Named: **singular nouns** (Student, not Students)

---

### 3. End-to-End Example: Tic-Tac-Toe

Use Case: Play Move (Player vs. Computer)

**Domain Model (Initial):** Board class only

**Refined Domain Model (with BCE):**

```
PlayMoveBoundary  <--->  PlayMoveController  <--->  Board
```

**Sequence Diagram:**

```
:PMBoundary    :PMController    :Board

acceptMove
    |---checkMoveValidity()------->|
    |<--[invalid]------------------|
    |---announceInvalidMove()
    |---move()-------------------->|
    |---checkWinner()------------->|
    |<--[game over]----------------|
    |---announceResult()
    |---playMove()---------------->|  (computer's turn)
    |---displayBoardPositions()---->|
```

**Class Diagram derived from above:**

```
PlayMoveBoundary          PlayMoveController    Board
  announceInvalidMove()     (delegates)         int position[9]
  announceResult()                              checkMoveValidity()
  displayBoard()                                checkResult()
  promptNextMove()                              playMove()
```

---

### 4. End-to-End Example: Supermarket Prize Scheme

Use Cases: Register Customer, Register Sales, Select Winners

**Initial Domain Model:**

```
CustomerRegister  1 --- * CustomerRecord
SalesHistory      1 --- * SalesRecord
```

**Refined Domain Model adds BCE objects:**

```
RegisterCustomerBoundary    RegisterCustomerController
RegisterSalesBoundary       RegisterSalesController
SelectWinnersBoundary       SelectWinnersController
```

**Register Customer Sequence:**

```
:RCBoundary  :RCController  :CustomerRegister  :CustomerRecord

register
  |---register()----------->|
  |                         |---checkDuplicate()
  |                         |   *match
  |                         |<--[duplicate]----|
  |<--showError()----------|
  |                         |---generateCIN()
  |                         |   create :CustomerRecord
  |<--displayCIN()---------|
```

---

### 5. CRC Cards

**CRC = Class–Responsibility–Collaborator**

Pioneered by Ward Cunningham and Kent Beck.
One index card per class with two columns:

```
+--------------------------------------------------+
| Class: BookRegister                              |
+------------------------+-------------------------+
| Responsibility         | Collaborator            |
|------------------------|-------------------------|
| FindBook               | Book                    |
| CreateBook             | Book                    |
| Reserve                | Book                    |
+------------------------+-------------------------+
```

**Purpose:**

- Systematize assignment of responsibilities (methods)
  to classes for complex use cases
- Facilitate team walkthroughs where members roleplay
  as classes and "pass control" to collaborators
- Surface missing responsibilities and classes early

**How CRC cards work:**

1. Create one card per class
2. For a use case, start with the initiating class
3. Identify what responsibility that class has
4. Identify which collaborator class it delegates to
5. Switch to that collaborator's card
6. Repeat until the use case is fully walked through
7. If no card has the needed responsibility → add new class

---

## Comparison Table: Initial vs. Refined Domain Model

| Step     | What it contains                         |
|----------|------------------------------------------|
| Initial  | Entity classes only (nouns from domain)  |
| Refined  | Entity + Boundary + Controller classes   |

The refined model is what feeds directly into the
sequence diagrams and ultimately the class diagram.

---

## Summary: OOAD Artifact Dependency Chain

```
Requirements
    |
    v
Use Case Diagram
    |
    +----> Domain Model (initial: entities only)
    |           |
    |           +----> Refined Domain Model (+ B + C)
    |                       |
    v                       v
Sequence Diagrams  -----> Class Diagram
(one per use case)         (methods from messages)
                               |
                               v
                             Code
```

---

## Quiz Questions — L13

1. What is the difference between an Initial Domain Model
   and a Refined Domain Model in OOAD?

2. How many boundary objects do you create for a use case
   with two actors? Why?

3. What is a CRC card? What three things does it contain,
   and what role does it play in OOAD?

4. In the Supermarket Prize Scheme example, why does the
   SelectWinners use case need to access both SalesHistory
   and CustomerRegister? Trace through the sequence diagram.

5. When should a Controller object be split into two or
   more controllers? When might it be removed entirely?

---

---

# Cross-Lecture Connections

## How the Lectures Fit Together

```
L9: UML Class Relations
  (Aggregation, Composition, Dependency — static structure)
          |
          v
L10: State Machine Diagrams
  (Dynamic behavior of individual objects — events, states)
          |
          v
L11: Encoding State Machines + Intro Sequence Diagrams
  (Code generation + how objects collaborate over time)
          |
          v
L12: Advanced Sequence Diagrams + OOAD Intro
  (Combined fragments + Boundary/Controller/Entity model)
          |
          v
L13: Full OOAD + CRC Cards
  (End-to-end: requirements → domain model → code)
```

---

## Master Comparison: All UML Diagram Types Covered

| Diagram             | What it models             | Static/Dynamic |
|---------------------|----------------------------|----------------|
| Class Diagram        | Structure of classes        | Static         |
| State Machine Diagram| Single object behavior      | Dynamic        |
| Sequence Diagram     | Object collaboration, time  | Dynamic        |
| Communication Diagram| Object collaboration, structure | Dynamic   |
| Interaction Overview | High-level flow of interactions | Dynamic   |

---

## Quick-Reference: UML State Machine Syntax

```
Event [Guard] / Action

entry/ <action>     -- on entering state
exit/  <action>     -- on leaving state
do/    <activity>   -- while in state

Initial state:  filled circle
Final state:    filled circle in larger circle
History:        H  (shallow)  or  H*  (deep)
```

---

## Quick-Reference: Sequence Diagram Arrow Types

```
Synchronous:   ---msg()-->   filled arrowhead, sender blocks
Asynchronous:  ===>msg()=>   open arrowhead, sender continues
Return:        - - - - ->   dashed arrow (optional)
Create:        ---<<create>>-->   to new object
Destroy:       ---<<destroy>>-->  ends with X on lifeline
Iteration:     *msg()             loop prefix
```

---

*End of Study Guide — Good luck on your quiz!*
