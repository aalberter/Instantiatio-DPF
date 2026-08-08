# AI SDLC Worked Examples

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
