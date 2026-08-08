# AI SDLC DPF Combined Publication

**AI SDLC DPF 1.0.1 Working Release**

Working-kit assembly date: **2026-08-01**

This book is the primary combined reading path through the controlled DPF release. It preserves the normative DPF pattern text and places selected reference, profile, application and informative carriers behind explicit authority labels. It is a generated reading projection, not a byte-complete concatenation of every companion file; Traceability and the historical Quick Start remain linked standalone carriers.

## Contents

1. [О документе](#chapter-1)
   - [Historical Quick Start note](#quick-start)
2. [Как использовать комплект](#chapter-2)
3. [Domain и authority architecture](#chapter-3)
4. [AI SDLC DPF](#chapter-4)
5. [Reference Architecture](#chapter-5)
6. [Reference Process](#chapter-6)
7. [Primary Application Profile](#chapter-7)
8. [Application Guide](#chapter-8)
9. [Glossary](#chapter-9)
10. [Worked Examples](#chapter-10)
11. [Sources and maintenance](#chapter-11)
12. [Open Questions](#chapter-12)

<a id="chapter-1"></a>

# 1. О документе

> **Authority status:** informative publication wrapper. It does not create domain rules.

AI SDLC DPF is a domain framework for designing, adapting and improving agentic processes for developing software systems. This volume gives a single navigation path while preserving the authority boundary of every included carrier.

Only the ten E8-normalized general patterns in Chapter 4 are normative when selected. Chapters 5–6 are bounded references, Chapter 7 is a bounded profile, Chapter 8 and the examples are informative, and Chapters 9–12 support interpretation, evidence and maintenance.

The kit is not an Organization LPF, project-specific process, performed work, standard, compliance result, product assurance case or ready-made agent configuration.

<a id="quick-start"></a>

## Historical Quick Start note

The former [QUICKSTART.md](QUICKSTART.md) is retained as historical, non-operational material. It is not an entry route for current Engineering Work Kit initiatives and its legacy carrier names and status vocabulary do not define the current project contract.

Current Work Kit execution begins with the [`ENGINEERING_WORK_BOOTSTRAP_GUIDE.md`](../ENGINEERING_WORK_BOOTSTRAP_GUIDE.md), an admitted Work Context and Entry Decision, followed by the [`WORKING_PROCESS_AND_LOOPS_GUIDE.md`](../WORKING_PROCESS_AND_LOOPS_GUIDE.md). Framework content in this publication is selected inside that authorized project-specific process.

<a id="chapter-2"></a>

# 2. Как использовать комплект

> **Authority status:** informative reading and application guidance.

1. Read Chapter 3 to recover the domain, primary Entity of Concern and authority boundaries.
2. Use Chapter 4 to recognize recurring process-design problems and select patterns proportionally through FC-13.
3. Choose or replace the optional architecture and process realizations in Chapters 5–6.
4. Apply Chapter 7 only when consequence, irreversibility, equipment, regulation, long lifecycle or assurance needs justify PAP overhead.
5. Use the templates and examples in Chapters 8 and 10 as starting points, not mandatory schemas.
6. Adapt the selected content at Organization LPF or project-process level, where actual roles, tools, thresholds and applicability decisions belong.
7. Maintain sources, trace and changes through Chapter 11 and the companion reference documents.

<a id="chapter-3"></a>

# 3. Domain и authority architecture

> **Authority status:** governing orientation for this publication; the detailed normative content begins in Chapter 4.

**Domain:** design, adaptation and improvement of agentic processes for developing software systems.

**Primary Entity of Concern:** an agentic software-development process in a defined project context. Architecture is the structure of that process; a connected engineering model is one coordination mechanism, not the primary EoC.

| Level | Role |
|---:|---|
| 1. FPF | Governing conceptual framework |
| 2. AI SDLC DPF | Domain patterns |
| 3. Reference Architecture / Metamodel | Optional realization structure and contracts |
| 4. Reference Process | Optional composable operations |
| 5. Application Guide | Informative application guidance |
| 6. Organization LPF | Organization-specific authority |
| 7. Project-specific Process | Concrete project authority |
| 8. Performed Work | Actual execution and results |

PAP is a bounded specialization of selected DPF/reference content. It is not a ninth authority level. Reference Architecture, Reference Process and Application Guide cannot establish DPF truth, and lower-level adoption cannot silently redefine a higher level.

<a id="chapter-4"></a>

# 4. AI SDLC DPF

> **Authority status:** normative domain patterns when selected; not a mandatory universal pattern set or end-to-end workflow.

## Publication control

| Field | Value |
|---|---|
| Semantic version | `1.0.1` |
| Publication status | `working` |
| Release label | `conformance-repaired` |
| Domain | Design, adaptation and improvement of agentic processes for developing software systems |
| Primary Entity of Concern | An agentic software-development process in a defined project context |
| Primary reader | AI Process Architect or software/system architect designing that process |
| Governing FPF | July 2026; SHA-256 `A6B2C26A8E3B56F5B1AC4CE16D6A6818CFB2A0CF4FFBD5E69619FF9722EF6E75` |
| Release corpus | Exactly FC-02, FC-03, FC-04, FC-05, FC-06, FC-07, FC-08, FC-09, FC-11 and FC-13 |

## Intended use and authority

Use this pattern language to recognize recurring agent-process design problems, select proportional moves, expose consequences and compose a process. It specializes FPF for the stated domain; it does not replace FPF, prescribe a reference architecture/process, prove regulatory compliance, or define an organization LPF, project process or performed work.

Normative statements in the ten pattern bodies govern this DPF only. Reference Architecture, Reference Process and PAP are bounded realizations. The Application Guide is informative. “MUST” inside a selected pattern means required to claim application of that pattern, not required for every project.

## Pattern-language use and governance

FC-13 selects a proportional set. FC-02/03/04 form an execution–authority–admission seam; FC-05/06/07/09 form a source–change–trace–configuration seam; FC-08/11 form a scope–verification seam. These are declarative relations, not a mandatory workflow.

Reopen a pattern on a material FPF change, source-currentness trigger, repeated field counterexample, inability to preserve one primary EoC, authority-layer leakage, or new evidence changing a disposition. Changes require a formal decision, source-use update, affected E21 replay and traceability/governance update.

Supporting carriers are [Sources](reference/AI_SDLC_SOURCES.md), [Glossary](reference/AI_SDLC_GLOSSARY.md), [Open Questions](reference/AI_SDLC_OPEN_QUESTIONS.md), [Traceability](reference/AI_SDLC_TRACEABILITY.md) and [Governance](reference/AI_SDLC_GOVERNANCE.md).

## FC-02 - Bounded Agent Loop

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-02:1 - Problem frame

When an AI agent can inspect engineering state, act, and repeat, the primary Entity of Concern is one agent work loop pursuing a declared result. Without this pattern the loop can drift, consume an open-ended budget, or return unfinished work as if complete; the pattern buys a bounded, replayable run with an honest return. First useful move: state one observable progress or completion check and one stop condition before the first action. The first result is a loop card that names target, allowed effects, check, budget and return route. Not this pattern when one reversible action can be inspected directly at lower cost.

### FC-02:2 - Problem

An open-ended loop can hide partial failure behind continued activity. A downstream user then cannot tell whether the agent reached the target, merely stopped, or changed state outside its authority.

### FC-02:3 - Forces

Exploration needs iteration, while time, cost and side effects are bounded. Observations can become stale; tool actions may be irreversible; model capability varies by task; a useful partial result may still be worth returning.

### FC-02:4 - Solution

The process architect SHALL declare the loop’s input state, target result, allowed actions, observable checks, budget, stop and return conditions, and accountable authority. Each iteration observes the current state, chooses one permitted action, records material change, runs the declared check, and either continues or returns a candidate, partial, blocked or escalated result. The continuation condition SHALL depend on observed progress and remaining budget, not on the agent’s confidence alone. A returned result remains a candidate until FC-04 admits it for reliance.

### FC-02:5 - Archetypal Grounding

**Tell.** Bound the smallest repeatable agent action cycle by a visible check, a resource limit and an honest return; that makes iteration useful without making activity indistinguishable from completion.

**Show — ordinary slice.** A coding agent receives one repository commit, a failing test and a 20-minute budget. It may edit two modules and run the named test; after three iterations the test passes, so it returns the patch, test output and changed commit state as a candidate result.

**Show — near-miss slice.** A documentation typo needs one reversible edit and direct human inspection. Creating retries, telemetry and a loop record would add apparatus without changing the decision, so the architect does not select FC-02.

### FC-02:6 - Bias-Annotation

Automation bias can treat continued activity as progress, and sunk-cost bias can keep a failing loop alive. Benchmark success can also substitute for fitness in the current repository. The observable check and honest-stop route counter those biases without promising productivity.

### FC-02:7 - Conformance Checklist

- [ ] One loop, target result and starting configuration are identifiable.
- [ ] Allowed effects, budget and accountable authority are bounded.
- [ ] At least one progress or completion check is externally inspectable.
- [ ] Stop, failure, partial-return and escalation routes are explicit.
- [ ] The returned object is still a candidate until separately admitted.

### FC-02:8 - Common Anti-Patterns and How to Avoid Them

**Infinite retry:** add a finite budget and escalation. **Agent-as-owner:** allocate authority through FC-03. **Completion-by-self-report:** use an observable check. **Workflow theatre:** omit the formal loop when one reversible action plus review is cheaper.

### FC-02:9 - Consequences

The pattern improves recoverability, cost control and diagnosis, but adds instrumentation and termination design. Conservative stops can reduce exploration; permissive budgets can preserve drift. It does not prove correctness or productivity.

### FC-02:10 - Rationale

The loop is the smallest recurring unit in which agent autonomy, feedback and cost interact. Bounding that unit preserves useful iteration while exposing failure and authority return without prescribing one tool or workflow.

### FC-02:11 - SoTA-Echoing

`W1-U08 / W1-S06`, SWE-agent (2024), answers whether the agent–computer interface and permitted actions affect repository-task performance. **Adapt:** FC-02 makes allowed effects and observable checks explicit; it does not carry SWE-bench performance as a general productivity claim, and it reopens when materially different interfaces invalidate the action-boundary assumption.

`W1-U07 / W1-S05`, Agentless (2024), asks whether a simpler non-agent workflow can solve the same class of task. **Adopt as counterevidence:** the ordinary non-use boundary now permits a direct workflow for cheap reversible work; the benchmark’s task scope and model results are not carried, and new cross-task comparisons can reopen that boundary.

`W1-U13 / W1-S13`, the METR experienced-OSS RCT (2025), asks whether contemporary AI tools improve real developer task time. **Adapt as contradiction:** FC-02 makes no productivity promise and requires use-specific checks and budgets; the study’s repositories, tools and time window are not generalized, and materially different field replications trigger review.

### FC-02:12 - Relations

FC-03 bounds delegated authority; FC-04 governs candidate admission; FC-11 can supply checks; FC-09 identifies configuration. CP-03 Honest Stop is embedded by direct FPF reuse. RA may define run records, RP may compose loop fragments, and PAP may strengthen logging or budgets.

### FC-02:End

## FC-03 - Human Authority Boundary

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-03:1 - Problem frame

When an agent can create side effects or results on which people will rely, the primary Entity of Concern is the allocation of decision and action authority between that agent and accountable humans. If missed, permissions can masquerade as authority and nominal oversight can become rubber-stamping; the pattern buys named ownership and usable return points. First useful move: identify the earliest irreversible or materially relied-upon transition and name its accountable human owner. The first result is an authority map for that transition. Not this pattern when an agent offers a local reversible suggestion under ordinary review and cannot act.

### FC-03:2 - Problem

An agent can act beyond delegated authority, while a human gate placed too late or too often fails to provide meaningful judgment. Responsibility then diffuses across model, tool and reviewer.

### FC-03:3 - Forces

Automation speed conflicts with accountability; frequent approval creates delay and fatigue; reviewers have limited attention; consequences and reversibility differ; access permission is necessary for action but does not establish decision authority.

### FC-03:4 - Solution

For each material action or result class, the process architect SHALL assign permitted agent actions, prohibited actions, decision owner, escalation condition and authority-return point. Place human judgment at the first transition whose consequence or irreversibility exceeds the delegated envelope. Give the owner the candidate, intended use, relevant evidence, limitations and available outcomes. Reduce or remove a gate when direct review of a reversible action is cheaper and preserves accountability.

### FC-03:5 - Archetypal Grounding

**Tell.** Put accountable human judgment at the first consequential transition, while delegating reversible preparation inside a visible envelope.

**Show — ordinary slice.** An agent may edit code and run tests on a branch, but cannot merge a security-sensitive change. At the merge boundary, the security owner receives the diff, evidence and residual limitation and decides admit, repair or reject.

**Show — failure slice.** A “human-approved” label is added automatically after a reviewer opens the diff. No decision basis or return route exists, so the label does not satisfy FC-03 and the transition remains unowned.

### FC-03:6 - Bias-Annotation

Automation bias, approval fatigue and responsibility diffusion can make nominal oversight ineffective. Consequence-sensitive placement and a visible decision basis counter those biases; the number of approvals is not a value proxy.

### FC-03:7 - Conformance Checklist

- [ ] Agent permissions and decision authority are distinct.
- [ ] Material transitions have named accountable owners.
- [ ] Prohibited actions, escalation and authority return are usable.
- [ ] Gate strength follows consequence and reversibility.
- [ ] Human approval is not treated as evidence by itself.

### FC-03:8 - Common Anti-Patterns and How to Avoid Them

**Human-as-rubber-stamp:** provide decision basis and real alternatives. **Permission-equals-authority:** record them separately. **Gate everywhere:** select proportional transitions through FC-13. **Hidden autonomous effect:** prevent or expose it before reliance.

### FC-03:9 - Consequences

The pattern improves accountability and containment but adds review latency and cognitive load. Too many gates reduce scrutiny quality; too few leave reliance unowned. Local authority still depends on organizational and legal arrangements.

### FC-03:10 - Rationale

Authority is a property of the socio-technical process, not of model confidence. Material-transition ownership preserves useful autonomy while keeping decisions with accountable actors.

### FC-03:11 - SoTA-Echoing

`W1-U01 / W1-S01`, NIST AI 600-1 (2024), asks how oversight should vary with context and impact. **Adapt:** FC-03 places authority by consequence and reversibility rather than using a universal gate list; the voluntary cross-sector profile is not carried as mandatory project law, and a profile revision triggers refresh.

`W1-U06 / W1-S04`, Amershi et al. (CHI 2019), asks how people retain control and recover from AI-system error. **Adapt:** the Solution requires operable correction and authority-return paths; product-interaction guidelines are not treated as a complete engineering-governance model, and new agentic-development evidence can reopen the mapping.

`W1-U13 / W1-S13`, METR’s experienced-OSS RCT (2025), asks whether user perception tracks measured developer outcomes. **Adopt as counterevidence:** perceived benefit cannot justify wider authority, so FC-03 requires transition-specific evidence and ownership; the study does not prove harm or benefit for other tasks, and field replication remains a currentness trigger.

### FC-03:12 - Relations

FC-03 bounds FC-02 and supplies decision ownership to FC-04. FC-11 can shape the evidence presented at a decision. RP may realize Human Gates; PAP may strengthen independence and prohibited actions; LPF and project process name actual people.

### FC-03:End

## FC-04 - Candidate Result Admission

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-04:1 - Problem frame

When an agent-produced output is about to influence engineering work, the primary Entity of Concern is one transition from candidate result to bounded reliance. If missed, visibility, merge or fluency can become accidental acceptance; the pattern buys an explicit decision with a recoverable basis. First useful move: label the output “candidate” and state the earliest downstream use it is not yet allowed to support. The first result is an admission question naming claim, use, evidence and owner. Not this pattern when an ephemeral suggestion remains unrelied upon and is directly inspected.

### FC-04:2 - Problem

Generated output can become relied upon without evidence that it is fit for its intended claim and use. Review, testing, merge and approval are then conflated.

### FC-04:3 - Forces

Generation is fast; evidence is costly and imperfect; downstream reliance compounds errors; checks differ by claim; useful drafts should remain cheap; admitted results can become stale.

### FC-04:4 - Solution

The process SHALL keep candidate and admitted states distinct. Before admission, the decision owner SHALL receive the intended use and claim, selected checks, evidence, configuration and residual limitations. The owner chooses admit for the bounded use, reject, repair or defer; failed or inconclusive checks return to the candidate. Source or configuration change reopens the decision through FC-06 or FC-09.

### FC-04:5 - Archetypal Grounding

**Tell.** Admit reliance deliberately: name what the candidate may support, inspect claim-specific evidence, and record a human-owned outcome.

**Show — ordinary slice.** An agent drafts a database migration. The owner states that production deployment is the intended use, reviews the schema diff and rollback test against the pinned baseline, then admits the migration only for the named release.

**Show — near-miss slice.** A generated design note is shared for brainstorming and no decision depends on it. It remains visibly unadmitted; a formal gate would add cost without changing reliance.

### FC-04:6 - Bias-Annotation

Fluent output and tool confidence can masquerade as evidence; completed review can become a proxy for fitness. Claim-specific evidence and explicit limitations counter those substitutions.

### FC-04:7 - Conformance Checklist

- [ ] Candidate and admitted states are distinguishable.
- [ ] Intended use and relied-upon claim are explicit.
- [ ] Evidence, configuration, limitations and decision owner are recoverable.
- [ ] Admit, reject, repair and defer routes are available.
- [ ] Change can reopen admission.

### FC-04:8 - Common Anti-Patterns and How to Avoid Them

**Merge-means-accepted:** separate repository action from reliance. **One score fits all:** bind checks to the claim. **Human glance as evidence:** record what was examined. **Admission forever:** connect source and configuration changes.

### FC-04:9 - Consequences

The pattern reduces silent trust escalation and improves auditability, but adds decision latency and evidence cost. A use framed too broadly can reject helpful drafts; a use framed too narrowly can hide downstream reliance.

### FC-04:10 - Rationale

Generation is not the risky transition; reliance is. A typed admission decision permits cheap candidate work and strong consequential use without declaring every output correct.

### FC-04:11 - SoTA-Echoing

`W1-U03 / W1-S02`, NIST SP 800-218A (2024), asks what evidence and provenance should accompany risk-bearing AI-related software use. **Adapt:** FC-04 requires claim-sensitive evidence, configuration and uncovered limitations; the producer/acquirer guidance is not a universal gate catalogue, and SSDF-profile revisions reopen the mapping.

`W1-U10 / W1-S08`, Liu et al. in IEEE TSE (2024), asks how generated code candidates change through evaluation and repair. **Adapt:** failed checks return the result for repair instead of collapsing candidate and final states; model/task-specific effectiveness is not carried, and new real-project replications can reopen the evidence boundary.

`W1-U11 / W1-S09`, CodeSecEval (2024), asks whether security-specific evaluation exposes failures missed by general coding checks. **Adapt for relevant claims:** independent security checks become a PAP or claim-specific option; benchmark performance is not universalized, and new model/benchmark evidence triggers refresh.

### FC-04:12 - Relations

FC-04 receives FC-02 results and uses FC-03 authority, FC-11 verification intent and FC-09 configuration. FC-06 can reopen reliance. RA owns states and records; RP owns admission fragments; PAP may strengthen evidence and independence.

### FC-04:End

## FC-05 - Source–Claim Mediation

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-05:1 - Problem frame

When an external standard, requirement, contract or study materially shapes engineering work, the primary Entity of Concern is the engineering claim carried from that source. If missed, copied wording or an AI summary can hide interpretation and applicability; the pattern buys a replayable source-to-claim boundary. First useful move: write separate sentences for “the source states” and “we carry for this use.” The first result is one mediated claim with source locus, interpretation, applicability and exclusions. Not this pattern when material is only background reading and no reliance is placed on it.

### FC-05:2 - Problem

Source text becomes an engineering requirement or justification without preserving version, scope, authority, interpretation or excluded material. Later readers cannot challenge or replay the transformation.

### FC-05:3 - Forces

Sources differ in authority and scope; language is ambiguous; automation scales extraction and error; precise engineering use requires interpretation; excessive claim records are costly.

### FC-05:4 - Solution

For each material carried claim, record the exact source, version and locus; the selected meaning; applicability basis; intended use; interpretation owner; uncertainty; and material not carried. State the source assertion before the engineering interpretation. The depth of mediation SHALL follow downstream reliance. Connect source state to FC-06 and downstream use to FC-07.

### FC-05:5 - Archetypal Grounding

**Tell.** Keep what a source says separate from what the engineering process decides to carry, and make that interpretation replayable.

**Show — ordinary slice.** An official standard record says alternative lifecycles are permitted when its requirements are satisfied. The project claim carries only “V is not the sole lifecycle option under this source,” names the edition and use, and excludes any claim that the source applies automatically.

**Show — failure slice.** An agent summarizes a regulator page as “the project must use control X” without jurisdiction, revision or adoption basis. FC-05 blocks the claim until the exact source and applicability interpretation are recovered.

### FC-05:6 - Bias-Annotation

Authority bias and quotation fidelity can hide misapplication; fluent summaries can amplify false scope. Exact locus, excluded material and a named interpretation owner counter those biases.

### FC-05:7 - Conformance Checklist

- [ ] Exact source identity, version and locus are recoverable.
- [ ] Source statement and carried claim are distinct.
- [ ] Applicability, intended use, uncertainty and exclusions are explicit.
- [ ] An interpretation owner is named.
- [ ] Currentness and downstream reliance are linked.

### FC-05:8 - Common Anti-Patterns and How to Avoid Them

**Copy-as-requirement:** mediate the claim. **Bibliography-as-evidence:** name the selected payload. **Universalize-a-standard:** record jurisdiction, system and adoption basis. **AI-summary authority:** return to the exact source.

### FC-05:9 - Consequences

The pattern improves replay, challenge and source-change analysis, but adds claim-management effort. Too little granularity hides interpretation; too much granularity overwhelms use, so FC-13 profiles depth.

### FC-05:10 - Rationale

A retained URL does not explain which meaning the process relies upon. The mediation boundary lets source authority and engineering interpretation be inspected independently.

### FC-05:11 - SoTA-Echoing

`W2-U01 / W2-S01`, ISO/IEC/IEEE 29148:2018, asks how source context and requirements information remain identifiable across the lifecycle. **Adapt:** FC-05 carries exact source-to-claim interpretation and use rather than copying a requirements schema; the standard’s specific information-item structure is not universalized, and its announced revision triggers refresh.

`W5-U12 / W5-S11`, NP-026-16, asks what an official Russian nuclear rule can support inside its jurisdiction and system scope. **Adapt:** the Solution requires jurisdiction, applicability and adopted-source state before carrying a claim; no applicability or compliance conclusion is copied, and amendment, repeal or official-list change reopens use.

`W5-U13 / W5-S12`, GOST R IEC 61513-2020, asks how a national adoption can differ from the current international edition. **Adopt as a boundary case:** current international status and locally adopted version remain separate mediated claims; automatic legal mandate or equivalence is not carried, and replacement or adoption change triggers review.

### FC-05:12 - Relations

FC-06 monitors source state; FC-07 links claims to downstream reliance; FC-08 scopes claim coverage; FC-09 identifies relied versions. RA defines source/claim relations, while PAP strengthens applicability records.

### FC-05:End

## FC-06 - Current Source Impact

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-06:1 - Problem frame

When a relied-upon source is revised, superseded, withdrawn or reinterpreted, the primary Entity of Concern is the set of engineering reliance affected by that event. If missed, work silently remains based on stale meaning or is needlessly regenerated; the pattern buys a bounded impact decision. First useful move: identify the adopted source state and its first downstream mediated claim. The first result is a list of potentially affected claims with an owner and assessment route. Not this pattern when background knowledge has no identified downstream reliance and periodic review is sufficient.

### FC-06:2 - Problem

Source changes occur asynchronously, while dependent claims and results are dispersed. “Use latest” ignores adoption; “change nothing” ignores impact; “redo everything” wastes effort.

### FC-06:3 - Forces

Relevance is contextual; full revalidation is costly; missed impact can be severe; current publication and adopted edition can differ; dependency records are imperfect.

### FC-06:4 - Solution

Maintain source identity, currentness and traversable claim dependencies. On a material event, classify the event, find potentially relying claims, results and configurations, assess applicability, and record change, no-impact or unresolved decisions with rationale and reopen trigger. Expand to full reassessment when impact cannot be bounded. The process SHALL NOT replace an adopted source merely because a newer edition exists.

### FC-06:5 - Archetypal Grounding

**Tell.** Reopen only the reliance that a source event can actually affect, while keeping adopted and newly published source states distinct.

**Show — ordinary slice.** A security guide changes one control interpretation. The steward follows the mediated claim to two release checks, marks one no-impact with rationale and returns the other for updated evidence.

**Show — countercase.** A new international IEC edition appears while a national contract still names an older adoption. FC-06 records the event and impact question but does not silently replace the contractual baseline.

### FC-06:6 - Bias-Annotation

Recency bias favors “latest,” while status-quo bias favors no change. Keeping publication, adoption and applicability separate prevents either label from deciding impact alone.

### FC-06:7 - Conformance Checklist

- [ ] Published, adopted and applicable source states are distinguishable.
- [ ] Source events have owners and refresh triggers.
- [ ] Potentially affected claims and results are discoverable.
- [ ] Change, no-impact and unresolved outcomes have reasons.
- [ ] Unbounded impact broadens assessment rather than hiding uncertainty.

### FC-06:8 - Common Anti-Patterns and How to Avoid Them

**Always-latest:** respect adoption basis. **Link-only registry:** use mediated claims and typed relations. **Refresh everything:** assess bounded impact first. **Silent no-change:** record rationale and review date.

### FC-06:9 - Consequences

The pattern reduces stale reliance and unnecessary full refresh, but requires source stewardship and maintained dependency paths. Missing relations can cause false negatives; ambiguous impact can still require broad reassessment.

### FC-06:10 - Rationale

Source currentness matters through reliance, not as a standalone date. Starting from the adopted source and first carried claim localizes review without denying a full refresh when locality fails.

### FC-06:11 - SoTA-Echoing

`W2-U14 / W2-S12`, NIST SSDF 1.1 (2022), asks how software practices and changes should be handled proportionally to risk. **Adapt:** FC-06 permits change, no-impact and broader reassessment outcomes instead of one universal refresh procedure; SSDF security scope is not generalized, and publication of SSDF 1.2 final reopens the source use.

`W5-U13 / W5-S12`, GOST R IEC 61513-2020, asks how a nationally effective edition coexists with a newer international source. **Adopt as contradiction:** the Solution separates published, adopted and applicable states; it does not declare which edition governs a project, and national replacement or contract change triggers review.

`W5-U14 / W5-S13`, the NRC digital I&C modernization source seam, asks how differing official reference pages affect currentness. **Adapt:** FC-06 requires exact revision and adoption evidence before updating reliance; no US applicability outside a licensing basis is carried, and NRC guide or page revision reopens the record.

### FC-06:12 - Relations

FC-06 depends on FC-05 and FC-07 and may reopen FC-04 admission or FC-09 baseline. FPF E9 governs material rationale. RP owns change-handling fragments; PAP selects applicable sources and review cadence.

### FC-06:End

## FC-07 - Bidirectional Engineering Trace

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-07:1 - Problem frame

When change, admission or handover requires both “why does this exist?” and “what became of this source or decision?”, the primary Entity of Concern is the use-bounded set of engineering relations that answers those queries. If missed, one-way or decorative links hide rationale and impact; the pattern buys replayable upstream and downstream paths. First useful move: write one concrete two-way query before creating relations. The first result is the minimum typed path that answers it, with gaps and owner visible. Not this pattern when direct local inspection is cheaper and no future reliance needs a maintained path.

### FC-07:2 - Problem

Trace is often maximized by edge count or reduced to a matrix whose relation meanings are unclear. Such trace decays, costs effort and still fails the practical query.

### FC-07:3 - Forces

Trace supports impact and handover; comprehensive graphs are expensive; heterogeneous carriers complicate identity; relations become stale; a link is not evidence.

### FC-07:4 - Solution

For each declared reliance query, maintain typed, version-aware relations sufficient to traverse upstream source or rationale and downstream realization or evidence. Each endpoint SHALL have recoverable identity and configuration; gaps and owners SHALL remain visible. Test the path with the declared query instead of using relation count as success. Add relations only when they answer a current use or preserve a named handover/change boundary.

### FC-07:5 - Archetypal Grounding

**Tell.** Start from a question that matters, then maintain only the relations needed to answer it in both directions.

**Show — ordinary slice.** A requirement changes. The trace follows its mediated source claim to one architecture decision, two components and three affected tests; the reverse query from a failed test returns to the same claim and decision.

**Show — near-miss slice.** A two-file patch is fully understood from one commit and review. A trace graph would duplicate direct inspection, so the architect records the commit and does not select a broader FC-07 path.

### FC-07:6 - Bias-Annotation

Coverage percentage and graph size can substitute for query usefulness. A successful query with visible gaps is more informative than a dense graph whose semantics or versions are unknown.

### FC-07:7 - Conformance Checklist

- [ ] At least one upstream and one downstream reliance query are declared.
- [ ] Relation meanings, endpoint identities and versions are recoverable.
- [ ] Gaps, stale paths and maintenance owners are visible.
- [ ] Links reach evidence and decisions without being treated as evidence.
- [ ] Trace apparatus is proportional to the declared queries.

### FC-07:8 - Common Anti-Patterns and How to Avoid Them

**Link count as value:** replay queries. **Matrix without semantics:** type relations. **Forward-only trace:** add what-became-of. **Stale graph:** connect source and baseline changes. **Link as proof:** keep evidence distinct.

### FC-07:9 - Consequences

The pattern improves impact analysis, explanation and handover, but adds identity and relation maintenance. Incomplete paths can create false confidence, so the architect SHALL keep gaps and query failure visible.

### FC-07:10 - Rationale

Trace creates value only by answering a reliance question. Starting from paired queries bounds apparatus and exposes missing paths without requiring one graph technology.

### FC-07:11 - SoTA-Echoing

`W2-U05 / W2-S04`, Tian et al.’s mapping study (2021), asks what benefits and costs requirements traceability shows across maintenance work. **Adopt:** FC-07 makes trace use-bounded and cost-visible; heterogeneous study results are not turned into a universal benefit claim, and a newer systematic synthesis can reopen the balance.

`W2-U07 / W2-S05`, Charalampidou et al. (2021), asks how empirical traceability evidence varies across contexts. **Adapt:** the Solution requires declared queries and gaps rather than assuming a graph is valuable; no technique ranking is carried, and current industrial evidence can change the non-use boundary.

`W2-U10 / W2-S08`, in-toto stable v1.0, asks how step and artifact relations can preserve a verifiable provenance chain. **Adapt as one realization:** typed endpoints and versioned paths inform RA contracts; the supply-chain layout is not prescribed as the DPF trace model, and a new stable major version triggers currentness review.

### FC-07:12 - Relations

FC-07 connects FC-05, FC-06 and FC-09 and supports FC-04, FC-08 and FC-11. Decision rationale remains with FPF E9/C.32.ADR. RA owns relation semantics, RP owns capture/change operations, and PAP may require stronger queries.

### FC-07:End

## FC-08 - Bounded Completeness

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-08:1 - Problem frame

When a team needs to stop and rely on an engineering result, the primary Entity of Concern is one completeness claim for a declared scope and use. If missed, “complete” becomes absolute or is inferred from counts, hiding omissions; the pattern buys a falsifiable closure statement with visible gaps. First useful move: complete the sentence “complete enough for ___ within ___, except ___.” The first result is a scoped claim with checks, exclusions and reopen triggers. Not this pattern when sufficiency of a trivial result is directly observable and no formal closure claim is made.

### FC-08:2 - Problem

Artifact, checklist or coverage counts can create false closure. Unknowns remain, while the claim fails to say what use it supports or what would overturn it.

### FC-08:3 - Forces

Stakeholders need closure; unknowns are unavoidable; more checks cost time; expert and AI review can find omissions but also add false positives; visible metrics invite proxy substitution.

### FC-08:4 - Solution

State completeness relative to the primary EoC, intended use, scope, profile, applicable claim classes and qualification time. Select checks that can expose material omissions, record known gaps and exclusions with owners, and name evidence that would lower or reopen the claim. The process SHALL NOT equate completeness with correctness, admission or a target percentage. Apply FPF E13 when a count or score replaces the intended use value.

### FC-08:5 - Archetypal Grounding

**Tell.** Close a result only for a named use and scope, while publishing what remains outside or uncertain.

**Show — ordinary slice.** A requirements set is declared complete enough for release planning for three named workflows, except offline recovery and two unresolved regulatory claims. The owner and reopen events are recorded, so planning can proceed without claiming total system completeness.

**Show — proxy-failure slice.** Test coverage reaches 100 percent while an untested behavior outside the instrumented paths still harms users. FC-08 refuses the percentage as completeness and returns to the use, behavior scope and missing check.

### FC-08:6 - Bias-Annotation

Checklist completion, artifact count and coverage invite Goodhart effects; AI omission lists invite false authority. Ask what could remain wrong despite the visible measure and what became worse while the measure improved.

### FC-08:7 - Conformance Checklist

- [ ] EoC, scope, use and qualification time are named.
- [ ] Included claim classes, checks and exclusions are explicit.
- [ ] Known gaps, owners and reopen triggers are visible.
- [ ] No count or coverage target substitutes for use.
- [ ] Completeness is not equated with correctness or admission.

### FC-08:8 - Common Anti-Patterns and How to Avoid Them

**Absolute completeness:** bound the claim. **Hundred-percent proxy:** identify missed behavior. **LLM says complete:** retain accountable review. **Checklist inflation:** select the smallest claim-relevant checks.

### FC-08:9 - Consequences

The pattern makes closure honest and reviewable, but leaves visible uncertainty and can be less rhetorically satisfying. A badly chosen scope can still hide risk, so consequences and reopen triggers matter.

### FC-08:10 - Rationale

Completeness is a claim relative to use, not an intrinsic artifact property. Explicit exceptions make stopping possible without pretending uncertainty vanished.

### FC-08:11 - SoTA-Echoing

`W3-U04 / W3-S04`, NASA SWE-050, asks how review and trace checks support completeness in NASA software practice. **Adapt:** FC-08 uses scoped checks and gap visibility as aids, not proof; NASA obligations are not generalized, and handbook or governing-standard revision triggers refresh.

`W3-U07 / W3-S07`, Kochhar et al. (2017), asks whether high code coverage reliably corresponds to defect effectiveness in open-source projects. **Adopt as counterevidence:** the Solution explicitly rejects coverage as completeness; observational Java-project findings are not universalized, and causal cross-language replication can reopen the calibration.

`W3-U09 / W3-S09`, Luitel et al. (2024), asks whether LLMs can help identify missing requirements. **Adapt:** AI omission finding is one check under accountable review; model-specific accuracy is not carried as authority, and field or new-model replication triggers review.

### FC-08:12 - Relations

FC-08 uses FC-11 for verification intent, FC-07 for coverage queries and FC-13 for proportional scope. FPF E13 governs proxy substitution. PAP may strengthen exclusions and independent review.

### FC-08:End

## FC-09 - Configuration Baseline

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-09:1 - Problem frame

When a decision, result or release relies on a particular engineering state, the primary Entity of Concern is that identified configuration. If missed, people rely on a moving or partially known state and cannot reproduce or supersede it; the pattern buys a stable referent without claiming completion. First useful move: name the exact result and configuration the current decision relies upon. The first result is a bounded baseline with versions, evidence, gaps and owner. Not this pattern when disposable exploration can be recovered adequately from one local commit or run reference.

### FC-09:2 - Problem

Inputs, outputs, evidence and agent or tool versions change independently. A tag alone can hide environment, gaps and variance, while freezing everything can obstruct continuous work.

### FC-09:3 - Forces

Flow favors mutable state; reliance needs identity; full environment capture is costly; some variance is harmless; baseline status can be mistaken for readiness or completion.

### FC-09:4 - Solution

At each material reliance point, identify included versions and states, evidence, known gaps, tolerated variance, owner and supersession rule. Capture agent, tool and environment state only where it can change the relied claim. The process SHALL keep baseline identity distinct from completion and SHALL make the successor relation recoverable. Use a lightweight commit or run identity for disposable low-consequence work.

### FC-09:5 - Archetypal Grounding

**Tell.** Give every material reliance one recoverable configuration referent, including the variance and gaps that matter for that use.

**Show — ordinary slice.** A release decision cites source revision, code commit, generated artifacts, test environment and known waiver. Later, a dependency upgrade creates a successor baseline while the prior decision remains replayable.

**Show — non-use slice.** An exploratory script will be discarded after a single review. Its commit and run log are sufficient; a formal baseline package would not buy additional reliance.

### FC-09:6 - Bias-Annotation

A baseline can signal false stability, and capture volume can become a maturity proxy. The intended use, tolerated variance and admitted gaps keep identity from becoming completion theatre.

### FC-09:7 - Conformance Checklist

- [ ] Intended reliance and included states are named.
- [ ] Material source, agent, tool and environment versions are recoverable.
- [ ] Evidence, gaps and tolerated variance are explicit.
- [ ] Owner and supersession rule exist.
- [ ] Baseline is not described as completion by itself.

### FC-09:8 - Common Anti-Patterns and How to Avoid Them

**Latest-is-baseline:** record adopted state. **Tag-only baseline:** include material evidence and variance. **Freeze forever:** provide supersession. **Capture everything:** profile what can affect the claim.

### FC-09:9 - Consequences

The pattern improves coordination and replay, but adds configuration effort and may slow continuous flow. Under-capture harms reproduction; over-capture harms affordability.

### FC-09:10 - Rationale

Reliance requires a stable referent even while work continues. A bounded baseline provides that referent and a successor path without declaring the engineering object finished.

### FC-09:11 - SoTA-Echoing

`W2-U03 / W2-S02`, NIST SP 800-53 Rev.5 release 5.2.0 (2025), asks how identified baselines support controlled change in its security context. **Adapt:** FC-09 carries exact state, owner and change relation without importing a federal control catalogue; no US applicability is inferred, and a new NIST release triggers refresh.

`W2-U09 / W2-S07`, SLSA Provenance v1.2, asks how build provenance can make where, when and how a result was produced verifiable. **Adapt:** the Solution includes material production state and provenance; SLSA’s supply-chain schema is not made universal, and a new approved version reopens the realization mapping.

`W2-U11 / W2-S09`, Reproducible Builds documentation, asks which environment and variance details affect repeatability. **Adapt:** FC-09 records only variance material to the relied claim; byte-for-byte reproducibility is not required for every baseline, and material documentation or technique changes trigger review.

### FC-09:12 - Relations

FC-09 stabilizes reliance for FC-04, FC-06, FC-07 and FC-11; FC-13 selects depth. RA defines identity/state contracts, RP defines create and supersede fragments, and PAP may strengthen retention or approval.

### FC-09:End

## FC-11 - Verification Co-design

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-11:1 - Problem frame

When an engineering claim or result will need evidence, the primary Entity of Concern is its verification intent while the result can still be shaped. If missed, verification arrives late, the claim is unobservable or evidence is expensive and weak; the pattern buys a testable design and a clear failure return. First useful move: state what observation would distinguish an acceptable result from a plausible wrong one. The first result is a verification intent naming evidence, oracle, environment and limitations. Not this pattern when a trivial change is directly inspectable and no separate verification design would alter it.

### FC-11:2 - Problem

Verification attached after design often exposes untestable claims or forces costly rework. Conversely, imposing TDD, a V-cycle or independence everywhere over-controls contexts where simpler observation is enough.

### FC-11:3 - Forces

Early evidence thinking improves observability; designs evolve; oracles can be wrong; independent verification costs; simulation and real equipment preserve different structures; test-technique effects vary by context.

### FC-11:4 - Solution

Co-design each material claim or result with its verification question, observable evidence, oracle or acceptance basis, environment, independence need, limitations and failure return. Let the intended observation influence the result while change remains cheap. Failed or inconclusive evidence SHALL return to the claim or result rather than become admission. Select test-first, continuous, staged, simulation, monitoring or independent techniques only when their evidence properties fit the claim.

### FC-11:5 - Archetypal Grounding

**Tell.** Decide early what evidence could distinguish the desired result from a convincing mistake, then shape the result so that evidence can exist.

**Show — ordinary slice.** Before an agent implements an authorization rule, the architect names denied and permitted scenarios, an observable audit event and the environment. The interface is adjusted to expose the audit event before implementation hardens.

**Show — countercase.** A team mandates TDD for a one-line configuration correction whose effect is directly observable and reversible. FC-11 retains the verification question but rejects the technique mandate as unnecessary apparatus.

### FC-11:6 - Bias-Annotation

Test count and coverage can replace fit-for-claim evidence; independence can become ceremonial. Select observations by failure and intended use, and keep decision authority separate.

### FC-11:7 - Conformance Checklist

- [ ] One claim or result is paired with verification intent.
- [ ] Observable evidence and oracle or acceptance basis are stated.
- [ ] Environment limitations and independence needs are explicit.
- [ ] Failed or inconclusive verification has a return route.
- [ ] No lifecycle or test technique is universalized.

### FC-11:8 - Common Anti-Patterns and How to Avoid Them

**Test-after-design only:** state intent while design can change. **TDD or V as dogma:** retain alternatives. **Coverage-as-proof:** bind evidence to claim. **Independent-name-only:** state conflict boundary and decision owner.

### FC-11:9 - Consequences

The pattern improves observability and reduces late surprise, but creates early design effort and may constrain exploration. A wrong oracle can lock in a mistaken claim; representative environments can be expensive.

### FC-11:10 - Rationale

Verification is most useful when its evidence needs can still influence the design. Keeping lifecycle and technique open preserves transfer while making the claim–observation pair explicit.

### FC-11:11 - SoTA-Echoing

`W3-U02 / W3-S02`, ISO/IEC/IEEE 29119-2:2021, asks how test processes operate across lifecycle contexts. **Adapt:** FC-11 retains lifecycle-neutral verification intent and return without importing one test process; the standard’s information items are not universal artifacts, and revision triggers refresh.

`W3-U03 / W3-S03`, NASA-STD-8739.8B and current NASA assurance guidance, ask when objective or independent evidence strengthens critical software assurance. **Adapt for PAP:** the Solution exposes independence as a claim-sensitive choice; NASA scope is not generalized, and a NASA standard revision reopens the strengthening.

`W3-U05 / W3-S05`, Bissi et al.’s TDD systematic review (2016), asks whether TDD consistently improves quality or productivity. **Adopt as contradiction:** TDD remains one alternative rather than the pattern; heterogeneous effects are not converted into a positive or negative universal claim, and a newer synthesis can reopen technique guidance.

### FC-11:12 - Relations

FC-11 supplies verification intent to FC-04 and FC-08 and binds evidence to FC-09 and FC-07. CP-16 is a PAP extension for equipment-boundary claims. RP composes verification work; PAP may set formality and independence.

### FC-11:End

## FC-13 - Contextual Process Profile

| Field | Value |
|---|---|
| Type | Architectural (A) |
| Status | Active |
| Normativity | Normative when selected |

### FC-13:1 - Problem frame

When an architect chooses an agentic process for a project context, the primary Entity of Concern is the selected process profile. If missed, one default process under-controls consequential reliance or over-controls simple work; the pattern buys a justified, changeable selection rather than a maturity score. First useful move: name the consequence, reversibility and reliance that would be harmed. The first result is a profile decision listing selected, omitted, replaced and strengthened content with reasons. Not this pattern when a simple local activity can explicitly use the lightweight default and has no material external obligation.

### FC-13:2 - Problem

A universal process, risk label or artifact count hides the actual reasons for control. Tailoring can also remove inconvenient safeguards without showing the lost protection.

### FC-13:3 - Forces

Consequences, reversibility, lifecycle, system class and source applicability vary. Governance costs time; profiles change; local simplicity is valuable; external obligations can limit alternatives.

### FC-13:4 - Solution

State decision-relevant context and required reliance, then select, strengthen, omit or replace DPF patterns and reference components. Record source applicability, deviations, equivalent protection, reasons, ordinary non-use and reopen triggers. The profile SHALL NOT use maturity level or artifact count as evidence of suitability. Both added and removed controls SHALL name the value or harm they address.

### FC-13:5 - Archetypal Grounding

**Tell.** Select the smallest process composition that protects the actual reliance, and make every strengthening and omission explainable and reopenable.

**Show — ordinary slice.** A multi-team SaaS product selects all ten patterns, federated trace and continuous verification, but rejects a V-cycle and exact Core-11 files. The result is a medium-consequence profile with reasons, equivalent carriers and triggers for PAP adoption.

**Show — different slice.** A four-person team changes a reversible internal page. It selects a lightweight loop, ordinary review and commit identity; a maturity ladder or PAP package would cost more than the harm it prevents.

### FC-13:6 - Bias-Annotation

Compliance theatre, risk tiers, maturity ladders and artifact counts can replace value reasoning; convenience can drive under-tailoring. FPF E13 and bidirectional rationale make both tendencies visible.

### FC-13:7 - Conformance Checklist

- [ ] Context, consequence, reversibility and harmed reliance are named.
- [ ] Lifecycle, system and source applicability are assessed.
- [ ] Selections, omissions, replacements and strengthenings have reasons.
- [ ] Profile is not a maturity score or fixed artifact list.
- [ ] Change, non-use and reopen conditions are explicit.

### FC-13:8 - Common Anti-Patterns and How to Avoid Them

**Universal process:** compare compositions. **Risk tier by label:** connect the tier to claims and evidence. **Tailoring-to-convenience:** state lost protection. **Maximum-control default:** exercise the lightweight boundary.

### FC-13:9 - Consequences

The pattern improves fit and affordability, but introduces a governance decision and can enable inconsistent tailoring. Context changes require reopening; equivalence arguments can be disputed.

### FC-13:10 - Rationale

Process architecture is selection under context, not ascent through one maturity ladder. A recorded profile makes additional control and deliberate non-use equally challengeable.

### FC-13:11 - SoTA-Echoing

`W4-U03 / W4-S01`, ISO/IEC/IEEE 24748-1:2024, asks how lifecycle models and content are adapted across domains and projects. **Adapt:** FC-13 makes context-to-selection rationale and reopen explicit; it does not carry one adaptation procedure or lifecycle, and ISO revision triggers currentness review.

`W4-U04 / W4-S02`, ISO/IEC/IEEE 15288:2023, asks whether system lifecycle processes require one development method, model or topology. **Adopt:** lifecycle pluralism protects the Solution from universal V/model claims; the standard does not establish AI-process effectiveness or project applicability, and revision or adoption change reopens the relation.

`W4-U08 / W4-S07`, Giray et al.’s very-small-company case, asks whether situational context can justify a lightweight software process. **Adapt as a non-use case:** the pattern includes an explicit lightweight profile instead of maximum control; one company does not establish universal effectiveness, and broader comparative field evidence can reopen the boundary.

### FC-13:12 - Relations

FC-13 selects the proportional use of all other patterns and RA/RP/PAP options and invokes FPF E13. PAP is a bounded specialization, not another authority level. LPF and project process make actual adoption decisions.

### FC-13:End

<a id="chapter-5"></a>

# 5. Reference Architecture

> **Authority status:** bounded reference realization; not normative DPF and not a project architecture.

## Status and boundary

This is a bounded, implementation-neutral realization of the [AI SDLC DPF](#chapter-4), not domain truth, a required tool stack or a project architecture. Alternative document-, code-, federated-, database-, event-sourced-, generated-view-, model-driven- and hybrid realizations are valid when they preserve selected pattern obligations.

## Conceptual entities

| Entity | Meaning | Key distinctions |
|---|---|---|
| Process Context | Decision-relevant project/process situation | Description, not performed work |
| Profile | Selected process strengthenings/omissions/replacements | Not maturity or authority level |
| Source State | Identified edition/locus/currentness/adoption | Technical relevance ≠ applicability |
| Mediated Claim | Interpretation carried for a declared use | Source text ≠ claim |
| Candidate Result | Generated result not yet relied upon | Candidate ≠ admitted |
| Admitted Result | Result admitted for a bounded use | Admission ≠ correctness forever |
| Evidence | Observation/data supporting a claim | Evidence ≠ assurance/decision |
| Decision | Accountable authority act with rationale | Agent output ≠ decision ownership |
| Configuration/Baseline | Identified relied-upon state | Baseline ≠ completion |
| Trace Relation | Typed, version-aware dependency | Link ≠ evidence |
| View | Projection for a use with declared loss | View ≠ source entity/carrier |
| Agent Run | Bounded actions, observations and return state | Activity ≠ progress |

## Relations and state distinctions

```text
SourceState --interpreted-as--> MediatedClaim --constrains/justifies--> Result
Result --verified-by--> Evidence --considered-in--> AdmissionDecision
AdmissionDecision --admits-for-use--> AdmittedResult --belongs-to--> Baseline
Decision/Claim/Result/Evidence --linked-by--> typed TraceRelation
SourceState --change-event--> ImpactAssessment --reopens--> affected reliance
Entity --projected-as--> View --returns-to--> Entity
AgentRun --returns--> CandidateResult
Profile --selects/strengthens/omits--> Pattern and reference component
```

Candidate/admitted, current/adopted, generated/authored, evidence/assurance/decision, entity/view/carrier and baseline/completion states must remain recoverable.

## Authority and trust boundaries

- AI agents may propose claims/results and perform explicitly delegated actions.
- Human or otherwise legally/accountably constituted authority owns material admissions and project decisions.
- A generator, schema validator or passing check supplies evidence only for its declared claim.
- External sources retain their own authority/applicability; the architecture stores mediation, not legal truth.
- PAP strengthens a selected realization only after adoption; LPF/project assigns actual owners, tools and thresholds.

## Implementation-neutral contracts

### Agent run contract

Identify inputs/configuration, target result, allowed effects, checks, budget, stop/return routes, owner and emitted candidate status. Serialization is optional.

### Human Gate contract

Identify decision class, candidate, intended use, evidence, limitations, owner, allowed decisions, return route and rationale. A gate is an RP contract, not a DPF pattern.

### Source and claim contract

Identify source/version/locus/status, carried claim, applicability, intended use, owner, exclusions, uncertainty and refresh trigger.

### Baseline and trace contract

Identify included states, material variance, evidence/gaps, relation semantics, owners, supersession and use-bounded queries.

### View contract

Identify source entity/state, view use, transformation/generator, preserved information, loss, freshness and return path.

## Reference realization: connected engineering model

A connected model can implement the contracts through typed entities, relations, versioned baselines and generated views. It is preferred only when relation density, long lifecycle, heterogeneous parties or replay/impact needs justify tool, migration and governance cost. A canonical edit locus is optional; federated authoritative loci with explicit synchronization can conform.

Loss/recovery requirements:

- export identities, relations and decisions in a durable form;
- expose view loss and staleness;
- preserve a migration path independent of one vendor/tool;
- permit small-work non-use;
- detect divergent sources of authority rather than claiming a single truth.

## Core-11 mapping

The historical Core-11 is a reference package, not a minimum:

| Carrier | Reference entity/concern | Status |
|---|---|---|
| Project Manifest | Context/profile/baseline identity | replaceable |
| Source Registry | Source/claim/currentness | required when applicable sources exist; replaceable |
| System Context and Scope | Boundary/context | required concern; replaceable |
| Requirements Model | Claims/requirements | evidence required; model optional |
| Operational/Behavioral Model | Behavior | conditional |
| Domain and Data Model | Domain/data/measurement | conditional |
| System Architecture Model | Architecture/interface | required concern; replaceable |
| Equipment and Integration Model | Physical boundary | conditional; PAP-strengthened |
| UI Model | HMI/user behavior | conditional |
| Roles, Permissions and Audit Model | Authority/security/audit | concern required as applicable |
| V&V and Traceability Model | Verification/evidence/relations | concern required; form optional |

## DPF mapping

FC-02 → Agent Run; FC-03 → Authority Boundary; FC-04 → Candidate/Admission states; FC-05/06 → Source/Claim/Impact; FC-07 → Trace; FC-08 → bounded claim/gap; FC-09 → Configuration; FC-11 → Verification Intent; FC-13 → Profile.

## Not proven or prescribed

This RA does not prove process effectiveness, product safety/security, source applicability, regulatory compliance or evidence sufficiency. It does not prescribe YAML, a repository layout, Core-11, a graph database, one canonical model or one lifecycle.

<a id="chapter-6"></a>

# 6. Reference Process

> **Authority status:** bounded reference composition; not normative DPF and not one mandatory workflow.

## Status and composition rule

This carrier offers composable process fragments. It is neither the [DPF](#chapter-4) nor one mandatory end-to-end workflow. Select fragments through FC-13 and specialize them through the [PAP](#chapter-7), an organization LPF or a project context under their respective authority.

| Fragment | Entry | Core move | Exit / return |
|---|---|---|---|
| RP-01 Frame | Unbounded process-design question | Apply FPF C.22/C.22.2; identify EoC, use, consequence and authority | Bounded brief; return if material unknown |
| RP-02 Select Profile | Bounded context | Apply FC-13; select/omit/strengthen patterns and reference options | Profile + rationale + reopen |
| RP-03 Run Agent Work | Authorized task/configuration | Apply FC-02/03; observe–act–check within limits | Candidate, partial, blocked or escalation |
| RP-04 Admit Result | Candidate and intended use | Apply FC-04/11; inspect evidence/limits/configuration | admit, reject, repair or defer |
| RP-05 Mediate Source | Material source statement | Apply FC-05; separate source and carried claim | Mediated claim or unresolved interpretation |
| RP-06 Handle Source Change | Source event | Apply FC-06/07; find reliance and assess impact | change/no-impact/unresolved decision |
| RP-07 Establish Baseline | Material reliance point | Apply FC-09; identify states/evidence/gaps | Bounded baseline or missing-state return |
| RP-08 Check Bounded Completeness | Closure request | Apply FC-08/11 and FPF E13 | Qualified claim, gaps or reopen |
| RP-09 Refine by Impact | Change/failed check | Traverse dependencies; update smallest justified set | New candidate and rechecks; full regeneration if impact unbounded |
| RP-10 Supersede | Accepted change | Record successor, affected views and decisions | Recoverable supersession |

## Product Engineering Composition

A **Product Engineering Composition (PEC)** is an optional reusable starting point for designing a project-specific Working Process. It helps a project recover material engineering concerns and dependencies before consequential commitments. It is not a DPF pattern, mandatory lifecycle, maturity level, artifact catalogue, compliance basis or project authority.

PEC has three cooperating layers:

1. a navigation backbone showing useful result transitions, iteration, parallel work and returns;
2. a Concern/Result Disposition Contract preventing material concerns from disappearing inside broad Loop names;
3. proportional Commitment Guards applied only when scope, coupling, consequence or reliance triggers them.

The project-specific Working Process remains authoritative for its Loops, Tasks, Runs, verification and Human Gates. It may use, combine, replace or explicitly decline PEC according to FC-13 and its admitted context.

### Navigation backbone

```text
context, sources and intended outcomes
↔ operational concept, scenarios and bounded scope
↔ requirements and observable behavior
↔ domain/data/state, architecture and interfaces
↔ verification intent and acceptance
↔ construction in reusable vertical slices
↔ integration, system verification and transition
↔ admitted baseline, operation and learning
```

This is a navigation view, not a required sequence. Work may iterate, run in parallel or return to the smallest responsible result. A project does not demonstrate coverage merely by naming a broad stage or first slice.

### Concern/Result Disposition Contract

For the declared scope, each material concern or independently relied-on result receives one explicit disposition:

| Disposition | Meaning |
|---|---|
| `explicit` | A distinct result or carrier is required. |
| `combined` | The concern is recoverable inside a named shared carrier. |
| `cross_cutting` | The concern is maintained across several results with an owner and trace route. |
| `deferred` | Work is intentionally postponed with a trigger, owner and protected value. |
| `omitted` | The concern is applicable but intentionally excluded with rationale and consequence. |
| `not_applicable` | The concern does not apply to the declared scope; a reopen trigger is recorded when useful. |

Minimum disposition record:

`concern/result | scope | disposition | rationale/protected value | carrier/Loop | first relying use | dependencies | verification/admission | owner/authority | reopen trigger`

Equivalent evidence is valid when provenance, meaning, receiving use and return routes remain recoverable. PEC never requires one file per concern.

Reference concern families for selection are:

1. context, stakeholders, problem and scope;
2. sources, applicability and carried claims;
3. operational concept, operational scenarios and observable behavior;
4. requirements, MVP boundary and User Stories where useful;
5. domain, data, state, identity, invariants and persistence;
6. architecture, interfaces, APIs, external systems and integration;
7. authority, roles, permissions, security, privacy and audit;
8. UX/UI and human-centred interaction where applicable;
9. quality, test cases, traceability, verification, validation and acceptance;
10. construction, scaffolding, CI and reusable implementation slices;
11. transition, deployment, operation, monitoring, recovery and support;
12. change, source revision, supersession, Process Review and learning.

The catalogue is a selection aid. Context can add, split or combine concerns without changing DPF authority.

### Commitment Guards

Apply a guard before the first relying use that would make a relevant decision costly, shared or hard to reverse.

| Guard | Trigger | Minimum result before commitment |
|---|---|---|
| `PEC-G01 Process Coverage` | A new consequential Working Process/Loop or material scope change | Material concern/result dispositions, dependencies, first relying uses and return routes |
| `PEC-G02 Cross-cutting Commitment` | A shared quality, security, authority, UX or architectural property crosses slices/elements | Owner, affected boundaries, decision/evidence, verification intent and reopen condition |
| `PEC-G03 Data-State-Persistence` | Planned scenarios share identity/state/invariants or a slice introduces consequential persistence | Logical concepts, identity/ownership/lifecycle, relationships, invariants, source-of-truth boundaries, projection/migration exposure and unresolved verification questions |
| `PEC-G04 Relied-on Data Migration` | Data is non-resettable, relied upon, production or externally valued | Compatibility, migration, backup/recovery, verification, rollback and operational ownership |
| `PEC-G05 Integration and System Property` | Multiple elements, external interfaces or system-wide properties are involved | Levels, interfaces, integration responsibility, system-property verification and failure return |
| `PEC-G06 Transition and Baseline` | A result will become an operational, supplier or release baseline | Configuration, acceptance evidence, transition/operation/recovery limits and Admission authority |

Guard outcomes are `pass`, `pass_with_declared_gap`, `return`, `defer` or justified `not_applicable`. `pass_with_declared_gap` is valid only when the receiving use, owner and authority accept the remaining gap.

**Architecture-first** means resolving or bounding shared, consequential and hard-to-reverse decisions before dependent commitments. It does not mean completing all design before feedback, freezing a physical schema or prohibiting later change.

For `PEC-G03`, the logical readiness result does not require a complete physical database schema. Physical schemas remain iterative projections. Record the reliance state separately:

- `disposable_synthetic` — reset is expected;
- `development_reseedable` — controlled reseed is acceptable;
- `relied_on_nonproduction` — compatibility/recovery may already matter;
- `production_or_externally_valued` — explicit migration and recovery evidence is required.

`PEC-G04` is triggered only by relied-on value and consequence. Migration is an engineering technique, not by itself a process defect.

## Human Gates

A Human Gate is a reference contract: decision class, owner, candidate, intended use, evidence, limitations, configuration, allowed outcomes and return route. Place gates at material reliance/irreversibility boundaries. Do not gate every agent step; actual people and thresholds belong to LPF/project.

## Alternative compositions

- Direct Work: one reversible edit with explicit verification; PEC may be recorded as not used.
- Standalone Script: behavior, inputs/outputs, state, failure and tests; product UX/data/PAP concerns may be not applicable.
- Driver or bounded component: interfaces, timing/state, platform constraints, failure behavior and integration evidence; UI/product process remains conditional.
- Research Spike: timeboxed non-production result with limitations and a disposal/transfer decision.
- Lightweight Product/MVP: combined carriers cover scope, scenarios, UX, domain/data, architecture and tests without simulating a large organization.
- Source-heavy Domain MVP: source mediation and shared data/state readiness precede consequential persistence across slices.
- Architecture-first Iterative Product: shared commitments are bounded early; admitted results are reused or explicitly superseded across slices.
- Integrated System: system levels, integration ownership and system-property verification are explicit.
- PAP-strengthened Assurance: use the existing PAP only after applicability; add independence/equipment evidence without upward leakage.
- Legacy Evolution: identify relied-on baseline and impact, then change the smallest justified set with compatibility evidence.

These contextual compositions can use Lightweight, Iterative/CI, Risk-driven, Test-first, supplier/integration-staged, V-shaped or hybrid lifecycle views. The context family is not a maturity ladder.

## V-cycle reference composition

For a PAP adoption with staged decomposition/integration, map system claims and verification intentions on paired sides, keep iteration/returns at every stage, and make generated V views return to underlying entities. The V is optional. IEC 61513:2026 explicitly allows other lifecycles when applicable requirements are satisfied; ISO/IEC/IEEE 15288:2023 prescribes no lifecycle model.

## Vertical slices and reuse

A vertical slice is valuable when it reaches a verifiable outcome and leaves reusable, explicitly configured results for later work. Before starting a consequential slice, record:

- intended outcome and bounded scope;
- admitted upstream results and shared assumptions;
- affected concern families and applicable guards;
- local decisions versus decisions shared with later slices;
- verification and Admission route;
- data reliance/baseline state;
- supersession and smallest-responsible-return route.

Later slices reuse admitted decisions and artifacts at their declared configuration or explicitly supersede them with impact analysis. They do not silently build around inherited inconsistency. An intermediate slice is not a supported product version unless separately verified and admitted for that use.

## Process Review and learning

After a significant Run, return, pilot or counterexample, compare the observed behavior with the selected composition and guard triggers. An observation becomes a Candidate Lesson, not an automatic process change. Record applicability, affected results/Loops, proposed repair, migration impact, verification and process authority. Change only the smallest responsible reference, Working Process or Loop; a normative DPF hypothesis follows a separate formal route.

## Failure handling

Unknown applicability → return to Source Mediation/profile authority. Failed/inconclusive evidence → repair/reframe, never silent admit. Unbounded dependency impact → broaden assessment or regenerate. Authority ambiguity → stop and escalate. Budget exhaustion → honest partial/blocked result.

## Mappings and exclusions

Schemas, folder layouts, prompts and sample thresholds belong to RA/Guide/PAP. This RP does not determine compliance, enforce Core-11, assign local roles or constitute performed work.

<a id="chapter-7"></a>

# 7. Primary Application Profile

> **Authority status:** bounded specialization activated only by explicit applicability/adoption; not a ninth level and not compliance proof.

## Status

PAP is a bounded specialization profile for long-lived, complex, regulated or assurance-sensitive software and software–equipment systems. It is not a ninth authority level and has effect only when adopted with an explicit applicability basis. It cannot prove compliance.

## Applicability screen

Consider PAP when several of these hold: high consequence of error, low reversibility, equipment integration, safety/security relevance, multiple suppliers, long lifecycle, stringent configuration/traceability, independent assurance, or external regulatory/contractual sources. Record non-use when these concerns do not justify its overhead.

## Strengthenings

| Concern | PAP strengthening |
|---|---|
| Source/applicability | Exact edition, jurisdiction, system/lifecycle scope, nature, adoption basis, carried/non-carried material and refresh trigger |
| Human authority | Named accountable decisions, separation where required, prohibited agent actions, explicit return paths |
| Admission | Claim-specific evidence, configuration, limitations and independent check where applicable |
| Configuration | Long-lived baselines, supplier/tool/source versions, deviation and supersession history |
| Traceability | Required two-way assurance/change queries, known gaps and relation maintenance |
| Verification | Early intent, representative environment, failure evidence, independence and inconclusive-result handling |
| Long lifecycle | Obsolescence, migration, source revision, platform/application separation and monitoring |
| Security | Lifecycle security concern when applicable; no claim of complete control coverage |

## CP-16 — Equipment Boundary and Failure Evidence

Status: `profile-only grounded`, embedded control.

For every relied-upon claim crossing software and equipment, identify the physical/software boundary, failure/interaction claim, assumptions and evidence limitations. Select a justified combination from interface analysis, hardware/software integration testing, simulation/digital model, equipment-in-loop, fault injection, supplier evidence, field evidence, operational monitoring and independent verification. No technique or artifact is universally required; representativeness and residual gaps must be explicit.

## Core-11 disposition

PAP requires coverage, not eleven named files. By default it expects recoverable concerns for sources/applicability, context/scope, requirements/claims, architecture/interfaces, authority/security, configuration/baseline, and V&V/trace/evidence. Behavior, domain/data, equipment and UI concerns are conditional. Every carrier may be replaced by equivalent evidence-bearing material with a demonstrated return path; omissions require rationale.

## Model-driven option

A connected engineering model is a preferred reference option when dense relations, long retention, multiple views, change impact and replay justify it. It is not mandatory. Document-centric, code-centric, federated, database-backed, event-sourced, generated-view and hybrid approaches remain admissible. Adoption must state authoritative loci, synchronization, loss/recovery, migration and tool-exit strategy.

## Lifecycle options

The V-cycle is useful for staged supplier/integration work and paired verification claims, but is only one option. Iterative, incremental, spiral/risk-driven, continuous delivery, test-first, continuous-verification and hybrid lifecycles remain available if applicable obligations are satisfied.

## Source applicability

Use the PAP and industry section of [AI SDLC Sources](#chapter-11-source-register) as a screening baseline and follow the applicability rules in [Governance](#chapter-11-maintenance-governance). IEC/IAEA relevance does not create national legal authority. NP-026-16 is mandatory only within its Russian jurisdiction/system scope. A national standard is not automatically mandatory without an adoption basis. Actual licensing, contractual and legal determinations remain external obligations.

## Tailoring and non-use

Adoption records selected strengthenings, equivalent carriers, omissions, deviations, decision owners and reopen triggers. For lower-consequence or reversible work, use the general DPF/lightweight profile instead. Artifact count, trace percentage or maturity level never substitutes for assurance or value.

## Limitations

No clause-level conformance assessment, safety classification, licensing basis, contract interpretation or product assurance was performed. Qualified engineering, legal/regulatory and human review remain required for concrete adoption.

<a id="chapter-8"></a>

# 8. Application Guide

> **Authority status:** informative. Templates and sequences do not create requirements.

This carrier is informative. It explains ways to use the DPF; it has no independent authority.

## Lightweight adoption

1. Frame the task directly with FPF C.22/C.22.2.
2. Use FC-13 to declare a lightweight profile and reopen conditions.
3. Bound agent work with one check, one budget and one honest-stop route.
4. Keep generated output a candidate until ordinary review.
5. Identify the commit/run/source state actually relied upon.

Do not create a graph, eleven files or a V-cycle merely to claim conformance.

## General adoption checklist

- What is the agentic-process EoC and intended reliance?
- Which patterns address a real problem here?
- What is deliberately not used, and why?
- Where does agent authority stop?
- What makes a candidate fit for its intended use?
- Which sources/versions and claims matter?
- Which two-way trace queries justify maintenance?
- What is complete enough, with which gaps?
- Which configuration is relied upon?
- What observation could falsify the result?

## Selecting a Product Engineering Composition

The Reference Process offers an optional Product Engineering Composition (PEC) for projects that need more than one direct bounded result. PEC is a tailoring aid: it does not prescribe a lifecycle, organization, artifact set or gate sequence.

Use this five-step method:

1. **Screen the context.** Declare intended outcome, scope, consequence, reversibility, system level, interfaces, data reliance, assurance needs and likely first relying use.
2. **Select a contextual composition.** Start with the lightest plausible route—Direct Work, Script, Driver, Spike, Lightweight Product, Source-heavy MVP, Architecture-first Product, Integrated System, PAP-strengthened Assurance or Legacy Evolution.
3. **Disposition material concerns/results.** Mark each as `explicit`, `combined`, `cross_cutting`, `deferred`, `omitted` or `not_applicable`; record where relied-on meaning is recoverable.
4. **Apply triggered Commitment Guards.** Resolve only the evidence needed before a shared, consequential or hard-to-reverse commitment.
5. **Build and learn in verified slices.** Reuse admitted results, supersede them explicitly when evidence changes, and return failures to the smallest responsible result.

### Selection screen

| Question | Lightweight signal | Strengthening signal |
|---|---|---|
| Is the work reversible and isolated? | Direct Work or Script | Shared baseline, external use or hard rollback |
| Are state/data shared across future scenarios? | Disposable synthetic state | Relied-on identity, invariants, migration or recovery |
| Are multiple components or external systems involved? | One bounded interface | Integration owner and system-property verification |
| Is interaction material? | Non-interactive/known operator path | UX research, screen map or validation evidence |
| Are sources/adoption decisions consequential? | Local facts | Source mediation, applicability and revision control |
| Is assurance/equipment evidence required? | Ordinary project route | PAP applicability and qualified review |

If every strengthening signal is absent, do not instantiate full product apparatus merely because PEC exists.

## Concern disposition

Use one compact row per material concern/result:

`concern/result | declared scope | disposition | rationale/protected value | carrier/Loop | first relying use | dependencies | verification/admission | owner/authority | reopen trigger`

Examples:

- a small web MVP may combine MVP scope, operational scenarios and User Stories in one product brief;
- a driver can mark UI design `not_applicable` while keeping interface/state/failure behavior explicit;
- a security property can be `cross_cutting` across architecture, implementation and verification with one accountable owner;
- production migration can be `deferred` while data is `development_reseedable`, with a trigger before non-resettable reliance.

Do not accept a row such as “covered by implementation” without a recoverable result, receiving use and check. Do not create one file per row unless independent maintenance actually requires it.

## Commitment guards

Commitment Guards are pre-reliance questions, not mandatory stage gates:

- `PEC-G01 Process Coverage` — before approval of a new consequential Working Process/Loop, can material concerns, dependencies and first relying uses be recovered?
- `PEC-G02 Cross-cutting Commitment` — before sharing a quality/security/authority/UX/architecture decision, are owner, boundary and verification explicit?
- `PEC-G03 Data-State-Persistence` — before consequential persistence, do declared scenarios expose identity, ownership, lifecycle, relations, invariants and source-of-truth boundaries?
- `PEC-G04 Relied-on Data Migration` — before data becomes non-resettable or externally valued, are compatibility, migration, recovery and rollback owned and testable?
- `PEC-G05 Integration and System Property` — before subsystem commitments, are interfaces, integration responsibility and system-level verification visible?
- `PEC-G06 Transition and Baseline` — before operational/release reliance, is the configuration recoverable and accepted for that use?

A guard can pass with a declared gap only when the receiving use and authority explicitly accept it. Otherwise return to the smallest responsible result.

## Vertical slices and reuse

A slice should deliver a verifiable outcome quickly while preserving useful engineering results. A compact slice card can be:

`outcome/scope | admitted upstream results | shared assumptions | affected concerns/guards | local/shared decisions | verification/admission | data/baseline state | supersession/return`

For each later slice:

1. load the admitted upstream configuration;
2. reuse decisions whose assumptions still hold;
3. perform impact analysis before superseding shared decisions;
4. update affected verification and generated views;
5. return a failed check to the responsible model, contract or requirement rather than building a workaround around inherited debt.

CI and passing slice tests do not by themselves prove system acceptance or integration properties.

## Data and migration

`PEC-G03` is a logical readiness check, not a demand for a complete physical schema. The minimum can be one model/table identifying concepts, identity, ownership, lifecycle, relationships, invariants, state transitions, source-of-truth boundaries, projection/migration exposure and unresolved verification questions across the declared scenarios.

Record one current reliance state:

| State | Allowed treatment |
|---|---|
| `disposable_synthetic` | Reset freely; do not fabricate production migration work. |
| `development_reseedable` | Preserve a deterministic reseed path and declared test assumptions. |
| `relied_on_nonproduction` | Add compatibility, backup/recovery and change evidence proportionally. |
| `production_or_externally_valued` | Require owned migration, validation, rollback/recovery and operational evidence. |

Physical schema evolution remains iterative. A migration is not evidence that slicing failed; unmanaged reliance, hidden shared assumptions or unverified compatibility are the relevant process failures.

## Context examples

| Context | First useful result | Typical selected concerns | Typical explicit non-use/reopen |
|---|---|---|---|
| Direct reversible change | Verified patch/result | impact, change, check, rollback | Full PEC not used; reopen on shared dependency |
| Script | Executable behavior with tests | inputs/outputs, state, failure, security as applicable | UX/product baseline not applicable |
| Driver/component | Interface/state contract and integration test | platform, timing, failure, interfaces, verification | Product UI conditional |
| Research spike | Timeboxed finding | question, experiment, evidence, limitations | Not production; transfer requires new Admission |
| Small web MVP | Demonstrable bounded product baseline | scope, scenarios, UX, data, architecture, tests | Separate files/roles not required |
| Source-heavy MVP | Mediated claims plus reusable domain/data baseline | sources, scenarios, data guard, trace, validation | Reopen on source revision |
| Medium product | Admitted shared decisions plus verified slices | architecture, API, data, UX, quality, operation | Strengthen on coupling/consequence |
| Integrated system | Integration-ready system baseline | levels, interfaces, owner, system properties | Subsystem success is insufficient |
| PAP route | Qualified assurance package | applicability, independence, equipment evidence | No compliance claim from process alone |
| Legacy evolution | Bounded compatible change | relied-on baseline, impact, migration, regression | Full regeneration only if impact unbounded |

## Example templates

### Bounded loop card

`target | input/config | allowed effects | check | budget | stop/partial return | owner`

### Admission card

`candidate | intended use/claim | evidence | limitations | baseline | owner | admit/repair/reject`

### Source-use card

`source/version/locus | source statement | carried claim | applicability | exclusions | owner | refresh`

### Profile card

`context | consequence/reversibility | selected/omitted patterns | RA/RP/PAP options | reasons | reopen`

These are examples, not schemas or required files.

## Common failures

Activity as progress → test an observable result. Human gate everywhere → place authority at material transitions. Bibliography as evidence → mediate claims. Trace percentage as value → test actual queries. Baseline as completion → state gaps. Model as truth → declare authoritative loci and loss. Minimal map as coverage → disposition material concerns and receiving uses. First slice as product model → run data/state readiness across declared scenarios before consequential persistence. Architecture-first as BDUF → bound only shared and hard-to-reverse commitments. Independent slice stacks → reuse or explicitly supersede admitted results. Migration as failure → classify data reliance and verify compatibility. CI as acceptance → verify integration and system properties separately. V-cycle as law → compare lifecycle options. PAP as compliance → obtain a concrete applicability determination.

## Adaptation to an organization or project

Start from the DPF invariant rather than copying the reference package unchanged. Select patterns through FC-13, choose or replace RA contracts and RP fragments, adopt PAP only with an applicability basis, then assign organization or project roles, tools, thresholds and evidence carriers at the lower authority level. Preserve provenance and exclusions through [AI SDLC Traceability](reference/AI_SDLC_TRACEABILITY.md), and govern semantic changes through [AI SDLC Governance](#chapter-11-maintenance-governance).

## PAP adoption

Start with applicability, system/software/equipment boundaries and required assurance claims. Select equivalent evidence-bearing carriers, not Core-11 by filename. Record model/V non-use where alternatives better fit. Engage qualified regulatory, safety, security and V&V reviewers before project reliance.

<a id="chapter-9"></a>

# 9. Glossary

> **Authority status:** supporting term recovery. FPF governs mapped meanings.

| Term | Meaning and authority note |
|---|---|
| Agentic process | A software-development process in which AI agents perform bounded engineering work under allocated authority |
| Primary EoC | The agentic software-development process in a defined project context |
| Candidate result | Agent-produced output not yet admitted for reliance |
| Admitted result | Candidate accepted by accountable authority for a bounded claim/use |
| Source state | Exact source edition/locus/status/adoption state |
| Mediated claim | Interpretation carried from a source for a declared engineering use |
| Evidence | Observation/data bearing on a claim; not itself assurance or decision |
| Assurance | Confidence-building argument/activity; distinct from evidence and authority decision |
| Baseline | Identified relied-upon configuration; not completion |
| Trace | Typed relation maintained to answer a declared reliance query |
| View | Use-specific projection with declared preservation/loss and return path |
| Profile | Contextual selection/strengthening/omission of process content; not maturity |
| PAP | Bounded specialization profile; not an authority level |
| Reference Architecture | Optional conceptual structure/contract realizing patterns |
| Reference Process | Optional composable operations realizing patterns |
| Application Guide | Non-normative examples/templates |
| Product Engineering Composition (PEC) | Optional reusable Reference Process starting point combining navigation, concern/result dispositions and proportional guards; not a DPF pattern, mandatory lifecycle or project authority |
| Concern disposition | Explicit treatment of a material concern/result as `explicit`, `combined`, `cross_cutting`, `deferred`, `omitted` or `not_applicable`, with recoverable rationale and receiving use |
| Commitment guard | Proportional pre-reliance check triggered by coupling, consequence, applicability or reliance; not a mandatory gate at every stage |
| LPF | Organization-specific framework with local authority |
| Project-specific Process | Concrete process selected for one project |
| Performed Work | Actual execution and results; not their description |
| Human Gate | Reference-process decision contract; not a universal pattern |
| Core-11 | Historical reference carrier set; not a universal minimum |

FPF meanings govern where a term maps to FPF. Local shorthand cannot silently override it.

<a id="chapter-10"></a>

# 10. Worked Examples

> **Authority status:** informative application demonstrations; not validation of truth, effectiveness or compliance.

These examples are informative. They demonstrate application and do not establish pattern truth or project compliance.

## Example 1 — Direct reversible work

### Context

A maintainer asks an agent to make one reversible internal configuration/code correction with an observable check and ordinary review. The material harms are wasted time and an unnoticed incorrect edit; no shared product model, external source claim, equipment or long retention is involved.

### Selected and non-used patterns

- Selected: FC-02, FC-03, FC-04, FC-09 and FC-13.
- Not used: FC-05/06 because no material external-source claim exists; FC-07 because the commit/diff answers the relevant queries; formal FC-08 because scope is directly observable.
- FC-11 is realized by one acceptance example rather than a separate verification plan.
- PEC is explicitly not used beyond a Direct Work screen; product/data/UX/PAP concerns are `not_applicable` for this scope and reopen on shared reliance.

### Architecture realization

The realization is code/commit-centric: issue, branch commit, test output and review decision. No graph, Core-11 package, canonical model or V structure is introduced.

### Process composition and Human Gates

Direct FPF frame → bounded agent edit → check → ordinary review. One Human Gate exists at reliance; the agent cannot admit or change production.

### Artifacts

Short task brief, changed configuration/diff, check output and review note.

### Benefits, overhead, failure and adaptation

- Expected benefits: bounded iteration, explicit candidate status and no silent admission.
- Overhead: minutes of declaration/review rather than a new document system.
- Failure scenario: a flaky test consumes the loop budget; the agent returns a partial patch instead of claiming completion.
- Reopen/adaptation: use PEC dispositions/guards, FC-07, stronger FC-11 or PAP only if dependencies, reliance or consequence grow.

## Example 2 — Script or bounded driver

### Context

A small team builds a standalone import script or a bounded device driver. The result has defined inputs/outputs, platform/interface constraints, state and failure behavior, but no product UI and no production database.

### Concern disposition and guards

- Explicit: behavior, inputs/outputs, interface/platform assumptions, state/failure modes, security as applicable and verification.
- Combined: requirements, interface contract and test examples may share one compact carrier.
- `not_applicable`: product UX, production-data migration and PAP unless a concrete assurance/equipment trigger appears.
- `PEC-G05` applies for a driver integrated with hardware/OS; `PEC-G03/G04` do not apply to disposable local test state.

### Process composition

Frame → compact behavior/interface contract → implementation in small increments → automated and integration checks → accountable admission. No full product roadmap, screen map or twenty-file artifact sequence is created.

### Benefits, overhead, failure and adaptation

- Expected benefits: lightweight work still exposes interface/state assumptions that later integration relies on.
- Overhead: one compact contract and test evidence.
- Failure scenario: a driver passes unit tests but violates timing or recovery behavior at the integration boundary; return to the interface/state result rather than patch around it.
- Reopen/adaptation: add system-level integration ownership, PAP or operational transition evidence when consequence or reliance grows.

## Example 3 — Source-heavy multi-slice web MVP

### Context

A small team builds a web MVP from changing domain sources. Several operational scenarios share identity, lifecycle state and invariants. Early environments use synthetic/reseedable data; the first vertical slice covers only one scenario.

### Concern disposition and guards

- Source statements are mediated into bounded claims and revision triggers.
- MVP scope, ConOps/operational scenarios and User Stories can be combined, but each remains recoverable.
- Before first consequential persistence, `PEC-G01` exposes material concerns and `PEC-G03` models concepts, identity, ownership, lifecycle, relations, invariants and source-of-truth boundaries across all declared MVP scenarios.
- Data state is `development_reseedable`; `PEC-G04` is deferred until non-resettable reliance.

### Process composition and slice reuse

Source mediation ↔ scenarios/scope ↔ logical data and architecture readiness → first verified slice → admission of reusable decisions → later slices reuse or explicitly supersede them. The first physical schema remains an iterative projection; it is not treated as the complete product model.

### Benefits, overhead, failure and adaptation

- Expected benefits: shared data assumptions become visible before slice-local persistence creates hidden legacy.
- Overhead: a compact cross-scenario logical model and disposition table.
- Failure scenario: a later source revision changes an invariant; return to the mediated claim and affected model/tests, not the whole project.
- Reopen/adaptation: trigger migration/compatibility/recovery only when data becomes relied-on.

## Example 4 — General medium-consequence product

### Context

A long-lived SaaS product has multiple human teams, coding/analysis agents, CI/CD, evolving requirements, security guidance and customer commitments. An incorrect admission can affect customers, but releases are reversible and no PAP industry source is adopted.

### Selected and non-used patterns

- Selected: all ten general patterns.
- Profile: medium-consequence, iterative/continuous-delivery.
- Not used: V-cycle, exact Core-11 files and a single canonical model.
- PEC route: Architecture-first Iterative Product with explicit architecture/data/API/UX/quality/operation dispositions.

### Architecture realization

Authoritative loci are federated: requirements and source claims in an issue/requirements service, code/configuration in VCS, evidence in CI and decisions in ADR records. Typed IDs and links answer “why” and “what changes”; dashboards are generated views with declared freshness and source return.

### Process composition and Human Gates

Frame → select profile/PEC → disposition concerns and shared commitments → mediate material sources → co-design acceptance/security verification → reusable vertical slices → CI evidence → integration/system verification → admission → release baseline. Source changes trigger impact review; failed evidence returns to the smallest responsible result. Human Gates cover architecture-impact decisions, security-sensitive admission and production release.

### Artifacts

Mediated source claims, requirements, ADRs, commits, tests/scans with limitations, a release baseline and known-gap register. Names and storage are local choices, not Core-11 conformance.

### Benefits, overhead, failure and adaptation

- Expected benefits: recoverable reliance across changing requirements and multiple agents.
- Overhead: relation/currentness maintenance and focused human review.
- Failure scenario: a new slice builds a parallel data/API stack around an inherited inconsistency; PEC reuse/supersession and FC-07/08 return the shared decision for impact repair.
- Reopen/adaptation: reassess the profile for a high-consequence feature, equipment integration or external mandate.

## Example 5 — PAP software/software–hardware integrated system

### Context

A long-lived multi-supplier control system integrates software with equipment. Error consequence is high; platforms and source editions change; configuration, traceability, V&V, evidence, assurance and human authority require strengthening. Industry sources are screened, but their legal applicability is not assumed.

### Selected and non-used patterns

- Selected: all ten general patterns, adopted PAP strengthenings and CP-16.
- Profile: high-consequence PAP subject to qualified applicability determination.
- Selected options: model-driven connected RA for dense long-lived relations and a V composition for supplier/integration pairing.
- Not required: exact Core-11 files; equivalent controlled carriers cover the concerns.
- PEC route: Integrated System strengthened by PAP; `PEC-G05/G06` expose integration responsibility, system properties, transition and baseline evidence.

### Architecture realization

A federated connected model links exact source editions, mediated claims, system/software/equipment interfaces, failure claims, architecture, supplier baselines, verification intentions, evidence, admissions and generated views. Platform qualification remains distinct from application evidence. Durable exports and migration tests provide tool-exit recovery.

### Process composition and Human Gates

FPF frame → applicability/profile decision → source mediation → claim/verification co-design → bounded agent work → supplier/integration evidence → independent check where adopted → accountable admission/baseline → source/change impact. A staged V view pairs decomposition and integration while preserving iteration and return. Human Gates cover source applicability, safety/architecture decisions, equipment-boundary evidence, admitted baselines and unresolved deviations.

### Artifacts

Profile/applicability record; source/currentness register; context, requirement, architecture and interface descriptions; authority assignments; configuration baselines; trace queries; equipment-boundary evidence using justified simulation, equipment-in-loop and supplier evidence; independent review; monitoring and supersession records. These are evidence-bearing concerns, not mandated filenames.

### Benefits, overhead, failure and adaptation

- Expected benefits: controlled source/configuration change and a visible software–equipment assurance basis.
- Overhead: substantial governance, tooling, independent review and long retention.
- Failure scenario: a newer international edition is treated as automatically replacing the adopted national or contractual baseline; FC-05/06 and PAP stop the inference pending an impact/adoption decision.
- Reopen/adaptation: reassess on changes to classification, regulator/contract, platform, equipment boundary, lifecycle or evidence limitations.

## Cross-example use

The examples demonstrate that PEC can be declined, combined or strengthened; pattern non-use, RA alternatives and different RP compositions remain possible; slices reuse admitted results instead of accumulating hidden debt; Human authority stays recoverable; PAP does not leak upward; Core-11, V and model-driven realization are not universal requirements. These examples do not prove PEC field effectiveness.

<a id="chapter-11"></a>

# 11. Sources and maintenance

> **Authority status:** evidence/currentness and publication-governance support. Sources and maintenance records do not create pattern authority.

<a id="chapter-11-source-register"></a>

## Source register

### Purpose and use

This compact register contains the sources needed to interpret and maintain AI SDLC DPF `1.0.1` and its bounded reference-package realization. It is not a decorative bibliography, a legal-applicability decision or a clause-level conformance record. Core DPF source currentness was checked on `2026-07-31`; Reference Process composition sources were refreshed on `2026-08-01`. Each source must be used only for the bounded purpose and applicability shown.

### 1. Governing conceptual dependency

| Source ID | Citation | Used for | Authority/applicability | Currentness | Refresh trigger |
|---|---|---|---|---|---|
| FPF-2026-07 | **First Principles Framework — Core Conceptual Specification**. Edition: July 2026. SHA-256: `A6B2C26A8E3B56F5B1AC4CE16D6A6818CFB2A0CF4FFBD5E69619FF9722EF6E75` | Governing concepts; E8 form; direct FPF reuse; E21 method | External governing dependency, not AI SDLC DPF content | Pinned release dependency | Any semantic or published-edition change |

The full FPF specification is intentionally not distributed in this working kit. A maintainer must acquire the pinned edition from the authorized project source and verify the hash before changing normative patterns or their FPF mappings.

### 2. General AI SDLC DPF sources

| Source ID | Citation | Used for | Authority/applicability | Currentness | Refresh trigger |
|---|---|---|---|---|---|
| W1-S01 | NIST AI 600-1, 2024 | FC-03 contextual oversight; FC-04 evaluation before reliance | Voluntary cross-sector profile; not project law | Current final | AI RMF/profile revision |
| W1-S02 | NIST SP 800-218A, 2024 | FC-04 evidence, provenance and limitations | Producer/acquirer security guidance | Current final | SSDF or AI-profile revision |
| W1-S04 | Amershi et al., CHI 2019 | FC-03 correction, control and authority return | Foundational human–AI interaction evidence | Foundational | Agentic-SE oversight replication |
| W2-S01 | ISO/IEC/IEEE 29148:2018 | FC-05 source/claim identity; FC-07 bounded trace | Consensus requirements-engineering standard by adoption | Current; revision expected | Replacement or new edition |
| W2-S04 | Tian et al., requirements-traceability mapping study, 2021 | FC-07 benefit, cost and maintenance breadth | Systematic map; heterogeneous contexts | Aging current landscape | Newer systematic synthesis |
| W2-S05 | Charalampidou et al., traceability map, 2021 | FC-07 contextual evidence and non-use | Empirical map; no universal technique ranking | Aging current landscape | New industrial evidence |
| W2-S08 | in-toto stable v1.0 | FC-07 typed provenance as one realization | Supply-chain specification, not DPF trace ontology | Current stable | New stable major version |
| W2-S02 | NIST SP 800-53 Rev.5, release 5.2.0, 2025 | FC-09 identified baselines and controlled change | US federal/security scope; catalogue not imported | Current | NIST release or revision |
| W2-S07 | SLSA Provenance v1.2 | FC-09 production provenance | Supply-chain implementation option | Current approved | New approved version |
| W2-S09 | Reproducible Builds documentation | FC-09 material environment and variance | Practitioner corpus; build scope | Rolling, checked 2026 | Material documentation or technique change |
| W2-S12 | NIST SSDF 1.1, 2022 | FC-06 proportional change treatment | Government security guidance; no universal refresh procedure | Current final; 1.2 draft known | SSDF 1.2 final |
| W3-S02 | ISO/IEC/IEEE 29119-2:2021 | FC-11 lifecycle-neutral verification intent | Consensus test-process standard by adoption | Current | ISO review or revision |
| W3-S03 | NASA-STD-8739.8B and NASA assurance guidance | FC-11 objective/independent evidence option | NASA software scope; PAP strengthening only where applicable | Current scoped | NASA standard revision |
| W3-S04 | NASA SWE-050 | FC-08 review/trace checks as completeness aids | NASA handbook guidance, not general proof | Rolling, checked 2026 | Handbook or governing-standard revision |
| W3-S05 | Bissi et al., TDD systematic review, 2016 | FC-11 TDD as non-universal alternative | Heterogeneous foundational synthesis | Foundational/aging | New TDD meta-analysis |
| W3-S07 | Kochhar et al., coverage study, 2017 | FC-08 coverage anti-proxy counterevidence | Observational Java OSS evidence | Foundational | Causal cross-language replication |
| W4-S01 | ISO/IEC/IEEE 24748-1:2024 | FC-13 lifecycle adaptation and tailoring | Consensus standard by adoption | Current published | ISO revision or review |
| W4-S02 | ISO/IEC/IEEE 15288:2023 | FC-13 lifecycle plurality; optional V/model choices | General systems lifecycle standard by adoption | Current published | Revision or adoption change |
| W4-S07 | Giray et al., very-small-company process case | FC-13 lightweight profile and non-use | Single-company case; not effectiveness proof | Context-bounded | Broader comparative field evidence |

### 3. Reference Process composition sources

These official public sources bound the Product Engineering Composition claims carried by the Reference Process and Application Guide. They support lifecycle plurality, explicit concern coverage and contextual strengthening; they do not prescribe the exact PEC topology, a universal artifact list or a full physical-schema freeze.

| Source ID | Citation and official locus | Used for | Authority/applicability | Currentness | Refresh trigger |
|---|---|---|---|---|---|
| RP-S01 | [ISO/IEC/IEEE 12207:2026, Ed.2](https://www.iso.org/standard/90219.html) | Software-lifecycle breadth; concurrent/iterative/recursive/incremental application; method neutrality | Consensus standard only by adoption; does not prescribe PEC | Published 2026-04; stage 60.60 | Edition, amendment, review or adoption change |
| RP-S02 | [ISO/IEC/IEEE 15288:2023, Ed.2](https://www.iso.org/standard/81702.html) | System lifecycle, recursion, concurrency and lifecycle-model neutrality | Systems lifecycle standard only by adoption | Published 2023-05; stage 60.60 | Edition, amendment, review or adoption change |
| RP-S03 | [ISO/IEC/IEEE 24748-1:2024, Ed.2](https://www.iso.org/standard/84709.html) | Contextual lifecycle adaptation across domains and disciplines | Guidance by adoption; no universal project topology | Published 2024-03; stage 60.60 | Revision/review or relation change |
| RP-S04 | [ISO/IEC/IEEE 24748-6:2023, Ed.1](https://www.iso.org/standard/81563.html) | Integration planning and relationship to lifecycle processes | Applies when integration concerns exist; registry filename not prescribed | Published 2023-07; stage 60.60 | Edition, amendment or review |
| RP-S05 | [ISO/IEC/IEEE 29148:2018, Ed.2](https://www.iso.org/standard/72089.html) | Requirements-engineering and information-item concern coverage | Current edition with revision caution; no fixed Kit artifact sequence | Current/confirmed 2024; stage 90.92, successor CD under development | Successor publication or development-stage change |
| RP-S06 | [ISO 9241-210:2019, Ed.2](https://www.iso.org/standard/77520.html) | Human-centred design through interactive-system lifecycle | Interactive systems only; valid `not_applicable` elsewhere | Confirmed 2025; stage 90.93 | Review/revision or applicability change |
| RP-S07 | [ISO/IEC/IEEE 42010:2022, Ed.2](https://www.iso.org/standard/74393.html) | Architecture descriptions, concerns, viewpoints and architecture/description distinction | Does not prescribe architecting method, notation or tool | Published 2022-11; stage 60.60 | Edition, amendment or review |
| RP-S08 | [ISO/IEC 25010:2023, Ed.2](https://www.iso.org/standard/78176.html) | Product-quality concerns across requirements, design, test and acceptance | Characteristics are tailored; all are not mandatory | Published 2023-11; stage 60.60 | Edition, amendment or review |
| RP-S09 | [NIST SSDF publications](https://csrc.nist.gov/Projects/ssdf/publications) | Modular security strengthening within an SDLC | SSDF is not a complete lifecycle; draft is not final | SSDF 1.1 final; SSDF 1.2 draft dated 2025-12-17; checked 2026-08-01 | SSDF 1.2 final, withdrawal or material draft change |
| RP-S10 | [DORA Continuous Delivery](https://dora.dev/capabilities/continuous-delivery/) | Fast feedback/deployability across web, firmware, mainframe and schema contexts | Rolling operational guidance; not lifecycle authority | Rolling; checked 2026-08-01 | Material page/evidence-base change |
| RP-S11 | [DORA Database Change Management](https://dora.dev/capabilities/database-change-management/) | Visible version-controlled migrations and compatibility-oriented schema evolution | Applies when database/schema reliance exists; no no-migration claim | Rolling; checked 2026-08-01 | Material page/evidence-base change |
| RP-S12 | [The Scrum Guide, official current version](https://scrumguides.org/download.html) | Scrum's intentionally incomplete framework and composition with other practices | Scrum scope only; events do not prove engineering concern coverage | Official current version November 2020; checked 2026-08-01 | New official Scrum Guide version |

Exact PEC layers, dispositions, guards and contextual family are an experimental Kit synthesis mediated from these sources plus DPF FC-08/09/11/13. Public abstracts do not support clause-level conformance or legal applicability claims.

### 4. PAP and industry sources

| Source ID | Citation | Used for | Authority/applicability | Currentness | Refresh trigger |
|---|---|---|---|---|---|
| W5-S01 | IEC 61513:2026, Ed.3 | PAP lifecycle and I&C requirements; V as one option | International standard; binding only by adoption | Published; stability 2030 | Amendment, edition or adoption change |
| W5-S02 | IEC 62138:2018, Ed.2 | Category B/C software lifecycle and trace concerns | Nuclear I&C scope by adoption | Published; review due 2026 | Confirmation, revision or adoption |
| W5-S03 | IEC 60987:2021, Ed.3 | Hardware evidence boundary | Nuclear I&C hardware scope by adoption | Published | Amendment or revision |
| W5-S04 | IEC 63413:2026, Ed.1 | Platform/application qualification separation | Nuclear I&C platform scope by adoption | Published | Amendment or adoption |
| W5-S05 | IEC TR 62987:2015 | FMEA as an available CP-16 technique | Advisory technical report | Published | Revision |
| W5-S06 | IEC TR 62096:2009 | Long-lifecycle modernization concerns | Advisory technical report | Published; stability 2028 | Revision or stability review |
| W5-S07 | IAEA SSR-2/1 (Rev.1), 2016 | Safety-design obligations requiring local adoption analysis | IAEA requirements; national force only through adoption | Current series record | IAEA revision or national adoption |
| W5-S08 | IAEA SSG-39, 2016 | Lifecycle, interface, software/HMI and V&V guidance | Advisory specific safety guide | Current guide record | IAEA revision |
| W5-S09 | IAEA GSR Part 4 (Rev.1), 2016 | Graded assessment and independent verification | IAEA requirements within adopted scope | Current series | Revision or adoption |
| W5-S10 | IAEA NSS No.33-T, 2018 | Nuclear-facility I&C lifecycle security | Technical guidance; not complete control catalogue | Current record | Revision |
| W5-S11 | NP-026-16, Rostechnadzor Order 483, 2016 | FC-05/PAP jurisdiction and applicability boundary | Mandatory only in applicable Russian scope | Official/current-list status at check | Amendment, repeal or list change |
| W5-S12 | GOST R IEC 61513-2020 | FC-05/06 national-versus-international edition boundary | Russian national standard; mandate requires adoption basis | Effective national version at check | Amendment, replacement or adoption |
| W5-S13 | NRC RG 1.152 Rev.4 modernization source seam | FC-06 exact revision and licensing-basis currentness | US NRC guidance within concrete licensing context | Current selected reference at check | NRC guide, page or licensing revision |

Relevance to an industry does not establish jurisdiction, classification, contractual adoption or compliance. Concrete use requires qualified legal, regulatory and engineering determination.

### 5. Fast-changing sources requiring refresh

| Source ID | Citation | Used for | Authority/applicability | Currentness | Refresh trigger |
|---|---|---|---|---|---|
| W1-S05 | Agentless, 2024 | FC-02 simpler-workflow counterevidence | Repository benchmark/preprint scope | Fast-moving | Cross-task, model or benchmark replication |
| W1-S06 | SWE-agent, 2024 | FC-02 interface and action-bound effects | Repository benchmark/preprint scope | Fast-moving | Material ACI, task or model change |
| W1-S08 | Liu et al., IEEE TSE, 2024 | FC-04 candidate evaluation and repair | Model/task-bounded empirical evidence | Current, model-sensitive | New real-project or model replication |
| W1-S09 | CodeSecEval, 2024 | FC-04 claim-specific security evaluation | Benchmark evidence, not universal gate | Current, model-sensitive | Secure-code benchmark replication |
| W1-S13 | METR experienced-OSS randomized trial, 2025 | FC-02 productivity countercase; FC-03 perception gap | Early-2025 tools and repositories | Current, tool-sensitive | New field replication or design update |
| W3-S09 | Luitel et al., LLM requirements completeness, 2024 | FC-08 omission-finding aid | Forty specifications; model-bounded | Current, model-sensitive | Field or new-model replication |

Review these sources on every minor or major release and whenever a named trigger occurs.

### Provenance identities not distributed

The immutable source candidate used during framework derivation was `AI_SDLC_Core_v2_DPF_Methodology_v2.5`, SHA-256 `BCF35D7E15B69C04B37A7C377E15AF784B086A39BBDBB0A7AA5FA91D0D1630E4`. It is provenance, not current authority, and is intentionally excluded from this working kit.

<a id="chapter-11-maintenance-governance"></a>

## Maintenance governance

### Purpose

This document governs maintenance of the working framework package. It does not assign organization/project authority and is not a history of framework development.

### Authority architecture

| Level | Purpose and allowed authority | Cannot prove or prescribe |
|---:|---|---|
| 1. FPF | Governing conceptual distinctions and framework-construction rules | AI SDLC domain truth or project practice by itself |
| 2. AI SDLC DPF | Normative domain patterns for designing agentic software-development processes | One architecture, workflow, organization rule or project execution |
| 3. Reference Architecture / Metamodel | Optional conceptual realization and contracts | DPF truth or a concrete project architecture |
| 4. Reference Process | Optional composable operations and process alternatives | One mandatory end-to-end workflow |
| 5. Application Guide | Informative adoption guidance, templates and examples | Normative requirements |
| 6. Organization LPF | Organization-specific policy, roles, tooling and defaults | Universal domain or project truth |
| 7. Project-specific Process | Concrete authorized process for one project | Organization-wide or domain-wide authority |
| 8. Performed Work | Actual actions, observations and results | Retroactive redefinition of the governing process |

PAP is a bounded specialization of selected DPF/reference content. It is **not a ninth authority level**. It has effect only after an explicit applicability and adoption decision at the appropriate organization/project level.

### Change classes

| Change class | Typical content | Minimum handling |
|---|---|---|
| Editorial correction | Spelling, formatting, link repair with no meaning change | Peer check and patch version |
| Clarification without semantic change | Clearer wording preserving EoC, invariant, action and boundary | Impact check; affected-locus review |
| Source refresh | Edition, currentness, citation or evidence-boundary update | Currentness/applicability check; affected-pattern review |
| Reference realization repair | Backward-compatible RA/RP/Guide/operational correction that does not change normative DPF meaning | Formal scoped decision; source/authority/no-shadow review; behavioral replay; assembly version/hash update |
| Pattern repair | E8, ambiguity, action, grounding, non-use or relation repair | Formal decision; E8 replay; E21 evaluation |
| Pattern addition/removal/merge/split | Corpus or identity change | Formal decision; full coverage/no-shadow review; major or minor version judgment |
| PAP strengthening | New or revised profile-only control/applicability | Formal decision; source/applicability and upward-leakage review |
| Breaking change | Incompatible normative meaning, authority or adoption contract | Formal decision; major version and migration guidance |

### When a formal decision is required

A recoverable formal decision is required when changing:

- the pattern corpus;
- the primary Entity of Concern;
- a pattern invariant or first useful move;
- an authority boundary;
- source or domain applicability;
- PAP scope;
- normative versus informative status.

The decision must state the problem, exact change, considered alternatives, consequences, evidence, validation obligations and reopen conditions. The working kit need not carry the decision history, but maintainers must preserve it in the engineering repository.

### Source currentness

- **Periodic review:** inspect the complete compact source register for every minor or major release; inspect fast-changing sources at least on the cadence set by the maintainer.
- **Event-triggered refresh:** reopen the smallest affected pattern/profile locus when a named trigger fires.
- **Fast-changing AI sources:** reassess benchmark, model, interface, field-study and vendor-sensitive claims; do not transfer old performance results to new settings automatically.
- **Standards revision:** keep published, adopted and applicable states distinct. A new international edition does not silently replace an adopted national or contractual baseline.
- **Regulatory applicability:** jurisdiction, classification, contract, licensing basis and regulator position require qualified external determination.
- **Source replacement:** preserve old and successor identities, compare carried claims, record impact/no-impact/unresolved decisions, and update citations without silently broadening authority.

See [AI SDLC Sources](#chapter-11-source-register) for current records and triggers.

### Release process

```text
change proposal
→ impact review
→ source/currentness check
→ affected-pattern review
→ E8 repair if needed
→ E21 evaluation
→ traceability update
→ release decision
```

Before publication, also check local links, exact E8 headings, corpus/no-shadow dispositions, P/M coverage, hashes of governing inputs and separation of DPF/RA/RP/PAP/Guide authority.

### Versioning

| Version increment | Use |
|---|---|
| Major | Breaking normative, authority, EoC or compatibility change |
| Minor | Backward-compatible pattern or profile extension |
| Patch | Clarification, source refresh, editorial or non-semantic conformance repair |

The publication label must identify working/draft status separately from semantic versioning.

The normative AI SDLC DPF semantic version is independent from the Engineering Work Kit/reference-package assembly version. A Reference Process, Application Guide or operational repair does not imply a DPF version change when pattern meaning and corpus remain unchanged.

Unless a component has an explicitly governed independent version, its recoverable release identity is:

`Work Kit assembly version | component path | exact SHA-256 | compatible DPF version | publication status`

The package manifest is the distributed inventory and assembly identity carrier. Generated combined publication is a projection and must not become an independent semantic version source. Apply final hashes only after authored sources, generated parity and Candidate status labels are stable.

### Dependency and provenance control

Governing conceptual dependency: **First Principles Framework — Core Conceptual Specification**, July 2026, SHA-256 `A6B2C26A8E3B56F5B1AC4CE16D6A6818CFB2A0CF4FFBD5E69619FF9722EF6E75`.

Immutable derivation provenance: `AI_SDLC_Core_v2_DPF_Methodology_v2.5`, SHA-256 `BCF35D7E15B69C04B37A7C377E15AF784B086A39BBDBB0A7AA5FA91D0D1630E4`. This provenance source is not current framework authority and is not distributed in the working kit.

### Maintenance obligations

Maintain one primary EoC per pattern, positive action guidance, local Tell–Show–Show grounding, explicit non-use, consequences/costs, current source-use effects and late declarative relations. Re-evaluate quality for the declared readers and use after any material repair. Qualified human review, concrete regulatory applicability and product assurance remain external obligations.

<a id="chapter-12"></a>

# 12. Open Questions

> **Authority status:** governance/open evidence. An open question is not a normative pattern.

| ID | Question / gap | Current treatment | Reopen evidence |
|---|---|---|---|
| OQ-01 | Does selective refinement outperform regeneration across lifecycles? | FC-10 excluded/provisional | Current cross-lifecycle field comparison |
| OQ-02 | How should minimal agent context be selected across models/projects? | FC-14 excluded/provisional | Replicated multi-model field evidence |
| OQ-03 | Is there a carrier-independent knowledge/view governance method? | FC-16 excluded/provisional | Multi-context evidence of distinct move/result |
| OQ-04 | What is the field effectiveness/overhead of the ten-pattern language? | Working release limitation | Independent multi-project adoption evidence |
| OQ-05 | How quickly should fast-moving agent sources refresh? | Source-specific triggers | Material model/tool/benchmark changes |
| OQ-06 | Which PAP sources/editions apply to a concrete project? | External adoption decision | Jurisdiction, classification, contract, regulator |
| OQ-07 | Is model-driven realization preferable for a specific organization? | Bounded RA/PAP option | Comparative total-cost/recovery evidence |
| OQ-08 | Which lifecycle/process composition fits a project? | FC-13 decision; optional PEC contextual family and V are reference options, not mandatory routes | Project consequence, coupling, data reliance, evidence, supplier and field-use context |
| OQ-09 | Do E21 results transfer beyond the declared readers/use? | Working-release qualification | Independent practitioner/human review |
| OQ-10 | How should source/licensing restrictions affect automated ingestion? | No ingestion claim | Legal/contractual assessment and tool design |
| OQ-11 | Does PEC concern disposition and guard use reduce avoidable rework enough to justify its overhead? | Experimental reference repair; pass-by-design only | Comparative live pilots across direct/script, multi-slice product, integrated and PAP contexts |
