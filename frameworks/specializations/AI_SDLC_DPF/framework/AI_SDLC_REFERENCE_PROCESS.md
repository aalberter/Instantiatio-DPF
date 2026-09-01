# AI SDLC Reference Process

## Status and composition rule

This carrier offers composable process fragments. It is neither the [DPF](AI_SDLC_DPF.md) nor one mandatory end-to-end workflow. Select fragments through FC-13 and specialize them through the [PAP](AI_SDLC_PRIMARY_APPLICATION_PROFILE.md), an organization LPF or a project context under their respective authority.

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
