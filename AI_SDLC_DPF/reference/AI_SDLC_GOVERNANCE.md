# AI SDLC Governance

## Purpose

This document governs maintenance of the working framework package. It does not assign organization/project authority and is not a history of framework development.

## Authority architecture

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

## Change classes

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

## When a formal decision is required

A recoverable formal decision is required when changing:

- the pattern corpus;
- the primary Entity of Concern;
- a pattern invariant or first useful move;
- an authority boundary;
- source or domain applicability;
- PAP scope;
- normative versus informative status.

The decision must state the problem, exact change, considered alternatives, consequences, evidence, validation obligations and reopen conditions. The working kit need not carry the decision history, but maintainers must preserve it in the engineering repository.

## Source currentness

- **Periodic review:** inspect the complete compact source register for every minor or major release; inspect fast-changing sources at least on the cadence set by the maintainer.
- **Event-triggered refresh:** reopen the smallest affected pattern/profile locus when a named trigger fires.
- **Fast-changing AI sources:** reassess benchmark, model, interface, field-study and vendor-sensitive claims; do not transfer old performance results to new settings automatically.
- **Standards revision:** keep published, adopted and applicable states distinct. A new international edition does not silently replace an adopted national or contractual baseline.
- **Regulatory applicability:** jurisdiction, classification, contract, licensing basis and regulator position require qualified external determination.
- **Source replacement:** preserve old and successor identities, compare carried claims, record impact/no-impact/unresolved decisions, and update citations without silently broadening authority.

See [AI SDLC Sources](AI_SDLC_SOURCES.md) for current records and triggers.

## Release process

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

## Versioning

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

## Dependency and provenance control

Governing conceptual dependency: **First Principles Framework — Core Conceptual Specification**, July 2026, SHA-256 `A6B2C26A8E3B56F5B1AC4CE16D6A6818CFB2A0CF4FFBD5E69619FF9722EF6E75`.

Immutable derivation provenance: `AI_SDLC_Core_v2_DPF_Methodology_v2.5`, SHA-256 `BCF35D7E15B69C04B37A7C377E15AF784B086A39BBDBB0A7AA5FA91D0D1630E4`. This provenance source is not current framework authority and is not distributed in the working kit.

## Maintenance obligations

Maintain one primary EoC per pattern, positive action guidance, local Tell–Show–Show grounding, explicit non-use, consequences/costs, current source-use effects and late declarative relations. Re-evaluate quality for the declared readers and use after any material repair. Qualified human review, concrete regulatory applicability and product assurance remain external obligations.
