# Instantiatio DPF 3.3.0 — Engineering Work Runtime · Beta

> Runtime version: `3.3.0` — publication status `released`; product maturity `Beta`; predecessor released Runtime baseline is `3.2.0`

Версии, publication status, authoritative loci и SHA-256 компонентов определены в [PACKAGE_MANIFEST.md](PACKAGE_MANIFEST.md).

Состав изменений, совместимость, ограничения и recovery route описаны в [Release Notes 3.3.0](docs/releases/RELEASE_NOTES_3_3_0.md). Publication status указан выше и в manifest, но сам по себе не создаёт Release Admission; ZIP, Git tag, upload и внешняя публикация не выполняются и не заявляются.

## 1. Что это

Этот репозиторий содержит `Instantiatio DPF — Engineering Work Runtime`: среду управляемой инженерной работы человека и агента. Она помогает оформить задачу, выбрать project-specific процесс, выполнить ограниченную работу, проверить результат и получить явное человеческое решение. Runtime поставляется как связанная система operational documents, templates, checks и agent interaction; это не отдельный daemon, hosted service или автономный источник authority.

Пакет связывает нормативную основу, операционную инстанциацию и фактическую проектную работу:

```text
DPF
→ normative engineering framework

Instantiatio DPF
→ operational Engineering Work Runtime
→ включает защищённую AI SDLC DPF edition как domain-specific DPF payload

Engineering Work Bootstrap
→ вход человека и агента в новую инженерную работу

Working Process and Loops
→ создание и развитие project-specific процесса

Project-specific artifacts
→ фактическая работа, решения, код, проверки и evidence
```

Пакет можно использовать:

- для разработки программных и сложных инженерных систем;
- для отдельной разработки требований;
- для архитектурной работы;
- для исследования систем, методов и предметных областей;
- для подготовки технической документации;
- для impact analysis;
- для bounded pilot;
- для новой инициативы внутри уже действующего проекта.

Это не готовый универсальный workflow и не автоматическая власть агента. Runtime помогает построить подходящий рабочий контур под конкретную инициативу.

### 1.1. Public identity, license и provenance

