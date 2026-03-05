# MCQ Answer Key
## Software Engineering — Lectures 2–10

**Source:** final.pdf (Lectures 2–10 Compressed Edition)

---

## Overview

This document provides answers and justifications for all 105 MCQs.
Each entry lists the question ID, correct option(s), and a brief
explanation grounded in the source material.

---

## Answers

---

### Q1 — SDLC Activity Spanning All Stages

**Answer: c) Project management**

Project management encompasses planning, tracking, staffing, and
control across every phase of the SDLC. Coding, testing, design, and
requirements specification are each confined to specific phases.

---

### Q2 — Unit Testing Phase in Waterfall

**Answer: a) Implementation phase**

The PDF states: "Each module is coded, unit-tested independently
(as a stand-alone unit), debugged, and documented. Unit testing is
in-phase." The implementation/coding phase owns unit testing;
integration testing belongs to the next phase.

---

### Q3 — Maximum Effort Phase During Development

**Answer: b) Testing**

Per the Relative Effort Distribution in the PDF: "Testing: ~15%
(highest among dev phases)." Among development-only phases
(feasibility through testing), testing consumes the most effort.

---

### Q4 — Advantages of Iterative Waterfall

**Answer: a, b, c, d**

The iterative waterfall inherits all classical waterfall strengths:
easy to understand, well-understood milestones, requirements
stability, and strong management control. Options f and g
(continual integration, continual customer interactions) are
characteristics of Agile/IID, not the iterative waterfall.

---

### Q5 — When Waterfall is Appropriate

**Answer: a, b, c**

The PDF lists waterfall's "When to use" criteria as: requirements
stable and well-understood, technology is known, team is
experienced. An aggressive delivery date (d) and substantial
reuse (e) are not listed as waterfall indicators.

---

### Q6 — NOT Shortcomings of Iterative Waterfall

**Answer: e, f**

The PDF lists actual waterfall weaknesses as: all requirements must
be known upfront (a), can give false impression of progress (b),
big-bang integration at the end (c), and little customer preview (d).
"Inadequate documentation" (e) is the opposite — the PDF says
waterfall produces "good documentation." "Number of phases
ill-defined" (f) is not mentioned anywhere in the source.

---

### Q7 — Benefits of Systematic Process over Build-and-Fix

**Answer: c) Increased maintainability**

Adopting a systematic SDLC model ensures documentation of all
phases, modularity, and design discipline — all of which
improve maintainability. The PDF notes: "Development:Maintenance
effort is typically 40:60," and good process reduces that burden.
Increased documentation overhead (a) is a cost, not a benefit.

---

### Q8 — Prototyping Model Risk

**Answer: c) Incomplete and uncertain requirements**

The PDF states prototyping is used "when requirements are only
partially known." Building a prototype clarifies ambiguous
requirements before actual development begins.

---

### Q9 — Activity Spanning All SDLC Stages

**Answer: c) Project management**

Same reasoning as Q1. Project management spans the entire
lifecycle; all other options are phase-specific activities.

---

### Q10 — Operation Phase Synonym

**Answer: c) Maintenance phase**

The maintenance phase is also called the "operation phase" in some
literature. It is the post-deployment phase where the delivered
software is corrected, improved, and adapted.

---

### Q11 — Unit Testing Phase

**Answer: a) Implementation phase**

Same as Q2. The PDF explicitly places unit testing within the
"Coding & Unit Testing" phase — i.e., the implementation phase.

---

### Q12 — Maximum Effort Phase

**Answer: b) Testing usually**

Among development-only phases, testing accounts for the highest
effort (~15%). The word "usually" is correct since maintenance
(not listed here) dominates the full lifecycle at ~60%.

---

### Q13 — Characteristics of Agile Development

**Answer: a, b, d**

The PDF describes agile as: incremental (a), iterative (b), and
requiring customer participation — e.g., an on-site customer (d).
Linear development (c) is waterfall's characteristic, not agile.
Development at customer site (e) is not required; co-location
of the team is preferred but not at the customer's premises.

---

### Q14 — Agile Approach per Increment

**Answer: c) Something of business-value delivered, with right
quality**

The PDF states agile delivers working software of business value
in short iterations. "Quick and dirty" (a) is RAD's approach.
Requiring complete documentation sign-off (d) is waterfall-style.

---

