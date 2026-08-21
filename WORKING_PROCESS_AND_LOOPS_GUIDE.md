# Working Process and Loops Guide

> Version: `1.7.0`

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

##### Triggered «Профиль инженерных представлений»

Engineering-view profile не является обязательным Bootstrap carrier. Первое use может оставаться Loop-local; permanent/reused profile и material delta требуют explicit project/process decision и trace. Подробная selection/content/lifecycle mechanics и optional template принадлежат [`catalog/engineering_views/`](catalog/engineering_views/README.md), а не Working Process Guide.

Core invariant сохраняется: material view называет receiving use и exact authoritative source/configuration, не становится parallel truth молча и не поддерживает affected reliance при stale/conflict. Affected Human Gate показывает current view, material baseline difference и consequence; unrelated Gate переиспользует current verified view. Level of consideration, non-coverage и integration responsibility остаются явными; component/subsystem evidence не доказывает system properties.

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

Обычная выдача должна быть похожа на краткое сообщение инженера на рабочей встрече, а не на machine log. Группируй routine tool/file operations и веди читателя от смысла к проверяемым деталям в таком порядке:

1. `Статус` — всегда, когда нужен структурированный отчёт: понятная суть результата или ситуации, практическое последствие, material risk/blocker и следующий полезный шаг. Одних IDs/status codes недостаточно.
2. `Требуемое решение` — только при реальном Human Gate: exact decision, meaningful options, последствия и recommendation обычным языком. Блок не бывает пустым и не скрывается/collapse.
3. `Служебная информация` — только когда exact IDs, statuses, hashes, paths, predicates или evidence имеют receiving use. В rich UI блок может collapse, но text-only output сохраняет его после решения.

Если решения или полезных служебных деталей нет, соответствующий блок полностью опускается. Candidate status, CAP `terminated_on_deviation`, `honest_stop`, critical limitation/risk, authority/scope change, failed или inconclusive Verification, Human Gate и Admission остаются явными в `Статус`; consequential meaning нельзя помещать только в `Служебная информация`.

Структура не требует трёх headings в каждом коротком сообщении. Она задаёт стабильный порядок при наличии содержания и согласуется с `WPC-06`: material decision может содержать расширенный basis, но человек сначала понимает ситуацию и требуемое решение, а затем проверяет exact детали.

#### Stage-progress snapshot и completion taxonomy

На значимых milestones показывай компактный snapshot с пятью полями: `Завершено`, `Сейчас`, `Осталось`, `Открытые вопросы`, `Ближайший Human Gate / следующий допустимый шаг`. Частота зависит от presentation preferences, но state опирается на наблюдаемые Task/Run/Loop transitions, не на activity или confidence. Не используй проценты готовности без отдельной измеримой модели и не повторяй неизменившийся status ради видимости движения.

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
7. рекомендация агента;
8. **Требуемое решение**;
9. что решение разрешает и не разрешает;
10. следующий переход и return/reopen route.

Короткий ответ не требует десяти разделов. Структура обязательна там, где человек принимает material decision. `compact` может сокращать пояснения, но не decision basis.

Одна и та же material configuration сохраняет понятную идентичность через request, decision confirmation и handoff. При первой ссылке покажи `понятное название + exact ID` и descriptive link, если carrier существует и ссылка полезна; при последующей relying reference повтори `понятное название + exact ID`. Bare ID, filename или path допустимы в service details, но не являются достаточной основной идентификацией результата или решения.

Минимальный Required Decision contract:

