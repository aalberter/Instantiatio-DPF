# Working Process and Loops Guide

> Version: `1.12.0`

## 1. Назначение

Этот документ устанавливает общую исполнительскую методику применения AI SDLC DPF для проектирования, создания, выполнения и совершенствования:

- project-specific Working Process;
- loops;
- tasks;
- runs;
- Candidate Results;
- verification;
- admission decisions;
- relied-on results.

Документ является companion guide к AI SDLC DPF и применяется во всех проектах, использующих данный репозиторий.

Он не является Working Process конкретного проекта и не содержит конкретных проектных Loops.

Project-specific реализации этой методики размещаются в `project/process/`.

Он не изменяет и не заменяет:

- AI SDLC DPF;
- Reference Architecture;
- Reference Process;
- Primary Application Profile;
- Application Guide.

AI SDLC DPF задаёт устойчивые инженерные принципы. Этот Guide определяет общую исполнительскую механику, по которой в конкретном проекте создаются и применяются Working Process и Loops.

---

## 2. Основной принцип

Основа работы — получение конкретного инженерного результата, который после предусмотренной проверки и admission может безопасно использоваться дальше.

Loop является основной повторяемой операционной единицей такой работы.

```
требуемый инженерный результат
→ Working Process
→ Loop
→ Task
→ Run
→ Candidate Result
→ Verification
→ Admission Decision
→ Relied-on Result
```

Не начинай проектирование исполнительской системы со списка агентов.

Сначала определи:

1. какой инженерный результат требуется;
2. для чего и кем он будет использован;
3. какой повторяемый процесс должен его получать;
4. как результат будет проверяться;
5. кто имеет authority принять его;
6. какой агент или человек может выполнить работу внутри этого процесса.

---

## 3. Операционная иерархия

Используй следующую иерархию:

```
Project / System of Interest
└── Project-specific Working Process
    └── Loop
        └── Task
            └── Run
                ├── Candidate Result
                ├── Verification
                └── Admission Decision
                    └── Relied-on Result
```

В этой иерархии `System of Interest` означает Engineered System of Interest: продукт, систему или подсистему, над которой ведётся работа. DPF-patterns применяются к отдельному **Agentic Process EoC** — проектируемому Working Process, Loop или другой bounded process entity.

`Project-specific Process` является термином authority hierarchy. `Project-specific Working Process` является его операционной реализацией и carrier в текущем комплекте.

### 3.1. Project-specific Working Process

Working Process определяет общую карту инженерной работы проекта:

- необходимые инженерные результаты;
- loops, которые их создают, проверяют и принимают;
- связи и зависимости между loops;
- порядок или условия их запуска;
- источники и входные состояния;
- Human Gates;
- authority;
- возвраты и эскалации;
- правила интеграции;
- системную verification;
- порядок совершенствования процесса.

Working Process не обязан заранее подробно описывать весь жизненный цикл проекта.

На старте достаточно минимальной карты:

```
контекст проекта
→ первый требуемый результат
→ первый bounded loop
→ verification
→ admission
→ следующий loop
```

#### 3.1.1. Non-lossy concern/result contract

Минимальная карта является navigation view, а не доказательством инженерной полноты. До approval первого consequential Loop Working Process должен явно disposition material concerns и независимо relied-on results для заявленного scope.

Допустимые dispositions:

```text
explicit
combined
cross_cutting
deferred
omitted
not_applicable
```

Для каждой material позиции фиксируй как минимум:

`concern/result | scope | disposition | rationale/protected value | carrier/Loop | first relying use | dependencies | verification/admission | owner/authority | reopen trigger`

Broad Loop name, первый slice или список файлов не являются coverage proof. Допустим один combined carrier для нескольких concerns, если смысл, provenance, receiving use и return route восстанавливаемы.

Для product/system work используй optional Product Engineering Composition из Reference Process как reusable screen, а не как обязательный lifecycle. Не сокращай составные concern families до broad labels: отдельно рассмотри operational concept/ConOps, operational scenarios и observable behavior; requirements, MVP boundary и User Stories where useful; domain, data, state, identity, invariants и persistence; component, integration и system verification. Неприменимые concerns маркируй явно и пропорционально; не создавай пустые artifacts.

#### 3.1.2. `WPC-01` — DPF-first composition

Working Process строится из admitted project context, а не копируется из PEC или иного reference package.

```text
admitted Work Context и Entry Decision
→ FC-13 selection of applicable DPF patterns and reference components
→ project-relevant result expansion
→ optional PEC completeness screen
→ project-specific concerns
→ Candidate Working Process
```

Сначала назови Engineered System of Interest, Agentic Process EoC, intended use, consequence, reversibility и first relying use. Затем через `FC-13` выбери, усили, замени, не используй или отложи DPF patterns и RA/RP/PAP options с rationale и reopen route. PEC остаётся optional Reference Process component; PAP применяется только после applicability decision.

Не требуй одинаково подробную profile table для любой работы. Для Direct Work допустима короткая запись material selection/non-use; для product/system work профиль и reference selection должны быть видимы до process approval.

#### 3.1.3. `WPC-02` — развёртывание до сокращения

До предложения оптимизированной карты сформируй развёрнутый набор всех material и potentially material results для заявленного project context:

```text
selected DPF obligations
+ selected reference contracts/fragments
+ optional PEC screen
+ project/domain concerns
```

Развёрнутая Candidate-карта не является maximum-control lifecycle, обязательным перечнем файлов или доказательством абсолютной полноты. Она показывает project-relevant результаты до их объединения. Independently relied-on result остаётся различимым, если имеет собственные receiving use, owner, admission boundary, verification basis, lifecycle или reopen route.

##### Triggered material human decision obligation

После развёртывания results проверь только material independently relied-on results, для которых downstream transition может требовать отдельного человеческого решения, не сводимого однозначно к уже запланированному Admission/review. Сигналы включают independent human-facing communication или intent, authority/scope/requirement change, external/freeze/production transition, дорогой replay при позднем обнаружении либо отдельные owner, receiving use, Admission boundary или reopen cadence. File count и generated representation сами по себе trigger не создают.

Для каждого trigger сохрани recoverable local record:

`source result/configuration ref | required authority act/decision meaning | accountable authority ref/override | required before transition | blocked effect | decision/evidence basis ref/override | reopen ref/override | disposition`

Ссылайся на уже существующие object/configuration, owner/authority, first relying use, verification/admission и reopen поля; не копируй их без material difference. `required authority act/decision meaning` является plain project meaning, а не новым Runtime enum/status. `blocked effect` ограничивается защищаемым downstream transition и не блокирует разрешённую обратимую подготовку. Допустимые planning dispositions выражаются как `separate`, `combined_with:<local ref>`, `inherited_from:<exact decision/admission>` или `no separate decision`; они не являются Admission statuses.

Одна presentation может объединять решения только при совместимых object/configuration, timing и authority, сохраняя отдельные meaning, outcome, conditions, effects и reopen. Если distinct material decision отсутствует либо exact existing Admission уже полностью покрывает act/use, не создавай record, Gate, form, profile или TL;DR; для review material process coverage достаточно одной bounded no-trigger записи. Markers: `material_human_decision_obligation | no_material_decision_no_ceremony`.

#### 3.1.4. `WPC-03` — восстанавливаемая адаптация

После развёртывания отдельно предложи сокращения и объединения. Для каждого material предложения фиксируй:

`proposal ID | source results | proposed disposition | target carrier/Loop | rationale | protected value | accepted loss/risk | dependencies | first relying use | verification/admission | owner | reopen trigger`

`combined` допустим только тогда, когда contained results названы и их смысл можно восстановить. Broad file, Loop или slice name не заменяет эту запись. Не объединяй молча результаты с несовместимыми owners, first relying uses, Admission, verification или change cadence.

Пользователь может одним решением утвердить recommended reduction set. Отклонённое сокращение возвращает result в более развёрнутую Candidate-карту. Только admitted optimized Working Process получает project authority.

#### 3.1.5. `WPC-04` — зависимости до first relying use

До consequential commitment проверь minimum upstream results и применимые Commitment Guards. Для product/system work явно рассмотри:

- ConOps и operational scope до relying Requirements;
- declared MVP boundary до объявления первого slice полным scope;
- full-scope logical data/state/invariants до consequential persistence;
- shared architecture, interfaces и integration responsibility до зависимой реализации;
- verification intent до construction;
- system verification отдельно от subsystem evidence;
- configuration, transition и recovery до relied-on release baseline.

Iteration сохраняется: failed dependency возвращается к smallest responsible result, а admitted result изменяется через explicit supersession и impact review.

#### 3.1.6. `WPC-05` — согласованные представления

Один Candidate process contract может иметь две views:

- управленческую — outcomes, этапы, Human Gates, ответственность, риски и решение;
- инженерную — profile, concern/result dispositions, dependencies, guards, reductions, verification и reopen routes.

Обе views должны иметь одну configuration identity и возвращаться к одному source contract. Несогласованность содержания, статуса или authority является verification failure. View не становится самостоятельным источником process truth.

Optional `STATE_INDEX.yaml` является только текущей operational projection той же resolved configuration. Он указывает exact carrier refs/hashes, `last_verified`, allowed/prohibited actions, ближайший Gate и reopen routes, но не допускает result и не предоставляет authority. При missing, stale, invalid или contradictory index сообщи проблему, игнорируй его для authority и восстанови state по exact Work Context/Process/Task/Run/Admission carriers. Human-readable chat/Markdown view строится из того же resolved state; расхождение views является verification failure. Создание live index требует отдельного project decision; шаблон находится в `templates/STATE_INDEX_TEMPLATE.yaml`.

##### Deterministic re-entry and recovery composition

Context compaction/transcript loss, новый chat/session/model/agent, host restart/handoff, interruption/long pause или explicit continuation request вызывают re-entry resolution до создания новой Task или нового Bootstrap. Это dispatcher composition существующих carriers и reconciliation, а не новый Runtime state, authority carrier, daemon, event log или database.

Разрешай состояние по трём независимым классам:

```text
authority
→ exact admitted Work Context + Entry Decision + Working Process/Loop + Admission/authorization decisions

relied configuration
→ active initiative + source/product baseline + exact carrier/configuration refs and hashes

factual execution state
→ current Task/Run + actual durable effects + Candidate/Gate + unresolved/stop/reopen routes
```

Process/Admission decisions определяют authority; exact source/configuration carriers — relied configuration; Task/Run/effect evidence — factual state. Chat memory, filename, modification time, confidence, tool/provider state и stale projection не заменяют эти loci. Optional `STATE_INDEX` используется только после currentness/consistency check; contradiction возвращает к exact carriers и actual-effects reconciliation по §10.1.

Если explicit continuation однозначно соответствует ровно одной recoverable non-closed initiative, продолжай её и не создавай новый Bootstrap. Несколько plausible initiatives требуют compact Human Gate selection с exact identities и consequences. Missing/broken Admission ref, relied hash или carrier/effect conflict блокирует только affected continuation и называет repair/return owner. Pending Admission блокирует dependent/bypass Task, но не already authorized independent reversible preparation.

Recovered presentation кратко показывает initiative, baseline/configuration, current Loop/Task/Run, Candidate/Gate, allowed next action, blocked actions и unresolved/reopen route. Если active initiative отсутствует, обычный Bootstrap начинается без recovery ceremony. Valid projection и exact-carrier resolution должны давать одну semantic state; расхождение является Verification failure. Markers: `deterministic_reentry_before_bootstrap | authority_configuration_factual_state_separated | stale_state_index_ignored | ambiguous_initiative_requires_selection | pending_admission_blocks_dependent_bypass_only`.

##### Triggered «Профиль инженерных представлений»

Engineering-view profile не является обязательным Bootstrap carrier. Первое use может оставаться Loop-local; permanent/reused profile и material delta требуют explicit project/process decision и trace. Подробная selection/content/lifecycle mechanics и optional template принадлежат [`catalog/engineering_views/`](catalog/engineering_views/README.md), а не Working Process Guide.

Core invariant сохраняется: material view называет receiving use и exact authoritative source/configuration, не становится parallel truth молча и не поддерживает affected reliance при stale/conflict. Affected Human Gate показывает current view, material baseline difference и consequence; unrelated Gate переиспользует current verified view. Level of consideration, non-coverage и integration responsibility остаются явными; component/subsystem evidence не доказывает system properties.