### Q15 — NOT Characteristics of Agile

**Answer: d, f**

Postponing integration (d) contradicts agile's continuous
integration practice. Rapid prototyping (f) is associated with
RAD, not agile. Shared ownership (a), simplest solution (b),
continual customer feedback (c), and pair programming (e) are
all genuine agile/XP practices per the PDF.

---

### Q16 — Daily Scrum Questions

**Answer: a, b, c**

The PDF explicitly lists the three Daily Scrum questions as:
(1) What did you do yesterday? (2) What will you do today?
(3) What obstacles are in your way? Options d and e are not
part of the Daily Scrum format.

---

### Q17 — NOT True of Scrum Development

**Answer: c) Sprint backlog is modified during a Sprint based
on customer feedback**

The PDF states: "No external changes are permitted during a
Sprint." The Sprint Backlog is modified only by the team, and
the Product Owner cannot push new items mid-Sprint.

---

### Q18 — NOT True of Build-and-Fix

**Answer: a) Coding starts immediately after requirements
specification**

Build-and-fix is characterized by starting coding without any
formal requirements specification (b), no formal design (c),
and no formal requirements document (e). Statement (a) is
incorrect because build-and-fix skips the requirements
specification step entirely — it does not follow it.

---

### Q19 — Stakeholders in a Software Project

**Answer: c, d, e, f, g**

A stakeholder is anyone with an interest in the software.
This includes clients defining requirements (d), developers
of outsourced parts (e), the development team (f), and users
(g). "Anyone who is interested" (c) is the broadest definition.
Shareholders of the developing organization (a) and client
organization (b) are investors, not direct stakeholders in the
software development sense used in the PDF.

---

### Q20 — Requirements Analysis and Specification Phase

**Answer: a, c, e**

The PDF describes this phase as: (1) Requirements Gathering —
interviews/discussions with users (a); (2) Requirements Analysis
— resolving contradictions/ambiguities (c); then producing the
SRS document (e). Building a prototype (b) belongs to the
Prototyping model. Resource allocation (d) is a project
management task.

---

### Q21 — Pair Programming Extreme Practice

**Answer: c) Code review**

The PDF states under XP: "Code review is good? → Always review =
PAIR PROGRAMMING." Pair programming takes code review to its
logical extreme by making it continuous and mandatory.

---

### Q22 — NOT Goals of Requirements Analysis

**Answer: c, e**

Requirements analysis focuses on resolving ambiguity (a),
inconsistency (b), and incompleteness (d). Weeding out
non-functional requirements (c) is wrong — these must be
retained, not removed. Weeding out third-party references (e)
is not a requirements analysis goal in the PDF.

---

### Q23 — Characteristics of Agile Development

**Answer: a, b, e**

Agile exhibits incremental development (a), iterative development
(b), and test-driven development (TDD) (e) as per XP practices.
Linear development (c) is waterfall. Frozen requirements (d)
and module integration at end (f) are anti-agile practices.

---

### Q24 — Agile Approach per Increment

**Answer: c) Business value delivered quickly with right quality**

Same reasoning as Q14. Agile prioritizes delivering business
value in working software each iteration — not quick-and-dirty
shortcuts (a), not documentation-gate releases (d), and not
partial artifacts like specs or test cases alone (e).

---

### Q25 — SRS Should Avoid Discussing

**Answer: c) Design specification**

The SRS is a black-box view of the system. It documents what
the system must do (functional/non-functional requirements,
constraints, interfaces) but must not prescribe how to build it.
Design specification belongs to the Design phase, not the SRS.

---

### Q26 — Requirement Type: Import JPEG into Document

**Answer: a) Functional requirement**

This requirement describes a specific capability — importing a
JPEG file — which maps an input (a JPEG file) to a system
behaviour (import into document). This is a functional/
behavioural requirement per the PDF's definition.

---

### Q27 — FALSE Assertion About Functional Requirements

**Answer: b) A functional requirement is also called a structural
requirement**

Functional requirements are also called "behavioural requirements"
(true — option a). They describe input-output mappings (d, true).
They consist of multiple scenarios (c, true). Calling them
"structural requirements" (b) is false; that term refers to
design structure, not requirements.

---

### Q28 — Requirement Type: Register Vehicles

**Answer: a) Functional requirement**

