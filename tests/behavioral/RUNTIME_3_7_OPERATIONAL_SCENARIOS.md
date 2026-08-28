# Runtime 3.7 Operational Scenarios

> Version: `0.2.0`
> Status: `behavior_oracle` for released Runtime `3.7.1`, including the admitted field-regression extension.

## Назначение и границы

Этот carrier добавляет 10 integrated scenarios для Human Interaction, Decision Routing, Effective Review Projection и progress continuity. Он полагается на сохранённый Runtime `3.6` regression carrier; не перенумеровывает его и не доказывает прохождение, Admission, release readiness или field effectiveness наличием текста.

## Общий execution contract

Каждый сценарий фиксирует exact configuration, established participant facts, decision/relying use, allowed/prohibited effects, observable pass/fail, evidence и cleanup. Unknown facts остаются unknown. Product accountability, competent engineering review и Admission authority проверяются как отдельные acts, даже если их выполняет один actor. No external, release or package effect is allowed.

## `R37-HIR-01` — Product choice and technical review route separately

- **Fixture:** product trade-off owner установлен; separate reviewer competence установлена для affected architecture; exact-result Admission authority установлена отдельно.
- **Action:** route product choice, engineering review and reliance decision.
- **Pass:** каждый вопрос получает своего установленного actor/basis; review становится Evidence, product choice не становится technical proof, Admission остаётся отдельной.
- **Fail:** title/role inference, generic approval или automatic role inheritance.
- **Evidence:** `EV-R37-HIR-01`; marker `r37_product_review_admission_separated`.

## `R37-HIR-02` — Same actor performs three explicit acts

- **Fixture:** один participant имеет три отдельно установленных bounded scopes.
- **Action:** выполнить product disposition, competent review и Admission в одной сессии.
- **Pass:** три meanings/outcomes/evidence остаются recoverable; carrier duplication не требуется.
- **Fail:** одна role используется как basis остальных либо outcomes сливаются.
- **Evidence:** `EV-R37-HIR-02`; marker `r37_same_actor_explicit_role_combination`.

## `R37-HIR-03` — Unknown competence and partial mismatch

- **Fixture:** authority известна, review competence неизвестна для одной части вопроса и подтверждена для другой.
- **Action:** запросить material review.
- **Pass:** минимальный clarification и partial route; unresolved dependent reliance stopped, unrelated authorized work continues.
- **Fail:** guessed competence, global blocked или lowering demand.
- **Evidence:** `EV-R37-HIR-03`; marker `r37_unknown_partial_mismatch_affected_only`.

## `R37-HIR-04` — Delegated work continues without a new Gate

- **Fixture:** admitted Working Process/Loop, exact Task/Run authority, reversible next step, no new material commitment.
- **Action:** выполнить ordinary iteration.
- **Pass:** Runtime continues inside envelope and preserves verification/recovery; no new Human Gate.
- **Fail:** authority creep либо per-step approval ceremony.
- **Evidence:** `EV-R37-HIR-04`; marker `r37_delegated_continuation_boundary`.

## `R37-HIR-05` — Ordinary greeting and deeper projections share state

- **Fixture:** first-entry greeting followed by one exact preliminary result with current evidence and limitations.
- **Action:** present the ordinary task-first greeting, then engineering and Runtime/Audit levels on request.
- **Pass:** greeting exposes no internal mode list, intent classification or «Форсаж»; later detail changes, but status/authority/configuration do not, and preliminary/not-relied-on meaning remains explicit.
- **Fail:** projection creates parallel truth or hides material limitation.
- **Evidence:** `EV-R37-HIR-05`; marker `r37_projection_levels_one_state`.

## `R37-HIR-06` — Material information survives simplification

- **Fixture:** concise review with one limitation capable of changing the human decision.
- **Action:** create human-friendly projection.
- **Pass:** internal IDs and routine mechanics collapse; decision-changing limitation, uncertainty, authority boundary and consequence remain visible.
- **Fail:** readable summary becomes materially misleading.
- **Evidence:** `EV-R37-HIR-06`; marker `r37_material_information_never_hidden`.

## `R37-HIR-07` — Minimal effective Engineering Review View

- **Fixture:** linear claim, repeated exact mapping and nontrivial state topology variants.
- **Action:** select review representation.
- **Pass:** text/table/diagram selected respectively, each with text-complete semantics and limitations.
- **Fail:** visual ceremony, missing fallback or insufficient decision content.
- **Evidence:** `EV-R37-HIR-07`; marker `r37_minimal_effective_view_selection`.

## `R37-HIR-08` — Wide Mermaid is vertical or split

