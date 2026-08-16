# Каталог композиций рабочих процессов

> Version: `0.1.0-candidate`
> Reviewed: `2026-08-16`

Карточки ниже — reference/adaptation aid. Они не создают project authority, обязательный lifecycle или доказательство полноты. Порядок выбора и ограничения определены в [README модуля](README.md).

## Контекстные композиции

### `CC-01` — Компактное ограниченное изменение

- **Predecessor alias:** `WA-01`.
- **Purpose/outcome:** одно небольшое, обратимое и наблюдаемое изменение с ясной проверкой и возвратом.
- **Applicability evidence:** локальная граница, малая стоимость ошибки, один accountable owner, быстрый feedback.
- **Counter-signals:** shared architecture/data, внешняя приёмка, миграция, несколько системных уровней или высокая цена ошибки.
- **System/consequence profile:** Direct Work, script, локальный компонент; low-to-moderate reversible consequence.
- **Concern/result map:** bounded intent, exact effect, focused Verification, evidence and handoff.
- **Dependencies/guards:** source/authority check; rollback; первый relying use не выходит за локальную проверку.
- **Possible Loop/Gate:** один bounded Task/Run; Human Gate только при consequential action или изменении authority.
- **Verification/baseline:** before/after state, focused test and explicit limitation.
- **Adaptation questions:** что делает изменение необратимым; есть ли скрытые consumers/state/interfaces?
- **Compatible modules:** обычно `WM-01`, `WM-06`, при необходимости `WM-07`.
- **Safe reductions:** no catalogue record, combined Task/Run note, local evidence.
- **Explicit non-coverage:** системная интеграция, release readiness и product completeness.
- **Source/owner/change/reopen:** admitted project process/process authority; reopen при расширении locus, зависимости, последствий или first relying use.

### `CC-02` — Итерационное развитие продукта

- **Predecessor alias:** `WA-02`.
- **Purpose/outcome:** несколько связанных increments с общей product commitment и recoverable learning.
- **Applicability evidence:** развивающиеся потребности, доступный feedback, допускаемая поэтапная поставка.
- **Counter-signals:** фиксированный внешний contract без change route, неделимый safety claim или невозможность проверить increments.
- **System/consequence profile:** продукт/подсистема, moderate consequence, повторяемые bounded Loops.
- **Concern/result map:** goals/scope, behavior, architecture/data commitments, increments, Verification and integration.
- **Dependencies/guards:** full-scope concerns before consequential slice-local reliance; explicit supersession.
- **Possible Loop/Gate:** discovery/specification/implementation/integration Loops с Gates по admitted configurations.
- **Verification/baseline:** increment evidence плюс отдельная system-level Verification.
- **Adaptation questions:** какой feedback меняет admitted results; что обязано быть общим до первого increment?
- **Compatible modules:** `WM-02`–`WM-07`, `WM-08` при release use.
- **Safe reductions:** объединённые reversible results при recoverable concerns/owners/uses.
- **Explicit non-coverage:** backlog/increment count не доказывает requirements, architecture или whole-product readiness.
- **Source/owner/change/reopen:** product/process authority; reopen при новом system concern, cross-team dependency или изменении release use.

### `CC-03` — Разработка от спецификации или контракта

- **Predecessor alias:** `WA-03`.
- **Purpose/outcome:** delivery against externally relied-on exact specification/contract configuration.
- **Applicability evidence:** supplier/API/interface agreement, formal acceptance, multiple implementers or material ambiguity cost.
- **Counter-signals:** research/discovery без известного outcome либо disposable experiment.
- **System/consequence profile:** component-to-system, externally relied-on obligations, moderate-to-high consequence.
- **Concern/result map:** source mediation, normative boundary, trace, change control, implementation, acceptance evidence.
- **Dependencies/guards:** applicable contract/domain authority, exact version and discrepancy route.
- **Possible Loop/Gate:** specification Admission → bounded implementation → acceptance/integration Gate.
- **Verification/baseline:** bidirectional trace, exact baseline, acceptance criteria and mismatch disposition.
- **Adaptation questions:** кто вправе изменить specification; где пример informative, а требование normative?
- **Compatible modules:** `WM-01`, `WM-03`, `WM-04`, `WM-06`, `WM-07`, при поставке `WM-08`.
- **Safe reductions:** компактная specification при сохранении authority/version/Verification.
- **Explicit non-coverage:** contract не заменяет domain/system concerns, которые он не определяет.
- **Source/owner/change/reopen:** contract/specification authority; reopen при revision, conflict, waiver или failed acceptance.

