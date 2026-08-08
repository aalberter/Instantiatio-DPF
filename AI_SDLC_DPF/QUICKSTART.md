# AI SDLC DPF Quick Start

> **Status:** Historical / non-operational
>
> **Operational use:** Prohibited for new Engineering Work Kit initiatives.
>
> **Superseded by:** [`ENGINEERING_WORK_BOOTSTRAP_GUIDE.md`](../ENGINEERING_WORK_BOOTSTRAP_GUIDE.md) and [`WORKING_PROCESS_AND_LOOPS_GUIDE.md`](../WORKING_PROCESS_AND_LOOPS_GUIDE.md).
>
> **Preservation purpose:** provenance, comparison and migration reference. The legacy vocabulary and carrier names below are intentionally preserved and must not be interpreted as the current Work Kit contract.

## 1. Назначение Quick Start

Quick Start помогает архитектору, аналитику, тимлиду или руководителю проекта спроектировать и впервые применить ограниченный агентный процесс разработки. Это application guidance: инструкция помогает принять проектные решения, но не создаёт новые нормативные patterns, Organization LPF или готовый процесс конкретного проекта.

Сохраняется следующая authority architecture:

1. FPF;
2. AI SDLC DPF;
3. Reference Architecture;
4. Reference Process;
5. Application Guide;
6. Organization LPF;
7. Project-specific Process;
8. Performed Work.

PAP — bounded specialization profile, а не девятый уровень. V-cycle, model-driven architecture, Core-11, конкретные документы и инструменты не являются универсальными требованиями.

## 2. Что получится в результате

После прохождения десяти шагов у команды будут:

- ограниченный контекст и intended use;
- выбранный проектный профиль;
- обоснованный набор применимых и неприменимых DPF-паттернов;
- явное распределение human/agent authority;
- минимальная проектная реализация Reference Architecture;
- скомпонованный из нужных fragments процесс;
- admission и verification для material results;
- спецификация первого bounded agent loop;
- фактический run/admission result;
- review и решение об адаптации процесса.

Названия файлов в этой инструкции — рекомендуемые carriers. Эквивалентные таблицы, модели, ADR, записи в системах управления требованиями или репозитории допустимы, если сохраняют то же содержание и authority.

## 3. Что нужно знать до начала

Минимально прочитайте:

- [AI SDLC DPF](framework/AI_SDLC_DPF.md) — нормативные patterns;
- [Glossary](reference/AI_SDLC_GLOSSARY.md) — различия candidate/admitted result, evidence/assurance/decision, baseline/completion;
- [Reference Architecture](framework/AI_SDLC_REFERENCE_ARCHITECTURE.md) — необязательные entities и contracts;
- [Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md) — composable process fragments.

До старта должен быть назван владелец результата или процесса. Если есть регулируемая, договорная или safety/security applicability, привлеките квалифицированного специалиста: комплект не определяет её автоматически.

## 4. Выбор режима запуска

### 4.1. Минимальный старт

Используйте его, если изменение локальное, команда небольшая, действия обратимы, цена ошибки умеренная, сложной нормативной применимости и оборудования нет, а усиленный PAP не нужен.

Минимальный результат:

```text
PROJECT_CONTEXT.md
PATTERN_SELECTION.md
AUTHORITY_MATRIX.md
PROJECT_ARCHITECTURE.md
PROJECT_PROCESS.md
ADMISSION_AND_VERIFICATION.md
AGENT_LOOP_001.md
PROCESS_REVIEW_001.md
```

Это не обязательные filenames. Один короткий decision record может реализовать несколько carriers, если различия и ответственность остаются восстанавливаемыми.

### 4.2. Усиленный старт

Рассмотрите его при высокой цене ошибки, длительном lifecycle, регулируемой B2B/B2G-среде, software/hardware или equipment integration, нескольких организациях/поставщиках либо усиленных требованиях к traceability, configuration management, V&V, assurance, independence, human authority и нормативной/договорной применимости.

Дополнительно могут понадобиться:

```text
PROJECT_PROFILE.md
APPLICABLE_SOURCES.md
TRACEABILITY_PLAN.md
CONFIGURATION_PLAN.md
ASSURANCE_AND_INDEPENDENCE_PLAN.md
HUMAN_GATES.md
INITIAL_BASELINE.md
```

Это situational carrier set, не универсальный обязательный набор. Выбирайте только records, которые защищают конкретную reliance или выполняют применимое внешнее обязательство. Подробнее: [Primary Application Profile](framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md).

## Шаг 1 — Ограничить задачу и контекст

### Зачем