##### Engineering Review View в том же Human Gate

Когда material architecture, data, interface, interaction или другой engineering result должен стать основой первого relying decision, Runtime автоматически разрешает current applicable Engineering Review Views и фактически предъявляет их smallest sufficient Gate Projection в том же Human Gate до `Рекомендация`/`Варианты решения`. Useful source link сохраняет direct access к exact carrier, но link, filename, hash, bare ID, `tests passed` или carrier-existence assertion являются только supplementary detail и не заменяют presentation. Gate называет exact Candidate/result configuration, View identity/configuration, authoritative source/carrier configuration, verification/freshness, first baseline или material local delta, limitations/non-coverage, consequence и stable local element refs внутри этой View configuration, например `A-01`, `D-03` или `API-04`. Element ref облегчает addressed review, но не создаёт новый общий `EV-*`, status, authority level или source of truth.

Если `required_by_default` View missing, stale, conflicting или неразрешима, блокируется только affected relying decision. View возвращается к preparation/Verification; если exact Candidate уже представлен для Admission, используй существующий `returned_for_refinement`. Уже разрешённая unrelated reversible preparation может продолжаться. Trivial/reversible work и Gates без material engineering object не создают View ceremony.

Addressed Human Response сохраняет exact Candidate ref, View ref/configuration и element ref, когда он указан. Feedback само не изменяет source, View truth, Candidate status или Admission: оно становится question, change request, condition или element observation и возвращается к smallest responsible authoritative source. После authorized source/Candidate change affected View регенерируется и повторно проверяется; следующий Gate сначала показывает material local delta и downstream effects. Unaffected elements переиспользуются, пока impact не оправдывает full review. Independent reviewer findings, когда этот trigger применяется, входят как claim-referenced Evidence в тот же Gate и не создают второй approval ladder. Markers: `engineering_review_view_same_gate | stable_view_element_refs | addressed_element_feedback_returns_to_source | regenerated_view_delta_leads | missing_view_blocks_affected_reliance_only`.

##### Gate Projection и Runtime review-checklist

Gate Projection требуется, когда одновременно существуют material engineering object/View, named first relying use или affected re-reliance, accountable Human Decision и потребность человека понять engineering semantics для этого решения. Filename count, broad `engineering` label, diagram availability, model confidence, renderer availability или presentation preference trigger не создают. При false trigger сохраняется direct Decision UI route без View/checklist ceremony.

Runtime выполняет один derived, host-neutral flow; это не новый lifecycle или status:

| Step | Resolution and output | Block/return |
|---|---|---|
| `GP-01 Resolve Gate` | exact Candidate/result, decision class, authority and relying use | ambiguity → `DI-04`/clarification; no decision |
| `GP-02 Affected results` | admitted process/result obligations plus actual impact → bounded result set | missing coverage → Working Process/source return |
| `GP-03 Select Views` | smallest sufficient applicable View set from local/admitted selection, catalogue guidance and current state | no adequate View → preparation; no catalogue-wide default |
| `GP-04 Resolve configuration` | exact View/source/carrier/configuration and stable element refs | unresolvable required View → affected block |
| `GP-05 Currentness` | freshness/conflict evidence for affected claims | stale/conflict → affected block and source route |
| `GP-06 Baseline/delta` | first material baseline or local delta plus downstream consequences | unknown baseline is an explicit limitation, never invented |
| `GP-07 Compose representation` | smallest sufficient semantic content, limitations, consequence, useful links and text-complete privacy-safe fallback | unsafe/insufficient presentation → authorized secure surface or affected block |
| `GP-08 Present` | observable Gate Projection before `Рекомендация`/`Варианты решения` | links-only/bare-ID/carrier assertion → fail; decision not accepted |
| `GP-09 Generate checklist` | exact projection configuration → Gate-local required/optional items and applicable outcome section | unbound/incomplete generation → Gate not ready |
| `GP-10 Human response` | human dispositions/comments/outcome → validity and compatibility check | early/partial/ambiguous/mismatched response → clarify unresolved items; drift → regenerate affected items |
| `GP-11 Record/confirm` | valid response → existing Human Response/Decision/Admission record and exact effects/return | missing authority/invalid outcome → Gate remains open |

Каждая фактически предъявленная View показывает understandable name + exact ID/configuration, decision question/use, smallest sufficient semantic representation, currentness/evidence, baseline/delta, limitation/non-coverage, consequence and useful source link. Existing diagram/table/native source допустим, когда он действительно displayed или его decision-relevant semantics представлены в text/table form. Renderer, CSS, native control или vendor UI не являются обязательными. Restricted content наследует source access; bare secure link недостаточен без observable authorized presentation. Runtime не создаёт автоматически SVG/PNG/PDF/DOCX или новый View carrier только из-за trigger. Marker: `engineering_gate_projection_presented_before_options | links_supplementary_not_presentation`.

Review-checklist является derived Gate-local interaction contract. Его identity связывает exact Gate/Candidate, View configurations, material baseline/delta, generated item set and freshness evidence через recoverable refs; optional digest не заменяет эти refs и не обязателен для non-byte-addressable source. Physical YAML/store/template/profile/database/migration не требуются. Checklist формируется после projection и до options; human `disposition`, supporting comment/ref и selected outcome остаются unset до Human Response. Marker: `runtime_review_checklist_human_empty`.

Required item создаётся для каждой required View и отдельно лишь для material delta, limitation, risk или consequence, которым нужен самостоятельный disposition. Optional explanatory item Gate не блокирует. Stable Gate-local item содержит ID, plain question, exact subject ref, `required | optional`, allowed dispositions и response rule. Allowed local dispositions: `reviewed_no_objection`, `question`, `change_request`, `condition`, `observation`, `not_reviewed`; они не являются Admission statuses. `question`, `change_request`, `condition`, material `observation` и `not_reviewed` требуют sufficient human text или exact referenced statement. Condition дополнительно называет owner, affected use, Verification and reopen route.

Checklist complete только если все required items имеют valid human dispositions, обязательный supporting text существует, exact configuration/currentness сохранены, accountable actor identifiable и выбран один applicable existing `DI-01…DI-08` outcome/action. Row completion без outcome остаётся partial response. `admitted` недоступен при unresolved question/change/not-reviewed, unaccepted material condition, missing/stale/conflicting required View или failed applicable Verification. Другие compatible outcomes сохраняют существующий смысл: feedback возвращается к exact Candidate/View/element/source, defer сохраняет reason/use/reopen, reject — rationale/prohibited reliance. Completion означает полноту configuration-bound Human Response, а не correctness, Verification, evidence sufficiency или automatic Admission. Marker: `checklist_completion_not_admission`.

Aggregate option вроде `1` допустим только после фактического предъявления full projection/checklist, когда каждый required item является pure acknowledgement, нет missing evidence, conflict/staleness, item-specific input, material risk acceptance или condition, а option явно означает `reviewed_no_objection` для всех listed required items плюс named existing outcome/action and effects. В остальных случаях aggregate option скрывается. Unsolicited/early option-like input до presentation является unaccepted response, а не authority: Runtime сначала предъявляет missing basis и запрашивает exact confirmation. Partial/ambiguous/configuration-mismatched response уточняет только unresolved items и не default-ит dispositions.

После material Candidate/View/source/freshness change affected items invalid, prior response остаётся historical evidence, affected projection/checklist регенерируется и ведёт material delta. На re-entry Runtime восстанавливает только exact recorded Gate/Candidate/projection/checklist configuration and dispositions из carriers/decision evidence; unknown item остаётся unresolved и повторно предъявляется, chat memory не восполняет пробел. Valid complete response записывается вместе с existing Decision/Admission record, conditions/effects and confirmation; checklist не создаёт параллельный approval ladder. Markers: `gate_projection_gp01_gp11 | checklist_partial_response_clarifies_unresolved | checklist_drift_regenerates_affected | checklist_reentry_recovers_recorded_only`.

##### Triggered «Варианты организации инженерной работы»

После admitted context, `FC-13` и развёрнутой project-relevant concern/result map Working Process design может обратиться к [`catalog/working_process_compositions/`](catalog/working_process_compositions/README.md). Модуль различает контекстную композицию, инженерный метод и reusable concern module; эти типы не являются взаимозаменяемыми lifecycle options. Для малого обратимого Direct Work/Task сохраняется явный no-catalogue route.

Runtime рекомендует максимум одну контекстную композицию и обычно один–три метода по наблюдаемой applicability evidence. Keyword, популярность, число артефактов или numeric fit не являются основанием выбора. До process approval видимы существенные counter-signals, невыбранные альтернативы, adaptations, omissions/reductions, residual gaps и project/domain additions. По запросу или при material uncertainty Runtime предлагает подробное сравнение, обоснование, пример и ожидаемые результаты/усилия без молчаливой смены interaction preferences.

Optional `WORKING_PROCESS_COMPOSITION_RECORD.yaml` сохраняет сложный/persistent выбор, но не создаёт project process или authority. Результатом selection остаётся одна exact Candidate Working Process configuration; reliance разрешает только process authority Admission. Existing admitted Working Process не меняется автоматически. Общие system/product views по-прежнему маршрутизируются через engineering-view module, а method-specific working views ссылаются на authoritative carriers и называют scope/non-coverage.

#### 3.1.7. `WPC-08` — module specialization

Размещай правило в smallest responsible locus: DPF хранит normative invariant; RA — implementation-neutral entity/view contract; Reference Process — reusable fragments; Application Guide — informative use; PAP — bounded assurance strengthening; operational Guides — selection/execution mechanics; project-specific Working Process — actual admitted choice; Run evidence — observation.

Lower-level carrier может применять и связывать higher-level authority, но не дублирует, не переопределяет и не повышает собственный статус. Local model/prompt/project failure не является основанием менять controlled DPF или reference module.

#### 3.1.8. `WPC-09` — пропорциональный облегчённый маршрут

- Direct Work: одна reversible action, observable check, rollback и короткая запись material non-use; полная product map не создаётся.
- Script/driver: compact DPF screen и explicit/combined behavior, interface, state, failure и test results; product concerns могут быть `not_applicable`.
- Product/system work: видимый DPF profile, развёрнутая project-relevant map, отдельные reductions и Human Gate.
- PAP-strengthened work: отдельная applicability decision, required evidence и independence; PAP не применяется автоматически.

Strengthening triggers включают несколько operational scenarios/slices, shared state, external interfaces, system-wide properties, security/authority impact, non-resettable reliance, supplier/operation baseline и высокую цену ошибки.

#### 3.1.9. Специализация HSI/UI по применимости

Marker: `optional_hsi_ui_specialization`.

Эта экспериментальная специализация Runtime применяется только в Working Process со статусом `admitted`, когда Human–System Interaction существенно влияет на указанное использование результата. Она связывает существующие `FC-03/04/05/06/07/08/09/11/13`, Engineering Views, Forsage, Verification и Admission; новый принцип DPF, уровень полномочий, жизненный цикл или общая запись каталога не создаётся.

Bootstrap передаёт сведения о существенной инженерной значимости HSI и контекст решения, но не запускает отдельное интервью по UI и не выбирает специализацию вместо уполномоченного лица процесса. Выбор выполняется при формировании Working Process или Process Review. Основания могут включать:

- несколько существенных экранов, состояний, переходов, альтернативных путей или путей обработки ошибок;
- поведение, зависящее от роли или полномочий;
- значимую операционную ошибку, повторную работу, риск для безопасности или соответствия либо отказ от использования при неверном взаимодействии;
- необходимость проверить замысел взаимодействия с человеком до обязательства по production implementation;
- управляемое развитие существующего UI baseline.

Это вспомогательные признаки решения, а не оценочная таблица или чек-лист. Working Process фиксирует границы, принятое disposition, защищаемую ценность, первое использование с опорой на результат (`first relying use`), зависимости, Verification/Admission и условие повторного открытия (`reopen trigger`).

```text
нет существенной задачи HSI
→ обычный облегчённый маршрут
→ без дополнительных HSI carriers и церемонии

есть существенная задача HSI
→ выбрать минимально достаточный набор HSI results
→ вывести design из точной конфигурации authoritative sources
→ выполнить сквозную Verification
→ при необходимости получить evidence Human Validation
→ выполнить Admission точного design basis до production reliance
```

