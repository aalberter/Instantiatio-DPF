# AI SDLC Reference Architecture

## Status and boundary

This is a bounded, implementation-neutral realization of the [AI SDLC DPF](AI_SDLC_DPF.md), not domain truth, a required tool stack or a project architecture. Alternative document-, code-, federated-, database-, event-sourced-, generated-view-, model-driven- and hybrid realizations are valid when they preserve selected pattern obligations.

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