```text
Требуемое решение — <класс>
Candidate и first relying use
Рекомендация
Evidence и limitations
Решение разрешает / не разрешает
Допустимые outcomes и return route
Следующий переход
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

Общий chat-first порядок чтения:

```text
<человеко-понятный заголовок ситуации>
Candidate status и exact configuration
Краткий вывод / recommendation
Что изменится и зачем это нужно сейчас
Evidence, assumptions, risks и limitations
Что разрешено / что запрещено
Требуемое решение / Required Decision
Текстовые варианты ответа или exact approval phrase
Следующий переход и return/reopen route
```

Не используй `Human Gate`, ID или цвет как единственный основной заголовок. Заголовок называет ситуацию и решение, например `Нужно утвердить Candidate-контракт перед первым Run`. Цвет, emoji и typographic emphasis могут обозначать состояние (`информация`, `внимание`, `риск`, `решение`), но весь смысл, порядок и доступные действия должны сохраняться без цвета, emoji, rich rendering или нативных кнопок.

Информационный бюджет пропорционален последствиям. Default one-scan target перед outcomes: один human-readable heading, 3–6 decision-relevant bullets, одна explicit recommendation и не более одной descriptive details link. Это usability guidance, а не truncation rule: critical evidence, authority boundary или limitation остаются видимыми даже при justified overflow. Не добавляй пустые поля или decorative density ради шаблона.

Для `DI-08` точная формула решения содержит action verb, target/configuration, side effects, recovery/reversibility и verification. Для `DI-05` risk/exposure, possible consequence, mitigation, accountable risk owner, review condition/date, reopen trigger, unaccepted residual part и bounded relying use остаются видимыми в request, confirmation и последующем relied-on context. Decision authority и risk owner могут различаться; не объединяй их молча.

После однозначного ответа Layer C явно подтверждает: outcome в plain language и exact status; exact admitted/rejected/returned/deferred configuration; newly allowed effects и what remains prohibited; conditions/limitations; decision actor и date/time when available; descriptive link to the decision record when one created; next authorized transition и return/reopen route. Не показывай success confirmation до существования решения. Не считай двусмысленное `да`, emoji reaction, молчание или ответ не к той configuration Admission либо authority grant: запроси clarification. Стабильные textual actions и exact approval phrase являются переносимым fallback; этот контракт не обещает native Codex controls, CSS, fonts, persistence или accessibility behavior host-продукта.

#### `WPC-07` — русский по умолчанию

Пользовательские заголовки, пояснения, рекомендации и decision basis пиши по-русски, если project authority не установила иной язык. English сохраняй для точных technical terms, identifiers, code, paths, statuses, model names и quotations. При первом material use кратко поясни термин по-русски, если это улучшает понимание. Не переводи source quotations или machine identifiers так, чтобы изменился смысл.

То же правило действует для создаваемых project-specific carriers: headings и explanatory prose формируются прежде всего по-русски, а English используется только там, где сохраняет exact technical meaning. Автоматический word-count или запрет English не является достаточным oracle; проверяй смысл, continuity title/ID и отсутствие decorative English.

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
5. disposition results, dependencies, first relying uses и applicable Commitment Guards;
6. представь развёрнутую Candidate map;
7. отдельно предложи reductions по `WPC-03` и recommended optimized map;
8. выдели предполагаемые Loops и связи между ними;
9. предложи первый bounded Loop;
10. представь ясный Required Decision по `WPC-05/WPC-06/WPC-07`;
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
- первый предлагаемый bounded Loop;
- verification и admission для ключевых результатов;
- открытые вопросы, assumptions и limitations;
- Required Decision, exact allowed/prohibited consequences и return route.

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

Для material Candidate Loop действует `WPC-06 decision wrapper required`: Loop carrier или adjacent presentation, связанная с его exact configuration, показывает recommendation, evidence/assumptions/risks/limitations, Required Decision, allowed/prohibited effects и return/reopen route. Эти поля не становятся обязательными headings внутри каждого lightweight Loop, если эквивалентный wrapper однозначно сохранён.

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

## Status and Purpose
## Candidate Result and Configuration
## First Relying Use
## Evidence Reviewed
## Assumptions, Risks and Limitations
## Recommendation
## Required Decision
## Allowed and Prohibited Effects
## Allowed Outcomes
## Decision Authority
## Return and Reopen Route
```

Admission Request является Candidate decision presentation, а не уже принятым решением. Для bounded естественного запроса отдельный файл не обязателен, если весь applicable basis явно представлен и configuration recoverable.

В чате Admission Request следует Decision UI contract из `WPC-06`: человеко-понятный situation heading, Candidate и first relying use, видимые последствия и ограничения, `Требуемое решение / Required Decision`, допустимые textual outcomes и return route. Если используется adjacent `.md`, chat summary и файл ссылаются на одну exact configuration. После решения агент подтверждает распознанный outcome и условия; ambiguous reply возвращается на clarification, а не записывается как Admission.

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
- Required Decision и последствия понятны пользователю;
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