Не начинать с выбора LLM, agent framework, prompts или workflow до определения объекта проектирования, intended use и первого relied-on результата.

### Кто участвует

Владелец результата или процесса, архитектор и представитель выполняющей команды. При необходимости участвуют reviewer и domain specialist.

### Как выполнить

Проведите короткую рабочую сессию. Определите систему, проектируемую часть процесса, primary Entity of Concern, problem situation, intended use, first relying use, ожидаемый результат, последствия ошибки, ограничения, существующую authority, допустимые изменения и stop/return/reopen conditions.

Отдельный нормативный FC-01 не используется: framing выполняется через direct FPF semantics и application guidance.

### Вопросы, на которые нужно ответить

- Что именно проектируется и для какой системы?
- Кто и в каком use будет полагаться на результат первым?
- Какой вред возникает при ошибке или преждевременной reliance?
- Что уже установлено организацией, контрактом или проектом?
- Когда работу нужно остановить, вернуть или открыть заново?

### Уровень рассмотрения и декомпозиция сложной системы

#### Когда подраздел применяется

Пройдите этот подраздел полностью, если система состоит из нескольких существенно различающихся частей, имеет подсистемы с отдельными функциями или командами, входит в надсистему, взаимодействует с внешними системами, включает software/hardware или equipment integration, либо слишком велика для одного bounded agent process. Он также необходим, когда общесистемные свойства нельзя доказать проверкой отдельных компонентов.

Для небольшой локальной задачи пройдите подраздел кратко: назовите текущий уровень и зафиксируйте, что декомпозиция не требуется.

#### Основной принцип

> Для сложной системы сначала определяется система интереса на выбранном уровне рассмотрения. Её подсистемы могут проектироваться отдельными bounded-процессами, но ограничения надсистемы, интерфейсы, общесистемные свойства, интеграция и системная верификация остаются предметом отдельного управления.

```text
Надсистема
└── Система интереса
    ├── Подсистема A
    ├── Подсистема B
    └── Подсистема C
```

Каждая подсистема рекурсивно может рассматриваться как новая система интереса и проходить тот же Quick Start. При этом сохраняйте trace от системного решения и allocated requirements к подсистемному контексту, а от подсистемных результатов — к интеграции и системной проверке.

#### Вопросы декомпозиции

- Что является системой интереса в текущем проходе?
- В какую надсистему она входит?
- Какие ограничения приходят от надсистемы?
- Какие подсистемы входят в систему интереса?
- Какие внешние системы с ней взаимодействуют?
- Какие функции принадлежат всей системе, а какие отдельным подсистемам?
- Какие interfaces должны быть определены до раздельной разработки?
- Какие данные, состояния, события и физические воздействия проходят через границы?
- Какие свойства являются общесистемными?
- Какие требования могут быть распределены по подсистемам?
- Какие требования нельзя корректно проверить на уровне одной подсистемы?
- На каком уровне запускается текущий агентный процесс?
- Какие решения должны быть приняты до параллельной разработки частей?
- Как и когда будет выполняться интеграция?
- На каком уровне проводится admission результата?
- Кто отвечает за системное решение и системную интеграцию?

#### Общесистемные свойства

Рассмотрите безопасность, информационную безопасность, производительность, надёжность, отказоустойчивость, временные характеристики, целостность данных, совместимость, наблюдаемость, восстановление, поведение при отказах, ограничения оборудования и regulatory/contractual properties.

> Успешная проверка каждой подсистемы отдельно не доказывает выполнение общесистемного свойства собранной системой.

#### Как декомпозировать

1. Определите назначение системы интереса.
2. Зафиксируйте её границу.
3. Перечислите внешние системы и actors.
4. Определите ограничения надсистемы.
5. Выделите функции и общесистемные свойства.
6. Предложите подсистемы.
7. Определите ответственность подсистем.
8. Определите interfaces и contracts.
9. Определите зависимости и порядок интеграции.
10. Определите проверки на уровне подсистем.
11. Определите проверки на уровне собранной системы.
12. Выберите первый bounded scope для реализации.

Не декомпозируйте только по существующей организационной структуре и не считайте структуру каталогов архитектурной декомпозицией. Не передавайте общесистемное свойство одной подсистеме без системного обоснования. Не начинайте независимую разработку подсистем до определения critical interfaces, не откладывайте интеграцию до полного завершения всех частей и не создавайте один agent loop на всю сложную систему.

#### Дополнительные carriers сложного проекта

Для сложного проекта могут понадобиться:

```text
SYSTEM_CONTEXT.md
SYSTEM_DECOMPOSITION.md
INTERFACE_REGISTER.md
INTEGRATION_AND_SYSTEM_VERIFICATION_PLAN.md
```

`SYSTEM_CONTEXT.md` фиксирует систему интереса, её положение и внешнюю границу:

```markdown
# System Context

## System of Interest
## Level of Consideration
## Purpose
## Supersystem
## Supersystem Constraints
## External Systems and Actors
## System Boundary
## Inputs and Outputs
## System-Wide Properties
## System Authority
```

`SYSTEM_DECOMPOSITION.md` фиксирует rationale, распределение ответственности и integration order:

```markdown
# System Decomposition

## System of Interest
## Decomposition Rationale
## Subsystems
## Responsibilities
## Allocated Functions
## Allocated Requirements
## System-Wide Concerns
## Dependencies
## Integration Order
## Open Decomposition Decisions
```

`INTERFACE_REGISTER.md` делает critical interactions и их проверку явными:

| Interface | Participants | Purpose | Inputs/outputs | Contract | Owner | Verification |
|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |

`INTEGRATION_AND_SYSTEM_VERIFICATION_PLAN.md` отделяет subsystem checks от собранной system verification:

```markdown
# Integration and System Verification Plan

## Integration Strategy
## Integration Order
## Required Baselines
## Interface Verification
## Subsystem Verification
## System-Level Verification
## System-Wide Properties
## Equipment or External-System Participation
## Admission Authorities
## Failure and Return Routes
```

> Это дополнительные carriers для сложного проекта, а не обязательный универсальный набор документов. Допустимы эквивалентные формы представления.

#### Критерий готовности сложной системы

Шаг завершён, когда система интереса названа; уровень рассмотрения и граница определены; надсистема и её ограничения зафиксированы; основные подсистемы, внешние системы и critical interfaces выявлены; общесистемные свойства перечислены; subsystem-level и system-level проверки разделены; bounded scope первого прохода выбран; ответственность за системную интеграцию назначена.

### Что зафиксировать

Создайте `PROJECT_CONTEXT.md` или эквивалент:

```markdown
# Project Context

## System
## Level of Consideration
## System of Interest
## Supersystem
## Subsystems
## External Systems
## System Boundary
## Critical Interfaces
## System-Wide Properties
## Integration Responsibility
## Project situation
## Entity of Concern
## Problem
## Decision question
## Intended use
## First relying use
## Stakeholders
## Constraints
## Consequences of error
## Existing authority
## Expected result
## Stop conditions
## Reopen conditions
```

Для небольшой задачи поля декомпозиции могут содержать краткое значение `Not material for this bounded task`.

### Минимальный результат

Одна согласованная страница с decision question, EoC, first relying use, expected result и границами.

### Критерий готовности

Другой участник может объяснить, что проектируется, для кого, зачем, в каких границах, какой результат ожидается и когда работу нужно остановить или вернуть.

### Не делайте

Не подменяйте задачу названием инструмента, модели, файла или workflow. Не объявляйте контекст полным: назовите материальные неизвестные.

### Подробнее

[AI SDLC DPF](framework/AI_SDLC_DPF.md), [Application Guide](framework/AI_SDLC_APPLICATION_GUIDE.md), [Glossary](reference/AI_SDLC_GLOSSARY.md), [Reference Architecture](framework/AI_SDLC_REFERENCE_ARCHITECTURE.md), [Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md), [Primary Application Profile](framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md), [Worked Examples](examples/AI_SDLC_WORKED_EXAMPLES.md).

### Следующий шаг

Оцените профиль проекта и необходимость PAP.

## Шаг 2 — Определить профиль проекта

### Зачем

Выбрать пропорциональную глубину процесса и не перенести high-assurance overhead в простую работу либо lightweight defaults в consequential use.

### Кто участвует

Владелец результата, архитектор, тимлид и представители V&V/security/assurance или domain/regulatory expertise, если их concerns применимы.

### Как выполнить

Оцените последствия ошибки, обратимость, сложность, длительность lifecycle, число команд/организаций/поставщиков, оборудование и external interfaces, regulatory/contractual applicability, traceability, configuration management, V&V, assurance, independence, data sensitivity и допустимую автономию агентов.

Для сложной системы используйте результат шага 1: отдельно оцените system-wide consequence и profiles подсистем, interfaces и integration. PAP-strengthening на одном уровне не применяется автоматически ко всем уровням без applicability rationale.

Выберите один режим:

```text
lightweight non-PAP
general AI SDLC
PAP-strengthened
```