The requirement describes a specific function the system must
perform: allowing employees to register vehicles. This is
a direct input-to-output behavioural specification — a
functional requirement.

---

### Q29 — Requirement: Web Browser as Front End

**Answer: c) Design constraint**

Mandating a specific technology (web browser) as the front end
restricts how the system must be built. This constrains the
design rather than describing what the system does — making it
a design constraint.

---

### Q30 — When is Requirements Specification Carried Out

**Answer: d) After requirements analysis activity**

The PDF's flow is: Requirements Gathering → Requirements Analysis
(resolving ambiguities/inconsistencies) → then producing the
SRS document. Specification follows analysis, not precedes it.

---

### Q31 — Source of Requirements for Generic Product

**Answer: c) Sales personnel**

For generic (off-the-shelf) products, requirements come from
market analysis. Sales personnel understand market needs and
customer demand — they are typically the source. There is no
single customer client commissioning the product.

---

### Q32 — NOT Requirements Gathering Techniques

**Answer: d, e**

Requirements review (d) is a verification/quality activity, not
a gathering technique. Requirements analysis (e) is the phase
that follows gathering — it is not a gathering technique itself.
Task analysis (a), scenario analysis (b), and form analysis (c)
are standard elicitation techniques.

---

### Q33 — NOT Focus of Requirements Analysis

**Answer: d, e**

Requirements analysis focuses on inconsistency (a), ambiguity (b),
and incompleteness (c) per the PDF. Unstructuredness (d) and
grammar/sentence issues (e) are editorial concerns, not the
analytical focus of requirements analysis.

---

### Q34 — View Implicit in SRS

**Answer: a) Black box**

An SRS describes external behaviour — what the system does —
without revealing internal implementation. This is the classic
black-box view. White box, grey box, and glass box all imply
knowledge of internal structure.

---

### Q35 — SRS Should Avoid

**Answer: c) Design specification**

Same as Q25. An SRS captures requirements (what), not design
(how). Design specification belongs to the subsequent Design
phase.

---

### Q36 — Requirement Type: Convert to HTML

**Answer: a) Functional requirement**

Same reasoning as Q26. Converting a file to HTML is a specific
capability — a defined input/output behaviour — making it a
functional requirement.

---

### Q37 — Data Exchange Between Modules

**Answer: a) Coupling**

The PDF defines coupling as "the degree of interdependence
between two modules" and measures data interchange between them.
Cohesion measures internal strength of a single module.

---

### Q38 — Best Type of Cohesion

**Answer: d) Functional**

The PDF's cohesion scale lists Functional as the highest (best)
form. "Every element cooperates to achieve exactly ONE function."

---

### Q39 — Characteristics of Good Module Design

**Answer: a) High cohesion, low coupling**

The PDF states: "Modules should display HIGH COHESION and LOW
COUPLING." High cohesion means strong internal focus; low
coupling means minimal inter-module dependencies.

---

### Q40 — Best (Most Desirable) Module Coupling

**Answer: c) Data coupling**

The PDF's coupling scale (best to worst): Data > Stamp > Control
> Common > Content. Data coupling, using only elementary
parameters, is the most desirable form.

---

### Q41 — Worst Type of Module Coupling

**Answer: e) Content coupling**

Content coupling is the worst because one module directly accesses
or modifies another's internal data, completely breaking
encapsulation. The PDF labels it "worst."

---

### Q42 — Worst Type of Module Cohesion

**Answer: d) Coincidental cohesion**

The PDF's cohesion scale (lowest to highest) places Coincidental
at the bottom: "random collection of unrelated functions grouped
by coincidence. Worst possible cohesion."

---

### Q43 — Coupling Where Complete Data Structures Are Passed

**Answer: b) Stamp coupling**

The PDF: "Modules communicate via a composite data item
(struct/array). The callee may use only some fields, but the
entire structure is passed."

---

### Q44 — Cohesion When All Tasks Execute in Same Time-Span

**Answer: c) Temporal cohesion**

The PDF describes temporal cohesion as: "All tasks execute in the
same time-span (startup/shutdown), but are otherwise unrelated."
Example: systemStartup() grouping unrelated initialization tasks.

---

### Q45 — Coupling Order: Strongest to Weakest

**Answer: a) content, common, control, stamp, data**

The PDF's coupling scale from worst (strongest/least desirable)
to best (weakest/most desirable): Content > Common > Control >
Stamp > Data.

