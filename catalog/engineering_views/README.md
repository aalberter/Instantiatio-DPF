# Модуль инженерных представлений

> Version: `0.3.0-candidate`

## 1. Назначение и authority boundary

Модуль помогает Runtime предложить минимальное conventional engineering representation по фактическому объекту, вопросу и будущему решению. Разработчик не обязан знать название диаграммы или нотации.

Модуль является product guidance/reference. Он не создаёт Project-specific Process, lifecycle, authority, Admission, источник product truth или разрешение на изменение файлов. Core Runtime сохраняет trigger, first relying use, Human Gate и authority mechanics; выбранное представление выполняется только внутри applicable Working Process/Task/Run.

Сами виды и их контракты находятся в [`CATALOG.md`](CATALOG.md). Опциональный профиль — в [`templates/PROJECT_VIEW_PROFILE.yaml`](templates/PROJECT_VIEW_PROFILE.yaml).

## 2. Когда предлагать представление

Trigger возникает, когда обнаружен material engineering object, конкретная аудитория/формат решения или повторное receiving use. Runtime сразу и простыми словами сообщает:

- какой инженерный вопрос полезно сделать видимым;
- какое представление предлагается;
- перед каким решением оно понадобится;
- что произойдёт, если его не подготовить.

Раннее предложение не является немедленной блокировкой. `required_by_default` становится blocking concern только перед первым consequential решением, которое должно опираться на отсутствующее представление. До этого допустима bounded подготовительная работа, не создающая такой reliance.

Если material trigger отсутствует, Runtime не проводит diagram interview, не показывает полный каталог и не создаёт profile carrier. В приветствии достаточно общей возможности; конкретный вид предлагается только по фактическому контексту.

## 3. Локальное первое применение и постоянный профиль

Первое применение по умолчанию локально для текущего Task/Loop. Temporary view без повторного receiving use не требует project profile.

Когда одно представление начинает повторно использоваться, обслуживает несколько Tasks/команд или становится стабильной основой Human Gates, Runtime один раз предлагает закрепить правила проекта. Silence, созданная диаграмма или повторное использование сами по себе профиль не создают. Постоянный `project/ENGINEERING_VIEW_PROFILE.yaml` или equivalent carrier требует explicit project/process scope decision и отдельного Admission, если он становится relied-on result.

Loop может создать bounded local delta к admitted profile, но не изменяет его молча. Material reused delta получает trace, applicable decision и reopen route.

## 4. Выбор и понятная сила рекомендации

1. Назови Engineered System level, engineering object, receiving use, аудиторию и решение.
2. Сопоставь context triggers записей `EV-*`; не начинай с checklist диаграмм.
3. Исключи counter-signals и вопросы, уже закрытые adequate current admitted representation.
4. Предложи smallest useful set и объясни пользу/последствия обычным языком.
5. Задай один adaptive question только при material ambiguity source, use, cost, format, accessibility, confidentiality или competing views.
6. Зафиксируй selection/reduction/delta в applicable result/profile carrier.

Служебные уровни переводятся в инженерную речь:

| Уровень | Что сказать человеку | Reduction |
|---|---|---|
| `required_by_default` | «Это нужно до конкретного relying decision, иначе остаётся существенный разрыв». | explicit reason, alternative evidence/accepted limitation и reopen trigger |
| `recommended` | «Это полезно и соразмерно, но текущую работу отсутствие не блокирует». | material omission фиксируется с причиной |
| `situational` | Не предлагать без конкретного trigger. | не создавать ради полноты |

Код уровня остаётся служебной информацией и не заменяет понятное объяснение.

### 4.1. Minimal effective representation

Выбирай форму по decision question и material relations, а не по доступности renderer или желанию сделать результат визуальнее:

- concise text — для линейного смысла, небольшого набора claims и последовательного explanation;
- table — для exact repeated fields, mappings, comparisons, ownership, coverage или alternatives;
- diagram — когда topology, hierarchy, interaction, sequence или state relations с тремя и более зависимыми элементами существенно труднее понять линейно.

Используй smallest sufficient form или небольшой набор форм. Диаграмма не обязательна, если текст/таблица дают человеку достаточную основу решения; таблица не нужна для single fact. Любая rich representation сохраняет text-complete fallback, material limitations/non-coverage и сведения, способные изменить решение. Marker: `minimal_effective_representation_by_decision_need`.