### `CC-04` — Развитие существующей системы

- **Predecessor alias:** `WA-04`.
- **Purpose/outcome:** изменить relied-on baseline, сохранив совместимость, миграцию и наблюдаемый переход.
- **Applicability evidence:** installed base, consumers, persistent state, legacy interfaces or operational continuity.
- **Counter-signals:** новый isolated disposable system без relied-on baseline.
- **System/consequence profile:** subsystem/system/supersystem interfaces; consequence определяется affected reliance.
- **Concern/result map:** current truth, consumers, compatibility, data/state migration, cutover/rollback and verification.
- **Dependencies/guards:** exact baseline and owner; no silent reinterpretation of legacy evidence.
- **Possible Loop/Gate:** impact → successor specification → bounded change → migration/integration Gate.
- **Verification/baseline:** old/new compatibility matrix, migration rehearsal and rollback evidence.
- **Adaptation questions:** кто зависит от старого поведения; какая совместимость обязательна и до какого момента?
- **Compatible modules:** `WM-01`, `WM-04`–`WM-08`.
- **Safe reductions:** unchanged areas referenced by exact baseline rather than duplicated.
- **Explicit non-coverage:** local regression pass не доказывает external consumer or operational transition success.
- **Source/owner/change/reopen:** baseline/configuration authority; reopen on unknown consumer, irreversible migration or field discrepancy.

### `CC-05` — Интеграция и выпуск

- **Predecessor alias:** `WA-05`.
- **Purpose/outcome:** assemble admitted components, verify system properties and establish a releasable exact configuration.
- **Applicability evidence:** multiple component Candidates, shared interfaces, packaging/migration/operations and release Admission need.
- **Counter-signals:** один локальный patch без downstream reliance.
- **System/consequence profile:** release/system level, externally or operationally relied-on state.
- **Concern/result map:** configuration inventory, integration, system V&V, limitations, transition, recovery and release decision.
- **Dependencies/guards:** component Admission is necessary but insufficient; system claims need system evidence.
- **Possible Loop/Gate:** integration Loop → system Verification → release-readiness Gate → release Admission.
- **Verification/baseline:** exact manifest/hashes, end-to-end/system properties, package and rollback checks.
- **Adaptation questions:** какие свойства возникают только при сборке; что не проверено компонентами?
- **Compatible modules:** `WM-04`, `WM-07`, `WM-08`, часто `WM-01/03/05`.
- **Safe reductions:** reuse exact admitted evidence with applicability check; no ceremonial re-execution.
- **Explicit non-coverage:** комплект файлов или зелёные component tests не являются release pass.
- **Source/owner/change/reopen:** release/configuration authority; reopen on integration drift, manifest gap or unresolved limitation.

### `CC-06` — Повышенная доказательность или регулирование

- **Predecessor alias:** `WA-06`.
- **Purpose/outcome:** strengthen evidence, independence and applicability for high-consequence or externally governed reliance.
- **Applicability evidence:** safety/security/privacy consequence, regulation, certification, contractual assurance or costly irreversible failure.
- **Counter-signals:** low-consequence reversible local task without applicable external obligation.
- **System/consequence profile:** declared assurance scope/level; high consequence or mandated control.
- **Concern/result map:** authority/applicability, assurance claims, hazards/risks, trace, independent Verification and controlled release.
- **Dependencies/guards:** exact applicable edition, qualified authority/reviewer and evidence retention.
- **Possible Loop/Gate:** applicability decision → strengthened specification/V&V → independent review → accountable Admission.
- **Verification/baseline:** claim-specific evidence, independence gaps, configuration and audit trace.
- **Adaptation questions:** какая норма применима и кем; где требуется независимость/квалификация?
- **Compatible modules:** `WM-01`–`WM-08` по triggered concerns; часто `EM-01/02`.
- **Safe reductions:** только с documented applicability/risk owner/alternate evidence/reopen route.
- **Explicit non-coverage:** каталог и DPF не заменяют law, contract, regulator or qualified professional judgment.
- **Source/owner/change/reopen:** applicable external/domain authority; reopen on edition/scope/claim/consequence change.

## Инженерные методы

### `EM-01` — V-диаграмма

**Для разработчика:** полезна, когда нужно наглядно связать уровни системы с Integration, Verification и Validation; для маленького локального изменения обычно избыточна.

**Служебная информация:**