---

### Q46 — What is Designed During Detailed Design

**Answer: b) Data structures and algorithms**

The PDF's table: "Detailed Design — Define data structures per
module; Define algorithms per module." Module hierarchy, control
structure, and interfaces belong to High-Level Design.

---

### Q47 — NOT Carried Out During High-Level Design

**Answer: c, e**

The PDF states HLD outputs are: module structure, control
relationships, and interfaces. Algorithms (c) and data structures
(e) for individual modules belong to Detailed Design, not HLD.

---

### Q48 — Carried Out During Detailed Design

**Answer: c, e**

Detailed design covers: algorithms per module (c) and data
structures per module (e). Module structure (a), call
relationships (b), and interfaces (d) are HLD activities.

---

### Q49 — Functional Independence

**Answer: a) High cohesion and low coupling**

The PDF: "A module is functionally independent when it has high
cohesion and low coupling. It performs one well-defined task,
needs minimal help from other modules."

---

### Q50 — Magic Number 7 in Abstraction

**Answer: c) Each node should have at most seven children**

The PDF references the "magic number 7" in the context of DFD
decomposition: "3–7 bubbles per level — matches human cognitive
limits." Each decomposition node should have at most 7 children
to stay within human cognitive capacity.

---

### Q51 — Characteristics of Build-and-Fix Model

**Answer: a, b, c, d, e**

All options describe build-and-fix: coding without understanding
requirements (a), no formal design (b), no documentation (c),
no proper testing (d), and poor code quality (e) are all
consequences of the unstructured exploratory approach.

---

### Q52 — Why Effort Grows Exponentially in Exploratory Dev

**Answer: c, d**

Without decomposition (d), the system cannot be broken into
manageable parts. Without abstraction (c), complexity cannot be
hidden. Together they cause effort to grow exponentially because
the entire system must be understood simultaneously.

---

### Q53 — Essential Practices for Structured Programs

**Answer: a, c, d, f**

Structured programming requires adequate indentation (a),
adequate commenting (c), decomposition into modules (d), and
avoiding GOTO statements (f). Assembly language (b) is not
a structured programming practice. Testing (e) is important
but is not a programming style practice.

---

### Q54 — Why Maintained Software Becomes Less Maintainable

**Answer: d, f**

Code fixes that address symptoms without understanding the root
cause (d) introduce latent errors. Each patch adds unstructured
code, making the codebase more unstructured over time (f).
These two factors progressively degrade maintainability.

---

### Q55 — Importance of Code Understandability

**Answer: c, d, e**

Understandable code facilitates testing (c), maintenance (d),
and debugging (e). It does not inherently improve runtime
efficiency (a) or reduce code size (b).

---

### Q56 — Software Service-Type Projects

**Answer: a, b**

Service-type projects involve maintaining existing software (a)
or customizing it for a new client (b). Developing new software
for a client (c), off-the-shelf products (d), or innovative
embedded applications (e) are product-type or bespoke projects.

---

### Q57 — Implications of Limited Short-Term Memory

**Answer: c, d**

The magic number 7 principle implies difficulty handling many
unrelated variables simultaneously (c) and debugging programs
with many unrelated variables (d). Related variables can be
chunked; unrelated ones cannot — exceeding cognitive capacity.

---

### Q58 — Principle: Software as Loosely Coupled Modules

**Answer: b) Decomposition**

Breaking software into loosely coupled, independent modules is
an application of the decomposition principle — dividing a
complex system into manageable, independent parts.

---

### Q59 — Multiple Map Views of a Country

**Answer: a) Abstraction**

Each map type (political, physical, climate, etc.) captures only
relevant aspects while ignoring the rest. This is the definition
of abstraction — modelling only what matters for a given context.

---

### Q60 — Factors Driving Service-Type Projects

**Answer: a, b, c**

Reusable code from past projects (a), customer demands for
shorter delivery (b), and similar requirements across projects (c)
all drive organizations toward service/customization projects.
New languages (e) and qualified manpower (f) are general trends,
not specific drivers of service-type work.

---

### Q61 — Milestones in a Project

**Answer: a, b, e**

The PDF: "Every phase has formally defined entry criteria (a) and
exit criteria (b)... These criteria form the milestones that
project managers use to track progress." Project completion (e)
is also a milestone. Abstraction and decomposition (c, d) are
design principles, not milestones.