### Вопросы, на которые нужно ответить

- Нужен ли PAP и на каком основании?
- Какие требования являются general, profile strengthening или внешним обязательством?
- Какие решения остаются project-specific?
- Какие расходы усиленного режима оправданы последствиями?

### Что зафиксировать

При необходимости создайте `PROJECT_PROFILE.md`:

```markdown
# Project Profile

## Project class
## Consequence level
## Reversibility
## Lifecycle
## System boundary
## Equipment boundary
## Regulatory and contractual applicability
## Traceability needs
## Configuration needs
## V&V needs
## Assurance and independence
## Human authority strengthening
## PAP applicability
## Tailoring decisions
```

Для lightweight старта те же решения можно записать кратким разделом в `PROJECT_CONTEXT.md`.

### Минимальный результат

Выбран один профиль с причинами, strengthenings, non-use и reopen triggers.

### Критерий готовности

Понятно, нужен ли PAP, откуда приходит каждое strengthening и какие applicability decisions требуют внешней квалификации.

### Не делайте

Не применяйте PAP автоматически из-за слова «регулируемый» и не выводите compliance из тематической релевантности источника.

### Подробнее

[Primary Application Profile](framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md), [Worked Examples](examples/AI_SDLC_WORKED_EXAMPLES.md), [Sources](reference/AI_SDLC_SOURCES.md).

### Следующий шаг

Выберите patterns по фактически присутствующим проблемам.

## Шаг 3 — Выбрать применимые DPF-паттерны

### Зачем

Получить минимальный достаточный pattern set, а не применять все десять patterns по умолчанию.

### Кто участвует

Архитектор, владелец процесса, тимлид и reviewers, отвечающие за обнаруженные problem situations.

### Как выполнить

Заполните таблицу:

| Pattern | Problem present? | Apply now | Defer | Non-use reason | Project realization |
|---|---|---|---|---|---|
| FC-02 |  |  |  |  |  |
| FC-03 |  |  |  |  |  |
| FC-04 |  |  |  |  |  |
| FC-05 |  |  |  |  |  |
| FC-06 |  |  |  |  |  |
| FC-07 |  |  |  |  |  |
| FC-08 |  |  |  |  |  |
| FC-09 |  |  |  |  |  |
| FC-11 |  |  |  |  |  |
| FC-13 |  |  |  |  |  |

Для декомпозированной системы заполняйте selection отдельно для system/integration level и для подсистем, где problem situations различаются. Сохраните trace между общесистемным pattern decision, allocated concern и подсистемной realization; один выбор не переносится на все уровни автоматически.

Диагностические вопросы:

- `FC-02`: будет ли агент выполнять bounded consequential work?
- `FC-03`: существуют ли actions или decisions, authority которых нельзя выводить из agent output, confidence или explanation?
- `FC-04`: может ли AI output стать основанием relied-on engineering work?
- `FC-05`: нужно ли преобразовать source material в принятую engineering claim?
- `FC-06`: может ли изменение или устаревание source затронуть relied-on result?
- `FC-07`: нужны ли why/impact paths между engineering objects?
- `FC-08`: требуется ли bounded completeness или readiness claim?
- `FC-09`: нужно ли точно идентифицировать relied-on engineering state?
- `FC-11`: нужно ли проектировать verification intent вместе с claim или design?
- `FC-13`: требуется ли tailoring процесса по контексту, последствиям и обратимости?

### Вопросы, на которые нужно ответить

- Какую observable problem situation закрывает каждый выбранный pattern?
- Как выглядит first useful move и expected result в проекте?
- Почему отложенный или неприменяемый pattern не нужен сейчас?
- Какой trigger откроет выбор заново?

### Что зафиксировать

Создайте `PATTERN_SELECTION.md`. Для каждого pattern укажите recognized problem, first useful move, expected result, project realization, non-use, responsible reviewer и reopen trigger.

### Минимальный результат

Таблица со всеми десятью IDs и явным `apply`, `defer` или `non-use` для каждого.

### Критерий готовности

Каждый выбранный pattern связан с реальной проблемой и результатом, а каждый non-use имеет причину и trigger.

### Не делайте

Не выбирайте pattern из-за красивого названия, наличия шаблона или желания получить «полный» комплект.

### Подробнее