- **Technical aliases:** `Vee`, `V-shaped composition`.
- **Method type:** development/V&V topology and process view.
- **Purpose/problem:** связать уровни определения и декомпозиции системы с намерениями/результатами Integration, Verification и Validation.
- **Applicability evidence:** несколько уровней системы, software/hardware, suppliers, дорогая поздняя ошибка или усиленная V&V.
- **Counter-signals:** одно обратимое локальное изменение, research spike или компонент без полезного hierarchical pairing.
- **Minimal practical route:** определить уровни и integration responsibility; связать needs/requirements/architecture/component claims с validation/verification; спланировать realization/integration; сохранить iteration/returns; сослаться на exact carriers.
- **Expected results:** V-diagram/view, paired claims/evidence, integration order, gaps and return routes.
- **Method-specific representations:** V-диаграмма как derived Working Process view.
- **Concern coverage:** partial — topology, level pairing, integration and V&V intent.
- **Explicit non-coverage:** не полный lifecycle, не source of truth, не обязательный Waterfall и не release proof.
- **Compatible methods/compositions/modules:** `EM-02/04/05/03` на разных уровнях; `CC-05/06`; `WM-03/04/07/08`.
- **Material conflicts/constraints:** линейная интерпретация или неподкреплённое pairing; обязательны returns и exact evidence.
- **DPF/authority boundary:** применяет admitted DPF/reference patterns; diagram itself creates no authority.
- **Source basis/version/review/currentness:** DPF 3.1.0 Reference Process; [SEBoK Sequential Development Approach](https://sebokwiki.org/wiki/Sequential_Development_Approach), reviewed against SEBoK `2.14` on `2026-08-16`; exact standard applicability отдельно.
- **Reopen triggers:** regulated/contract claim, changed system levels, source edition or failed pairing/integration evidence.

### `EM-02` — Разработка по спецификации

**Для разработчика:** полезна, когда реализация должна точно соответствовать принятой версии требований, интерфейса или контракта; не превращает неизвестный discovery outcome в ложную определённость.

**Служебная информация:**

- **Technical aliases:** `specification-driven`, `spec-based`, `contract-driven`.
- **Method type:** requirements/contract/change-control method family.
- **Purpose/problem:** строить и проверять относительно explicit, versioned and admitted specification/contract configuration.
- **Applicability evidence:** external contracts/interfaces/suppliers, multiple implementers, high ambiguity cost or formal acceptance.
- **Counter-signals:** early discovery with unknown outcome, disposable experiment or trivial reversible change.
- **Minimal practical route:** mediated sources/authority → normative boundaries/claims → scenarios/interfaces/data/examples where needed → Verification/acceptance → baseline/version/change → bounded implementation → mismatch return.
- **Expected results:** exact specification, trace, change/supersession record, acceptance evidence and deviations.
- **Method-specific representations:** requirement/contract trace and specification change view.
- **Concern coverage:** full only for declared specification obligations; other domain/system concerns remain separately dispositioned.
- **Explicit non-coverage:** existence gives no authority; specification need not be one large upfront document and is not universal project truth.
- **Compatible methods/compositions/modules:** V-level pairing; Use Cases/DDD for behavior/domain; User Stories for scheduling without weakening requirements; `CC-03/04/06` and `WM-01/03/04/07`.
- **Material conflicts/constraints:** unversioned or non-admitted source, silent waiver, informative example treated as normative.
- **DPF/authority boundary:** uses DPF source mediation/trace/configuration/verification; specification authority remains explicit.
- **Source basis/version/review/currentness:** DPF 3.1.0 `FC-05/07/09/11/13` and ISO/IEC/IEEE 29148:2018 applicability boundary already mediated by DPF; reviewed `2026-08-16`.
- **Reopen triggers:** source revision, supplier/contract adoption, compliance claim, ambiguity or failed acceptance.

### `EM-03` — Разработка через пользовательские истории

**Для разработчика:** помогает поставлять небольшие проверяемые части пользовательской ценности; не заменяет архитектуру, данные, системные обязательства и полноту требований.

**Служебная информация:**

- **Technical aliases:** `User Stories`, `story-based delivery`.
- **Method type:** value slicing/planning/delivery technique.
- **Purpose/problem:** организовать работу малыми проверяемыми increments пользовательской/стейкхолдерской ценности с частым feedback.
- **Applicability evidence:** recognizable users/value, incremental delivery and accessible feedback.
- **Counter-signals:** infrastructure/equipment work без честного user-value slice, formal completeness, shared architecture/data commitments or high assurance.
- **Minimal practical route:** product goal/users/value → wider journey where useful → small stories → examples/acceptance → separate architecture/system/mandatory concerns → dependency order → implement/verify/learn with explicit supersession.
- **Expected results:** ordered value slices, acceptance examples, feedback evidence and visible non-story dependencies.
- **Method-specific representations:** Story Map with source, scope and non-coverage.
- **Concern coverage:** partial — value slicing and delivery planning.
- **Explicit non-coverage:** story/backlog count is not requirements, product model, architecture, domain/data/state or completeness proof; `As a …` syntax optional.
- **Compatible methods/compositions/modules:** Use Cases for coherent goals/scenarios, DDD for language, specifications for obligations, V for system V&V; commonly `CC-02` and `WM-02/03/06/07`.
- **Material conflicts/constraints:** story gravity hiding system concerns or silently rewriting admitted results.
- **DPF/authority boundary:** stories remain Candidate planning/behavior carriers until applicable authority decisions.
- **Source basis/version/review/currentness:** [Agile Alliance User Stories](https://agilealliance.org/glossary/user-stories/); [Scrum Guide 2020](https://scrumguides.org/docs/scrumguide/v2020/2020-Scrum-Guide-US.pdf) only to preserve that Scrum does not mandate User Stories; reviewed `2026-08-16`.
- **Reopen triggers:** named framework/version claim, unavailable feedback, completeness/assurance need or changed value boundary.

### `EM-04` — Разработка через варианты использования

**Для разработчика:** помогает согласовать actor goals, взаимодействия и проверяемое поведение; сложную эксплуатационную среду и режимы при необходимости дополняют отдельные operational scenarios/ConOps.

**Служебная информация:**

- **Technical aliases:** `Use Cases`, `use-case-driven`.
- **Method type:** actor-goal/interaction/behavior analysis method.
- **Purpose/problem:** описать достижение actor goals через взаимодействия с системой, включая main, alternate and failure paths.
- **Applicability evidence:** meaningful actor/system boundaries, multiple roles/integrations and behavior/acceptance alignment.
- **Counter-signals:** algorithmic/internal work or domain/data/architecture complexity not explained by interaction; diagram-only ceremony.
- **Minimal practical route:** system boundary → actors/goals → use cases → triggers/preconditions/main/alternate/error paths/postconditions → affected data/state/rules → Verification and operational-scenario coverage check.
- **Expected results:** textual use cases, navigation diagram where useful, linked acceptance/scenarios and uncovered operational gaps.
- **Method-specific representations:** Use Case Diagram is navigation; exact behavior stays in textual scenarios and linked evidence.
- **Concern coverage:** full for operational scenarios only in a declared simple scope with evidence; otherwise partial.
- **Explicit non-coverage:** multi-system, physical, multi-mode, degraded, regulated or organizational environment/resources/modes/recovery require separate scenarios/ConOps for gaps.
- **Compatible methods/compositions/modules:** specifications, User Stories, DDD and V; usually `CC-02/03/06`, `WM-02/03/04/07`.
- **Material conflicts/constraints:** actor-goal model cannot replace internal domain/data/architecture or operational environment evidence.
- **DPF/authority boundary:** observed behavior/operational distinctions remain DPF-governed; selection creates no process authority.
- **Source basis/version/review/currentness:** current [OMG UML](https://www.omg.org/uml/) and [OMG SysML v1](https://www.omg.org/sysml/sysmlv1/) pages plus DPF 3.1.0 operational-scenario/observable-behavior distinctions; reviewed `2026-08-16`.
- **Reopen triggers:** exact notation/model exchange/contract use, changed system boundary or uncovered modes/failures/recovery.

### `EM-05` — Предметно-ориентированное проектирование

**Для разработчика:** полезно при сложных и изменчивых предметных правилах и конфликтующих языках моделей; для простого CRUD или utility может создать ненужную тяжесть.

**Служебная информация:**

- **Technical aliases:** `Domain-Driven Design`, `DDD`.
- **Method type:** domain analysis and design pattern family.
- **Purpose/problem:** согласовать software design со сложным domain language, rules, model boundaries and evolution.
- **Applicability evidence:** complex/changeable business rules, ambiguous cross-area terms, multiple models/teams, long-lived system or material domain-model errors.
- **Counter-signals:** simple CRUD/utility/disposable prototype or pattern use without meaningful domain complexity.
- **Minimal practical route:** domain experts/sources → terms/rules/conflicts → domains/models → Bounded Contexts/relationships → language per context → only useful tactical models → links to scenarios/data/interfaces/Verification → evidence-driven refinement/supersession.
- **Expected results:** Ubiquitous Language, bounded models, context relationships and explicit integration/gaps.
- **Method-specific representations:** Context Map and compact Domain Model.
- **Concern coverage:** partial — domain meaning and model boundaries.
- **Explicit non-coverage:** Bounded Context ≠ microservice; Domain Model ≠ complete data model; ER ≠ domain model; Context Map ≠ org chart or implementation plan.
- **Compatible methods/compositions/modules:** Use Cases/User Stories/specification/V at distinct uses; usually `CC-02/04`, `WM-02`–`WM-07`; persisted data still triggers applicable `EV-05/EV-06`.
- **Material conflicts/constraints:** tactical-pattern cargo cult, one language forced across legitimate models or service boundary inferred automatically.
- **DPF/authority boundary:** domain authority/sources remain explicit; DDD card is not product truth.
- **Source basis/version/review/currentness:** Eric Evans' [DDD Reference](https://www.domainlanguage.com/ddd/reference/), based on 2004 pattern summaries with stated later additions; reviewed `2026-08-16`.
- **Reopen triggers:** material source change, named derivative method, high-consequence domain claim, cross-context conflict or persistence reliance.

## Повторно используемые модули

| ID | Человеческое название | Trigger и ожидаемый результат | Не покрывает автоматически |
|---|---|---|---|
| `WM-01` | Источники и полномочия | multiple/conflicting/regulated/contract sources → mediated authority, provenance and resolution route | applicability law/contract decision без accountable authority |
| `WM-02` | Эксплуатационная концепция и сценарии | actors/environment/modes/interactions/success-failure → ConOps/scenario/behavior results | requirements, architecture или все operational gaps одним Use Case |
| `WM-03` | Требования и приёмка | normative needs/trace/acceptance → exact requirements and acceptance intent | source authority или реализацию |
| `WM-04` | Архитектура, интерфейсы и интеграция | components/responsibility/interfaces/system properties → architecture/integration results | system proof из component evidence |
| `WM-05` | Данные, состояния и миграция | identity/ownership/lifecycle/relations/invariants/recovery → data/state/migration results | domain model, analytics и physical schema как одно и то же |
| `WM-06` | Ограниченная реализация | exact change/Task/Run/CAP → bounded implementation and focused evidence | Admission или расширение scope |
| `WM-07` | Проверка и независимая оценка | consequential claims/reviewer need → claim-specific V&V and independence gaps | release authority или абсолютную уверенность |
| `WM-08` | Переход, выпуск и эксплуатация | configuration/package/migration/rollback/release → transition/readiness results | release pass без exact configuration и Admission |

Модули — concern/result fragments, а не стадии. Их порядок определяется dependencies и first relying uses.

## Совместимость и aliases

| Исторический ID/термин | Текущий ID/термин |
|---|---|
| `WA-01`…`WA-06` | `CC-01`…`CC-06` соответственно |
| `Working Process Archetypes` | `Working Process Compositions` как technical family name |
| «составные архетипы» | «варианты организации инженерной работы» / «типовые композиции рабочего процесса» |

Существующий admitted Working Process не мигрирует автоматически. Retired relied-on ID требует alias/supersession, impact, migration and reopen handling.

## Source/currentness register

| Method | Initial basis | Reviewed | Bounded currentness / reopen |
|---|---|---|---|
| `EM-01` | DPF 3.1.0 Reference Process; SEBoK Sequential Development Approach reviewed against `2.14` | `2026-08-16` | recheck exact edition/applicability for regulated, contract or consequential standards claim |
| `EM-02` | DPF 3.1.0 `FC-05/07/09/11/13`; ISO/IEC/IEEE 29148:2018 boundary mediated by DPF | `2026-08-16` | recheck on source revision, supplier/contract adoption or formal compliance claim |
| `EM-03` | Agile Alliance User Stories; Scrum Guide 2020 only for framework boundary | `2026-08-16` | recheck if claiming a named framework/version or changing semantics |
| `EM-04` | OMG UML and SysML v1 specification pages; DPF operational distinctions | `2026-08-16` | recheck exact notation/version for contractual/model-exchange use |
| `EM-05` | Eric Evans DDD Reference derived from the 2004 book summaries and stated additions | `2026-08-16` | recheck on source change, named derivative or high-consequence claim |

These are bounded selection/application summaries, not reproduced manuals or field-effectiveness claims. Legal, contractual, regulatory and organization constraints remain external/domain authority inputs.