---

### Q62 — Why Late Defect Removal Costs More

**Answer: c) Larger amount of rework required**

The PDF's core iterative waterfall principle: "The later an error
is found, the exponentially higher the rework cost." A defect
found in testing requires reworking design, code, and tests —
whereas the same defect caught during design requires only a
design fix.

---

### Q63 — Activities During Feasibility Study

**Answer: a, b, c**

The PDF describes feasibility as: understanding the problem (a),
formulating alternative solution strategies (b), and comparing
them to determine acceptability (c). Completing the SRS document
(d) and reviewing it (e) belong to the Requirements phase, which
comes after feasibility.

---

### Q64 — Types of Software Maintenance

**Answer: b, c, d**

The PDF lists three maintenance types: Corrective (b) — fix bugs,
Perfective (c) — improve/add features, Adaptive (d) — port to
new environment. Regression testing (a) and performance/
functional testing (e, f) are testing activities, not maintenance
types.

---

### Q65 — Build-and-Fix in Commercial Development

**Answer: a, b, c**

Build-and-fix causes effort (a), cost (b), and time (c) to grow
exponentially with software size due to lack of abstraction and
decomposition. Options d and e (linear cost/time) are incorrect.
The "99% complete syndrome" (f) is a waterfall problem, not
specifically build-and-fix.

---

### Q66 — Why Late Defect Detection Costs More

**Answer: c) Larger amount of rework required**

Same reasoning as Q62. Late detection means more downstream
artifacts must be reworked. This is the primary technical reason,
not interest rates (a), inflation (b), or structural degradation
over time (e).

---

### Q67 — Major Waterfall Shortcomings

**Answer: b, f**

The PDF lists waterfall weaknesses including: requires complete
upfront requirements (b) and delivers the product as one big
release at the end (f — "Integration is a big bang at the end").
Options c, d are process strengths, not weaknesses. Option e
is not a stated waterfall characteristic.

---

### Q68 — When is Code Review Done in Waterfall

**Answer: b) After coding is complete and the code compiles**

In waterfall, code review is a quality gate within the Coding &
Unit Testing phase — it occurs after the code is written and
compiles successfully, but before or alongside unit testing.

---

### Q69 — Exit Criteria for Coding Phase

**Answer: a, b, d**

Exit criteria for the coding phase typically include: unit
testing complete (a), code review complete (b), and code
documentation complete (d). Integration testing (c) and system
testing (e) belong to the next phase. Module specification (f)
is a design-phase deliverable.

---

### Q70 — V Model: Integration Test Cases Designed In

**Answer: b) High-level Design**

The PDF's V Model structure maps: "Architecture/High-Level Design
↔ Integration Testing." Integration test cases are planned
during the High-Level Design phase on the left side of the V.

---

### Q71 — Pair Programming Extreme Practice

**Answer: c) Code review**

Same as Q21 and Q81. XP takes code review to the extreme by
making it continuous through pair programming.

---

### Q72 — How Agility is Achieved

**Answer: b, d**

Agility is achieved by fitting the process to the project (b)
rather than forcing a rigid methodology, and by avoiding
activities that waste time (d) such as excessive documentation.
Elaborate documentation (a) and rigorous planning (c) are
waterfall traits. Postponing integration (e) is anti-agile.

---

### Q73 — CRM Customization for American Bank

**Answer: c) Iterative waterfall model**

This is a customization project with ~70% reuse, known
technology, and mostly understood requirements (similar to a
past project). The iterative waterfall is the standard choice
for well-understood projects needing some rework management.
Agile/Scrum would be chosen if requirements were highly volatile.

---

### Q74 — Characteristics of Agile

**Answer: a, b, d**

Agile features incremental (a), iterative (b), and test-driven
(d) development. Linear development (c) is waterfall. Planned
development (e) contradicts the agile value of responding to
change over following a fixed plan.

---

### Q75 — Agile Approach per Increment

**Answer: c) Business value with right level of quality**

Same reasoning as Q14 and Q24. Agile manifesto values working
software over documentation and responding to change — but not
at the expense of quality. "Quick and dirty" belongs to RAD.

---

### Q76 — NOT Characteristic of Agile

**Answer: d, e**

