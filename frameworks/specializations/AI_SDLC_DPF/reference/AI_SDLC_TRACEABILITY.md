# AI SDLC Traceability

## Purpose

This is the operational trace summary for AI SDLC DPF `1.0.1`. It records release selection, provenance routing and no-shadow checks without carrying the development-history log. Normative authority remains only in the ten general patterns in [AI SDLC DPF](../framework/AI_SDLC_DPF.md).

## Release pattern origins

| Release pattern | Original concern/loci | Current normative locus | Main reference realization |
|---|---|---|---|
| FC-02 Bounded Agent Loop | Agent execution §§27.1–27.5; M072–M074 | `FC-02:1`–`FC-02:12` | RA Agent Run; RP-03; Guide loop card |
| FC-03 Human Authority Boundary | Authority/gates §§28.1–28.4, 31.5; M074–M077, M085 | `FC-03:1`–`FC-03:12` | RA authority boundary; RP Human Gates |
| FC-04 Candidate Result Admission | Trust/admission §§13.2–13.3, 31.4–31.5; M044, M085 | `FC-04:1`–`FC-04:12` | RA candidate/admitted states; RP-04 |
| FC-05 Source–Claim Mediation | Sources/claims §§4.1, 4.5, 6.2; M017–M019 | `FC-05:1`–`FC-05:12` | RA Source/Claim contract; RP-05 |
| FC-06 Current Source Impact | Source change §§17, 29; currentness concern | `FC-06:1`–`FC-06:12` | RA Impact Assessment; RP-06 |
| FC-07 Bidirectional Engineering Trace | Relations §7 and Appendix A; M033–M035, M068 | `FC-07:1`–`FC-07:12` | RA typed relations; RP-06/09 |
| FC-08 Bounded Completeness | Completeness §8 and readiness §16; M036–M037, M081 | `FC-08:1`–`FC-08:12` | RP-08; PEC concern dispositions and G01; Guide questions |
| FC-09 Configuration Baseline | States/baselines §§9–10, 26, 29; M038–M040, M069–M071 | `FC-09:1`–`FC-09:12` | RA Baseline contract; RP-07/10; PEC data-reliance and G06 contracts |
| FC-11 Verification Co-design | V&V §§2.2, 6.11, 23 | `FC-11:1`–`FC-11:12` | RA evidence contracts; RP-04/08; PEC guard verification intent |
| FC-13 Contextual Process Profile | Tailoring/profile §§22, 34.4; M059–M061, M093 | `FC-13:1`–`FC-13:12` | RA Profile; RP-02; PEC contextual compositions; PAP adoption |

Every pattern ends with its matching `FC-xx:End` sentinel. Stable IDs were retained even where the `1.0.1` sequence has gaps.

## Corpus dispositions

| Class | IDs | `1.0.1` treatment |
|---|---|---|
| Normative general patterns | FC-02, FC-03, FC-04, FC-05, FC-06, FC-07, FC-08, FC-09, FC-11, FC-13 | Published in the DPF |
| Provisional, excluded from `1.0.1` | FC-10, FC-14, FC-16 | Open questions/mechanisms only; no normative body |
| Direct FPF reuse/reject-as-pattern | FC-01, CP-06, CP-14 | FPF `C.22/C.22.2` or relevant FPF distinctions carry the concern |
| Embedded | CP-03 | Honest Stop embedded in FC-02 through direct FPF reuse |
| PAP-only | CP-16 | Equipment Boundary and Failure Evidence in PAP; not general DPF |
| Removed | FC-12, FC-15 | No pattern body; useful concerns routed to FPF/reference carriers |
| Rejected | CP-21 | No maturity-ladder pattern; anti-proxy treatment uses FPF E.13 |

## P-01–P-16 problem coverage

