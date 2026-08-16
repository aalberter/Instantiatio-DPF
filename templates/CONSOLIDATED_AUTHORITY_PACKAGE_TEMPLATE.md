# Consolidated Authority Package — Candidate Template

> This template does not grant authority. A completed package remains Candidate until the named process authority approves its exact configuration/hash. Remove instructional comments only when they have no receiving use; never omit a material boundary because the field is inconvenient.

## 1. Identification

- CAP ID: `CAP-...`
- Version: `0.1.0-candidate`
- Status: `candidate`
- Configuration ID: `...`
- Configuration SHA-256: presented after final Candidate bytes are fixed
- Date/expiry when applicable: `...`
- Candidate author: `...`
- Decision authority: `...`
- Final result Admission authority: `...`

## 2. Purpose and relying use

- Purpose: `...`
- Engineered System of Interest: `...`
- Level of Consideration: `...`
- Agentic Process EoC: `...`
- Receiving use: `...`
- First relying use of final result after Admission: `...`
- Consequence/reversibility profile: `...`

## 3. Exact inputs and configuration

| Input/configuration | Authority/status | Exact carrier/version/hash/length | Required predicate | Drift route |
|---|---|---|---|---|
| `...` | `...` | `...` | `must match` | `do not activate / terminate` |

Closed baseline may replace individual rows only when every relied-on input resolves unambiguously from it. Capability to read a source does not make it authoritative.

## 4. Allowed and prohibited work

### Allowed actions, tools and effects

- `...`

### Exact write/effect loci

| Locus/target | Create/modify/action | Maximum instances/effect | Recovery/reversibility | Verification |
|---|---|---:|---|---|
| `...` | `...` | `...` | `...` | `...` |

A directory wildcard is valid only with recoverable bounded instances and an enforceable count rule.

### Prohibited actions and effects

- `...`

State each consequential class explicitly:

| Effect class | `allowed` or `0/not allowed` | Exact target/boundary if allowed | Separate Human Gate? |
|---|---|---|---|
| destructive delete/move/overwrite | `0` | — | — |
| Git index/history/remote | `0` | — | — |
| network/external system | `0` | — | — |
| production/deployment | `0` | — | — |
| security/privacy boundary | `0` | — | — |
| packaging/release/publication | `0` | — | — |

Silence means not allowed.

## 5. Phases and conditional transitions

```text
Phase A — ...
  if exact predicates ...
→ Phase B — ...
  if exact predicates ...
→ Phase C — return Candidate result for Verification/Admission
```

| Phase | Action | Entry predicates | Declared exit evidence | Allowed repair inside phase |
|---|---|---|---|---|
| `A` | `...` | `...` | `...` | `...` |

Only a full predicate pass permits automatic transition. Ordinary reversible work inside a declared phase may continue without micro-Admission; failed mandatory predicate cannot be skipped.

## 6. Side-effect and iteration budget

- maximum created/modified files or effect instances: `...`;
- maximum aggregate bytes/value exposure where applicable: `...`;
- maximum work/repair iterations: `...`;
- deletions/moves/renames: `0` unless exact targets and recovery are separately approved;
- external/network/Git/release effects: `0` unless exact targets are separately approved;
- unused budget does not authorize additional scope.

## 7. External methods and capabilities

- Declared external skills/plugins/methods: `none | exact list`.
- Allowed capability/use class: `...`.
- Required current-use classification: `capability_only | process_bearing_mappable | process_incompatible`.
- Task/Run mapping and accepted parts: `...`.
- Rejected/translated process semantics: `...`.
- Output status and applicable Verification/Admission: `Candidate / ...`.
- Host/domain authority conflict route: `...`.

An available method is not authorized merely because the CAP exists. Undeclared material process-bearing use invokes the applicable return or termination predicate.

## 8. Verification and evidence

| Claim/transition | Check | Evidence | Pass/fail rule | Failure return |
|---|---|---|---|---|
| `...` | `...` | `...` | `...` | `...` |

- configuration/hash replay: `...`;
- allowed-locus/effect check: `...`;
- source/currentness check: `...`;
- claim-specific verification: `...`;
- final Candidate configuration: `...`;
- known limitations/non-claims: `...`.

Passing a check does not admit the result.

## 9. Human Gate triggers

Return to the named authority on:

- input/configuration drift;
- scope, intended use, authority or protected-value change;
- undeclared locus/effect/tool/external method;
- budget exceedance;
- destructive, Git, network, privacy/security, production or release need outside exact approval;
- material unresolved source/authority conflict;
- failed/inconclusive mandatory verification after allowed repair;
- request to rely on intermediate/Candidate output.

Add project-specific triggers: `...`.

## 10. Deviation termination and ordinary fallback

Mandatory execution state: `terminated_on_deviation`.

Leading report:

> CAP прекращён: обнаружено отклонение от согласованных условий.

Termination report:

- exact deviation: `...`;
- last completed phase: `...`;
- effects already produced: `...`;
- preserved evidence/Candidate state: `...`;
- why automatic transitions no longer apply: `...`;
- Run/Session outcome (`honest_stop` only when actually applicable): `...`;
- next ordinary stepwise decision/route: `...`.

The terminated CAP cannot pause, resume or retry under the same decision. Produced results remain Candidate until applicable Admission. Termination does not automatically end the wider initiative.

When cause and new exact bounds are understood, offer once for this termination event:

1. prepare a successor **Candidate** CAP for review; or
2. continue through ordinary step-by-step decisions.

Do not create or activate a successor automatically. If cause remains unclear or work unbounded, do not offer a CAP yet.

## 11. Completion and final Admission

- Normal CAP completion state: `completed_candidate_pending_admission`.
- Expected Candidate result/configuration: `...`.
- Verification required before request: `...`.
- Allowed Admission outcomes: `admitted | returned_for_refinement | rejected | deferred`.
- Exact first relying use if admitted: `...`.
- Still-prohibited downstream work: `...`.
- Return/supersession route: `...`.

CAP completion does not admit the result or authorize the next Loop.

## 12. Required process authority decision

Candidate configuration/hash: `...`.

Recommendation and material consequences: `...`.

Exact approval phrase:

> Утверждаю `<configuration>` с SHA-256 `<hash>` и разрешаю `<exact actions/targets>` в пределах declared inputs, phases, predicates and budgets. При отклонении CAP прекращается как `terminated_on_deviation`; тот же CAP не возобновляется. Итог остаётся Candidate и требует отдельного Admission. Всё не указанное явно остаётся неразрешённым.

Allowed decision outcomes: `admitted`, `returned_for_refinement`, `rejected`, `deferred`.