Postponing integration (d) contradicts continuous integration in
agile/XP. Rigorously planned development (e) is a plan-driven/
waterfall characteristic. The Agile Manifesto values responding
to change over following a plan.

---

### Q77 — Communication Modes Least to Most Effective

**Answer: c) b a d c e**

The PDF states Agile's preference: "Face-to-face at whiteboard >
phone > email > documents." Ranking from least to most effective:
paper documents (b) < audiotape (a) < video conferencing (d) <
face-to-face (c) < face-to-face at whiteboard (e) = b a d c e.

---

### Q78 — NOT Expected Scrum Daily Meeting Question

**Answer: c, e**

The three expected questions are: What did you do yesterday (a),
What will you do today (b), What obstacles are in your way (d).
"Why are you getting delayed?" (c) and "How do you rate your
contribution?" (e) are not part of the daily Scrum format. The
PDF notes: "Daily Scrum is NOT a status check."

---

### Q79 — NOT True of Sprints in Scrum

**Answer: b, d**

Sprints do not overlap (b) — each sprint is sequential and
time-boxed. The Sprint Backlog cannot be modified mid-sprint
based on customer feedback (d); the PDF says "No external changes
are permitted during a Sprint."

---

### Q80 — Requirements Analysis Activity in Waterfall

**Answer: c) Identify ambiguity, inconsistency, incompleteness**

Requirements analysis specifically resolves ambiguities,
inconsistencies, and incompleteness (c). Identifying requirements
(a) is requirements gathering. Building a prototype (b) belongs
to the prototyping model. Resource allocation (d) is project
management. Documenting in the SRS (e) is requirements
specification, which follows analysis.

---

### Q81 — Pair Programming Extreme Practice

**Answer: c) Code review**

Same as Q21, Q71. XP: "Code review is good? → Always review =
PAIR PROGRAMMING."

---

### Q82 — How Agility is Achieved

**Answer: b, d**

Same as Q72. Process fit (b) and waste avoidance (d) are
the two mechanisms. Documentation (a) and rigid planning (c)
oppose agility. Postponing integration (e) is anti-agile.

---

### Q83 — Focus of Requirements Analysis

**Answer: a, b, e**

The PDF: Requirements Analysis resolves contradictions and
ambiguities (a), inconsistencies (b), and incompleteness (e).
Non-functional requirements (c) must be retained, not removed.
Functional requirements (d) must also be retained.

---

### Q84 — SRS Should Avoid

**Answer: c, e**

An SRS documents what the system must do, not how. Design
specification (c) belongs to the Design phase. Team members
and roles (e) belong to a project plan, not an SRS. Functional
requirements (a), non-functional requirements (b), and
implementation constraints (d) are all valid SRS content.

---

### Q85 — Requirement: Convert File to HTML

**Answer: a) Functional requirement**

Same reasoning as Q26 and Q36. Converting a file to HTML is a
specific capability — a defined input-to-output behaviour.
This is a functional/behavioural requirement.

---

### Q86 — FALSE Assertions About Functional Requirements

**Answer: b, e**

System reliability for safety-critical systems (b) is a
non-functional requirement, not functional. Specifying the
programming language (e) is a design constraint, not a
functional requirement. Options a, c, d are all true statements
about functional requirements per standard definitions.

---

### Q87 — Requirement: Camera Detects Vehicle at Gate

**Answer: a) Functional requirement**

This describes a specific system behaviour: camera detects
incoming vehicle, system checks registration, gate opens only
for registered vehicles. This is an input-to-output functional
specification — a functional requirement.

---

### Q88 — Requirement: Web Browser as Front End (Mandatory)

**Answer: d) Design constraint**

Mandating that a web browser must be used as the front end
constrains the design solution. It specifies a technology
choice that restricts implementation — a design constraint.

---

### Q89 — When Requirements Specification is Carried Out

**Answer: b) Immediately after requirements analysis is complete**

The waterfall flow: Requirements Gathering → Requirements
Analysis → Requirements Specification (SRS document). The SRS
is produced after analysis resolves ambiguities, not before.

---

### Q90 — NOT a Requirements Gathering Technique

**Answer: e) SRS document review**

SRS review is a quality assurance activity on an already-written
document, not a technique for gathering requirements from
stakeholders. All others (task analysis, scenario analysis,
form analysis, reviewing similar software, customer write-up)
are gathering or elicitation techniques.