[Normative DPF patterns](framework/AI_SDLC_DPF.md), включая [FC-13 Contextual Process Profile](framework/AI_SDLC_DPF.md#fc-13---contextual-process-profile).

### Следующий шаг

Распределите consequential human/agent authority.

## Шаг 4 — Определить human/agent authority

### Зачем

Не допустить, чтобы permission, fluent output, confidence или explanation стали неявной authority для consequential action или decision.

### Кто участвует

Accountable owner, архитектор, тимлид, оператор/исполнитель и независимый reviewer, если он требуется профилем или внешним обязательством.

### Как выполнить

Сначала перечислите consequential decisions и actions, а не должности и инструменты. Для каждого определите accountable human, самостоятельные и proposal-only agent actions, human admission, independent review, escalation, honest stop, запрещённые side effects и обратимость.

Для сложной системы различайте system authority, integration authority и subsystem authority. Подсистемный owner не получает authority для общесистемного свойства или system admission без явного системного решения.

| Decision/action | Consequence | Reversibility | Agent authority | Human authority | Independent check | Escalation |
|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |

### Вопросы, на которые нужно ответить

- Кто отвечает за решение и может его отменить?
- Какие effects агент не может создавать?
- Где возникает первая material reliance или irreversibility?
- Что получает человек для решения и куда возвращает result?

### Что зафиксировать

Создайте `AUTHORITY_MATRIX.md` с таблицей decisions/actions и отдельным списком prohibited actions.

### Минимальный результат

Для первого loop определены agent envelope, accountable human, admission point и escalation route.

### Критерий готовности

Ни одно consequential decision не осталось без accountable human; участники одинаково объясняют границу authority.

### Не делайте

Не выводите authority из confidence, не считайте explanation решением, не ставьте Human Gate после каждой операции и не оставляйте material decision без owner.

### Подробнее

[FC-03 Human Authority Boundary](framework/AI_SDLC_DPF.md#fc-03---human-authority-boundary), [Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md), [Primary Application Profile](framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md).

### Следующий шаг

Определите минимальные entities, relations и authoritative loci.

## Шаг 5 — Собрать проектную архитектуру

### Зачем

Сделать состояния, claims, evidence, authority и return paths восстанавливаемыми без копирования всей Reference Architecture.

### Кто участвует

Software/system architect, AI Process Architect, владельцы authoritative systems и представители information/configuration management.

### Как выполнить

Используйте system context, decomposition, interfaces и system-wide properties шага 1 как вход. Рассмотрите только значимые для проекта entities: Agent Work Application, Method Description, Context, Source, Engineering Claim, Candidate Result, Admitted Result, Evidence, Assurance, Decision, Authority, Configuration, Trace Relation, View и Return State.

Для каждой ответьте: где она существует, кто владеет/изменяет/принимает, что является authoritative locus, как определяется current state, как выполняется return to source, какие relations нужны и какие losses допустимы во views.

### Вопросы, на которые нужно ответить

- Какие distinctions необходимы выбранным patterns?
- Где candidate становится admitted result?
- Где evidence отделено от assurance и decision?
- Можно ли восстановить source, configuration и authority?
- Нужна ли connected/model-driven реализация или дешевле document/code/federated approach?

### Что зафиксировать

Создайте `PROJECT_ARCHITECTURE.md`. Допустимы Mermaid, entity/relation table, Markdown и ADR для material decisions.

### Минимальный результат

Минимальная схема entities/relations с owners, authoritative loci, states и return paths для первого loop.

### Критерий готовности

Команда может показать, где существует каждое material состояние, кто им управляет и как result возвращается к исходным claims/configuration.

### Не делайте

Не копируйте всю Reference Architecture, не объявляйте модель «единственной правдой» и не делайте Core-11 универсальным minimum.

### Подробнее

[Reference Architecture](framework/AI_SDLC_REFERENCE_ARCHITECTURE.md), [Traceability](reference/AI_SDLC_TRACEABILITY.md), [Glossary](reference/AI_SDLC_GLOSSARY.md).

### Следующий шаг

Скомпонуйте необходимый проекту flow из reference fragments.

## Шаг 6 — Скомпоновать проектный процесс

### Зачем

Получить исполнимый process composition, сохранив alternatives и return paths вместо копирования одного обязательного workflow.

### Кто участвует

Архитектор процесса, тимлид, accountable owners, исполнители и V&V/assurance participants для применимых fragments.

### Как выполнить

Выберите только необходимые fragments: context/profile selection, source mediation, planning, bounded execution, honest stop/return, candidate admission, verification, baseline identification, source-change impact, refinement, review и process adaptation.

Сложная система может иметь отдельные bounded processes подсистем и отдельный process интеграции/system verification. Свяжите их через interface baselines, entry/exit conditions, return routes и system-level admission, не превращая их в один неограниченный workflow.

Для каждого fragment определите entry, work, result, responsible authority, verification/check, return path, exit и next relying use.

### Вопросы, на которые нужно ответить

- Какие fragments нужны для первого intended use?
- Где процесс возвращается после failure или uncertainty?
- Какие fragments можно опустить без потери value?
- Нужен ли V, iterative/CI, risk-driven, test-first или hybrid composition?

### Что зафиксировать

Создайте `PROJECT_PROCESS.md`:

| Fragment | Entry | Work | Result | Authority | Check | Return | Next use |
|---|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |  |

### Минимальный результат

Один end-to-end path до first relying use, включая failure/return route.

### Критерий готовности

Каждый fragment имеет вход, выход, authority, check и возврат; flow можно проиграть на конкретном результате.

### Не делайте

Не копируйте Reference Process целиком, не делайте V-cycle обязательным и не скрывайте возвращение за общим «повторить».

### Подробнее

[Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md), [Application Guide](framework/AI_SDLC_APPLICATION_GUIDE.md).

### Следующий шаг

Определите admission и verification для material candidate results.

## Шаг 7 — Определить admission и verification

### Зачем

Не допустить, чтобы agent completion или passing check автоматически стали relied-on engineering result.

### Кто участвует

Владелец first relying use, verification/V&V participant, accountable admission authority и independent reviewer, если он требуется.

### Как выполнить

Для каждого material candidate result определите first relying use, evidence, verification question, assurance, decision authority, independence, residual uncertainty, admission outcome и rejection/return route. В сложной системе различайте admission подсистемного результата для integration use и admission результата собранной системы для system use: первое не доказывает второе.

### Вопросы, на которые нужно ответить

- Какое observation отличит подходящий result от правдоподобной ошибки?
- Какое evidence необходимо именно для first relying use?
- Кто может admit, reject, return или defer?
- Какая uncertainty останется после verification?

### Что зафиксировать

Создайте `ADMISSION_AND_VERIFICATION.md`:

| Candidate result | First relying use | Evidence | Verification | Authority | Admission | Return |
|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |

### Минимальный результат

Одна заполненная admission row для результата первого loop.

### Критерий готовности

До execution известны evidence, verification question, authority, outcomes и explicit return.

### Не делайте

Не считайте agent completion admission, explanation решением, confidence evidence, test count completeness или review гарантией correctness.

### Подробнее

[FC-04 Candidate Result Admission](framework/AI_SDLC_DPF.md#fc-04---candidate-result-admission), [FC-11 Verification Co-design](framework/AI_SDLC_DPF.md#fc-11---verification-co-design), [Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md).

### Следующий шаг

Подготовьте спецификацию первого bounded agent loop.

## Шаг 8 — Подготовить первый bounded agent loop

### Зачем

Сделать первую Agent Work Application ограниченной, проверяемой, replayable и способной вернуть honest partial/blocked result.

### Кто участвует

Task owner, архитектор/тимлид, будущий admission owner, оператор агента и reviewer требуемой специализации.

### Как выполнить

Выберите одну Agent Work Application на явно названном уровне рассмотрения и в bounded scope выбранной системы интереса или подсистемы. Задайте receiving use, task, input context, allowed tools/actions, prohibited actions, side-effect boundary, human authority, expected candidate result, verification intent, checks, iteration boundary, stop conditions, honest return, replay basis и admission route.

### Вопросы, на которые нужно ответить

- Что агент делает и чего не делает?
- Какие effects допустимы и обратимы?
- Что он возвращает при success, partial, blocked и stop?
- Кто и по какому evidence рассматривает result?

### Что зафиксировать

Создайте `AGENT_LOOP_001.md`:

```markdown
# Agent Loop 001

## Receiving use
## Task
## Inputs and context
## Allowed tools
## Allowed actions
## Prohibited actions
## Side-effect boundary
## Human authority
## Expected candidate result
## Verification intent
## Checks
## Iteration boundary
## Stop conditions
## Honest return
## Replay record
## Admission route
```

### Минимальный результат

Заполненная loop card для одной задачи с bounded effects, checks и return.

### Критерий готовности

До запуска понятно, что агент делает и не делает, что возвращает, когда останавливается, кто принимает результат и какой next use может на него опереться.

### Не делайте

Не задавайте бесконечный retry, не разрешайте неограниченные side effects и не называйте output admitted result заранее.

### Подробнее

[FC-02 Bounded Agent Loop](framework/AI_SDLC_DPF.md#fc-02---bounded-agent-loop), [FC-03 Human Authority Boundary](framework/AI_SDLC_DPF.md#fc-03---human-authority-boundary), [FC-04 Candidate Result Admission](framework/AI_SDLC_DPF.md#fc-04---candidate-result-admission).

### Следующий шаг

Выполните loop, сохраните фактический run и примите явное admission decision.

## Шаг 9 — Выполнить loop и принять результат

### Зачем

Отделить описанный процесс от Performed Work и agent output от принятой engineering reliance.

### Кто участвует

Оператор/выполняющая команда, accountable admission authority и назначенные verification/review participants.

### Как выполнить

1. Сохраните фактический run record.
2. Запишите использованный context.
3. Запишите tool actions и material side effects.
4. Отделите output от принятой interpretation.
5. Выполните intended verification.
6. Запишите gaps и uncertainty.
7. Примите admission decision.
8. Свяжите admitted result с first relying use.
9. При недостаточности выполните explicit return.

Если выполнена работа подсистемы, admission разрешает только названный подсистемный или integration use. Не представляйте этот результат как admission всей системы до integration, system-level verification и решения system authority.

### Вопросы, на которые нужно ответить

- Совпали ли фактические actions с envelope?
- Что показывают evidence и проверки, а чего не показывают?
- Какой result status обоснован?
- Изменились ли configuration, context или assumptions?

### Что зафиксировать

Создайте `RUN_001.md` и `ADMISSION_001.md` либо эквивалентные записи с identity, actions, evidence, limitations, decision, owner и return.

### Минимальный результат

Run record и один явный статус:

```text
admitted
rejected
returned for refinement
honest stop
```

### Критерий готовности

Result имеет явный status и owner; admitted result связан с evidence, configuration и first relying use, а return имеет адресата.

### Не делайте

Не используйте неопределённое «готово», не стирайте partial/failed attempts и не принимайте result на основании только agent narrative.

### Подробнее

[FC-04 Candidate Result Admission](framework/AI_SDLC_DPF.md#fc-04---candidate-result-admission), [Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md), [Application Guide](framework/AI_SDLC_APPLICATION_GUIDE.md).

### Следующий шаг

Проведите review первого meaningful cycle и измените только обоснованные части.

## Шаг 10 — Провести review и адаптацию

### Зачем

Проверить практическую ценность composition, обнаружить overhead и adverse consequences и принять bounded adaptation decision.

### Кто участвует

Владелец процесса, архитектор, тимлид, оператор, admission/review participants и представители PAP concerns, если они применялись.

### Как выполнить

Проверьте, какой pattern помог или был избыточен, где authority была неясной, возник human bottleneck, context был недостаточным/избыточным, traces реально использовались, configuration identity была достаточной, verification была ранней/поздней/дорогой и появились ли adverse consequences. Для сложной системы отдельно пересмотрите system boundary, decomposition rationale, interface contracts, integration order и разделение subsystem/system checks. Выберите изменения architecture, process или profile и назначьте reopen triggers.

### Вопросы, на которые нужно ответить

- Что улучшило result или предотвратило harm?
- Какой apparatus не окупился?
- Где failure/return был неработоспособен?
- Что следует сохранить, убрать, усилить или проверить следующим cycle?

### Что зафиксировать

Создайте `PROCESS_REVIEW_001.md`:

```markdown
# Process Review 001

## Intended result
## Observed result
## What worked
## What failed
## Adverse consequences
## Authority issues
## Evidence gaps
## Process changes
## Architecture changes
## Profile changes
## Reopen decisions
```

### Минимальный результат

Один review record с observed delta, выбранными изменениями, owners и следующей qualification window.

### Критерий готовности

Каждое изменение связано с наблюдением или gap, не расширяет authority молча и имеет проверяемый следующий цикл.

### Не делайте

Не превращайте первый успешный run в доказательство универсальной эффективности и не меняйте normative DPF под локальное удобство.

### Подробнее

[Application Guide](framework/AI_SDLC_APPLICATION_GUIDE.md), [Governance](reference/AI_SDLC_GOVERNANCE.md), [Worked Examples](examples/AI_SDLC_WORKED_EXAMPLES.md).

### Следующий шаг

Запустите следующий bounded cycle либо передайте обоснованные изменения в organization/project governance.

## 15. Минимальный набор проектных артефактов

| Artifact | Minimum start | PAP start | Purpose |
|---|---:|---:|---|
| `PROJECT_CONTEXT.md` | required | required | context and use |
| `PROJECT_PROFILE.md` | optional/lightweight | required | profile and strengthening |
| `PATTERN_SELECTION.md` | required | required | applicability |
| `AUTHORITY_MATRIX.md` | required | required | authority |
| `PROJECT_ARCHITECTURE.md` | required | required | realization |
| `PROJECT_PROCESS.md` | required | required | process composition |
| `ADMISSION_AND_VERIFICATION.md` | required | required | reliance control |
| `AGENT_LOOP_001.md` | required | required | first bounded execution |
| applicable-source record | optional | where applicable | external authority |
| trace plan | minimal | strengthened | why/impact |
| configuration plan | lightweight | strengthened | state identity |
| assurance/independence plan | optional | where applicable | PAP assurance |
| `PROCESS_REVIEW_001.md` | after pilot | after pilot | adaptation |

> Это Quick Start carrier set, а не универсальный нормативный набор артефактов. Допустимы эквивалентные carriers, а ненужные records не создаются.

## 16. Checklist готовности

### Ready for first loop

- [ ] Context bounded.
- [ ] Entity of Concern identified.
- [ ] Receiving use named.
- [ ] Profile selected.
- [ ] Applicable patterns selected.
- [ ] Authority assigned.
- [ ] Actions and side effects bounded.
- [ ] Candidate result specified.
- [ ] Stop/return defined.
- [ ] Verification intent specified.
- [ ] Admission authority assigned.
- [ ] Context and sources available.

### Ready for relied-on project use

- [ ] Candidate result admitted.
- [ ] Evidence linked.
- [ ] Relevant configuration identified.
- [ ] Material claims traceable.
- [ ] Gaps declared.
- [ ] Applicable sources current.
- [ ] Required human decisions completed.
- [ ] Required independent checks completed.
- [ ] Process review scheduled.
- [ ] Reopen triggers identified.

## 17. Типичные ошибки

| Ошибка | Коррекция | Подробнее |
|---|---|---|
| Начать с выбора LLM или agent framework | Сначала зафиксировать EoC, intended use и first relying use | [Step 1](#шаг-1--ограничить-задачу-и-контекст) |
| Скопировать весь Reference Process | Выбрать только fragments с явными entry/result/return | [Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md) |
| Применить все patterns | Записать problem present и non-use для каждого ID | [Step 3](#шаг-3--выбрать-применимые-dpf-паттерны) |
| Считать completion engineering result | Сохранить candidate state до admission | [FC-04](framework/AI_SDLC_DPF.md#fc-04---candidate-result-admission) |
| Выводить authority из confidence | Назначить accountable human и agent envelope | [FC-03](framework/AI_SDLC_DPF.md#fc-03---human-authority-boundary) |
| Путать source text и accepted claim | Записать source statement, interpretation и applicability отдельно | [FC-05](framework/AI_SDLC_DPF.md#fc-05---sourceclaim-mediation) |
| Считать trace count качеством | Проверить конкретные why/impact queries | [FC-07](framework/AI_SDLC_DPF.md#fc-07---bidirectional-engineering-trace) |
| Считать baseline обязательным freeze | Идентифицировать relied-on state и successor relation пропорционально | [FC-09](framework/AI_SDLC_DPF.md#fc-09---configuration-baseline) |
| Считать coverage доказательством completeness | Связать completeness с use, scope, gaps и reopen | [FC-08](framework/AI_SDLC_DPF.md#fc-08---bounded-completeness) |
| Автоматически применить PAP | Выполнить applicability/profile decision | [Primary Application Profile](framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md) |
| Превратить examples в requirements | Использовать их только как informative comparison | [Worked Examples](examples/AI_SDLC_WORKED_EXAMPLES.md) |
| Создать много документов без semantic need | Объединить equivalent carriers и оставить только value-bearing records | [Application Guide](framework/AI_SDLC_APPLICATION_GUIDE.md) |

## 18. Куда идти дальше

- Нормативные problem/action boundaries: [AI SDLC DPF](framework/AI_SDLC_DPF.md).
- Выбор entities, contracts и realization alternatives: [Reference Architecture](framework/AI_SDLC_REFERENCE_ARCHITECTURE.md).
- Сборка process fragments: [Reference Process](framework/AI_SDLC_REFERENCE_PROCESS.md).
- Усиленный профиль: [Primary Application Profile](framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md).
- Шаблоны и adoption guidance: [Application Guide](framework/AI_SDLC_APPLICATION_GUIDE.md).
- Источники и currentness: [Sources](reference/AI_SDLC_SOURCES.md).
- Сопровождение и versioning: [Governance](reference/AI_SDLC_GOVERNANCE.md).
- Полная читаемая книга: [AI SDLC DPF Complete](AI_SDLC_DPF_COMPLETE.md).