Marker: `no_material_hsi_no_ceremony`.

Поздняя активация допустима при изменении границ. Простая стабильная страница может остаться на прямом маршруте `requirements/scenario → implementation/review` без HSI carrier, Candidate UI Prototype или нового Human Gate.

##### Граница полномочий и источников

HSI design выводится из применимых точных конфигураций:

- System/Software Requirements;
- User/Operational Scenarios;
- роли и полномочия;
- бизнес-правила;
- архитектурные и интерфейсные constraints;
- применимые standards/normative sources после обычной source mediation;
- существующий UI baseline для развиваемой системы без автоматического превращения унаследованного поведения в requirement.

User Interaction View, Interaction Model, Screen Specification и UI Prototype являются производными инженерными результатами и представлениями. Они не создают UI Authority, второй SRS или независимый источник product requirements. HSI design basis со статусом `admitted` может быть инженерным решением, на которое опираются, только для указанного использования. Необоснованное требуемое поведение возвращается в authoritative requirement/scenario/rule locus.

`↔` ниже означает двустороннюю проверку покрытия и влияния изменений, а не равные полномочия.

##### Combined HSI design basis — объединённое основание проектирования HSI

Предпочитай:

```text
подходящий существующий carrier проекта
→ объединённый раздел или результат
→ создаваемое восстанавливаемое представление
→ новый carrier проекта только при самостоятельном жизненном цикле или повторяющемся receiving use
```

Новый шаблон Runtime не требуется. Project-specific carrier сохраняет один логически объединённый результат с восстанавливаемыми вложенными разделами.

**Идентификация, границы и использование с опорой на результат:** точные result/configuration/status/supersession; уровень и граница системы; границы HSI; `first relying use`; ответственные лица, аудитория и решение; конфигурации источников, их актуальность и конфликты; assumptions, non-coverage, ограничения конфиденциальности и внешнего представления, а также `reopen triggers`.

**Namespaced User Interaction View:** используй идентификатор проекта или домена вида `<project-or-domain>:UIV-<n>`, но не общий `EV-*`. Это представление отвечает на вопрос: что пользователь данной роли видит и делает в существенной задаче и на чём основано каждое взаимодействие? Минимально сохраняются роли, цели и задачи; связанные Requirements/Scenarios/Rules/Constraints; основные, альтернативные и error/recovery paths; связи экранов и состояний; нерешённые вопросы; смысловое резюме и fallback; актуальность и отличие от baseline. `EV-03/04` могут быть вложенными или поддерживающими views для вопросов времени и состояния.

**Contained Interaction Model:** отдельный файл не требуется. По применимости восстановима таблица или схема:

| Текущий экран или состояние | Actor/role | Цель или шаг | Действие или событие | Guard/permission | Следующий экран или состояние | Эффект или результат | Альтернатива, ошибка или восстановление | Authoritative basis |
|---|---|---|---|---|---|---|---|---|

Разделение допускается только при независимо подтверждённых ответственных лицах, самостоятельном жизненном цикле, отдельной границе Admission или повторяющемся receiving use. Marker: `interaction_model_combined_by_default`.

**Conditional Screen Specification:** включай детали уровня экрана, только если Candidate UI Prototype, implementation или Verification иначе должны изобрести существенное поведение. Несколько экранов могут находиться в одном carrier; отдельный файл на каждый экран не требуется.

| Поле | Минимально необходимый смысл |
|---|---|
| идентификатор, название и назначение | стабильная ссылка на экран в заявленных границах design |
| трассировка к источникам | точные Requirements/Scenarios/Roles/Rules/Constraints |
| роли и условия входа | actor и guard/state для входа |
| отображаемая информация | существенное содержание, его смысл и источник |
| элементы управления и действия | поведение, результат и запрет неопределённого поведения |
| навигация и переходы | target, cancel/back/exit и обработка тупиковых состояний |
| полномочия и бизнес-правила | разрешённое и запрещённое поведение, применимый guard |
| существенные состояния | normal/loading/empty/error/disabled/readonly либо обоснованная неприменимость |
| validation и confirmation | правила ввода, обратная связь, подтверждение и реакция на ошибку |
| связанные экраны и согласованность | общие термины, действия, состояния и межэкранные constraints |
| assumptions и non-coverage | нерешённый вопрос, ответственное лицо и маршрут возврата |

Отдельный Screen Specification требует самостоятельного receiving use, жизненного цикла, ответственного лица и evidence Verification/Admission. До этого он остаётся условным и объединённым. Marker: `screen_specification_conditional_combined`.

##### Candidate UI Prototype, Verification и Human Validation

Candidate UI Prototype — опциональное производное средство проверки замысла, а не production implementation или источник требований. Зафиксируй проверяемый вопрос и аудиторию, точный вход design basis, форму, tool и конфиденциальность, disposable/default status, ограничения и stale trigger. Быстрое создание использует Forsage или equivalent Task/Run со статусом `admitted`; формат или поставщик инструмента не являются универсальными.

Перед Human Validation или Admission design basis выполняй применимые проверки точной конфигурации:

```text
Requirements / Scenarios / Roles / Rules / Constraints
↔ namespaced User Interaction View / contained Interaction Model
↔ conditional Screen Specification
↔ optional Candidate UI Prototype
```

Проверь как минимум:

1. Requirements/Scenarios по UI без представления interaction или screen behavior;
2. существенные элементы UI, отображаемые данные или действия без основания в authoritative sources;
3. неопределённые поведение, результат, failure или transition действия;
4. противоречия ролей и полномочий;
5. недостижимые вход, выход или navigation и необъяснённые тупики;
6. пропущенные существенные состояния loading/empty/error/disabled/readonly/retry/recovery/cancel;
7. межэкранные противоречия терминов, элементов управления, состояний или правил;
8. несоответствие Candidate UI Prototype точной конфигурации design basis;
9. устаревшие конфигурации источников, design или prototype;
10. отсутствующие gaps, non-coverage, ответственные лица или маршруты возврата для указанного использования.

Oracle выбирается по проверяемому claim: таблица trace/query, матрица состояний и полномочий, проверка navigation/reachability, проверка согласованности экранов или точное сравнение с prototype. Количество элементов, ссылка, привлекательный layout или usability score не доказывают корректность и полноту.

Verification с результатом `fail` или `inconclusive` возвращает затронутый claim к наименьшему ответственному source/design/prototype result и не обходится через Human Validation. Human Validation применяется условно к существенному решению о замысле взаимодействия и фиксирует роль reviewer, реальную задачу или вопрос, точную configuration, контекст и ограничения наблюдения, observations, findings с ответственными лицами, disagreement и маршрут возврата. Human Validation является evidence, но не Admission. Marker: `human_validation_is_not_admission`.

##### Возврат findings, Admission и передача в production

Существенный finding классифицируется до изменения:

1. `requirement defect/change` → authoritative requirements;
2. `scenario defect/change` → User/Operational Scenario или equivalent behavior locus;
3. `interaction/screen design defect` → User Interaction View / contained Interaction Model / Screen Specification;
4. `presentation-only issue` → presentation layer/prototype без behavior change;
5. `ambiguous authority/classification` → Human/process authority, без молчаливого выбора.

Изменение source/configuration через `FC-06/07/09` повторно открывает только затронутое HSI reliance. Исправление только представления не скрывает изменение поведения.

По умолчанию объект опоры — точный Combined HSI design basis для указанного использования:

```text
Candidate combined HSI design basis
→ сквозная Verification
→ условное evidence Human Validation
→ Admission для named prototype/production design-basis use
→ отдельно ограниченный Task/Run production implementation
```

Marker: `production_ui_separate_task_run`.

Prototype обычно остаётся evidence/reference. Точная visual reference получает собственную Admission только при указанном downstream fidelity use, configuration, ответственном лице и правиле supersession. Production implementation опирается на применимые authoritative Requirements/Scenarios/Roles/Rules/Constraints и точный HSI design basis со статусом `admitted`; production Verification сравнивает implementation с обоими. Disposable prototype не переименовывается и не продолжается как production.

##### Экономия carriers, неизменяемые границы и повторное открытие

- Общий `EV-*` User Interaction View или `WM-*` HSI module не создаётся без повторно подтверждённой межпроектной ценности и отдельной Admission на уровне продукта.
- Не вводи обязательный carrier Interaction Model/Screen Specification, отдельный Human Validation Gate, универсальный vendor/tool, CAV/viewer, автоматическую оценку usability или универсальный accessibility claim.
- Существующие Working Processes со статусом `admitted` не мигрируют автоматически; новая существенная задача HSI использует обычный Process Review.
- Существующий UI baseline является evidence точной source/configuration, а не requirements по умолчанию; конфликты остаются видимыми.
- Успешные chain checks не доказывают реальную usability, корректность production, пользу в эксплуатации, ценность общего promotion или release readiness.
- Повторное открытие выполняется при существенном изменении source/scope/role/rule/interaction, обнаруженном росте церемонии, пропущенной существенной задаче HSI, повторном независимом использовании carrier или framework-level failure; framework hypothesis оформляется отдельно и не меняет controlled DPF молча.

Markers: `no_common_hsi_catalog_promotion | common_hsi_requires_product_admission | hsi_language_semantic_review`.

### 3.2. Loop

Loop — повторяемый bounded-процесс получения одного определённого типа инженерного результата.

Примеры:

- извлечение требований;
- проверка требований;
- архитектурное исследование;
- impact analysis;
- реализация ограниченного изменения;
- code review;
- генерация тестов;
- выполнение тестов;
- подготовка технической документации;
- проверка документации.

Loop определяет способ работы, но не конкретное поручение.

### 3.3. Task

Task — конкретное поручение внутри существующего Loop.

Пример:

```
Loop:
Извлечение требований

Task:
Извлечь требования к подсистеме регистрации
из документа ИТТ-2026-04.
```

Task должна быть ограничена конкретной целью, системой интереса, входами и ожидаемым результатом.

### 3.4. Run

Run — конкретное выполнение Task определённым исполнителем с конкретным контекстом, инструментами и исходным состоянием.

Одна Task может иметь несколько Runs.

Повторный Run может потребоваться, если:

- изменились источники;
- обнаружены ошибки;
- Candidate Result возвращён на уточнение;
- изменился bounded scope;
- требуется независимая проверка;
- первый Run завершился honest stop.

### 3.5. Candidate Result

Любой существенный результат Run сначала является Candidate Result.

Candidate Result:

- ещё не считается принятым инженерным результатом;
- может содержать ошибки, пробелы и допущения;
- не получает authority только из-за уверенности модели;
- не должен автоматически передаваться следующему Loop;
- должен сопровождаться сведениями о происхождении, ограничениях и проверках.

#### 3.5.1. Human interaction и decision routing

Human-facing presentation является derived projection существующей engineering state, а не новым source, carrier, lifecycle или authority layer. Ordinary human-friendly level по умолчанию показывает понятный статус, process stages по применимости, текущий вопрос/роль человека, существенные основания, risks/limitations/consequences и options. Термин `Candidate` можно скрыть, но preliminary, unverified или not-admitted meaning скрывать нельзя. Engineering level добавляет architecture/trace/review question/configuration delta/evidence; Runtime/Audit level — exact IDs, hashes, guards, full source/currentness и effects. Levels сохраняют одну exact state. Markers: `ordinary_human_friendly_default_projection | candidate_term_optional_meaning_mandatory | engineering_projection_same_runtime_state | audit_projection_same_runtime_state | material_decision_information_never_hidden`.

Для material routing Runtime восстанавливает минимальную decision demand:

1. exact decision/result и bounded intended/first relying use;
2. material product consequence и product accountability, если применимо;
3. engineering review question и required competence обычным инженерным языком;
4. required review evidence/disposition;
5. Admission authority exact result/use;
6. material View/projection и information-preservation obligations;
7. blocked dependent effect, safe continuing work и return/escalation route.