Для Mermaid `LR` допустим только для короткого linear flow, читаемого без уменьшения. Если branching, длинные labels или число узлов создают excessive width, используй `TB`/`TD`. Если vertical layout всё ещё смешивает independent concerns/system levels либо остаётся перегруженным, раздели схему по decision question/level и сохрани связи в тексте. Не уменьшай крупную схему до плохо читаемого масштаба. Marker: `large_mermaid_vertical_or_split`.

## 5. Minimum contract material view

Каждое представление, на которое предполагается опираться, называет:

- engineering object, `level_of_consideration` и явную boundary;
- purpose/question, receiving use, аудиторию и предстоящее решение;
- authoritative source/model и exact source configuration;
- текущую freshness/verification state и change rule;
- material baseline difference для affected Gate;
- concise semantic summary;
- text/table fallback rule;
- confidentiality и допустимость external/reduced projection;
- verification/evidence;
- `non_coverage`: чего представление не доказывает;
- reduction/delta, limitations и reopen trigger.

Graphical layout, цвет или renderer не являются инженерным смыслом. У каждого material view всегда есть краткое semantic summary. Полная text/table projection создаётся, когда rich format недоступен или решение требует точных объектов, связей, ключей, переходов, interfaces или invariants.

## 6. Source, truth и freshness

View по умолчанию является проверяемой проекцией названного basis, а не параллельным source of truth. Он может стать authoritative model только по explicit project decision, определяющему scope, synchronization и conflict obligations.

Когда source configuration меняется, Runtime сначала:

1. локализует затронутые views и claims;
2. определяет material difference и возможную безопасную regeneration/reverification;
3. прекращает reliance только на affected claims;
4. предлагает bounded correction внутри существующей authority, если source однозначен;
5. поднимает Human Gate лишь при неоднозначной основе, authority change или существенных последствиях.

Conflicting views не сливаются и не выбираются молча. Статус сначала объясняет человеку расхождение и последствие, затем при необходимости показывает exact sources/configurations в service detail.

## 7. Engineering Review View и baseline difference

Affected Human Gate показывает current applicable view, material difference от admitted/review baseline и последствия для решения. Full new picture без понятного delta недостаточна. Unrelated Gate ссылается на последнее verified view без regeneration или повторного согласования.

Перед первым material relying decision Runtime автоматически разрешает current applicable Engineering Review Views и фактически предъявляет их smallest sufficient semantic Gate Projection в том же Gate до `Рекомендация`/`Варианты решения`. Useful source link сохраняет direct access к exact carrier, но safe/bare link, filename, hash, technical ID, `tests passed` или carrier-existence assertion являются supplementary detail и не заменяют presentation. Gate сохраняет exact Candidate/result configuration, View identity/configuration, authoritative source/carrier configuration, verification/freshness, first baseline или material local delta, limitation/non-coverage, consequence и stable local element refs внутри exact View configuration. Refs могут быть понятными local identifiers вроде `A-01`, `D-03` или `API-04`; они не создают новый catalogue entry, authority или source of truth. Marker: `links_supplementary_not_presentation`.

Presentation является sufficient только если reasonable reviewer может ответить на material review questions из semantics, фактически предъявленных в Gate или observably presented authorized secure surface, с source links для details. Existing diagram/table/native source можно использовать, когда он действительно displayed либо affected semantics представлены в text/table form. Text-complete fallback обязателен независимо от renderer/CSS/vendor UI. Restricted source не копируется без authority: если safe sufficient presentation невозможна, блокируется только affected decision; bare secure link сам по себе недостаточен. Trigger не создаёт автоматически новый View carrier, SVG/PNG/PDF/DOCX, profile или full-catalogue review. Markers: `engineering_gate_projection_presented_before_options | engineering_view_text_complete_gate_projection`.

После фактического предъявления core Runtime, а не catalogue module, генерирует exact-configuration review-checklist с unset human fields и связывает его с existing Human Response/Decision/Admission contract. Catalogue отвечает за View selection/content/source/currentness/delta/privacy, но не владеет checklist dispositions, completion, outcome или authority. Checklist completion не является correctness, Verification или automatic Admission. Markers: `runtime_review_checklist_human_empty | checklist_completion_not_admission`.

