# AI SDLC Primary Application Profile

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

Use the PAP and industry section of [AI SDLC Sources](../reference/AI_SDLC_SOURCES.md) as a screening baseline and follow the applicability rules in [Governance](../reference/AI_SDLC_GOVERNANCE.md). IEC/IAEA relevance does not create national legal authority. NP-026-16 is mandatory only within its Russian jurisdiction/system scope. A national standard is not automatically mandatory without an adoption basis. Actual licensing, contractual and legal determinations remain external obligations.

## Tailoring and non-use

Adoption records selected strengthenings, equivalent carriers, omissions, deviations, decision owners and reopen triggers. For lower-consequence or reversible work, use the general DPF/lightweight profile instead. Artifact count, trace percentage or maturity level never substitutes for assurance or value.

## Limitations

No clause-level conformance assessment, safety classification, licensing basis, contract interpretation or product assurance was performed. Qualified engineering, legal/regulatory and human review remain required for concrete adoption.