Participant information берётся только из explicit current Work Context, Working Process/Loop, assignment, admitted record или decision evidence: understandable participant reference, responsibility, product accountability scope, established review competence и basis/currentness, Admission authority scope, availability/route, а также явно сообщённые language/format/accessibility needs. Title, confidence, profession, writing style, tool access/use и прошлый успех не доказывают competence или authority. Mandatory standalone Participant Profile, registry, universal competence taxonomy или persistent match state не создаются; applicable facts размещаются в существующих carriers. Marker: `routing_uses_established_participant_information`.

`Authority ≠ Competence`. Product accountability определяет product intent/consequence/trade-off; competent engineering review создаёт Evidence по конкретному review question; Admission authority решает, можно ли полагаться на exact engineering result для bounded use. Одна роль не наследует другую. Один actor может выполнить несколько acts только при отдельно установленном scope/basis каждого, а combined presentation сохраняет distinct meanings/outcomes. Review record сохраняет participant/basis, question, configuration, disposition, evidence, limitations, unresolved findings и currentness, но сам не admits result. Markers: `product_accountability_distinct_from_engineering_review | product_authority_does_not_imply_review_competence | review_competence_does_not_grant_admission_authority | admission_authority_does_not_imply_review_competence | same_actor_roles_require_explicit_bases`.

Routing является derived decision-local operation над существующими contracts:

- direct route при отсутствии material trigger;
- ordinary clarification для недостающего non-material context;
- `DI-06 Missing input` для material missing participant/source/review input;
- `DI-04 Conflict` для conflicting participant/authority facts;
- competent contribution сохраняется как Evidence, не Admission;
- partial match разделяет/сужает decision и блокирует только unresolved dependent reliance;
- independent work продолжается внутри previously delegated authority, admitted Working Process/Loop, side-effect и Verification/recovery boundaries;
- новый Human Gate требуется при material commitment, scope/authority change или ином existing trigger;
- whole Run/initiative получает `blocked` только когда affected work нельзя безопасно разделить, сузить, вернуть или эскалировать и нет разрешённого meaningful continuation.

Unknown/partial mismatch не расширяет competence scope, не снижает review demand и не создаёт global block автоматически. Markers: `unknown_participant_information_bounded_clarification | competence_mismatch_blocks_affected_reliance_only | delegated_continuation_no_new_material_commitment`.

Human-facing Progress Projection выводится из admitted Working Process и factual Loop/Task/Run/Decision records. Она сохраняет recognizable ordered stages, completed/current/remaining, returned/blocked только для affected stages, последний Gate outcome и следующий authorized stage. Re-entry восстанавливает ту же карту из carriers; reopen возвращает affected stage и сохраняет unaffected history/evidence; process-map change показывает before/after meaning. Не создавай progress store, percentage oracle или authority state. Marker: `progress_projection_gate_reentry_reopen_continuity`.

### 3.6. Verification

Verification определяет, достаточно ли Candidate Result соответствует установленным требованиям и intended use.

Verification может включать:

- проверку по источникам;
- проверку полноты;
- тестирование;
- статический анализ;
- трассировку;
- review человеком;
- независимую проверку;
- сравнение с baseline;
- проверку интерфейсов;
- проверку системных свойств.

### 3.7. Admission Decision

Admission — уполномоченное решение о статусе Candidate Result.

Используй явные статусы:

```
admitted
rejected
returned_for_refinement
deferred
```

`honest_stop` является исходом Run или исполнительского контура и фиксирует невозможность безопасного продолжения. Он не является Admission Decision.

Только admitted result может использоваться как relied-on input следующего Loop, если проектом не установлены более строгие ограничения.

### 3.8. Relied-on Result

Relied-on Result — принятый инженерный результат, на который разрешено опираться в последующей работе.

Admission не доказывает абсолютную истинность результата. Он означает, что результат:

- идентифицирован;
- проверен в установленной степени;
- принят уполномоченной стороной;
- пригоден для указанного first relying use;
- имеет известные границы применимости.

---

## 4. Место агента

Агент является исполнителем внутри Loop и Run.

Агент не является основанием структуры Working Process.

```
Loop
├── назначение и receiving use
├── inputs и context
├── Agent Work Application
├── allowed tools
├── allowed actions
├── prohibited actions
├── Candidate Result
├── verification
├── human authority
└── admission route
```

Один агент может участвовать в нескольких Loops.

Один Loop может использовать:

- одного агента;
- несколько агентов;
- человека;
- программные инструменты;
- автоматические проверки;
- Human Gates.

Название роли агента не создаёт authority.

Confidence, explanation, количество выполненных действий и успешное завершение агента также не создают authority.

### 4.1. Применение Interaction и Explanation preferences

Working Process применяет presentation preferences, определённые Bootstrap Guide, но не владеет их выбором или хранением.

- `interaction_mode`: `guided`, `standard` или `compact`;
- `explanation_mode`: `detailed` или `milestone`;
- product default: `compact + milestone`.

Настройки изменяют только форму interaction и reporting. Они не изменяют Working Process, Loop contract, Task scope, Run authority, tool permissions, side-effect boundary, Verification, evidence или Admission. Изменение настройки не является Process Review и не требует process approval.

#### Применение по этапам

| Этап | Обязательный смысл независимо от режима |
|---|---|
| Working Process selection | Candidate status, карта процесса, authority и требуемое решение. |
| Loop proposal | Purpose, receiving use, границы, verification, admission и stop route. |
| Task | Objective, scope, constraints и expected Candidate Result. |
| Run | Начало consequential action, существенные действия, результат и limitations. |
| Verification | Что проверено, evidence, coverage и unresolved issues. |
| Admission | Candidate Result, first relying use, authority и доступные решения. |
| honest stop | Причина, сохранённое состояние, ограничение и reopen/return route. |
| Process Review | Наблюдаемая проблема, impact, Candidate change и process authority. |

`guided` добавляет назначение этапа, значение терминов, последствия вариантов и следующий переход. `standard` даёт достаточный рабочий контекст. `compact` устраняет необязательные вводные и повторения.

`detailed` кратко поясняет каждую группу внешне значимых действий: изучаемый source/locus, создаваемый artifact, выбранный Guide/Process/Loop/Task, выполняемую проверку и существенный результат. Однотипные операции объединяются. `milestone` сообщает только о переходах, решениях, gates, consequential Runs, Verification, Candidate Results, Admission, honest stop и Process Review.

Ни одна комбинация не разрешает скрывать Candidate status, Human Gate, Admission Request, authority/scope change, consequential action, critical risk, honest stop или limitation. Не публикуй chain of thought, внутренний анализ или технические микрооперации; объяснение не заменяет evidence или Verification.

#### Человеко-понятная структура ответа

Обычная выдача должна быть похожа на краткое сообщение инженера на рабочей встрече, а не на машинный журнал. Группируй однотипные действия с инструментами и файлами и веди читателя от смысла к проверяемым деталям в таком порядке:

1. `Статус` — всегда, когда нужен структурированный отчёт: понятная суть результата или ситуации, практическое последствие, существенный риск/блокировка и следующий полезный шаг. Одних IDs или status codes недостаточно.
2. `Этапы работы` — только при существенном изменении этапа, после Human Gate, перед handoff или по прямому запросу; это generated projection наблюдаемого состояния, а не отдельный источник состояния.
3. `Рекомендация` и затем `Варианты решения` — только при реальном Human Gate. Рекомендация объясняет предпочтительный route, а единый блок вариантов показывает применимые действия и последствия. Первый вариант `Принять рекомендованный вариант` повторяет точное действие и последствие.
4. `Служебная информация` — только когда exact IDs, statuses, hashes, paths, predicates или evidence имеют receiving use. В rich UI блок может сворачиваться, но text-only output сохраняет его после вариантов.

Если структурированное сообщение использует эти major service blocks, оформляй их как Markdown headings level 2: `## Статус`, `## Этапы работы`, `## Рекомендация`, `## Варианты решения`, `## Служебная информация`. Nested decision/evidence content использует level 3 или ниже. Короткий неструктурированный ответ может опустить headings полностью; weak pseudo-heading или H3 major block не является допустимым fallback. Контракт не требует native UI, CSS или конкретных fonts. Marker: `structured_service_headings_h2`.

Если решения, изменения этапов или полезных служебных деталей нет, соответствующий блок полностью опускается. Candidate status, CAP `terminated_on_deviation`, `honest_stop`, критическое ограничение/риск, изменение authority/scope, failed или inconclusive Verification, Human Gate и Admission остаются явными в `Статус`; consequential meaning нельзя помещать только в `Служебная информация`.

Структура не требует всех headings в каждом коротком сообщении. Она задаёт стабильный порядок при наличии содержания и согласуется с `WPC-06`: существенное решение может содержать расширенные основания, но человек сначала понимает ситуацию, затем видит рекомендацию и все применимые варианты, после чего при необходимости проверяет exact детали.

#### `Этапы работы` и completion taxonomy

При существенном изменении этапа, после Human Gate, перед milestone handoff или по прямому запросу показывай generated block `Этапы работы`. Одна полезная строка соответствует одному этапу: `✅` завершено, `🔄` выполняется, `⏳` ожидается, `↩️` возвращено, `⛔` заблокировано. Маркер всегда сопровождается явным текстом, поэтому смысл сохраняется без emoji. Легенду поясняй только при первом существенном использовании или неоднозначности. Жёсткого числа строк нет: объединяй внутреннюю детализацию, если она ухудшает ориентацию.

Не показывай блок после каждого tool call, для простой одношаговой работы или при неизменившемся состоянии. Существенные `Открытые вопросы` и `Ближайший Human Gate / следующий допустимый шаг` указывай отдельно, если строки этапов не передают их полностью. Состояние опирается на наблюдаемые Task/Run/Loop transitions, не на activity или confidence. Не используй проценты готовности без отдельной измеримой модели. Marker: `work_stages_generated`.

Machine-stable regression projection: `progress_fields: completed | current | remaining | open_questions | next_gate`.

Различай: Task completion criteria met; Run ended с Candidate/partial/blocked outcome; Loop result reached declared Admission state; exact baseline admitted для bounded relied-on use; initiative complete, когда admitted intended outcome существует, а весь required scope завершён или явно disposed. Фраза `Mission Complete!` разрешена только для последнего состояния и сопровождается кратким итогом, exact admitted baseline/configuration, accepted limitations, optional next actions и указанием, что оставшаяся optional work не нужна для завершённого scope. Passing check, Candidate Result, закончившийся Run, implementation до Admission или исчерпание budget не являются initiative completion.

#### `WPC-06` — ясная основа решения

Material Candidate Work Context, Working Process, Loop и Admission Request представляются как продуманный decision carrier, а не поток заметок. Используй применимые подписанные блоки:

1. статус и назначение;
2. краткий вывод;
3. что предлагается и зачем;
4. scope и authority;
5. карта работы или результата;
6. evidence, assumptions, risks и limitations;
7. `Рекомендация` агента;
8. `Варианты решения` с точным действием и последствием для каждого применимого варианта;
9. что решение разрешает и не разрешает;
10. следующий переход и return/reopen route.

Короткий ответ не требует десяти разделов. Структура обязательна там, где человек принимает material decision. `compact` может сокращать пояснения, но не decision basis.

Одна и та же material configuration сохраняет понятную идентичность через request, decision confirmation и handoff. При первой ссылке покажи `понятное название + exact ID` и descriptive link, если carrier существует и ссылка полезна; при последующей relying reference повтори `понятное название + exact ID`. Bare ID, filename или path допустимы в service details, но не являются достаточной основной идентификацией результата или решения.

Минимальный contract вариантов решения:

```text
Candidate и first relying use
Рекомендация и её основание
Варианты решения: действие → последствие
Что каждый вариант разрешает / не разрешает
Return/defer/reject и следующий переход
```

#### Decision UI в чате и optional Markdown

Material Human Gate оформляй как единый Decision UI для одной exact Candidate configuration. Основной слой — сообщение в чате; adjacent `.md` нужен только когда decision basis, evidence или восстанавливаемая configuration не помещаются пропорционально в сообщение. Chat и файл не являются двумя версиями решения: сообщение показывает достаточный decision summary и безопасную ссылку на тот же exact carrier.

Выбирай одну из восьми admitted Decision Interactions по решению, которое действительно принимает человек:

| ID / Interaction | Когда применять | Обязательное усиление |
|---|---|---|
| `DI-01 Review` | принять, вернуть, отклонить или отложить Candidate Result | exact configuration, first relying use, verification и limitations |
| `DI-02 Choice` | несколько альтернатив остаются допустимыми | comparison: benefit, cost, risk, trade-off и affected relying use для каждого варианта; `request a new option is a return route`, not rejection of all current options unless explicitly stated |
| `DI-03 Change` | меняется scope, intent или baseline | `before → after`, impact, dependencies, superseded configuration/part, prior Admission that remains valid, prior Admission that is reopened и affected relying use after the change |
| `DI-04 Conflict` | material sources, claims или authorities конфликтуют | exact conflicting source/decision identities, competing statements и claimed authority, отдельно agent interpretation, blocked reliance и human-selected resolution basis в recorded outcome/action |
| `DI-05 Risk` | residual risk требует human disposition | consequence/exposure, mitigation, accountable risk owner, review condition, reopen trigger и unaccepted residual part |
| `DI-06 Missing input` | безопасное продолжение требует source/data | exact missing input, why needed, blocked use, safe continuing work, source authority boundary и допустимые routes: `add data/source`, `limit scope`, `defer the blocked reliance` |
| `DI-07 Failed verification` | claim failed или verification inconclusive | failed claim, evidence, smallest responsible return и closure evidence |
| `DI-08 Consequential action` | разрешается hard-to-reverse или external effect | exact action verb, target/configuration, side effects, reversibility/recovery и verification |

Для partial `DI-03 Change` generic return/reopen route недостаточен: decision basis и confirmation явно различают prior Admission that remains valid и prior Admission that is reopened, а также называют affected relying use after the change. Для `DI-04 Conflict` human-selected resolution basis записывается в outcome/action для exact conflicting source/decision identities; source statements, claimed authority и agent interpretation не смешиваются. Для `DI-02 Choice` запрос нового варианта расширяет или уточняет choice set и сам по себе не отклоняет текущие варианты. Для `DI-06 Missing input` uploaded file does not become authoritative только потому, что агент может его прочитать; authority устанавливается отдельно.

`Допустить несмотря на failure` для `DI-07` недоступно, если отдельный risk/exception route не был явно спроектирован и authorized. Не сворачивай восемь interactions в один generic template.

Broad navigation families не заменяют taxonomy и применяются только как routing view:

```text
candidate_admission → DI-01, DI-07
process_authority → DI-02, DI-03, DI-04
risk_acceptance → DI-05
missing_input → DI-06
consequential_action → DI-08
clarification → cross-class response state, not a Decision Interaction
```

Общий порядок чтения в чате:

```text
<человеко-понятный заголовок ситуации>
Candidate status и exact configuration
Краткий вывод
Что изменится и зачем это нужно сейчас
Evidence, assumptions, risks и limitations
Что разрешено / что запрещено
Рекомендация
Варианты решения с точными последствиями
Optional exact approval phrase после всех вариантов
Следующий переход и return/reopen route
```

Не используй `Human Gate`, ID или цвет как единственный основной заголовок. Заголовок называет ситуацию и решение, например `Нужно утвердить Candidate-контракт перед первым Run`. Цвет, emoji и typographic emphasis могут обозначать состояние (`информация`, `внимание`, `риск`, `решение`), но весь смысл, порядок и доступные действия должны сохраняться без цвета, emoji, rich rendering или нативных кнопок.

Информационный бюджет пропорционален последствиям. Default one-scan target перед outcomes: один human-readable heading, 3–6 decision-relevant bullets, одна explicit recommendation и не более одной descriptive details link. Это usability guidance, а не truncation rule: critical evidence, authority boundary или limitation остаются видимыми даже при justified overflow. Не добавляй пустые поля или decorative density ради шаблона.

Для `DI-08` точная формула решения содержит action verb, target/configuration, side effects, recovery/reversibility и verification. Для `DI-05` risk/exposure, possible consequence, mitigation, accountable risk owner, review condition/date, reopen trigger, unaccepted residual part и bounded relying use остаются видимыми в request, confirmation и последующем relied-on context. Decision authority и risk owner могут различаться; не объединяй их молча.

Варианты имеют сопоставимую структуру `<действие> — <последствие>` и показываются только по применимости выбранного `DI-*`. Если recommendation существует, первый вариант может называться `Принять рекомендованный вариант`, но сразу повторяет exact действие и последствие; одной ссылки на рекомендацию недостаточно для recoverable authority decision. Conditions, narrower authority и запрос нового/уточнённого варианта остаются видимыми там, где interaction это допускает. Не отмечай рекомендацию success marker до решения. Markers: `applicable_decision_options | recommended_option_exact_effect`.

После однозначного ответа Layer C явно подтверждает: outcome обычным языком и exact status; exact admitted/rejected/returned/deferred configuration; вновь разрешённые и по-прежнему запрещённые effects; conditions/limitations; decision actor и date/time when available; descriptive link to the decision record when one created; next authorized transition и return/reopen route. Не показывай success confirmation до существования решения. Не считай двусмысленное `да`, emoji reaction, молчание или ответ не к той configuration Admission либо authority grant: запроси clarification. Стабильные текстовые действия и exact approval phrase являются переносимым fallback после полного списка вариантов; этот контракт не обещает native Codex controls, CSS, fonts, persistence или accessibility behavior host-продукта. Marker: `decision_confirmation_effects`.

#### `WPC-07` — русский по умолчанию

Пользовательские заголовки, пояснения, рекомендации и основания решения пиши по-русски, если project authority не установила иной язык. Применяй semantic categories:

1. exact system terms (`Working Process`, `Loop`, `Task`, `Run`, `Candidate Result`, `Verification`, `Admission`, `Human Gate`, `Work Context`, `Entry Decision`, `Runtime`) сохраняют точную форму; при первом существенном употреблении добавь краткое русское пояснение, если оно помогает аудитории;
2. named engineering results/interactions сохраняют identity и при необходимости получают русское пояснение при первом употреблении;
3. IDs, status values, code, paths, commands, quotations и hashes сохраняются byte-exact;
4. boundary vocabulary вроде `baseline`, `scope`, `authority`, `evidence`, `configuration`, `carrier`, `first relying use`, `reopen trigger` в обычной пояснительной речи передаётся естественно по-русски; English остаётся при первом употреблении или когда важна exact field identity;
5. ordinary explanatory English переводится по смыслу.

Для системного объекта используй `<exact type> — <русское понятное название>` и exact ID при первой существенной ссылке, например `Working Process — проверка ясности взаимодействия` (`WP-IDPF-340-IC-001`). Русское название поясняет объект, но не переименовывает exact type. То же правило действует для project-specific carriers: headings и explanatory prose формируются прежде всего по-русски. Автоматический word-count, полный запрет English или массовый перевод historical/source content не являются oracle; проверяй смысл, continuity title/ID и отсутствие decorative English. Marker: `interaction_clarity_russian_first`.

Presentation preferences меняют объём, но не отменяют `WPC-05/WPC-06/WPC-07`, Candidate status, risks, authority или limitations.

### 4.2. Model Assignment и escalation

Если пользователь принял optional model-guidance offer либо risk/host context требует явного назначения, Working Process или Loop фиксирует Candidate Model Assignment по `MODEL_SELECTION_RECOMMENDATIONS.md`. Назначение выполняется после достаточного понимания scope и не является основанием структуры процесса: смена модели сама по себе не создаёт новый Loop.

Минимально зафиксируй только применимые поля:

```text
primary_model_role
implementation_model_role
review_model_role
escalation_model_role
effort_or_thinking_mode
host_availability
privacy_boundary
review_independence
fallback
verification
authority
```

Выбирай capability по риску конкретной Task, а не только по названию этапа. Для hard-to-reverse data, architecture, migration, security и Final V&V явно рассмотри frontier escalation и cross-family review. Реально доступные host/system capabilities имеют приоритет; недоступную модель нельзя представлять как назначенную.

Любой Model Assignment сначала является Candidate частью process/Loop contract и требует применимого process authority decision. Модель, effort, confidence, benchmark или стоимость не изменяют Task authority, side-effect boundary, Verification, Human Gates, Admission или honest stop. Не передавай confidential source/data внешнему provider без применимой privacy authority.

Authority invariant: model capability does not change Task authority.

### 4.2.1. Conditional independent review и recursive control guard

Independent review активируется только при material trigger: architecture baseline; authority/security change; system integration result; consequential migration/release Candidate; material Verification uncertainty; explicit process-authority requirement; либо selected sampling после repeated similar slices. Low-impact local work и confidence/file/model/tool count trigger не создают.

Minimum review contract остаётся внутри applicable Working Process/Loop/Task/Run/Model Assignment и называет:

- reviewer identity и independence class;
- exact claims, Candidate/configuration и permitted context/privacy boundary;
- prohibited actions; default — no Candidate modification и no Admission authority;
- evidence/findings format, limitations и disagreement;
- failed/inconclusive smallest-responsible return route.

Reviewer verdict является Evidence/Observation, а не Verification или Admission. Если review authority/context отсутствует, вернись к process authority до disclosure/action. Reviewer, желающий изменить Candidate, сначала получает separate bounded Task и explicit modification authority; finding само этого не разрешает. Когда Engineering Review View и independent review применимы к одной architecture/integration/release configuration, reviewer получает отдельную read-only Task/Run, а claim-referenced findings входят в тот же applicable Human Gate; failed/inconclusive finding блокирует только affected relying claim. Второй mandatory Admission или approval ladder не создаётся. Marker: `conditional_independent_review | reviewer_evidence_not_admission | independent_review_composes_with_engineering_gate`.

При material expansion Verification/control topology новый слой разрешён только если он защищает хотя бы одно:

```text
new material claim
OR new material risk
OR new trust boundary
OR required independence
```

Без такого value expansion останови recursive escalation и используй existing Verification/evidence contract. Loci, agents, tools или verifier count сами по себе diagnostic only. Active Candidate iteration использует proportional local verification; full exact configuration/hash closure выполняется на frozen Candidate перед reliance. Marker: `recursive_control_requires_new_protected_value | active_iteration_local_verification | frozen_candidate_exact_closure`.

### 4.3. Execution profile «Форсаж»

«Форсаж» — отдельный bounded rapid-prototyping execution profile, а не presentation mode, maturity level или bypass. Он доступен только внутри admitted context и отдельно утверждённого Loop/Task envelope. До старта зафиксируй:

```yaml
profile: forsage
first_working_result:
budget:
stop_condition:
reversible_agent_choices:
human_gate_triggers:
assumptions:
temporary_decisions:
prototype_limitations:
verification:
completion_route: discard | promote_to_engineering
```

Агент может самостоятельно выбирать только reversible local technical details внутри exact Task. Вернись к человеку до scope change, persistent или externally valued data, security/privacy/authority change, shared architecture/interface commitment, external effect, non-reversible action или выхода за prototype use. Prototype completion не означает production/release readiness. `promote_to_engineering` запускает обычный admitted requirements/architecture/implementation/verification route; `discard` сохраняет только предусмотренное contract evidence и не разрешает несанкционированное удаление.

### 4.4. Consolidated Authority Package

Объединённый пакет полномочий (`Consolidated Authority Package`, CAP) — optional exact Candidate configuration, в которой одно явное решение process authority может разрешить заранее ограниченную последовательность действий, проверок и conditional transitions. CAP уменьшает повторные approvals, но не является источником authority, lifecycle, Admission mechanism или универсальным default.

Если exact границы нельзя доказать, используй обычный пошаговый маршрут. Отсутствие CAP не является degraded mode.

#### Opportunity detection and one-time offer

Runtime предлагает подготовить Candidate CAP один раз, только когда одновременно наблюдаемы все material signals:

- admitted Working Process и repeatable Loop/sequence;
- known bounded phases и stable authority;
- exact sources/baseline и allowed/prohibited loci/effects;
- repeated Verification predicates и finite budgets;
- explicit deviations/stop conditions;
- low/moderate controlled consequence;
- final Candidate всё равно использует existing Admission route.

Exploratory, unbounded, high-uncertainty или high-consequence work не получает CAP offer и остаётся пошаговым. Отказ подавляет повторное предложение до нового material trigger. Opportunity detection не создаёт/активирует CAP и не предоставляет authority. Marker: `cap_opportunity_all_signals | cap_offer_once | cap_refusal_suppressed_until_material_trigger`.