- Short name: **Instantiatio DPF**.
- Current full name: **Instantiatio DPF — Engineering Work Runtime**.
- Historical admitted baseline: **Instantiatio DPF — Engineering Work Kit 3.1.0**.
- Canonical repository: [github.com/aalberter/Instantiatio-DPF](https://github.com/aalberter/Instantiatio-DPF).
- Copyright: `Copyright (c) 2026 Instantiatio DPF contributors`.
- License: [MIT License](LICENSE).
- Conceptual foundation: [First Principles Framework — FPF](https://github.com/ailev/FPF).

The historical 3.1.0 release is an independent engineering Work Kit and evolution layer; Runtime is its successor public identity. Instantiatio DPF is not an official FPF distribution; no affiliation with or endorsement by the FPF authors or repository owners is claimed. No files from the external FPF repository are included or relicensed by this distribution.

The release-level identity `Instantiatio DPF` does not rename or generalize the controlled `AI_SDLC_DPF/**` payload, which retains its historical and domain identity.

---

## 2. Основная идея

Пользователь не обязан заранее знать структуру процесса, имена Loops или терминологию DPF.

Он может начать с естественного сообщения:

```text
Привет.
У меня есть идея.
Нужно разработать требования.
Есть набор документов.
Хотим пересмотреть архитектуру.
Начнём новую инициативу.
```

Агент должен определить состояние репозитория и провести работу по следующему маршруту:

```text
Engineering Initiative
→ Bootstrap
→ Candidate Work Context
→ Review
→ Admission Decision
→ Admitted Work Context
→ Entry Decision
→ Working Process
→ Loop
→ Task
→ Run
→ Candidate Result
→ Verification
→ Admission
→ Relied-on Result
```

Ключевой принцип:

> Агент организует вход и выполнение работы, но не присваивает себе authority.

### 2.1. Первый вход и настройки взаимодействия

Первое сообщение укладывается в две короткие строки:

```text
Instantiatio DPF — Engineering Work Runtime
Среда управляемой инженерной работы человека и агента: от исходной идеи и материалов до проверенного результата и явного решения.
```

Если более приоритетная настройка отсутствует, Runtime сразу применяет `compact + milestone`: короткие сообщения на ключевых этапах. Для заранее точно ограниченной работы он может предложить **объединённый пакет полномочий** (`Consolidated Authority Package`, CAP) — одно решение на exact действия, проверки, budgets и условия остановки. CAP не включается автоматически.

Можно продолжить с рекомендуемым стартом или выбрать один из пяти intent-сценариев:

1. **Опытный пользователь — рекомендуемый старт.** `compact + milestone`; CAP только после отдельного точного согласования.
2. **Я здесь впервые.** `guided + detailed`; больше сопровождения без длинной анкеты до начала.
3. **Небольшой проект.** `standard + milestone`; лёгкий маршрут выбирается после понимания задачи и не отменяет необходимые проверки и решения.
4. **Форсаж.** Отдельный bounded prototype profile со своим согласованием; это не режим общения и не authority.
5. **Изучить или отладить Runtime.** `standard + detailed`; больше технических деталей, ссылок на правила и recovery checks.

Host может показать эти варианты как cards, но numbered text является полным переносимым fallback. Оба слоя сохраняют одинаковые названия, смысл, настройки, persistence actions и authority boundaries; Runtime не обещает native controls, CSS или host capabilities, которых нет.

Выбор необязателен и не задерживает Bootstrap. Он рекомендует presentation/entry behavior, но не admits Work Context, не выбирает Working Process, не активирует «Форсаж» или CAP и не разрешает consequential work. После краткого summary Runtime задаёт ровно один содержательный вопрос:

> С чего начнём: с идеи, проблемы, имеющихся материалов или конкретной задачи?

Начать можно любым удобным способом:

- положить документы, схемы или заметки в `project/source/` и попросить изучить их;
- описать идею или проблему прямо в диалоге;
- показать существующий проект и попросить оценить состояние;
- дать конкретную инженерную задачу — Runtime сначала проверит применимый контекст и границы.

Материалы не обязаны быть идеально оформлены. Можно начать с черновиков, списка мыслей или короткого описания — структуру работы соберём вместе.

Runtime сохраняет две независимые presentation-настройки:

- **Interaction Mode**: `guided`, `standard` или `compact`;
- **Explanation Mode**: `detailed` или `milestone`.

Все шесть комбинаций остаются доступными как secondary controls:

| Interaction Mode | Explanation Mode | Ожидаемая форма |
|---|---|---|
| `guided` | `detailed` | Сопровождение и пояснение всех групп значимых действий. |
| `guided` | `milestone` | Сопровождение на переходах, решениях и gates. |
| `standard` | `detailed` | Нейтральный стиль с подробными пояснениями действий. |
| `standard` | `milestone` | Обычная работа с пояснением ключевых событий. |
| `compact` | `detailed` | Короткие комментарии ко всем группам значимых действий. |
| `compact` | `milestone` | Минимальное сопровождение на обязательных точках; product default. |

```yaml
interaction_mode: compact
explanation_mode: milestone
```

Молчание применяет default, но не создаёт preference carrier. Сохранение требует явной project-scoped команды, например «Использовать для всего проекта»; тогда используется optional `project/INTERACTION_PREFERENCES.yaml`. «Только в этой сессии» и естественная команда без scope создают session override и не меняют project preference. Existing schema-version-1 carrier и initiative override сохраняют прежний смысл; «Форсаж» никогда не записывается как presentation mode.

Приоритет: host/system constraints → обязательные safety/authority messages → explicit command → session override → initiative override → project preference → `compact + milestone`.

Обычная выдача говорит как инженер на встрече, а не как machine log:

1. `Статус` — понятная суть, результат, последствие, риск или blocker.
2. `Требуемое решение` — только когда действительно нужен human decision; exact варианты и последствия не скрываются.
3. `Служебная информация` — полезные IDs, hashes, paths, predicates и evidence для проверки.

Пустые второй и третий блоки опускаются. Candidate status, CAP termination, `honest_stop`, критические ограничения, authority/scope changes, failed Verification, Human Gates и Admission всегда остаются видимыми в `Статус`, даже в `compact` или rich UI с collapsible service detail. `detailed` не раскрывает chain of thought и группирует однотипные действия.

Material carrier/result впервые называется понятным названием вместе с exact ID и useful link; в Gate, decision confirmation и handoff то же название повторяется вместе с ID. Bare ID, filename и path остаются служебными деталями. При русском project language создаваемые carriers используют русские headings и explanatory prose; English сохраняется для exact technical meaning, а не как декоративный default.

«Форсаж» остаётся bounded rapid-prototyping execution profile с admitted context, first working result, budget, stop condition, reversible choices, Human Gate triggers, assumptions, prototype limitations, verification и маршрутом `discard | promote_to_engineering`. Он не превращает prototype в production/release result.

### 2.2. Выбор конфигурации моделей

При старте новой инициативы агент может один раз необязательно предложить помощь в выборе максимальной, оптимальной или бюджетной конфигурации моделей. Offer не заменяет первый содержательный Bootstrap-вопрос и не блокирует discovery при отказе, молчании или host limitation.

После достаточного понимания scope, риска, privacy, бюджета и host capabilities пользователь сначала получает категорию `максимальная`, `оптимальная` или `бюджетная`, краткий rationale, главный trade-off и escalation trigger. Exact models, роли, effort и pricing показываются по запросу либо когда требуются для material Working Process/Loop decision. Тогда Candidate Model Assignment фиксирует primary, implementation, review и escalation roles, effort/Thinking mode, availability, privacy boundary, independence, fallback и verification.

Практические датированные рекомендации находятся в [`MODEL_SELECTION_RECOMMENDATIONS.md`](MODEL_SELECTION_RECOMMENDATIONS.md). Model Assignment не является presentation preference, не создаёт authority и не отменяет Verification, Human Gates, Admission или honest stop.

### 2.3. Прогресс и завершение

На значимых milestones агент показывает пять полей: `Завершено`, `Сейчас`, `Осталось`, `Открытые вопросы`, `Ближайший Human Gate / следующий допустимый шаг`. Непроверяемый процент готовности не используется. Завершение Task, Run, Loop, Admission baseline и всей initiative различаются; `Mission Complete!` допустимо только после admitted intended outcome и завершения либо explicit disposition всего required scope.

### 2.4. Lessons и optional state projection

После `Mission Complete!` агент может предложить отдельный Post-Initiative Lessons Review. Он начинается только с explicit consent, использует [`templates/POST_INITIATIVE_LESSONS_REVIEW_TEMPLATE.md`](templates/POST_INITIATIVE_LESSONS_REVIEW_TEMPLATE.md) и возвращает Candidate Patterns/Antipatterns для отдельного Process Review Admission. Material failure, critical risk или authority deviation при этом фиксируются сразу как evidence, а не откладываются.

[`templates/STATE_INDEX_TEMPLATE.yaml`](templates/STATE_INDEX_TEMPLATE.yaml) задаёт optional machine-readable projection текущего state. Такой index не предоставляет authority и не заменяет exact Work Context/Process/Task/Run/Admission carriers. Missing, stale, invalid или contradictory projection игнорируется для authority; recovery возвращается к exact carrier refs/hashes и одной согласованной human-readable view.

### 2.5. Полное покрытие до оптимизации процесса

Для нового Working Process агент сначала применяет `FC-13` и выбирает применимые DPF patterns. Затем он разворачивает полную для данного проекта карту результатов, зависимостей, проверок и точек допуска. Optional Product Engineering Composition может использоваться как reference screen, но не становится обязательным lifecycle.

Только после этого агент отдельно показывает рекомендуемые объединения, сокращения и неприменимые результаты, объясняет принимаемые риски и предлагает оптимизированный процесс. Пользователь получает два согласованных представления одной configuration: инженерную карту с trace и краткое управленческое представление с явно подписанным блоком `Требуемое решение / Required Decision`.

Этот порядок не означает одинаково тяжёлый процесс для всех задач. Direct Work, небольшой script или driver сохраняют лёгкий маршрут, если applicability и material non-use показаны явно, а проверка и возврат остаются достаточными для последствий ошибки.

### 2.6. Объединённый пакет полномочий и внешние методы

Для заранее ограниченной работы Runtime может предложить **объединённый пакет полномочий** (`Consolidated Authority Package`, CAP). В нём одним решением утверждается exact набор входов, действий, файлов или иных effects, фаз, проверок, budgets и stop conditions. Всё за пределами package остаётся неразрешённым, а итоговый результат всё равно требует отдельного Admission.

CAP optional. Если границы нельзя точно сформулировать и проверять, работа идёт обычным пошаговым маршрутом. Успешное завершение CAP не admits result и не запускает следующий Loop автоматически.

Если input, configuration, scope, authority, predicate или budget отклонились от утверждённых условий, affected CAP прекращается как `terminated_on_deviation`, а не ставится на паузу. Runtime сообщает отклонение, последнюю завершённую фазу и уже произведённые effects/evidence, после чего wider work возвращается к обычным пошаговым решениям. Тот же CAP нельзя возобновить. Когда причина понятна и новые exact границы определены, Runtime один раз предлагает подготовить successor Candidate CAP или продолжить пошагово; он ничего не создаёт и не активирует автоматически.

Внешние skills, plugins и методы также не становятся отдельным project process. Очевидная локальная capability используется внутри текущих Task/Run без лишнего сканирования всех доступных skills. Если метод приносит собственные plans, states, lifecycle, authority или verification semantics, Runtime явно map полезные части обратно в действующий процесс и сохраняет их output как Candidate. Несовместимый для текущей работы метод не используется; предлагается compatible fallback или его отключение для Task/session. Host constraints, applicable law, contracts и admitted domain authority сохраняют свой приоритет.

Полная mechanics находится в [`WORKING_PROCESS_AND_LOOPS_GUIDE.md`](WORKING_PROCESS_AND_LOOPS_GUIDE.md), reusable Candidate carrier — в [`templates/CONSOLIDATED_AUTHORITY_PACKAGE_TEMPLATE.md`](templates/CONSOLIDATED_AUTHORITY_PACKAGE_TEMPLATE.md).

### 2.6.1. Runtime conformance и durable-state reconciliation

Semantic prohibition не представляется автоматически как технически enforced. Только когда consequential Run действительно полагается на material deterministic boundary, Runtime связывает exact approved semantic source с required capability и actual host/tool/configuration, различает `declared | enforced | compensated | unsupported` и выбирает enforcement, compensating control, Human Gate либо `honest_stop`. Claim `enforced` требует concrete conformance evidence для exact configuration; capability/profile не создаёт authority. Simple reversible work без такого claim остаётся на direct route.

Перед consequential closure/handoff material durable effects сопоставляются с declared Candidate/admitted configuration: effect представлен в result, уже принадлежит exact baseline, связан с external system of record, явно disposable без downstream reliance либо возвращён как unresolved/deferred. Git не обязателен; read-only и clearly disposable work не получает baseline ceremony; persistence не означает Verification или Admission.

### 2.7. Инженерные представления по контексту

Runtime не просит заранее перечислять диаграммы и не показывает полный каталог в приветствии. При material engineering object он заранее и простыми словами предлагает подходящее представление из [`catalog/engineering_views/`](catalog/engineering_views/README.md), но требует его только перед первым решением, которое должно на него опираться. Первое use локально; постоянный профиль предлагается один раз при повторном/cross-team use и создаётся только по explicit project/process decision.

Для material database это составная ER-подача: понятная logical model, необходимые physical details и отдельное source/change/limitation explanation. View остаётся проверяемой проекцией названного source; affected Gate ведёт с baseline difference и consequences, stale/conflict сначала диагностируется. У material view есть concise semantic summary, а full text/table projection создаётся при недоступном формате или точной decision need. Level/non-coverage и confidentiality/external-projection boundary остаются явными.

### 2.8. Варианты организации инженерной работы

Когда проекту недостаточно просто bounded Task, Runtime может предложить подходящую общую форму и инженерные методы из [`catalog/working_process_compositions/`](catalog/working_process_compositions/README.md). Например, для сложной software–equipment системы полезны V-диаграмма и работа по спецификации; для насыщенного предметного продукта могут сочетаться DDD, варианты использования и пользовательские истории — у каждого метода своя задача и явные границы.

Сначала всё равно определяются context, `FC-13` и полная project-relevant карта concerns/results. Малое обратимое изменение проходит без каталожной церемонии. Обычно Runtime рекомендует не более одной контекстной композиции и одного–трёх методов, объясняет пользу, ограничения, альтернативы и непокрытые вопросы. Если выбор непонятен, до утверждения можно запросить подробное сравнение, пример и ожидаемые результаты/усилия.

Выбор карточки не запускает готовый процесс. Он лишь помогает собрать exact Candidate Working Process, который отдельно утверждает process authority. Existing admitted process не меняется автоматически; external skill не может импортировать параллельный lifecycle или authority. Use Cases не скрывают непокрытые operational scenarios, User Stories не заменяют system/architecture/data concerns, DDD не превращает Bounded Context в обязательный microservice, а V-диаграмма не объявляется универсальным Waterfall.

Root [`catalog/`](catalog/README.md) содержит выбираемые product modules и не получает authority. S-01/S-02 остаются core Runtime. Названия каталогов, файлов и stable IDs — английские; основное объяснение разработчику и названия вариантов — обычный русский текст, exact технические детали доступны в `Служебной информации`.

---

## 3. Происхождение и справочные материалы

AI SDLC DPF сформирован на основе **First Principles Framework — FPF** как отдельный Domain Principles Framework для проектирования, адаптации и совершенствования агентных процессов разработки программных систем. FPF является governing conceptual basis; модель или инструмент, использованные при подготовке, не создают authority.

История формирования, границы distributed kit и внешнего provenance corpus описаны в [DPF Formation Reference](docs/DPF_FORMATION_REFERENCE.md). Общая технология создания нового DPF из FPF находится в [DPF Formation Method](docs/DPF_FORMATION_METHOD.md).

---

## 4. Authority и уровни

Используется следующая иерархия:

```text
FPF
→ AI SDLC DPF
→ Reference Architecture
→ Reference Process
→ Application Guide
→ Organization LPF
→ Project-specific Process
→ Performed Work
```

Primary Application Profile является bounded specialization profile, а не отдельным уровнем authority.

Дополнительные исполнительские Guides:

```text
ENGINEERING_WORK_BOOTSTRAP_GUIDE.md
WORKING_PROCESS_AND_LOOPS_GUIDE.md
```

не изменяют DPF. Они определяют, как использовать его в фактической работе.

### 4.1. Роли основных компонентов

| Компонент              | Назначение                                                               | Чего он не делает                                                            |
| ---------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------------- |
| FPF                    | Общие первые принципы и методы различения                                | Не определяет конкретный AI SDLC                                             |
| AI SDLC DPF            | Доменные принципы и паттерны                                             | Не задаёт один обязательный workflow                                         |
| Reference Architecture | Reference-модель сущностей, состояний и связей                           | Не является архитектурой конкретного проекта                                 |
| Reference Process      | Компонуемые process fragments и optional Product Engineering Composition | Не является обязательным lifecycle, artifact catalogue или project authority |
| PAP                    | Усиления для bounded-класса сложных систем                               | Не заявляет автоматическую применимость                                      |
| Application Guide      | Примеры и практические пояснения                                         | Не создаёт authority                                                         |
| Bootstrap Guide        | Вход в новую инженерную инициативу                                       | Не заменяет Working Process                                                  |
| Working Process Guide  | Исполнительская механика Loops, Tasks и Runs                             | Не является процессом конкретного проекта                                    |
| Work Context           | Согласованный контекст инициативы                                        | Не является ТЗ или архитектурой                                              |
| Working Process        | Карта работы конкретного проекта                                         | Не доказывает, что работа выполнена                                          |
| Run                    | Фактическое выполнение Task                                              | Не создаёт admission автоматически                                           |

### 4.2. System terminology

- **Engineered System of Interest** — продукт, программная система или подсистема, над которой ведётся работа;
- **Agentic Process EoC** — Working Process, Loop или другая bounded process entity, к которой применяются DPF-patterns;
- **Project-specific Process** — термин authority hierarchy;
- **Working Process** — его операционная project-specific реализация и carrier.

---

## 5. Границы применимости

### 5.1. Для чего предназначен DPF

DPF предназначен для проектирования процессов, в которых:

- люди и ИИ-агенты совместно выполняют software или systems engineering work;
- агентная работа должна быть bounded;
- требуется различать candidate и admitted results;
- важны provenance, currentness и traceability;
- изменения источников и baselines должны иметь управляемый impact;
- human authority должна быть отделена от agent capability;
- verification проектируется вместе с результатом;
- процесс должен допускать возвраты, honest stop и improvement loops.

### 5.2. Основной Entity of Concern

Основной объект DPF:

> агентный процесс разработки программной системы в определённом проектном контексте.

DPF помогает проектировать:

- роли;
- состояния;
- переходы;
- границы полномочий;
- source-to-claim routes;
- agent loops;
- admission;
- verification;
- traceability;
- change propagation;
- proportional tailoring.

### 5.3. Что DPF не доказывает

Использование пакета само по себе не доказывает:

- эффективность паттерна в каждом проекте;
- соответствие законодательству или стандарту;
- применимость к конкретной юрисдикции;
- безопасность продукта;
- product assurance;
- качество фактически выполненной работы;
- правильность каждого решения агента;
- пригодность внешнего lifecycle extension для конкретного проекта.

Qualified human review и field validation остаются отдельными обязательствами.

### 5.4. Что не входит в нормативный DPF

DPF не должен содержать:

- названия конкретных LLM;
- выбор agent framework;
- repository paths конкретной организации;
- локальные роли и фамилии;
- организационные approval thresholds;
- обязательный набор project artifacts;
- конкретную архитектуру продукта;
- фактические Tasks и Runs;
- выполненные изменения кода;
- один универсальный V-цикл;
- Core-11 как обязательный набор для любого проекта.

Это относится к:

- Reference Architecture;
- Reference Process;
- PAP;
- Organization LPF;
- project-specific process;
- performed work.

### 5.5. Ограничения текущего рабочего релиза

Текущий DPF является **working release**, а не завершённым универсальным стандартом.

Его следует переоткрывать при:

- существенном изменении FPF;
- source-currentness trigger;
- повторяющемся field counterexample;
- невозможности сохранить один Primary Entity of Concern;
- утечке authority между уровнями;
- новых evidence, меняющих disposition паттерна;
- нарушении traceability или release integrity.

При этом обновлять DPF вслед за каждым изменением FPF не обязательно.

Практичная стратегия:

```text
использовать текущий DPF как baseline
→ развивать Guides, Working Processes и Loops
→ накапливать опыт применения
→ при существенной необходимости
   повторить полный цикл формирования DPF
   из актуального FPF
```

---

## 6. Структура пакета

### 6.1. Операционный пакет

Ниже объединены фактический distributed scaffold и project-specific carriers, которые создаются только после соответствующих decisions. В исходном пакете `project/` содержит только `.gitkeep`; отсутствие показанных ниже Work Context и process files является ожидаемым состоянием неинициированного проекта.

```text
/
├── .gitattributes
├── README.md
├── PACKAGE_MANIFEST.md
├── AGENTS.md
├── ENGINEERING_WORK_BOOTSTRAP_GUIDE.md
├── WORKING_PROCESS_AND_LOOPS_GUIDE.md
├── catalog/
│   ├── README.md
│   ├── engineering_views/
│   │   ├── README.md
│   │   ├── CATALOG.md
│   │   └── templates/
│   │       └── PROJECT_VIEW_PROFILE.yaml
│   └── working_process_compositions/
│       ├── README.md
│       ├── CATALOG.md
│       └── templates/
│           └── WORKING_PROCESS_COMPOSITION_RECORD.yaml
├── docs/
│   ├── DPF_FORMATION_METHOD.md
│   ├── DPF_FORMATION_REFERENCE.md
│   └── KIT_EVOLUTION_ROADMAP.md
├── scripts/
│   └── check_integrity.ps1
├── tests/
│   └── behavioral/
│       └── BOOTSTRAP_SCENARIOS.md
├── AI_SDLC_DPF/
│   ├── README.md
│   ├── QUICKSTART.md
│   ├── AI_SDLC_DPF_COMPLETE.md
│   ├── framework/
│   │   ├── AI_SDLC_DPF.md
│   │   ├── AI_SDLC_REFERENCE_ARCHITECTURE.md
│   │   ├── AI_SDLC_REFERENCE_PROCESS.md
│   │   ├── AI_SDLC_PRIMARY_APPLICATION_PROFILE.md
│   │   └── AI_SDLC_APPLICATION_GUIDE.md
│   ├── reference/
│   │   ├── AI_SDLC_GLOSSARY.md
│   │   ├── AI_SDLC_SOURCES.md
│   │   ├── AI_SDLC_TRACEABILITY.md
│   │   ├── AI_SDLC_GOVERNANCE.md
│   │   └── AI_SDLC_OPEN_QUESTIONS.md
│   ├── examples/
│   │   └── AI_SDLC_WORKED_EXAMPLES.md
└── project/
    ├── source/
    ├── artifacts/
    │   ├── WORK_CONTEXT.md
    │   ├── ENTRY_DECISION.md
    │   ├── WORK_CONTEXT_REGISTER.md
    │   └── work_contexts/
    ├── process/
    │   ├── WORKING_PROCESS.md
    │   ├── LOOP_REGISTER.md
    │   ├── loops/
    │   ├── tasks/
    │   ├── runs/
    │   └── admissions/
    ├── src/
    └── tests/
```

Не требуется создавать все папки и файлы заранее.

`PACKAGE_MANIFEST.md` определяет exact distributed inventory. Unlisted live `project/**` carriers являются рабочим состоянием пользователя, а не автоматически частью package distribution; они сохраняются и проверяются как project content, но не добавляются в manifest ради прохождения integrity check.

### 6.2. Контролируемый DPF-релиз

Каталог `AI_SDLC_DPF/` является controlled read-only release внутри Runtime. Distributed Runtime содержит нормативный DPF и bounded reference/profile/informative carriers, перечисленные в фактическом дереве выше.

Provenance-heavy development corpus и governing FPF не заявляются как физически включённые в текущий distributed kit. Их границы и назначение описаны в [DPF Formation Reference](docs/DPF_FORMATION_REFERENCE.md).

---

## 7. Основные документы

### [`README.md`](README.md)

Общая карта пакета и варианты начала работы.

### [`AGENTS.md`](AGENTS.md)

Главный диспетчер поведения агента.

Он определяет:

- когда запускать Bootstrap;
- когда продолжать действующий контекст;
- когда искать Working Process;
- когда создавать Task и Run;
- какие authority boundaries сохранять.

### [`ENGINEERING_WORK_BOOTSTRAP_GUIDE.md`](ENGINEERING_WORK_BOOTSTRAP_GUIDE.md)

Пусковой контур инженерной инициативы.

Результат:

```text
Admitted Work Context
+ Entry Decision
```

### [`WORKING_PROCESS_AND_LOOPS_GUIDE.md`](WORKING_PROCESS_AND_LOOPS_GUIDE.md)

Процессный движок проекта.

Основная иерархия:

```text
Project / System of Interest
└── Working Process
    └── Loop
        └── Task
            └── Run
                ├── Candidate Result
                ├── Verification
                └── Admission Decision
                    └── Relied-on Result
```

### [`AI_SDLC_DPF.md`](AI_SDLC_DPF/framework/AI_SDLC_DPF.md)

Нормативная доменная pattern language.

### [Reference Architecture](AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_ARCHITECTURE.md) и [Reference Process](AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_PROCESS.md)

Reference-модели для проектирования project-specific architecture и process. Reference Process включает optional **Product Engineering Composition (PEC)**: navigation backbone, Concern/Result Disposition Contract и proportional Commitment Guards для tailoring Working Process.

### [Primary Application Profile](AI_SDLC_DPF/framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md)

Профиль усилений для сложных, регулируемых или программно-технических систем.

### [Application Guide](AI_SDLC_DPF/framework/AI_SDLC_APPLICATION_GUIDE.md) и [Worked Examples](AI_SDLC_DPF/examples/AI_SDLC_WORKED_EXAMPLES.md)

Информативные материалы для практического применения.

---

## 8. Как начать работу

Operational entry текущего Runtime определяется Bootstrap Guide. Historical `AI_SDLC_DPF/QUICKSTART.md` не используется для новых инициатив или downstream process design; после Admitted Work Context и Entry Decision применяется `WORKING_PROCESS_AND_LOOPS_GUIDE.md` и непосредственно выбранные DPF/reference/application loci.

### Установка из admitted release ZIP

1. Скачайте admitted release ZIP из доверенного release locus и проверьте опубликованные имя, размер и SHA-256.
2. Распакуйте архив в отдельный каталог; не запускайте работу внутри ZIP и не смешивайте файлы с другим проектом.
3. Откройте в Codex корень распакованного каталога — тот, где находятся `AGENTS.md`, `README.md` и Guides.
4. Напишите первое сообщение или сразу опишите новую инициативу: dispatcher начнёт Bootstrap и покажет Candidate Work Context до consequential work.

Для product/system work действует `FC-13-first operational entry`: `admitted context -> FC-13 -> project-relevant result expansion -> optional PEC screen -> explicit reductions -> Human decision`. PEC из Reference Process подключается только как optional completeness screen после context-driven profile и первичного развёртывания результатов. Он помогает проверить requirements, operational concept/scenarios, User Stories, domain/data/state, architecture/interfaces, UX, security, V&V, construction, transition и learning concerns, но не задаёт первый шаг, обязательный порядок или отдельный файл на каждый concern. Direct Work, script, driver и research spike сохраняют lightweight route или explicit non-use.

### Вариант 1. Просто открыть проект и написать сообщение

Подходит для первого знакомства.

```text
пользователь: Привет
```

Агент проверяет:

- существует ли admitted Work Context;
- покрывает ли он текущую инициативу;
- существует ли Entry Decision;
- существует ли Working Process;
- существует ли подходящий Loop.

Если проект не инициирован, агент:

1. кратко представляется;
2. сообщает применимую presentation-настройку или default;
3. объясняет назначение Bootstrap;
4. при необходимости делает optional model-guidance offer;
5. начинает адаптивное интервью;
6. задаёт один содержательный вопрос.

Это основной рекомендуемый маршрут.

---

### Вариант 2. Начать с идеи или боли

Подходит, когда документов почти нет.

Примеры:

```text
У меня есть идея сервиса.
Нас не устраивает текущий процесс.
Хотим автоматизировать подготовку ПМИ.
Не понимаем, с чего начать архитектуру.
```

Маршрут:

```text
Interview-first
→ problem or concept framing
→ first summary
→ Candidate Work Context
→ Admission
→ Entry Decision
```

---

### Вариант 3. Начать с источников

Подходит, когда уже есть:

- ТЗ;
- ИТТ;
- требования;
- схемы;
- код;
- документация;
- нормативные документы;
- отчёты;
- существующий репозиторий.

Размести материалы в:

```text
project/source/
```

Затем напиши, например:

```text
В папке project/source лежат исходные материалы.
Нужно войти в проект и предложить маршрут работы.
```

Маршрут:

```text
Source intake
→ source classification
→ context extraction
→ interview по пробелам
→ Candidate Work Context
→ Review
→ Admission Decision
→ Admitted Work Context
→ Entry Decision
```

Оригинальные источники не должны переписываться агентом.

Scaffold marker `.gitkeep` не считается source material и не включается в source inventory.

---

### Вариант 4. Начать разработку требований

Пример:

```text
Нужно разработать требования к подсистеме регистрации.
```

Разработка требований не требует запуска полного project lifecycle.

Возможный маршрут:

```text
Requirements-first Bootstrap
→ Candidate Work Context
→ Review
→ Admission Decision
→ Admitted Work Context
→ Entry Decision
→ Requirements Working Process
→ Requirements Loops
```

Первым результатом может быть:

- source register;
- stakeholder map;
- requirement scope;
- requirements extraction plan;
- Candidate Requirements;
- requirements review route.

---

### Вариант 5. Начать архитектурную работу

Пример:

```text
Нужно определить архитектуру интеграции.
```

Возможный маршрут:

```text
Architecture-first Bootstrap
→ system of interest
→ boundaries and drivers
→ source and constraint intake
→ Candidate Work Context
→ Review
→ Admission Decision
→ Admitted Work Context
→ Entry Decision
→ Architecture Working Process
```

Bootstrap должен помочь определить:

- систему интереса;
- уровень рассмотрения;
- надсистему и подсистемы;
- внешние системы;
- architectural drivers;
- critical interfaces;
- intended use архитектурного результата.

---

### Вариант 6. Войти в существующий проект

Пример:

```text
Есть действующий код и документы.
Нужно понять состояние проекта и продолжить работу.
```

Маршрут:

```text
Existing-system assessment
→ repository and source intake
→ current-state reconstruction
→ gap identification
→ Candidate Work Context
→ Review
→ Admission Decision
→ Admitted Work Context
→ Entry Decision
```

Агент не должен считать существующие файлы согласованной моделью проекта без проверки.

---

### Вариант 7. Запустить bounded pilot

Подходит, когда контекст в целом понятен, но полный процесс проектировать рано.

```text
minimal Work Context
→ Entry Decision: start_bounded_pilot_loop
→ Candidate minimal Working Process and bounded Loop
→ explicit process approval
→ Task
→ Run
→ evidence
→ Admission
→ Process Review
```

Подходящие первые Loops:

- извлечение требований;
- проверка требований;
- architecture research;
- impact analysis;
- подготовка User Stories;
- генерация тестов;
- code review;
- проверка документации.

---

### Вариант 8. Начать новую инициативу внутри действующего проекта

Пример:

```text
Начнём новую инициативу: нужно отдельно проработать безопасность.
```

Агент должен:

1. определить, покрывается ли запрос текущим Work Context;
2. если нет — предложить отдельный Bootstrap;
3. объяснить его назначение;
4. создать отдельный Work Context;
5. зафиксировать связи с существующими инициативами;
6. предложить отдельный Entry Route.

Для нескольких инициатив используется:

```text
project/artifacts/WORK_CONTEXT_REGISTER.md
project/artifacts/work_contexts/
```

---

## 9. Режимы Bootstrap

| Режим | Когда применять | Типовой результат |
|---|---|---|
| Lite | Локальная понятная задача | Один `WORK_CONTEXT.md` |
| Standard | Новый проект или значимая инициатива | Work Context + Entry Decision |
| Extended | Сложная, регулируемая или высокорисковая система | Дополнительные source, authority, system и consequence records |

Режим предварительно выбирает агент и объясняет выбор пользователю.

---

## 10. Work Context и Entry Decision

### Work Context

Work Context отвечает на вопросы:

- что это за инициатива;
- зачем она нужна;
- что является системой интереса;
- где границы;
- кто будет использовать результат;
- какие источники существуют;
- какие ограничения действуют;
- кто имеет authority;
- что остаётся неизвестным.

Work Context не является автоматически:

- ТЗ;
- архитектурой;
- backlog;
- планом проекта;
- Working Process.

### Entry Decision

Entry Decision выбирает дальнейший маршрут:

```text
use_existing_working_process
adapt_existing_working_process
create_specialized_working_process
start_bounded_pilot_loop
continue_discovery
defer
honest_stop
```

Для создания полного project-specific процесса используется маршрут:

```text
create_specialized_working_process
```

Core v2 не входит в текущий пакет и недоступен как Entry Route. Он может рассматриваться только как возможное внешнее расширение после отдельного определения версии, applicability, entry contract и authority.

После Entry Decision применяется `WORKING_PROCESS_AND_LOOPS_GUIDE.md`.

---

## 11. Рабочая иерархия

```text
Engineering Initiative
→ Work Context
→ Entry Decision
→ Working Process
→ Loop
→ Task
→ Run
→ Candidate Result
→ Verification
→ Admission Decision
→ Relied-on Result
```

### Working Process

Карта инженерной работы конкретной инициативы.

Минимальная карта является navigation view, а не coverage proof. Сначала строится DPF-first project-relevant coverage map; ConOps, Requirements, User Stories, domain/data/state, architecture/interfaces, UX/UI, construction, verification, operation и learning получают самостоятельное disposition там, где применимы.

До consequential Loop каждый material result получает disposition `explicit`, `combined`, `cross_cutting`, `deferred`, `omitted` или `not_applicable` с dependencies, first relying use, verification и reopen route. Если результаты объединены в одном carrier, их identity и возможность возврата к smallest responsible result сохраняются. Затем пользователь явно утверждает предлагаемую оптимизацию и первый bounded Loop.

### Loop

Повторяемый bounded process получения одного типа результата.

### Task

Конкретное поручение внутри Loop.

### Run

Фактическое выполнение Task конкретным исполнителем, контекстом и инструментами.

### Candidate Result

Результат, ещё не допущенный к дальнейшему использованию.

### Verification

Проверка результата относительно требований и intended use.

### Admission

Уполномоченное решение:

```text
admitted
rejected
returned_for_refinement
deferred
```

`honest_stop` является исходом Bootstrap Session или Run, а не Admission Decision.

---

## 12. Human Gates и authority

Способность агента выполнить действие не создаёт права принять решение.

Human Gate показывается прежде всего как ясное сообщение о конкретной ситуации, а не как методологический ярлык. Восемь interactions `DI-01 Review`, `DI-02 Choice`, `DI-03 Change`, `DI-04 Conflict`, `DI-05 Risk`, `DI-06 Missing input`, `DI-07 Failed verification` и `DI-08 Consequential action` сохраняют свои decision-specific поля; clarification является response state. В чате видны Candidate/configuration, recommendation, evidence/risks/limitations, последствия и `Требуемое решение / Required Decision`. Optional adjacent `.md` описывает ту же configuration; цвет и rich formatting только помогают чтению, а текст сохраняет весь смысл.

Пример компактной формы:

```text
Нужно утвердить Candidate-контракт перед первым Run

Candidate: L-EXAMPLE-001, SHA-256 <exact-hash>
Рекомендация: утвердить для одного bounded Run.
Разрешает: создать TASK/RUN и изменить перечисленные targets.
Не разрешает: release, Git или расширение scope.

Требуемое решение / Required Decision
Ответьте exact approval phrase либо верните Candidate на refinement.
```

Для risk acceptance остаются видимыми residual risk, accountable risk owner и reopen trigger; для consequential action указываются exact action, target/configuration, effects, recovery/reversibility и verification. После решения confirmation повторяет exact outcome/configuration, newly allowed и still-prohibited effects, actor/date when available, decision-record link when created и next/reopen route. Двусмысленный ответ не считается Admission. Полная механика определена в [`WORKING_PROCESS_AND_LOOPS_GUIDE.md`](WORKING_PROCESS_AND_LOOPS_GUIDE.md), а Bootstrap-проекция — в [`ENGINEERING_WORK_BOOTSTRAP_GUIDE.md`](ENGINEERING_WORK_BOOTSTRAP_GUIDE.md).

Следует различать:

- доступ к инструменту;
- разрешение выполнить действие;
- accountability;
- verification;
- evidence;
- assurance;
- admission authority.

Агент может:

- анализировать;
- предлагать;
- создавать Candidate Results;
- выполнять bounded Runs;
- инициировать Bootstrap;
- обнаруживать необходимость Working Process или Loop.

Агент не должен без отдельной authority:

- утверждать Work Context;
- вводить Working Process в действие;
- добавлять consequential Loop;
- принимать результат для relied-on use;
- выполнять необратимое действие;
- изменять DPF.

---

## 13. Что изменять в ходе проекта

В обычной проектной работе развиваются:

- Work Context;
- Entry Decision;
- Working Process;
- Loops;
- project architecture;
- requirements;
- instructions;
- source registers;
- evidence;
- code;
- tests.

Каталог DPF считается read-only.

```text
AI_SDLC_DPF/
```

не следует менять из-за:

- нового инструмента;
- новой LLM;
- изменения prompt;
- локальной ошибки агента;
- появления нового project artifact;
- изменения одного Working Process;
- изменения архитектуры одного проекта.

---

## 14. Рекомендуемый первый пилот

Для проверки пакета не требуется сразу запускать полный lifecycle.

Рекомендуется выбрать инициативу, которая:

- практически полезна;
- имеет доступные источники;
- ограничена по scope;
- допускает проверку;
- обратима;
- имеет понятный receiving use;
- может пройти один законченный цикл.

Пример:

```text
идея или пакет источников
→ Bootstrap
→ admitted Work Context
→ Requirements Extraction Loop
→ Candidate Requirements
→ Verification
→ Admission
→ Process Review
```

Если declared scope включает несколько scenarios, shared persistence, external interfaces или system-wide properties, первый pilot дополнительно проверяет соответствующие Commitment Guards до локального hard-to-reverse решения. Первый vertical slice должен переиспользовать admitted upstream results и не объявлять slice-local data/architecture моделью всего продукта.

Первый pilot должен проверить не количество созданных файлов, а следующее:

- агент сам распознал необходимость Bootstrap;
- пользователь понял, что происходит;
- Work Context оказался полезен;
- Entry Decision привёл к подходящему процессу;
- Loop был bounded;
- material concern/result dispositions и first relying uses были видимы;
- shared architecture/data/integration assumptions были проверены до consequential commitment;
- последующая работа могла reuse или явно supersede admitted results;
- Candidate Result не был принят молча;
- verification и admission реально сработали.

---

## 15. Быстрый старт

### Шаг 1

Размести в корне:

```text
AGENTS.md
ENGINEERING_WORK_BOOTSTRAP_GUIDE.md
WORKING_PROCESS_AND_LOOPS_GUIDE.md
AI_SDLC_DPF/
```

### Шаг 2

Открой репозиторий в агентной среде, которая читает `AGENTS.md`.

### Шаг 3

Напиши:

```text
Привет
```

или сразу сформулируй потребность:

```text
Нужно разработать требования к новой подсистеме.
```

### Шаг 4

Ответь на короткое адаптивное интервью.

### Шаг 5

Проверь Candidate Work Context.

### Шаг 6

Явно утверди или верни его на уточнение.

### Шаг 7

Выбери предложенный Entry Route.

### Шаг 8

Утверди минимальный Working Process и первый bounded Loop.

---

## 16. Статус пакета

Текущий пакет следует рассматривать как:

> Released Instantiatio DPF Work Kit `3.1.0`; exact `3.0.0` остаётся prior admitted local release baseline, а Work Kit `2.5.2` — его local predecessor. Released metadata in a staged package does not self-admit an archive; reliance requires exact ZIP Admission.

DPF имеет контролируемый working release.

Bootstrap Guide и Working Process Guide являются исполнительскими companion documents, которые должны проверяться в реальных инициативах.

Optional PEC и его guards прошли design/behavioral replay, но их field effectiveness ещё не доказана. Требуются representative pilots для direct/script/driver, multi-slice product, integrated-system и PAP-strengthened contexts. Normative DPF остаётся `1.0.1` без изменений.

Model-guidance integration также является operational capability, а не новым authority level. Её behavioral contract проверяет optional/non-blocking offer, host limitations и сохранение process/Human authority; фактическая эффективность конфигураций должна подтверждаться KIT-specific evals и pilot evidence.

Coverage-first repair устраняет наблюдавшийся operational projection gap: ранее сжатая process map могла неявно поглотить ConOps или User Stories. Новые правила и behavioral scenarios прошли cross-carrier verification и fresh independent challenge с сохранённым `R1-IC-O01`: marker/order automation остаётся bounded regression evidence, а не semantic proof. Field effectiveness всё ещё требует representative multi-project pilots.

Candidate Decision UI `2.5.1` восстановил восемь admitted interactions, а local baseline `2.5.2` завершил их specializations и responsible-section guards. Admitted `3.0.0` добавил release-level identity и lightweight public layer. Released Work Kit `3.1.0` добавляет progress/completion grammar, category-first guidance, bounded «Форсаж», post-initiative Lessons и optional verified state projection. Repository checks не доказывают field effectiveness; fresh recovery и independent cross-carrier challenge остаются отдельной downstream работой.

Наиболее ценные следующие улучшения должны появляться из:

- фактических Bootstrap sessions;
- pilot Loops;
- failed Runs;
- admission returns;
- project feedback;
- field counterexamples.

Не следует заменять практическую проверку дальнейшей бесконечной теоретической детализацией.

---

## 17. Главная формула пакета

```text
DPF отвечает:
какие устойчивые проблемы и принципы существуют в домене?

Bootstrap отвечает:
во что именно мы входим и зачем?

Working Process отвечает:
как организована работа этой инициативы?

Loop отвечает:
как повторяемо получать конкретный тип результата?

Task отвечает:
что нужно сделать сейчас?

Run отвечает:
что фактически было выполнено?

Verification отвечает:
насколько Candidate Result пригоден?

Admission отвечает:
можно ли на результат опираться дальше?
```