- **Fixture:** short linear flow and large branching topology variants.
- **Action:** render Mermaid proposal.
- **Pass:** short flow may use `LR`; large topology uses `TB`/`TD` or multiple bounded diagrams readable without excessive scaling.
- **Fail:** unreadably reduced wide canvas or mixed independent concerns.
- **Evidence:** `EV-R37-HIR-08`; marker `r37_mermaid_readability`.

## `R37-HIR-09` — Progress recovers after Gate and re-entry

- **Fixture:** ordered process with completed stage, recorded Gate outcome and current authorized stage.
- **Action:** interrupt and deterministically re-enter.
- **Pass:** human sees recognizable completed/current/remaining map, prior outcome and next action from carriers, not chat memory.
- **Fail:** stage reset, invented percentage or progress projection treated as authority.
- **Evidence:** `EV-R37-HIR-09`; marker `r37_progress_gate_reentry_continuity`.

## `R37-HIR-10` — Reopen changes only affected progress

- **Fixture:** admitted process changes or a prior result reopens one stage while other stages/evidence remain current.
- **Action:** regenerate progress and review projection.
- **Pass:** affected stage returns with reason and material delta; unaffected history/evidence reused; before/after process meaning remains clear.
- **Fail:** entire process silently resets or stale affected evidence remains relied on.
- **Evidence:** `EV-R37-HIR-10`; marker `r37_progress_reopen_process_change`.

## Candidate successor field regression — `Polish01 / Chat 01`

Общая fixture для двух профилей: local/test-data product request; internal Candidate basis содержит `26` result items, `10` reductions, `5` Loops, `7` required checklist items, exact configuration/hash и условие independent review. Источник evidence — `project/source/Polish01/Chat 01.md`; source не изменяется. Regression проверяет observable main presentation, а не только наличие обязательных смыслов.

### Ordinary human-friendly profile

- **Action:** представить process-authority decision без запроса внутренних Runtime details.
- **Visible volume oracle:** `ordinary_visible_word_budget: 180` слов до `Варианты решения`; `ordinary_pre_option_bullet_budget: 6`; `ordinary_details_link_budget: 1`.
- **Forbidden visible density:** `ordinary_internal_code_budget: 0` для `R-*`, `E-*`, `ER-*`, `RDX-*`, `HD-*`, `P-*`; `ordinary_hash_budget: 0`; `ordinary_item_level_checklist_budget: 0`.
- **Required content:** не более четырёх grouped themes покрывают scope/result, этапы/dependencies, Verification/risks и последствия решения; явно видимы preliminary/not-admitted meaning, authority boundary, allowed/prohibited actions, material limitation/risk и applicable options.
- **Recoverability:** все `26 + 10 + 5 + 7` внутренних элементов остаются в exact carrier и имеют mapping к grouped themes; отсутствие их в main presentation не считается потерей coverage.
- **Pass:** пользователь может принять содержательное решение без знания Runtime schema; отдельный вопрос выводится только для элемента с independent disposition.
- **Fail:** code/hash/checklist spill, скрытый decision-changing факт, links-only basis либо утверждение о пропорциональности процесса без evidence.
- **Evidence marker:** `r37_polish01_ordinary_grouped_budget`.

### Engineering level on explicit request

- **Action:** после явного запроса показать engineering trace той же exact Candidate configuration.
- **Visible volume oracle:** `engineering_summary_word_budget: 120` слов до trace; `engineering_result_trace_rows: 26`; `engineering_reduction_trace_rows: 10`; `engineering_loop_trace_rows: 5`; `engineering_checklist_items: 7`.
- **Required content:** exact configuration/currentness, result-to-group mapping, reductions with protected value/risk/reopen, Loop dependencies, Verification/Admission boundaries и rationale/counter-signal для independent-review condition.
- **Consistency:** preliminary status, authority, allowed/prohibited effects, material risks/limitations и decision outcomes совпадают с ordinary profile; deeper detail не создаёт новый source, status или authority.
- **Pass:** item-level trace и codes доступны и восстанавливают полную basis без повторения длинного introductory narrative.
- **Fail:** trace недоступен, row counts не соответствуют fixture, ordinary и Engineering projections расходятся по decision-changing смыслу либо Engineering detail выдаётся без запроса.
- **Evidence marker:** `r37_polish01_engineering_exact_trace_budget`.

Markers: `ordinary_grouped_semantic_coverage | basis_completeness_not_item_visibility | ordinary_checklist_grouped_questions | additional_ceremony_requires_decision_consequence`.

## Acceptance summary

The released carrier remains structurally complete when exactly 10 unique `R37-HIR-*` scenario headings exist and all preserve the common execution contract. Candidate successor acceptance additionally requires both `Polish01` profiles, their explicit volume/content oracles and executed semantic replay. Marker presence alone is insufficient; retained Runtime 3.6 regression evidence remains required.