#### Eligibility contract

До approval CAP обязан назвать:

- stable ID, version, Candidate status и exact configuration/hash;
- purpose, Engineered System, Agentic Process EoC, receiving use и first relying use;
- accountable approver и final result Admission authority;
- exact authoritative/admitted inputs либо closed configuration baseline;
- allowed/prohibited actions, tools, effects и exact write loci;
- ordered phases, entry/transition predicates и declared evidence;
- side-effect budgets: file/effect count, aggregate bytes where applicable, iteration bound и zero budgets for prohibited effects;
- Human Gate triggers, Verification, recovery/rollback constraints, stop/return и supersession route;
- явный статус destructive, Git, network, external-system, production, security/privacy, packaging/release/publication effects; silence означает `not allowed`.

Directory wildcard допустим только тогда, когда bounded instances и file-count rule восстанавливаемы. Schema presence недостаточно: значения должны позволять observable enforcement. Reusable template находится в `templates/CONSOLIDATED_AUTHORITY_PACKAGE_TEMPLATE.md`.

#### States and transitions

```text
candidate
→ admitted_inactive
→ active
→ completed_candidate_pending_admission

active
→ terminated_on_deviation
```

`terminated_on_deviation` — terminal execution state одной CAP configuration. `honest_stop` остаётся outcome Run/Session. `admitted | returned_for_refinement | rejected | deferred` остаются Admission Decisions. Не подменяй эти state classes друг другом.

Approval идентифицирует exact CAP configuration/hash и authorized action. Молчание, reaction, двусмысленное «да» или ответ к другой configuration CAP не активируют; запроси clarification.

Перед первым consequential action activation повторно проверяет package/configuration, inputs, authority, allowed loci, budgets и baseline. Перед каждым automatic transition проверь applicable predicates и запиши evidence. Только полный pass разрешает следующий phase. Ordinary reversible work внутри declared phase не требует micro-Admission.

Automatic transition внутри exact active CAP может передавать только internal intermediate state/evidence без independent result identity или downstream first relying use и только внутри уже authorized package/Run. Любой named `Candidate Result`, включая result, запрошенный следующей phase для reliance, останавливается на existing Human Gate/Admission route. CAP не создаёт exception к `Candidate Result ≠ Relied-on Result`. Marker: `cap_internal_non_result_state_only | cap_candidate_reliance_requires_admission`.

Normal completion возвращает Candidate/partial result и evidence со state `completed_candidate_pending_admission`. Оно не admits result, не authorizes downstream Loop и не изменяет prior authority. Final result Admission остаётся отдельным explicit decision для exact result configuration и first relying use.

#### Deviation, fallback and successor

Failed mandatory predicate, undeclared effect, input/configuration/scope/authority drift или exceeded budget прекращает active CAP как `terminated_on_deviation`. Не pause и не resume тот же package после repair.

User-facing report начинается exact смыслом:

> CAP прекращён: обнаружено отклонение от согласованных условий.

Затем сообщи:

- exact deviation;
- last completed phase;
- effects already produced;
- preserved evidence/Candidate state;
- почему automatic transitions больше не применимы;
- Run/Session outcome, включая `honest_stop`, если он действительно наступил;
- следующий обычный route.

CAP termination не завершает wider initiative автоматически. Дальнейшая consequential работа возвращается к обычным пошаговым authority decisions. Уже созданные результаты остаются Candidate, пока не получат applicable Admission; termination не admits и не rejects их.

Когда cause понятна и новые exact bounds можно сформулировать, Runtime один раз для данного termination event предлагает: подготовить successor Candidate CAP либо продолжить пошагово. Он не создаёт и не активирует successor автоматически. Пока cause неясна или work остаётся unbounded, CAP ещё не предлагай; допустимо bounded ordinary investigation.

#### Verification and recovery

До каждого phase записывай applicable predicates/current configuration. После write phase перечисляй exact touched files/effects и выполняй allowed-locus, budget, source/configuration и claim-specific checks. Automatic destructive rollback не подразумевается: recovery/rollback должен быть отдельно разрешён и безопасен. Failed verification возвращает к smallest responsible work; `admit despite failure` требует отдельного спроектированного exception/risk route.

### 4.5. Внешние навыки и методологическая целостность

External skill, plugin, framework или agentic method может дать bounded capability, но не должен молча создавать parallel lifecycle, project plan, state model, artifact/source-of-truth hierarchy, Verification или Admission mechanism.

Host/system/safety/privacy constraints остаются выше project instructions. Applicable law, contract, admitted domain standard/model и authoritative engineering source входят через normal source/authority mediation; не классифицируй их как subordinate skill. Если higher-priority host behavior несовместим и его нельзя bounded-map, явно сообщи limitation и stop/return route вместо ложного обещания sovereignty.

#### Event-driven gate

Не инвентаризируй и не классифицируй все installed/available skills во время каждого Bootstrap или Run. Gate активируется только когда method:

- действительно invoked;
- явно requested;
- либо его applicable instructions вводят material lifecycle/planning/state/artifact/authority/verification semantics.

Классифицируй current use, а не skill «навсегда»:

1. `capability_only` — local technique/tool capability без material process semantics;
2. `process_bearing_mappable` — содержит полезные capability/steps, но также process semantics, которые можно bounded-map;
3. `process_incompatible` — для current use нельзя сохранить admitted process/authority/source/verification boundaries.

`capability_only` применяется внутри current Task/Run без user-facing gate или нового carrier, если не становится material. Это silent fast path.

Для `process_bearing_mappable`:

1. назови локальную capability и цель;
2. map useful actions/results to current Task/Run;
3. оставь foreign plans/states non-authoritative;
4. переведи equivalent concepts в Runtime terms, сохраняя material borrowed terminology/provenance;
5. классифицируй output как Candidate;
6. проведи его через applicable Verification/Admission;
7. reject или isolate incompatible parts и назови unresolved conflict.

Material mapping сохраняет:

`method/skill | version/observable identity | requested capability | classification for this use | Runtime Task/Run | accepted technique/output | rejected/translated process semantics | Candidate status | project process changed? | unresolved conflict | fallback/reopen`.

Для material external provider/method отдельно сохраняй foreign-state/authority/evidence mapping:

```text
provider/method identity + exact version/configuration
→ requested capability + current-use classification
→ Runtime Task/Run target, inputs/outputs and allowed/prohibited effects
→ foreign state/event
→ Runtime interpretation
→ explicit not_equivalent_to
→ allowed effect
→ Evidence section + fallback/reconciliation/invalidation
```

Foreign `queued | running | done | approved | passed` остаётся provider state/evidence и не становится Runtime lifecycle state, Verification, Admission или authority. Evidence section называет claim, exact checks, artifacts/hashes/effects, coverage/non-coverage, limitations, freshness, provider/configuration и retrieval locus. Provider identity/configuration drift делает affected mapping/evidence stale before relying use. Два provider-distinct verifier records могут нормализоваться в одинаковые Evidence fields, но provider identity и limitations не стираются.

Default — inline mapping в current Task/Run evidence. Physical `EXTERNAL_INTEGRATION_PROFILE` оправдан только если существуют как минимум два repeated/material mappings и independent receiving use, которые нельзя безопасно и согласованно удержать inline плюс Runtime Capability Profile. Иначе behavior сохраняется, carrier не создаётся. Evidence Envelope является section существующего Run/evidence output, а не новой universal core entity. Marker: `foreign_state_not_admission | provider_drift_stales_mapping | external_mapping_inline_by_default | external_profile_two_mappings_independent_reuse_predicate`.

Обычно `project process changed? = no`. Если useful capability требует реального process change, останови mapping и вернись к Process Review/process authority; gate сам не меняет Working Process.

Когда process-bearing method material, в `Статус` назови использованную capability и скажи, изменился ли project process. В `Служебная информация` помести mapping details. Не смешивай foreign terminology с Runtime как будто provenance не существует.

`process_incompatible` не используй для affected work. Сообщи conflict и предложи disable/avoid для Task/session, compatible capability или ordinary return. Если host требует incompatible behavior и его нельзя ограничить, соблюди higher-priority constraint и явно сообщи limitation/stop.

Compatible classification можно reuse только для same skill/version/use class. Reopen при version/behavior/Task/project-authority change или observed drift. Не создавай persistent skill registry, пока repeated use не докажет receiving use и отдельный project/process decision.

CAP не разрешает process-bearing external method только потому, что method доступен. Method/use должен быть declared либо compatibly mapped inside CAP boundary до reliance. Undeclared material method вызывает applicable return или CAP termination.

---

## 5. Структура каталога

Рекомендуемая структура:

```
/
├── AGENTS.md
├── WORKING_PROCESS_AND_LOOPS_GUIDE.md
├── AI_SDLC_DPF/
└── project/
    └── process/
        ├── WORKING_PROCESS.md
        ├── LOOP_REGISTER.md
        ├── loops/
        ├── tasks/
        ├── runs/
        └── admissions/
```

Допускаются эквивалентные carriers, если они сохраняют необходимый смысл и трассируемость.

### 5.1. `WORKING_PROCESS.md`

Содержит карту процесса проекта:

- цель процесса;
- систему интереса;
- основные результаты;
- последовательность и зависимости;
- перечень Loops;
- Human Gates;
- authority;
- integration routes;
- verification and admission;
- DPF profile и selected/non-selected reference components в пропорциональной форме;
- expanded project-relevant coverage basis до сокращений;
- `admitted reduction trace`: approved reductions, accepted risks/protected value и reopen routes;
- disposition material concerns/results и their first relying uses;
- triggered Commitment Guards, reliance states и reopen routes;
- правила reuse/supersession для vertical slices;
- configuration identity и связь management/engineering views с одним source contract;
- process-authority decision и exact admitted Candidate configuration либо ссылка на сохраняющий их evidence carrier;
- open process decisions.

`WORKING_PROCESS.md` не обязан дублировать весь Candidate decision package, но admitted optimized map должна возвращаться к DPF profile, expanded coverage basis, approved reductions и authority decision по exact configuration. Ссылка без recoverable meaning или на изменяемый неидентифицированный chat context недостаточна.

### 5.2. `LOOP_REGISTER.md`

Содержит реестр Loops.

Рекомендуемая таблица:

|ID|Loop|Purpose|Candidate Result|Inputs|Verification|Admission Authority|Status|
|---|---|---|---|---|---|---|---|

Дополнительные поля:

- owner;
- upstream loops;
- downstream loops;
- applicable system level;
- current version;
- last review;
- open issues.

### 5.3. `loops/`

Содержит определения повторяемых Loops.

Пример:

```
loops/
├── LOOP_001_REQUIREMENTS_EXTRACTION.md
├── LOOP_002_REQUIREMENTS_REVIEW.md
└── LOOP_003_ARCHITECTURE_RESEARCH.md
```

### 5.4. `tasks/`

Содержит конкретные Task instances.

Пример:

```
tasks/
└── LOOP_001/
    └── TASK_001_REQUIREMENTS_FROM_ITT.md
```

### 5.5. `runs/`

Содержит записи о фактическом выполнении Tasks.

Пример:

```
runs/
└── LOOP_001/
    └── TASK_001/
        ├── RUN_001.md
        └── RUN_002.md
```

### 5.6. `admissions/`

Содержит решения о статусе Candidate Results.

Пример:

```
admissions/
└── LOOP_001/
    └── TASK_001/
        └── ADMISSION_001.md
```

---

## 6. Инициация Working Process

Перед выполнением существенной или повторяемой инженерной работы проверь, существует ли актуальный Working Process.

Working Process необходимо инициировать, если:

- проект начинается с нуля;
- существующий процесс отсутствует;
- процесс не охватывает текущую систему интереса;
- появилась новая подсистема;
- появился новый тип инженерного результата;
- работа регулярно выполняется неформально;
- результат одного участка работы должен надёжно передаваться другому;
- требуется определить verification или admission;
- последствия ошибки требуют управляемого процесса;
- существующие Loops конфликтуют или дублируются.

Если Working Process отсутствует:

1. получи admitted project context и downstream handover; historical `AI_SDLC_DPF/QUICKSTART.md` не используй как operational method;
2. определи систему интереса, level of consideration, intended use, consequence, reversibility и first relying use;
3. через `FC-13` выбери применимые DPF patterns и reference components; не копируй PEC/PAP как default;
4. разверни project-relevant engineering results по `WPC-02` и проверь optional PEC/project-specific concerns;
5. disposition results, dependencies, first relying uses и applicable Commitment Guards; затем выполни conditional material-human-decision screen по `WPC-02` без нового carrier при no-trigger;
6. представь развёрнутую Candidate map;
7. отдельно предложи reductions по `WPC-03` и recommended optimized map;
8. выдели предполагаемые Loops и связи между ними;
9. предложи первый bounded Loop;
10. представь ясные `Рекомендация` и `Варианты решения` по `WPC-05/WPC-06/WPC-07`;
11. получи explicit process authority decision;
12. только после этого создавай process files или выполняй Run.

Не создавай подробный lifecycle или файлы без receiving use. Если данных недостаточно для развёрнутой project-relevant map, вернись к Bootstrap/discovery или явно оставь bounded open question; не скрывай неизвестное преждевременным сокращением.

### 6.1. Представление и утверждение Working Process

Предложенный Working Process сначала является Candidate Result.

До введения Working Process в действие агент обязан представить пользователю:

- систему интереса и уровень рассмотрения;
- DPF profile и выбранные/невыбранные reference components в пропорциональной форме;
- развёрнутые project-relevant инженерные результаты;
- Candidate reductions с protected value, risk и reopen;
- recommended optimized map Working Process;
- перечень предполагаемых Loops;
- связи и зависимости между Loops;
- explicit concern/result dispositions и причины material non-use/defer;
- triggered guards, data/baseline reliance и integration responsibility, если применимо;
- applicable material human decision obligations с required authority act, required-before transition и blocked effect либо bounded no-trigger statement, когда review material process coverage этого требует;
- первый предлагаемый bounded Loop;
- verification и admission для ключевых результатов;
- открытые вопросы, assumptions и limitations;
- `Варианты решения`, exact allowed/prohibited consequences и return route.

Для material Candidate Working Process действует `WPC-06 decision wrapper required`: перечисленное представление должно само содержать WPC-06 basis либо сопровождаться adjacent decision wrapper, связанным с exact Candidate configuration. Короткая однозначная команда пользователя остаётся допустимым ответом, но не заменяет сохраняемую основу решения.

Агент не должен молча создавать, считать утверждённым или начинать исполнять новый Working Process.

Working Process вводится в действие только после явного решения пользователя или иной заранее определённой process authority.

Отсутствие возражений, продолжение диалога или предоставление дополнительных материалов не считаются утверждением.

---

## 7. Инициация Loop

Новый Loop требуется, когда обнаружен повторяемый способ получения отдельного типа результата.

Признаки отдельного Loop:

- результат имеет самостоятельный receiving use;
- работа повторяется для разных Tasks;
- имеются устойчивые входы и выходы;
- существуют отдельные verification criteria;
- требуется собственный admission route;
- работа имеет ограниченный scope;
- результат может быть возвращён на отдельное уточнение;
- Loop можно независимо совершенствовать;
- Loop может использоваться в нескольких частях проекта.

Не создавай новый Loop только потому, что:

- появился новый агент;
- сменилась модель;
- изменился prompt;
- используется другой инструмент;
- одна Task оказалась сложной;
- возник единичный вспомогательный шаг;
- изменилась структура каталогов.

---

## 8. Проектирование Loop

Каждый Loop должен содержать следующие разделы.

```
# LOOP-NNN: Название

## Status
## Purpose
## System of Interest
## Level of Consideration
## Receiving Use
## Trigger
## Inputs
## Required Context
## Preconditions
## Candidate Result
## Participants
## Agent Work Application
## Model Assignment and Escalation
## Allowed Tools
## Allowed Actions
## Prohibited Actions
## Side-Effect Boundary
## Iteration Boundary
## Verification
## Evidence
## Admission Authority
## Admission Route
## Stop Conditions
## Honest Return
## Upstream Loops
## Downstream Loops
## Task Template
## Run Record Requirements
## Open Questions
## Change History
```

Для material Candidate Loop действует `WPC-06 decision wrapper required`: Loop carrier или adjacent presentation, связанная с его exact configuration, показывает `Рекомендация`, evidence/assumptions/risks/limitations, `Варианты решения`, allowed/prohibited effects и return/reopen route. Эти поля не становятся обязательными headings внутри каждого lightweight Loop, если эквивалентный wrapper однозначно сохранён.

Если admitted Working Process содержит applicable material human decision obligation, Loop или adjacent exact contract до первого affected transition ссылается на local obligation и current object/configuration, показывает `pending | current | reopened | not_yet_required`, сохраняет named blocked effect до current decision и не копирует parallel approval map. Bounded preparation может продолжаться только внутри already allowed actions. Stale source, incompatible authority или ambiguous mapping возвращают к smallest responsible process/decision locus. Если Loop не приближается к affected transition, отдельная inherited section/Gate не создаётся. Marker: `loop_inherits_material_decision_obligation`.

### 8.1. Purpose

Опиши, какую повторяющуюся инженерную проблему решает Loop.

### 8.2. Receiving Use

Укажи, где и кем будет использован результат.

Не проектируй Loop без понятного receiving use.

### 8.3. Inputs

Перечисли допустимые типы входов:

- authoritative sources;
- admitted results предыдущих Loops;
- project decisions;
- configuration state;
- code;
- datasets;
- test evidence;
- user-provided context.

### 8.4. Candidate Result

Определи конкретную форму результата:

- файл;
- набор записей;
- patch;
- таблица;
- модель;
- отчёт;
- код;
- тесты;
- решение;
- пакет evidence.

### 8.5. Participants

Укажи:

- accountable human;
- исполнителя;
- reviewer;
- verifier;
- admission authority;
- внешних участников.

### 8.6. Agent Work Application

Для работы агента зафиксируй:

- bounded task;
- разрешённый контекст;
- разрешённые инструменты;
- допустимые действия;
- запрещённые действия;
- side effects;
- iteration boundary;
- stop conditions;
- honest return;
- replay requirements.

Если Model Assignment материален, дополнительно укажи primary/implementation/review/escalation roles, effort/Thinking mode, host availability, privacy boundary, независимость reviewer, fallback и verification. Для простой механической Task достаточно явно принять host default; не создавай тяжёлый carrier ради заполнения полей.

#### 8.6.1. Conditional Runtime Boundary Conformance Contract

Semantic allowed/prohibited boundary остаётся authority source даже при наличии host automation. Когда consequential Run materially полагается на deterministic technical boundary, до действия установи recoverable mapping:

```text
exact approved semantic source/configuration
→ boundary claim
→ required implementation-neutral capability
→ actual host/tool/configuration capability
→ declared | enforced | compensated | unsupported
→ enforce | compensate | Human Gate | honest_stop
→ concrete conformance evidence, limitation and invalidation trigger
```

`declared` не означает `enforced`. Capability, tool permission, profile или projection не предоставляют action/decision authority и не заменяют Task/Run/Admission. Claim `enforced` требует observable evidence для exact configuration; behavioral scenarios, schema presence и integrity markers сами по себе недостаточны.

Default — inline mapping в material Loop/Task/Run/CAP или evidence. Reusable Runtime Capability Profile optional и оправдан repeated/material use одной exact configuration. Machine-readable projection создаётся только при concrete consumer/enforcer, ссылается на semantic source и становится stale/invalid при material source/host/tool/configuration change. Consequential execution не продолжается по stale projection.

Начинай с smallest protected-value set: protected loci, prohibited side effects/external actions, finite budget/terminal outcome и stale semantic binding. Для simple reversible work без material technical-enforcement claim сохраняй semantic boundary, direct review и ordinary Verification без profile/conformance ceremony. Git, worktree, container и CI являются adapters, а не universal vocabulary.

##### Demand-driven qualification maintenance

Qualification требуется только перед consequential Run, который materially полагается на technical boundary. Ordinary Runtime use и simple reversible work не создают host-maintenance obligation. Qualification связывается прежде всего с observed capabilities одной exact accessible configuration; host family, version/build и evidence date остаются evidence/diagnostic fields. Unknown build записывается как `unknown` с limitation, а не изобретается.

Host version/build change запускает manual material-change screen, но сам по себе не делает Runtime incompatible и не требует Runtime release. Material changes включают enforcement backend/OS, sandbox/write boundary, approval/tool/network policy, Verification/evidence surface, recovery behavior или capability semantics. UI wording, unrelated features и internal refactoring с unchanged observed behavior сами по себе material change не являются.

Initial qualification и каждая demanded requalification используют fixed `RC-01…RC-06` suite без automatic/selective impact subset. Каждый case получает explicit disposition: fresh `executed`, `inapplicable` с rationale или `not_executed_honest_stop`; non-executed case не поддерживает `enforced`. Profile покрывает или явно marks unsupported как минимум write/isolation boundary, network/tool boundary, verification execution и evidence/recovery. Maintenance ceiling — шесть case dispositions на demanded exact configuration, а не постоянная работа и не Runtime release.

Новая exact configuration создаёт new Candidate profile identity/revision/hash с `supersedes_ref`, `supersedes_sha256`, `material_change_summary` и per-binding `case_evidence_refs`. Prior definitions/evidence остаются historical comparison/provenance; fresh successor conformance claim использует fresh observations. Unsupported change затрагивает только affected binding и route `compensate | Human Gate | honest_stop`. Automatic fingerprinting, automatic impact analysis/requalification и qualification issuance не входят в Runtime. Markers: `qualification_demand_driven | fixed_rc01_rc06_full_disposition | successor_profile_fresh_evidence | host_update_no_runtime_release | automatic_requalification_deferred`.

##### Stable execution-substrate and repository adapter contract

Runtime не branches on substrate/vendor version и не интерпретирует internal HAR/worktree/container/VM/sandbox/CI states. Opaque identity/version/configuration хранится только как exact evidence и invalidation trigger. Stable properties распределяются по существующим carriers:

| Stable property | Existing responsible locus |
|---|---|
| starting baseline/configuration | Loop/Task/Run inputs and baseline fields |
| isolation plus protected/writable loci | capability binding + exact configuration |
| network/external-effect boundary | capability binding + side-effect boundary |
| resource/iteration/retry bounds | Loop/Task/Run/CAP budgets |
| launch/teardown | exact adapter action in Run |
| expected/prohibited effects | Task/Run contract |
| verification/evidence | Run evidence + conformance protocol |
| resulting exact state | Candidate/baseline identity where applicable |
| interruption/recovery | Run outcome + `RC-04` |
| durable-state reconciliation | existing §10.1 dispositions |

Repository control mapping remains `semantic boundary → required repository capability → exact concrete control/configuration → enforced | compensated | unsupported → positive/negative observation → drift/invalidation trigger`. Reference tests use only sacrificial temporary repository/workspace; no Git/CI field is universal. Marker: `substrate_version_opaque_evidence_only | stable_substrate_properties_existing_carriers | repository_control_is_adapter`.

### 8.7. Verification

Определи verification intent одновременно с Candidate Result.

Не откладывай вопрос проверки до завершения работы.

### 8.8. Admission

Укажи:

- кто принимает решение;
- какие evidence обязательны;
- какие статусы допустимы;
- какой результат может использоваться дальше;
- куда возвращается Candidate Result при недостатках.

---

## 9. Проектирование Task

Task должна использовать существующий Loop.

Рекомендуемый шаблон:

```
# TASK-NNN: Название

## Loop
## Status
## Objective
## System of Interest
## Level of Consideration
## Scope
## Inputs
## Source State
## Constraints
## Expected Candidate Result
## Completion Criteria
## Assigned Performer
## Requested Verification
## Required Admission
## Open Questions
```

Task не должна незаметно расширять определение Loop.

Если Task требует другого результата, других полномочий или другой verification, необходимо:

- изменить Loop;
- либо предложить новый Loop;
- либо явно оформить исключение.

---

## 10. Выполнение Run

Рекомендуемый шаблон:

```
# RUN-NNN

## Loop
## Task
## Status
## Start State
## Performer
## Model and Tools
## Context Used
## Source Versions
## Actions Performed
## Candidate Result
## Evidence
## Assumptions
## Limitations
## Verification Performed
## Actual Effects and Durable-State Reconciliation
## Unresolved Issues
## Stop Reason
## Replay Information
## Proposed Admission Status
```

Run должен быть достаточно воспроизводимым для понимания:

- что было выполнено;
- на каких исходных данных;
- какими инструментами;
- с какими ограничениями;
- почему получился данный результат.

Полная запись внутреннего рассуждения модели не требуется и не заменяет evidence.

### 10.1. Durable-State Reconciliation перед closure/handoff

Если Run создал material durable effect либо остаётся uncertainty о downstream relevance, перед successful consequential closure/handoff сопоставь actual effects с declared Candidate/admitted configuration. Для каждого material effect сохрани одну recoverable disposition:

```text
represented_in_result
already_represented_in_baseline
external_system_of_record
disposable_no_reliance
unresolved_deferred
```

`external_system_of_record` называет exact recoverable locus/version и не требует Git duplication. `disposable_no_reliance` не предоставляет deletion authority. `unresolved_deferred` блокирует successful consequential closure/handoff и возвращает owner/route. Persistence остаётся отдельной от Verification, Admission, release и publication.

Для read-only Run, unchanged relied baseline или явно temporary/disposable non-relied state достаточно одной строки об отсутствии material unreconciled effects; новый baseline или standalone reconciliation carrier не требуется. Admission Request и handoff показывают unresolved durable state, если оно влияет на relying use.

---

## 11. Admission Request и Admission Record

### 11.1. Admission Request / Decision Presentation

Material Admission Request использует `WPC-06 decision wrapper required` и связан с exact Candidate configuration:

```
# ADMISSION-REQUEST-NNN

## Статус и назначение
## Candidate Result и configuration
## Первое использование с опорой на результат
## Проверенные свидетельства
## Assumptions, риски и ограничения
## Рекомендация
## Варианты решения
## Разрешённые и запрещённые effects
## Допустимые outcomes
## Владелец решения
## Return и Reopen Route
```

Admission Request является Candidate decision presentation, а не уже принятым решением. Для bounded естественного запроса отдельный файл не обязателен, если весь applicable basis явно представлен и configuration recoverable.

В чате Admission Request следует Decision UI contract из `WPC-06`: понятный заголовок ситуации, Candidate и first relying use, видимые последствия и ограничения, `Рекомендация`, единый блок `Варианты решения` с применимыми действиями/последствиями и return route. Если используется adjacent `.md`, chat summary и файл ссылаются на одну exact configuration. После решения агент подтверждает распознанный outcome и условия; ambiguous reply возвращается на clarification, а не записывается как Admission.

### 11.2. Admission Record

Рекомендуемый шаблон:

```
# ADMISSION-NNN

## Loop
## Task
## Run
## Admission Request and Candidate Configuration
## Candidate Result
## First Relying Use
## Verification Reviewed
## Evidence Reviewed
## Known Limitations
## Decision
## Decision Rationale
## Decision Authority
## Allowed and Prohibited Effects
## Conditions
## Return Route
## Date
```

Admission Record фиксирует состоявшееся authority decision и не подменяет предшествующий Admission Request. Record и request возвращаются к одному Candidate/configuration; изменение record не переписывает evidence или Candidate bytes.

Допустимые решения:

```
admitted
rejected
returned_for_refinement
deferred
```

Не используй статус `готово` вместо admission decision.

---

## 12. Связи между Loops

Результат одного Loop может быть входом другого только при выполнении установленных правил admission.

Пример:

```
Requirements Extraction Loop
→ Candidate Requirements
→ Requirements Verification
→ Admission
→ Admitted Requirements
→ Architecture Loop
```

Для каждой связи фиксируй:

- передаваемый результат;
- необходимый статус;
- required baseline;
- формат;
- receiving use;
- ограничения;
- правила обработки изменений.

Если downstream slice или Loop relies on architecture, API, domain/data/state, interface, UX, authority/security, verification или transition result, передавай exact admitted configuration и assumptions. Later work должно reuse этот result или явно supersede его через impact analysis. Не связывай slices как независимые локальные стеки, если они разделяют system property, identity/state, interface или operational baseline.

Не связывай Loops только по совпадению имён файлов или каталогов.

---

## 13. Сложные системы

Для сложной системы Working Process может существовать на нескольких уровнях:

```
System Working Process
├── Subsystem A Working Process
├── Subsystem B Working Process
└── Integration Working Process
```

Loops могут относиться к:

- надсистеме;
- системе интереса;
- подсистеме;
- компоненту;
- интеграции;
- системной verification.

Явно указывай уровень рассмотрения каждого Loop.

Успешное выполнение всех subsystem Loops не доказывает выполнение общесистемных свойств.

Для общесистемных свойств могут потребоваться отдельные Loops:

- interface verification;
- integration;
- performance verification;
- safety analysis;
- security assessment;
- reliability verification;
- system acceptance.

До subsystem commitments явно определи integration responsibility, critical interfaces, system-wide properties, receiving use и system-level verification. `PEC-G05` из Reference Process можно использовать как screen. Успех component/subsystem tests не заменяет integration evidence или system acceptance.

---

## 14. Изменение Working Process

Working Process является развиваемым project-specific объектом.

Он может изменяться после:

- выполнения первого пилотного Loop;
- выявления нового receiving use;
- изменения системы интереса;
- изменения архитектуры;
- появления новой подсистемы;
- обнаружения лишнего или дублирующего Loop;
- изменения risk или consequence profile;
- изменения admission authority;
- анализа неудачного Run;
- process review.

Не изменяй процесс молча.

Для существенного изменения укажи:

- причину;
- затронутые Loops;
- последствия;
- migration route;
- authority решения.

Наблюдение из Run, pilot или failure сначала является Candidate Lesson. Process Review устанавливает applicability, mechanism, affected Loops/results, proposed change, migration impact и verification. Изменение Working Process требует process authority; lesson не переписывает Guide, Reference Process или DPF автоматически.

Полный Post-Initiative Lessons Review по умолчанию не выполняется непрерывно. После допустимого `Mission Complete!` предложи его как optional next action; только explicit user consent открывает bounded review по `templates/POST_INITIATIVE_LESSONS_REVIEW_TEMPLATE.md`. Review возвращает Candidate Patterns/Antipatterns, которые требуют отдельного Process Review Admission и отдельной authority на внедрение. При этом material failure, critical risk, authority deviation или unexpected consequential effect всегда фиксируется немедленно как Run evidence/observation с минимумом: `impact` — affected result/use/authority/scope и material consequence или exposure; `route` — следующий bounded `continue | stop | return | escalate` route с responsible owner/Gate, если applicable. Такая фиксация остаётся observation/evidence item: не становится автоматически Lesson, не запускает continuous Lessons Review, не даёт process/product authority и не откладывается до финального review.

Каждая lesson card сохраняет: `id | type | context | evidence | mechanism | consequence | guard | detection | observed outcome | countercase | applicability | confidence/evidence bound | owner/authority | recommended use/disposition | verification | reopen trigger | status`. `type` равен `pattern` или `antipattern`, начальный `status` всегда `candidate`.

---

## 15. Изменение Loop

Loop следует пересматривать, если:

- Runs регулярно завершаются возвратом;
- результат оказывается непригоден для receiving use;
- context boundary недостаточна;
- агент систематически выходит за scope;
- verification не обнаруживает существенные ошибки;
- admission authority неясна;
- Loop содержит несколько разных результатов;
- Task постоянно требует исключений;
- Loop дублирует другой процесс;
- изменились upstream или downstream contracts.

Не меняй Loop только ради адаптации к одной неудачной формулировке prompt.

Сначала установи, где находится проблема:

- в Task;
- в source material;
- в context;
- в агенте;
- в инструментах;
- в verification;
- в Loop contract;
- в Working Process.

---

## 16. Минимальный режим

Для небольшого проекта достаточно:

```
WORKING_PROCESS.md
LOOP_REGISTER.md
loops/LOOP_001_*.md
tasks/TASK_001_*.md
runs/RUN_001.md
admissions/ADMISSION_001.md
```

Допустимо объединять Task, Run и Admission в одном carrier, если:

- работа невысокого риска;
- происхождение результата остаётся понятным;
- authority не смешивается;
- admission явно зафиксирован;
- трассировка сохраняется.

Не создавай тяжёлую документную систему без практической необходимости.

Минимальный режим не отменяет non-lossy contract. Для одного reversible change можно записать, что PEC не используется, и сохранить один проверяемый result. Для script/driver допускается combined carrier с behavior/interface/state/test concerns и явным non-use UX/data/PAP. Lightweight означает меньшую форму и overhead, а не скрытые dependencies или отсутствие verification.

---

## 17. Первый пилотный Loop

Entry Route `start_bounded_pilot_loop` не разрешает Loop вне Working Process. Если применимого approved Working Process нет, сначала представь минимальную Candidate process map вместе с первым Candidate Loop и получи одно явное process authority decision. До этого Handover имеет статус `candidate_process_pending_approval`, process files не создаются и Run не начинается.

Первый Loop должен быть:

- bounded;
- практически полезным;
- основанным на доступных источниках;
- проверяемым;
- обратимым;
- с понятным receiving use;
- с доступной admission authority;
- достаточно небольшим для одного законченного цикла.

До approval первого consequential pilot Loop покажи не только navigation map, но и dispositions material concerns/results, dependencies и receiving uses. Если pilot вводит shared persistence, interface/system property или relied-on baseline, применяй соответствующий Commitment Guard до локальной реализации. Первый slice не может молча объявить свой local data/architecture result моделью всего declared product scope.

Подходящие первые Loops:

- извлечение требований;
- проверка требований;
- архитектурное исследование;
- impact analysis;
- подготовка User Stories;
- генерация тестов;
- проверка документации;
- ограниченный code review.

Не начинай пилот с полной автономной разработки всей системы.

---

## 18. Default workflow

Если иной порядок не определён:

```
изучить проект
→ определить систему интереса
→ определить необходимые результаты
→ предложить Candidate minimal Working Process и карту Loops
→ disposition material concerns/results и проверить guard triggers
→ утвердить Working Process и первый bounded Loop
→ создать только утверждённые process carriers
→ создать Task
→ выполнить Run
→ получить Candidate Result
→ выполнить Verification
→ принять Admission Decision
→ передать Relied-on Result следующему Loop
→ провести Process Review
→ уточнить Working Process и Loop
```

---

## 19. Критерий готовности Working Process

Working Process готов к началу пилота, когда:

- определена система интереса;
- применимые DPF patterns и reference components выбраны через `FC-13`;
- определены развёрнутые project-relevant инженерные результаты;
- proposed reductions отделены от coverage basis и явно рассмотрены process authority;
- указаны receiving uses;
- выделены необходимые Loops;
- определены основные зависимости;
- material concerns/results получили explicit disposition с first relying use и reopen route;
- triggered architecture/data/integration/transition commitments имеют minimum evidence или явный return;
- выбран первый bounded Loop;
- определены verification и admission;
- назначена authority;
- имеются stop и return routes;
- management и engineering views configuration-consistent, если используются обе;
- `Варианты решения` и последствия понятны пользователю;
- процесс не требует предварительного полного описания всего проекта.

---

## 20. Критерий готовности Loop

Loop готов к использованию, когда:

- его назначение однозначно;
- Candidate Result определён;
- receiving use известен;
- входы и context boundary указаны;
- authority определена;
- разрешённые и запрещённые действия зафиксированы;
- verification спроектирована;
- admission route существует;
- stop conditions существуют;
- Task можно создать без переопределения Loop;
- downstream use понимает, какой статус результата допустим.

---

## 21. Главная формула

```
Working Process — карта движения проекта.

Loop — повторяемый исполняемый модуль этой карты.

Task — конкретное поручение внутри Loop.

Run — фактическое выполнение Task.

Candidate Result — результат, ещё не допущенный к использованию.

Verification — проверка результата.

Admission — решение о допустимости использования.

Relied-on Result — принятый результат, на который может опираться следующая работа.

Агент — ограниченный исполнитель внутри Loop и Run.
```
