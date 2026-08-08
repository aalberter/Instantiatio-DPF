# AI SDLC Application Guide

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

Start from the DPF invariant rather than copying the reference package unchanged. Select patterns through FC-13, choose or replace RA contracts and RP fragments, adopt PAP only with an applicability basis, then assign organization or project roles, tools, thresholds and evidence carriers at the lower authority level. Preserve provenance and exclusions through [AI SDLC Traceability](../reference/AI_SDLC_TRACEABILITY.md), and govern semantic changes through [AI SDLC Governance](../reference/AI_SDLC_GOVERNANCE.md).

## PAP adoption

Start with applicability, system/software/equipment boundaries and required assurance claims. Select equivalent evidence-bearing carriers, not Core-11 by filename. Record model/V non-use where alternatives better fit. Engage qualified regulatory, safety, security and V&V reviewers before project reliance.