Addressed feedback lifecycle:

1. Human Response связывает exact Candidate ref, View ref/configuration и supplied element ref;
2. feedback не мутирует source/View truth и не создаёт Admission;
3. question, change request, condition или observation возвращается к smallest responsible authoritative source;
4. после authorized Candidate/source change affected View регенерируется и повторно проверяется;
5. следующий Gate сначала показывает material local delta и downstream effects;
6. unaffected elements переиспользуются, пока impact не оправдывает full review.

Missing/stale/conflicting `required_by_default` View блокирует только affected relying decision и возвращается к preparation/Verification. Если exact Candidate уже представлен, применим существующий `returned_for_refinement`; отдельный partial-Admission status не создаётся. Unrelated authorized reversible preparation может продолжаться. Trivial/reversible work и Gate без material engineering object не создают View ceremony. Markers: `engineering_review_view_same_gate | stable_view_element_refs | addressed_element_feedback_returns_to_source | regenerated_view_delta_leads | missing_view_blocks_affected_reliance_only`.

Каждое relied-on representation явно сохраняет level/boundary и non-coverage. Component/subsystem success не доказывает integration или system-level properties; system owner и integration responsibility остаются видимыми.

## 8. Database / ER composition

Material database или logical persisted data model вызывает `EV-05` как `required_by_default`. Подача составная:

1. логическая картина — основные entities, meaning, relations/cardinalities и business invariants;
2. необходимые physical details затронутой области — tables/columns/types, primary/foreign/candidate keys, constraints, indexes и migrations по receiving use;
3. отдельное текстовое объяснение source, change, limitation и unresolved scope.

Logical domain, physical operational schema и analytics/reporting model не объединяются молча. Если их несколько, показаны layer identity, mappings и gaps. Slice-local ER не объявляется full product data/state/invariant readiness.

## 9. Confidentiality и external projection

View наследует ограничения доступа и передачи от своих sources. Runtime не переносит secret values, tokens, passwords или реальные personal data в representation без отдельной необходимости/authority.

External, public или reduced projection создаётся явно для названной аудитории. Она фиксирует скрытые категории и non-coverage; факт доступности source агенту или возможность renderer не разрешают external transmission/publication. Text fallback имеет те же confidentiality constraints, что и graphic view.

Новый внешний rendering/service tool используется только при допустимости передачи данных. Host/system/privacy, law, contract и admitted domain authority имеют приоритет.

## 10. Форматы и внешние навыки

Приоритет выбора формы:

1. существующий пригодный формат проекта;
2. editable/versionable semantic source;
3. recoverable text/table projection;
4. image или interactive view как дополнительная форма.

Ни Mermaid, ни PlantUML, ни vendor tool не обязательны для всех проектов. Новый tool рекомендуется только при доказанной пользе и допустимой compatibility/privacy cost.

External skill может построить, преобразовать или проверить форму view внутри exact Task/Run. Он не выбирает lifecycle, authority, source-of-truth status, freshness, Human Gate или Admission и не публикует output автоматически. Process-bearing semantics возвращаются к действующему S-02 compatibility gate.

## 11. Расширение и жизненный цикл

Развитие проходит три уровня:

1. one-off Task/Run view — каталог не меняется;
2. project/domain extension — namespaced ID, source/authority, applicability, schema compatibility, verification и local lifecycle;
3. common Runtime entry — только после повторяемой cross-project пользы, distinct engineering question, bounded triggers/counter-signals, source/freshness/text/non-coverage contract и отдельного product Admission.

Количество entries не является completeness evidence. Renamed/retired relied-on entry сохраняет alias или migration route; obsolete entry не удаляется молча. Reopen catalogue design при repeated missing-view requests, stale incidents, bloated/unused entries, accessibility failure, tool lock-in или measurable ceremony.

DFD и business-process views являются возможными future candidates, но не входят в текущие `EV-01`–`EV-09` без отдельного evidence/decision.

## 12. Verification и return

До reliance проверь source/configuration, freshness, minimum content, semantic summary/fallback, confidentiality, baseline difference и non-coverage. Missing/stale/conflicting material field является verification failure для affected claim и возвращает работу к smallest responsible source/view/result.

Passing view checks не является product/release Admission. Catalogue/profile change остаётся Candidate до applicable decision.