| Problem | Effective `1.0.1` coverage | Status |
|---|---|---|
| P-01 Unbounded process-design question | Direct FPF `C.22/C.22.2`; RP-01 and Guide projection | covered |
| P-02 Unbounded/unrecoverable agent iteration | FC-02 plus embedded Honest Stop | covered |
| P-03 Plan/readiness/work/result conflation | Direct FPF `A.3/A.15`; Glossary, PEC disposition/result contract and Guide | covered without standalone pattern |
| P-04 Agent authority exceeds delegation | FC-03 | covered |
| P-05 Candidate becomes relied-upon implicitly | FC-04 | covered |
| P-06 Source wording becomes claim without mediation | FC-05 | covered |
| P-07 Source change misses affected reliance | FC-06 | covered |
| P-08 Relations are not traversable both ways | FC-07 | covered |
| P-09 Completeness is unbounded or count-based | FC-08 plus FPF E.13; PEC-G01 rejects map/artifact-count proxies | covered |
| P-10 Relied configuration is unidentified | FC-09 | covered |
| P-11 Change causes full refresh or misses local impact | FC-06/07 plus RP-09, PEC slice reuse and smallest-responsible-return; FC-10 remains provisional | covered operationally; standalone pattern open |
| P-12 Evidence/assurance/decision conflation | FPF distinctions plus FC-03/04/11 and RA/RP/PAP | covered |
| P-13 Verification intent is late or topology-bound | FC-11 plus guard-level verification intent | covered |
| P-14 Handover loses rationale | FPF E.9/C.32.ADR plus FC-07 and reference carriers | covered |
| P-15 One process/profile is universalized | FC-13 plus PEC contextual family/non-use routes | covered |
| P-16 Metrics/maturity replace value | FPF E.13 plus Guide anti-proxy use | covered |

`P-01–P-16 coverage: 16/16`.

## Material routed outside the normative DPF

| Carrier | Material routed here | Authority check |
|---|---|---|
| Reference Architecture | Concepts, state distinctions, contracts, connected-model/Core-11 options | May realize patterns; cannot define DPF truth |
| Reference Process | Composable operations, Human Gate contract, optional PEC and V compositions | May compose use; cannot become mandatory workflow or artifact catalogue |
| PAP | High-consequence strengthenings and CP-16 | Specialization after adoption; not a ninth level |
| Application Guide | PEC selection/tailoring templates, adoption guidance and common failures | Informative only; cannot approve a project process |
| Glossary | Term recovery | Cannot override FPF |
| Sources | Evidence/currentness/applicability boundaries | Cannot create normative authority |
| Worked Examples | Five contextual application demonstrations | Informative; cannot prove effectiveness or compliance |

## Compact M001–M103 coverage

| M range | Count | Current destinations |
|---|---:|---|
| M001–M016 | 16 | DPF control, RA and PAP boundaries |
| M017–M032 | 16 | FC-05, RA/RP/PAP source, Core-11 and gate carriers |
| M033–M040 | 8 | FC-07/08/09 and matching RA/RP contracts |
| M041–M048 | 8 | RA views/states, RP, Guide and examples |
| M049–M058 | 10 | FC-06/11, RA/RP/PAP currentness and verification |
| M059–M066 | 8 | FC-13, RP compositions and PAP lifecycle/assurance |
| M067–M077 | 11 | RA contracts, FC-02/03, RP and Guide |
| M078–M087 | 10 | FC-04, RA/RP change/admission, Guide/open questions |
| M088–M096 | 9 | Governance, traceability, open questions and authority boundaries |
| M097–M103 | 7 | RA/RP/Guide/Glossary/example appendix concerns |

**M001–M103 coverage: 103/103.**

## No-shadow verification

To verify the package:

1. Count exactly ten `## FC-xx -` pattern headings in the DPF.
2. Confirm there is no heading for FC-01, FC-10, FC-12, FC-14, FC-15, FC-16, CP-06, CP-14 or CP-16.
3. Confirm CP-16 occurs only in PAP as a profile-only control.
4. Confirm FC-10/14/16 occur only as provisional/open content.
5. Confirm RA/RP/PAP/Guide statements retain their own authority labels.
6. Confirm PEC is labelled optional/experimental reference composition, not a DPF pattern, lifecycle mandate or project authority.
7. Confirm concern dispositions permit combination/non-use and guards remain trigger-based rather than gate-every-step.

Current result: `NO_LOSS_AND_NO_SHADOW_PASS`.