---

### Q91 — NOT Focus of Requirements Analysis

**Answer: a, e**

Requirements analysis targets inconsistency (b), ambiguity (c),
and incompleteness (d). Unstructuredness (a) and incompactness
(e) are not listed as requirements analysis concerns in the PDF.

---

### Q92 — View Implicit in SRS

**Answer: a) Black box**

Same as Q34. An SRS describes external behaviour only — inputs
and outputs — without revealing internal implementation. This
is the black-box view by definition.

---

### Q93 — Definition of Cohesion

**Answer: b) The degree to which elements of a module belong
together**

The PDF defines cohesion as "functional strength of a module —
how closely its internal elements are related." Option a
describes coupling. Option e describes coupling as well.

---

### Q94 — Definition of Common Coupling

**Answer: a) Two modules share global data**

The PDF: "Two or more modules share global data. Any module can
read or modify the shared variable." This is common coupling.

---

### Q95 — Module Exposes Internal Data Structures

**Answer: c) Content coupling**

Content coupling is when "one module directly accesses or
modifies internal data of another module." Exposing internal
data structures for use by other modules is content coupling —
the worst type.

---

### Q96 — Extent of Data Exchange Between Modules

**Answer: f) Coupling**

Same as Q37. Coupling measures the degree of interdependence
and data interchange between two modules.

---

### Q97 — Best Form of Cohesion

**Answer: i) Functional**

Same as Q38. Functional cohesion is the best (highest) form.
Every element cooperates to achieve exactly one well-defined
function.

---

### Q98 — Good Software Design Characteristics

**Answer: f) High cohesion, low coupling**

Same as Q39. The PDF explicitly states: "Modules should display
HIGH COHESION and LOW COUPLING."

---

### Q99 — Preferred Coupling Type When Coupling is Needed

**Answer: h) Data coupling**

Same as Q40. Data coupling, using only elementary parameters,
is the most desirable (weakest/best) form of coupling per the
PDF's coupling scale.

---

### Q100 — Worst Type of Module Coupling

**Answer: e) Content coupling**

Same as Q41. Content coupling — directly accessing another
module's internals — is the worst type.

---

### Q101 — Worst Type of Module Cohesion

**Answer: d) Coincidental cohesion**

Same as Q42. Coincidental cohesion groups unrelated functions
randomly — the lowest (worst) form on the cohesion scale.

---

### Q102 — All Functions Execute in Same Time-Span

**Answer: b) Temporal cohesion**

Same as Q44. Temporal cohesion: all tasks execute in the same
time-span (e.g., startup or shutdown) but are otherwise
unrelated to each other.

---

### Q103 — Coupling Order: Strongest to Weakest

**Answer: a) Content, common, control, stamp, data**

Same as Q45. The PDF's coupling hierarchy from worst to best:
Content > Common > Control > Stamp > Data.

---

### Q104 — Designed During Detailed Design

**Answer: a, c**

The PDF: "Detailed Design — Define data structures per module (a),
Define algorithms per module (c)." Call relationships (b) and
interfaces (d, e) belong to High-Level Design.

---

### Q105 — Achieved During High-Level Design

**Answer: a, c, e**

HLD achieves: module identification (a), control relationships
among modules (c), and interfaces among modules (e). Data
structures (b) and algorithms (d) belong to Detailed Design.

---

## Summary

- **SDLC Models:** Waterfall, iterative, V, prototyping, agile,
  scrum, XP — Q1–Q18, Q61–Q79.
- **Requirements:** Gathering, analysis, specification, SRS —
  Q19–Q35, Q80–Q92.
- **Design Principles:** Cohesion, coupling, HLD vs. detailed —
  Q37–Q50, Q93–Q105.
- **Key Rules:**
  - Best cohesion: **Functional**; worst: **Coincidental**
  - Best coupling: **Data**; worst: **Content**
  - Good modules: **High cohesion + Low coupling**
  - Coupling order (worst→best): Content > Common > Control
    > Stamp > Data
  - Unit testing is in the **Implementation/Coding phase**
  - SRS avoids **design specification** (black-box view)
  - Pair programming = **code review** taken to the extreme
  - Daily Scrum: 3 questions only (yesterday/today/obstacles)
  - No changes to Sprint Backlog mid-Sprint in Scrum
