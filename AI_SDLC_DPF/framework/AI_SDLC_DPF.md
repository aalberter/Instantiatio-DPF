# AI SDLC Domain Principles Framework

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

Supporting carriers are [Sources](../reference/AI_SDLC_SOURCES.md), [Glossary](../reference/AI_SDLC_GLOSSARY.md), [Open Questions](../reference/AI_SDLC_OPEN_QUESTIONS.md), [Traceability](../reference/AI_SDLC_TRACEABILITY.md) and [Governance](../reference/AI_SDLC_GOVERNANCE.md).

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
