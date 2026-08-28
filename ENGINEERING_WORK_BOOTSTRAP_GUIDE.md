# Engineering Work Bootstrap Guide

> Version: `1.10.0`

## 1. Назначение

Этот документ устанавливает общую исполнительскую методику входа в новую инженерную работу.

Guide применяется, когда необходимо превратить:

- неструктурированную идею;
- потребность;
- боль;
- возможность;
- набор исходных материалов;
- новую инициативу внутри действующего проекта;
- запрос на разработку требований;
- запрос на архитектурную работу;
- исследовательскую задачу;
- задачу аудита, документирования или ограниченного изменения

в согласованный и пригодный для дальнейшей работы контекст.

Главный результат Bootstrap:

```text
Candidate Work Context
→ Review
→ Admission
→ Admitted Work Context
→ Entry Decision
```

Bootstrap не заменяет:

- AI SDLC DPF;
- Reference Architecture;
- Reference Process;
- Primary Application Profile;
- Application Guide;
- `WORKING_PROCESS_AND_LOOPS_GUIDE.md`;
- project-specific Working Process;
- конкретные Loops.

AI SDLC DPF задаёт устойчивые инженерные принципы.

Этот Guide определяет, как начать инженерную работу, сформировать общий контекст человека и агента, определить возможные маршруты входа и передать согласованный результат в исполнительский контур проекта.

---

## 2. Область применения

Bootstrap используется не только для полного запуска нового проекта.

Он применяется для любой новой инженерной инициативы, если для неё ещё нет согласованного Work Context.

Примеры:

- новый программный продукт;
- новая подсистема;
- развитие существующей системы;
- разработка требований;
- архитектурное исследование;
- проектирование интеграции;
- подготовка User Stories;
- разработка ПМИ;
- impact analysis;
- аудит;
- техническое исследование;
- подготовка документации;
- ограниченный pilot;
- отдельный bounded change;
- повторный вход в давно остановленную работу;
- новая инициатива внутри уже действующего проекта.

Bootstrap не требуется заново, если:

- существует актуальный admitted Work Context;
- текущая работа входит в его scope;
- существует подходящий Working Process;
- существует применимый Loop;
- новая Task не меняет intended outcome, system of interest, authority или receiving use.

При сомнении агент должен предложить Bootstrap и кратко объяснить, зачем он нужен.

### 2.1. Re-entry boundary перед новым Bootstrap

Explicit request продолжить существующую работу, context compaction/transcript loss, новый chat/session/model/agent, host restart или handoff, interruption/long pause сначала запускают read-only re-entry check. Новый Bootstrap допустим только после этого check, если applicable active initiative действительно не восстановима или запрос materially создаёт новую initiative.

Re-entry не создаёт новый lifecycle, authority или state database. Он раздельно разрешает три класса:

| Класс | Responsible evidence | Не подменяется |
|---|---|---|
| authority | exact admitted Work Context, Entry Decision, Working Process/Loop и Admission/authorization decisions | chat summary, filename, modification time, tool state |
| relied configuration | active initiative, exact source/product baseline, carrier refs/configurations и hashes | optional index, memory или latest-looking file |
| factual execution state | current Task/Run, actual durable effects, Candidate/Gate, unresolved issues и stop/reopen routes | declared plan/status без reconciliation |

Optional `STATE_INDEX` ускоряет navigation только когда valid, current и consistent. Missing, stale, invalid или contradictory index сообщается и игнорируется для authority; exact carriers и actual effects имеют приоритет. Before consequential continuation actual durable effects reconciled по Working Process Guide.

Resolution rules:

1. если explicit continuation однозначно соответствует ровно одной recoverable non-closed initiative, восстанови её без нового Bootstrap;
2. если остаются несколько plausible initiatives, представь Human Gate selection с exact identities/consequences; не выбирай по filename, modification time, chat memory или confidence;
3. missing/broken Admission ref, relied hash или carrier/effect contradiction блокирует только affected continuation и называет exact repair/return owner;
4. pending Admission блокирует dependent/bypass Task, но не уже authorized independent reversible preparation;
5. compact recovered presentation называет initiative, baseline/configuration, current Loop/Task/Run, Candidate/Gate, allowed next action, blocked actions и unresolved/reopen route;
6. если active initiative отсутствует, обычный Bootstrap начинается без recovery ceremony или обязательного index carrier.

Markers: `deterministic_reentry_before_bootstrap | authority_configuration_factual_state_separated | stale_state_index_ignored | ambiguous_initiative_requires_selection | pending_admission_blocks_dependent_bypass_only`.

---

## 3. Основной принцип

Пользователь не обязан знать:

- терминологию AI SDLC DPF;
- структуру Working Process;
- название Loop;
- специальные команды запуска;
- перечень обязательных project artifacts.

Пользователь может начать с любого естественного сообщения:

```text
Привет.
У меня есть идея.
Нужно разобраться с требованиями.
Есть папка документов.
Хотим переделать архитектуру.
Начнём новую инициативу.
```

Агент должен определить состояние репозитория и выбрать корректный режим работы.

```text
сообщение пользователя
→ проверка состояния
→ Bootstrap требуется?
    → краткое представление
    → адаптивное интервью
    → source intake
    → Candidate Work Context
    → Review and Admission
    → Entry Decision
→ Bootstrap не требуется?
    → продолжение существующего Working Process
```

Bootstrap является state-driven, а не command-driven.

---

## 4. Термины

### 4.1. Engineering Work

Инженерная работа, направленная на получение проверяемого результата с понятным receiving use.

Она может охватывать:

- весь проект;
- часть проекта;
- подсистему;
- отдельную дисциплину;
- ограниченный тип результата;
- одну инициативу внутри существующего проекта.

### 4.2. Engineering Initiative

Отдельная инициатива, имеющая собственные:

- потребность или проблему;
- intended outcome;
- scope;
- receiving use;
- источники;
- ограничения;
- заинтересованные стороны;
- authority;
- дальнейший маршрут работы.

Один проект может содержать несколько Engineering Initiatives.

### 4.3. Initiator

Initiator, или инициатор инженерной работы, — человек, который приносит исходную потребность, проблему, идею, материалы или намерение начать работу.

Initiator не считается автоматически:

- sponsor;
- project owner;
- product owner;
- accountable human;
- subject matter expert;
- verifier;
- admission authority.

Эти роли должны определяться отдельно.

### 4.4. Work Context

Work Context — структурированное описание инженерной инициативы, достаточное для выбора следующего рабочего маршрута.

### 4.5. Candidate Work Context

Work Context, который ещё не утверждён и не может автоматически использоваться как authoritative input для дальнейшего процесса.

### 4.6. Admitted Work Context

Work Context, проверенный и явно принятый уполномоченной стороной для указанного first relying use.

### 4.7. Entry Route

Предлагаемый способ входа в дальнейшую инженерную работу.

### 4.8. Entry Decision

Явное решение о том, какой Entry Route принимается.

### 4.9. Bootstrap Session

Одна последовательность взаимодействий, в ходе которой формируются Candidate Work Context и Entry Decision.

### 4.10. Engineered System of Interest и Agentic Process EoC

В исполнительском комплекте различаются два объекта рассмотрения:

- **Engineered System of Interest** — продукт, программная система, подсистема или иной инженерный объект, над которым ведётся работа;
- **Agentic Process EoC** — агентный процесс разработки в определённом project context, к которому применяются DPF-patterns.

`System of Interest` и `Level of Consideration` в Work Context относятся к Engineered System of Interest, если явно не указано иное. При выборе DPF-patterns отдельно называй Agentic Process EoC: Working Process, Loop или другую bounded process entity.

`Project-specific Process` является термином authority hierarchy. `Working Process` является его операционной project-specific реализацией и carrier.

---

## 5. Место Bootstrap в общей архитектуре

```text
AI SDLC DPF
→ устойчивые инженерные принципы

ENGINEERING_WORK_BOOTSTRAP_GUIDE.md
→ вход в новую инженерную работу

Admitted Work Context
→ согласованный контекст инициативы

WORKING_PROCESS_AND_LOOPS_GUIDE.md
→ создание или выбор исполнительского контура

Project-specific Working Process
→ карта работы

Loop
→ повторяемый bounded process

Task
→ конкретное поручение

Run
→ фактическое выполнение
```

Bootstrap заканчивается до начала основной инженерной работы.

Он может подготовить основания для Working Process, но не должен незаметно подменять собой Working Process или Loop.

---

## 6. Состояния Bootstrap

Не смешивай состояние Bootstrap Session со статусами его carriers. Отдельно фиксируй четыре оси.

### 6.1. Bootstrap Session State

```text
not_started
in_discovery
context_drafted
context_under_review
awaiting_entry_decision
handover_in_progress
handed_over
deferred
honest_stop
```

### 6.2. Work Context Status

```text
not_created
draft
candidate
admitted
rejected
returned_for_refinement
```

### 6.3. Entry Decision Status

```text
not_started
pending
selected
deferred
```

### 6.4. Handover Status

```text
not_started
candidate_process_pending_approval
in_progress
handed_over
returned
blocked
```

### 6.5. Основные переходы

| Current session state | Event or decision | Guard | Next session state | Carrier effect / return |
|---|---|---|---|---|
| `not_started` | Bootstrap начат | новая или неинициированная initiative | `in_discovery` | Work Context `not_created` |
| `in_discovery` | первое содержательное summary проверено | минимальное framing достаточно | `context_drafted` | Work Context `draft` |
| `context_drafted` | Candidate представлен authority | facts/assumptions/open questions различены | `context_under_review` | Work Context `candidate` |
| `context_under_review` | `admitted` | verification достаточна для bounded first relying use | `awaiting_entry_decision` | Work Context `admitted`; Entry Decision `pending` |
| `context_under_review` | `returned_for_refinement` | требуется уточнение | `in_discovery` или `context_drafted` | Work Context `returned_for_refinement` с return route |
| `context_under_review` | `rejected` | контекст неприемлем | `honest_stop` | Work Context `rejected`; причина и reopen condition |
| `context_under_review` | `deferred` | решение преждевременно | `deferred` | Work Context остаётся candidate |
| `deferred` | review возобновлён | Work Context остаётся candidate | `context_under_review` | предыдущий Candidate и причины defer восстановлены |
| `deferred` | выбор Entry Route возобновлён | Work Context admitted; Entry Decision был deferred | `awaiting_entry_decision` | Entry Decision `pending` |
| `awaiting_entry_decision` | существующий approved process/Loop выбран | Work Context admitted; applicability подтверждена | `handover_in_progress` | Entry Decision `selected`; Handover `in_progress` |
| `awaiting_entry_decision` | route требует нового или изменённого process/Loop | Work Context admitted | `handover_in_progress` | Entry Decision `selected`; Handover `candidate_process_pending_approval` |
| `awaiting_entry_decision` | `continue_discovery` | выявлен material gap | `in_discovery` | новая Candidate revision обязательна |
| `awaiting_entry_decision` | `defer` | route пока не выбирается | `deferred` | Entry Decision `deferred` |
| `awaiting_entry_decision` | `honest_stop` | безопасный Entry Route недоступен | `honest_stop` | Entry Decision `selected`; Handover `not_started`; stop и reopen route записаны |
| `handover_in_progress` | Candidate Working Process/Loop представлен | Handover ожидает process authority | `handover_in_progress` | Handover `candidate_process_pending_approval` |
| `handover_in_progress` | downstream process/Loop принят | handover package проверен | `handed_over` | Handover `handed_over` |
| `handover_in_progress` | downstream вернул package | gap устраним выбором другого route | `awaiting_entry_decision` | Handover `returned`; Entry Decision возвращён на review |
| `handover_in_progress` | downstream заблокировал package | gap нельзя безопасно ограничить | `honest_stop` | Handover `blocked`; stop и reopen route записаны |

`honest_stop` является исходом Bootstrap Session, а не Admission Decision. Для него фиксируй причину, сохранённое состояние и return/reopen route.

---

## 7. Автоматический запуск

### 7.1. Первый вход в неинициированный проект

При первом сообщении пользователя агент обязан проверить:

- существует ли Work Context;
- имеет ли он admitted status;
- существует ли Entry Decision;
- существует ли Working Process;
- относится ли сообщение к уже известному scope;
- требуется ли новая инициатива.

Если admitted Work Context отсутствует, агент:

1. кратко представляется;
2. объясняет назначение Bootstrap;
3. сообщает, что сначала будет сформирован согласованный контекст;
4. задаёт первый содержательный вопрос;
5. не требует специальной команды запуска.

### 7.2. Новая инициатива внутри действующего проекта

Если пользователь начинает новую инициативу, агент должен:

1. распознать, что новый запрос может выходить за scope текущего Work Context;
2. сообщить об этом;
3. предложить отдельный Bootstrap;
4. кратко объяснить, что Bootstrap позволит:
   - отделить новую инициативу от действующей работы;
   - определить её границы;
   - собрать источники;
   - выбрать подходящий рабочий маршрут;
5. запросить явное согласие на начало Bootstrap.

Пример:

> Похоже, это новая инженерная инициатива, которая пока не покрыта действующим Work Context. Предлагаю сначала пройти короткий Bootstrap: зафиксировать потребность, границы, источники и варианты входа, а затем выбрать подходящий процесс работы.

### 7.3. Явный запуск

Пользователь может инициировать новый Bootstrap естественной фразой:

```text
Начнём новую инициативу.
Запусти новый bootstrap.
Хочу отдельно проработать архитектуру.
Давай заведём новый контекст.
```

Специальный синтаксис не требуется.

### 7.4. Interaction и Explanation preferences

Bootstrap определяет и разрешает две независимые presentation-настройки:

- **Interaction Mode** — насколько активно агент сопровождает пользователя;
- **Explanation Mode** — какие внешне значимые действия агент поясняет.

Они не являются authority level, методологией, Working Process, Loop, Human Gate или Admission Decision и не меняют engineering assurance.

#### Interaction Mode

| Value | Русское название | Поведение |
|---|---|---|
| `guided` | режим с сопровождением | Объясняет назначение этапа, термины, последствия решения и следующий переход без превращения работы в лекцию. |
| `standard` | стандартный режим | Даёт достаточный рабочий контекст и кратко поясняет существенные решения. |
| `compact` | компактный режим | Минимизирует вводные и повторения, сохраняя результаты, ограничения и обязательные решения. |

#### Explanation Mode

| Value | Русское название | Поведение |
|---|---|---|
| `detailed` | подробное пояснение действий | Кратко поясняет каждую группу внешне значимых действий: источник, artifact, применимый locus, цель и результат проверки. |
| `milestone` | пояснение ключевых событий | Поясняет переходы, решения, gates, consequential Runs, Verification, Candidate Result, Admission, honest stop и Process Review. |

Все шесть комбинаций допустимы: `guided + detailed`, `guided + milestone`, `standard + detailed`, `standard + milestone`, `compact + detailed`, `compact + milestone`. Оси нельзя сводить к одному списку взаимоисключающих режимов.

#### Default и первый вход

Если применимая сохранённая настройка отсутствует, используй:

```yaml
interaction_mode: compact
explanation_mode: milestone
```

Первый контакт объясняет назначение iDPF, new-initiative/re-entry behavior, обычную работу, доступную глубину и следующее действие. Используй один canonical Markdown text без internal mode menu, intent classification или Runtime mechanics:

```markdown
**Instantiatio DPF (iDPF)** — среда управляемой инженерной работы человека и ИИ-агента. Она помогает организовать путь от задачи и исходных материалов до инженерного результата, его проверки и необходимых решений.

В начале работы iDPF определяет, **начинается ли новая инициатива или продолжается уже существующая**. Для новой работы формируются исходный контекст и границы, затем предлагается подходящий рабочий процесс. Если работа уже велась, iDPF восстанавливает её состояние и продолжает с актуальной точки.

По умолчанию используется **обычный режим работы**: я показываю понятные этапы, текущее состояние, существенные риски, а по необходимости — инженерные представления и результаты проверок; к вам выношу только те решения, которые действительно требуют вашего участия.

При необходимости можно перейти на **инженерный уровень**, где показывается больше архитектуры, процесса, трассировки и проверки, или на **Runtime/Audit уровень**, где доступны внутренняя механика, служебные состояния и точная конфигурация. Уровень можно изменить в любой момент. Если хотите увидеть все доступные варианты, просто спросите: **«Какие режимы работы доступны?»**

Форму представления я выбираю так, чтобы её было удобно понять и содержательно оценить: это может быть текст, таблица, схема, модель, пользовательский поток или результаты проверки.

**Опишите, что хотите сделать. Если есть исходные материалы, поместите их в `project/source/` — они могут быть в любом разумном исходном виде и не требуют предварительного оформления.**

После этого iDPF либо подготовит начальный контекст новой работы для вашего подтверждения, либо восстановит существующую инициативу и покажет, с какого шага разумно продолжить.
```

Обычный режим и два уровня глубины являются human-facing labels, а не новыми schema values: внутренние `interaction_mode`/`explanation_mode` продолжают применяться по существующим правилам. Вопрос о доступных режимах открывает их interface mapping по запросу, но greeting не показывает internal variables/combinations. Minimum effective representation означает smallest sufficient content для конкретного понимания/решения, а не shortest possible response. Greeting-specific graphical layer не создаётся. CAP, «Форсаж», `gate_required`, IDs/status values/guards и model-selection offer на первом экране не показываются. Markers: `ordinary_task_first_greeting | greeting_internal_variables_hidden | greeting_minimal_effective_not_shortest | greeting_engineering_details_on_demand`.

После сообщения ожидай свободное описание задачи или материалы и продолжи Bootstrap без preference/intent interview. Engineering Views показывай по material trigger, Engineering или Runtime/Audit depth — по запросу. «Форсаж» предлагай только когда пользователь явно просит быстрый ограниченный прототип или быстрый результат; он сохраняет отдельный existing start contract и не становится greeting/presentation mode. Marker: `greeting_forsage_triggered_only`.

Если project preference существует, примени его без повторного вопроса. Новая инициатива наследует project preference, если для неё нет override.

#### Scope и приоритет

Разрешай каждую ось независимо. Естественная команда без явного scope создаёт override до конца текущей сессии. Формулировки «в этом ответе», «для этой инициативы» и «для всего проекта» задают соответственно response, initiative и project scope.

```text
host/system constraints
→ обязательные safety и authority messages
→ явная команда пользователя
→ session override
→ initiative override
→ project preference
→ compact + milestone
```

Команда применяется сразу и кратко подтверждается. Она не запускает новый Bootstrap, не изменяет Work Context или Entry Decision, не изменяет Working Process/Loop и не требует Admission.

#### Хранение

Project-level persistence использует необязательный отдельный carrier:

```text
project/INTERACTION_PREFERENCES.yaml
```

Создавай его только после явной project-scoped команды пользователя; explicit onboarding selection может сохраняться project-wide только при таком scope. Молчание применяет `compact + milestone`, но не создаёт carrier. Рекомендуемая схема:

```yaml
schema_version: 1

project_defaults:
  interaction_mode: compact
  explanation_mode: milestone
  language: ru

initiative_overrides:
  WC-EXAMPLE-001:
    interaction_mode: guided
    explanation_mode: milestone
```

`language` является отдельной presentation-настройкой и не входит в матрицу `3 × 2`. Initiative override связывается с Work Context ID, но хранится вне admitted Work Context, чтобы изменение формы взаимодействия не требовало re-admission. Неизвестное или недопустимое значение игнорируется с кратким предупреждением и fallback к следующему уровню приоритета; Bootstrap не блокируется.

Schema version `1` остаётся читаемой. Смена product default не переписывает существующие project/initiative preferences; optional scenario metadata может быть только additive. «Форсаж» нельзя сохранять как `interaction_mode`, `explanation_mode` или project default.

#### Неподавляемые сообщения

Независимо от комбинации явно сообщай смысл Candidate status, требуемые Human Gates и Admission Requests, authority и scope changes, начало consequential action, critical risks, honest stop и limitations. `compact` не может скрывать эти сообщения. Сам термин `Candidate` в ordinary presentation необязателен по правилу ниже. `detailed` не требует chain of thought, внутреннего анализа или описания микроопераций; повторяющиеся действия одного типа группируются.

#### Human-friendly, engineering и Runtime/Audit levels

Обычный human-friendly уровень применяется по умолчанию независимо от `interaction_mode`: сначала понятный статус, этапы по применимости, роль человека в текущем вопросе, существенные основания/риски/ограничения, последствия и варианты. Internal IDs, hashes, guards, coverage codes и полная Runtime mechanics остаются внутри либо в service detail, пока не нужны для решения, диагностики или аудита.

Слово `Candidate` не обязательно в ordinary presentation. Обязателен его смысл: если результат предварительный, не проверен или не допущен к reliance, скажи это обычным языком, назови ещё требуемую проверку/решение и запрет преждевременного использования. Human-friendly упрощение никогда не скрывает uncertainty, limitation, authority boundary, prohibited effect или иной факт, способный существенно изменить решение человека.

Engineering level добавляет architecture, trace, review questions, configuration delta и Verification evidence. Runtime/Audit level добавляет exact terms, IDs/statuses, hashes, full source/currentness, guards и effect records. Все три являются derived projections одной exact engineering state; смена уровня не изменяет source, status, authority, Verification или Admission. Markers: `ordinary_human_friendly_default_projection | candidate_term_optional_meaning_mandatory | engineering_projection_same_runtime_state | audit_projection_same_runtime_state | material_decision_information_never_hidden`.

#### Проекция Decision UI

Существенное Bootstrap-решение представляется прежде всего в чате по `WPC-06` из `WORKING_PROCESS_AND_LOOPS_GUIDE.md`: выбери применимый `DI-01`—`DI-08`, используй понятный заголовок ситуации, одну exact Candidate configuration, русскоязычную `Рекомендация`, основания/риски/ограничения, видимые разрешённые и запрещённые последствия и единый блок `Варианты решения`. Первый пункт `Принять рекомендованный вариант` повторяет точное действие и последствие; применимые альтернативы остаются равноправно видимыми. При первой существенной ссылке назови carrier/result понятным названием вместе с exact ID и полезной ссылкой; в подтверждении решения и handoff повтори то же название вместе с exact ID, а не только ID или filename. Optional adjacent `.md` хранит подробные основания той же configuration, когда они нужны для review или восстановления. Для `DI-05 Risk` сохраняй accountable risk owner и reopen trigger; clarification является cross-class response state, а не девятой interaction. После решения подтверди outcome/configuration, вновь разрешённые и по-прежнему запрещённые effects, actor/date when available, ссылку на decision record, условия и следующий/reopen route. Текст сохраняет смысл без цвета или rich UI, а двусмысленный ответ не создаёт authority. Markers: `applicable_decision_options | recommended_option_exact_effect | decision_confirmation_effects`.

### 7.5. Optional model-guidance offer

При старте новой инициативы агент может один раз предложить помощь в выборе конфигурации моделей:

> Если хотите, после уточнения задачи я помогу выбрать конфигурацию моделей — максимальную, оптимальную или бюджетную — с учётом сложности, рисков и стоимости. Это необязательно и не блокирует Bootstrap.

Это optional offer, а не второй содержательный adaptive question и не обязательное preference-интервью. Отказ, молчание или недоступность выбора в host не задерживают переход `not_started → in_discovery`. Не повторяй offer, если пользователь отказался, уже задал конфигурацию или для инициативы существует admitted Model Assignment.

Если пользователь согласился, сначала продолжи discovery. После достаточного понимания scope, риска, privacy, бюджета и реально доступных моделей сначала рекомендуй категорию `максимальная`, `оптимальная` или `бюджетная`, одно предложение rationale, главный trade-off и escalation trigger. Exact models, роли, effort и pricing показывай только по запросу или когда они нужны для material Working Process/Loop decision; тогда подготовь Candidate Model Assignment по `MODEL_SELECTION_RECOMMENDATIONS.md`. Не обещай переключение, которого host не предоставляет; сообщи limitation и допустимый fallback.

Model Assignment не входит в presentation preferences и не хранится в `project/INTERACTION_PREFERENCES.yaml`. Он не изменяет authority, Verification, Human Gates, Admission или honest stop.

Behavioral invariant: optional offer; one substantive adaptive question; no Bootstrap blocking.

---

## 8. Первое сообщение агента

Первое сообщение использует единственную canonical Markdown form из `7.4 Default и первый вход`. Не дублируй второй greeting template и не показывай internal mode variables/combinations, intent menu, CAP/«Форсаж», persistence controls, internal IDs/status values/guards или model-selection offer до содержательной задачи.

Сообщение не задаёт mode/intent interview; оно предлагает описать задачу, указывает точное место материалов и объясняет следующий new/re-entry outcome. Plain Markdown является полной формой; host-specific graphical onboarding не проектируется и не обещается. Markers: `ordinary_task_first_greeting | greeting_internal_variables_hidden | greeting_engineering_details_on_demand | greeting_forsage_triggered_only`.

Не перегружай первое сообщение:

- полным описанием DPF;
- длинным перечнем терминов;
- полной анкетой;
- обязательным выбором модели до понимания scope;
- структурой всех будущих файлов;
- обещанием автоматического выполнения всей работы.

---

## 9. Authority

### 9.1. Базовое распределение

По умолчанию:

- агент организует Bootstrap;
- агент формирует Candidate Work Context;
- Initiator предоставляет сведения и материалы;
- Initiator проверяет интерпретацию;
- пользователь утверждает Work Context, если не назначена иная authority;
- выбор Entry Route требует явного решения;
- отсутствие возражений не считается утверждением.

### 9.2. Явное утверждение

Допустимые формы:

```text
Да, всё верно.
Утверждаю этот контекст.
Принимаю контекст и начинаем по первому варианту.
Да, запускай рекомендованный маршрут.
```

В Lite-режиме одна явная фраза может одновременно:

- утвердить Work Context;
- утвердить Entry Route;
- разрешить передачу в следующий исполнительский контур.

### 9.3. Ограничение authority агента

Агент не должен:

- считать собственное резюме утверждённым;
- назначать пользователя admission authority без проверки;
- принимать существенные project decisions молча;
- подменять неизвестные факты допущениями;
- выбирать irreversible route без согласования;
- начинать consequential work до admission контекста.

---

## 10. Режимы Bootstrap

Bootstrap поддерживает три режима:

```text
Lite
Standard
Extended
```

Агент предварительно выбирает режим и кратко объясняет выбор.

Пользователь может изменить режим.

### 10.1. Lite

Применяется, когда:

- задача локальна;
- scope понятен;
- источников мало;
- последствия ошибки ограничены;
- authority проста;
- ожидается один bounded result.

Типовой маршрут:

```text
короткое интервью
→ краткое резюме
→ WORK_CONTEXT.md
→ явное утверждение
→ Entry Decision
```

### 10.2. Standard

Применяется для:

- нового проекта;
- значимой инициативы;
- разработки требований;
- архитектурной работы;
- нескольких источников;
- нескольких stakeholders;
- выбора между несколькими Entry Routes.

Типовой маршрут:

```text
интервью
→ source intake
→ first summary
→ draft Work Context
→ уточнение
→ варианты входа
→ admission
→ Entry Decision
```

### 10.3. Extended

Применяется, когда:

- система сложная;
- последствия ошибки существенны;
- работа регулируемая;
- authority распределена;
- источники конфликтуют;
- имеются подсистемы и внешние системы;
- необходимы risk, safety, security или compliance considerations;
- требуется отдельный readiness review.

Extended может включать:

- stakeholder mapping;
- authority analysis;
- source assessment;
- system boundary analysis;
- consequence profile;
- risk framing;
- baseline identification;
- отдельную verification Work Context;
- formal Admission Record.

---

## 11. Варианты входа

Bootstrap не должен предполагать один универсальный маршрут.

Он анализирует ситуацию и предлагает подходящие Entry Routes.

### 11.1. Interview-first

Используется, когда есть идея или потребность, но мало материалов.

```text
интервью
→ формирование первичного контекста
→ определение требуемых источников
```

### 11.2. Source-first

Используется, когда имеются документы, код, схемы, отчёты или иные материалы.

```text
source intake
→ классификация материалов
→ извлечение исходного контекста
→ интервью по пробелам
```

### 11.3. Problem-first

Используется, когда известна боль, но решение не определено.

```text
problem framing
→ affected stakeholders
→ consequences
→ desired change
→ solution-neutral entry
```

### 11.4. Concept-first

Используется для формирования концепции продукта, системы или инициативы.

```text
idea
→ intended outcome
→ users
→ value
→ boundaries
→ concept artifact
```

### 11.5. Existing-system assessment

Используется для входа в существующий проект или систему.

```text
existing state
→ sources and repositories
→ architecture and process assessment
→ gaps
→ entry options
```

### 11.6. Requirements-first

Используется, когда основной результат — требования.

```text
sources and stakeholders
→ requirement scope
→ requirement development route
```

### 11.7. Architecture-first

Используется, когда сначала требуется определить:

- систему интереса;
- границы;
- уровни;
- интерфейсы;
- архитектурные drivers;
- варианты решения.

Этот Entry Route означает раннее ограничение shared, consequential и hard-to-reverse решений до dependent commitments. Он не означает завершение всего design до feedback, universal stage order, полную physical schema freeze или запрет vertical slices. Lifecycle и exact Working Process проектируются downstream по `WORKING_PROCESS_AND_LOOPS_GUIDE.md`.

### 11.8. Bounded pilot entry

Используется, когда общий контекст достаточно понятен, но полный процесс пока преждевременен.

```text
minimal Work Context
→ Candidate minimal Working Process
→ Candidate bounded pilot Loop
→ explicit process approval
→ Task and Run
→ evidence
→ process review
```

В текущем Runtime `start_bounded_pilot_loop` не создаёт исключения из операционной иерархии. Если применимого approved Working Process нет, сначала представь минимальную process map и Loop contract по `WORKING_PROCESS_AND_LOOPS_GUIDE.md`. Entry Decision не заменяет их process approval.

### 11.9. Honest stop

Используется, когда:

- невозможно определить scope;
- нет необходимых источников;
- отсутствует authority;
- конфликтующие цели не разрешены;
- последствия ошибки неприемлемы;
- пользователь пока не готов принимать Entry Decision.

---

## 12. Адаптивное интервью

### 12.1. Принцип

Не выдавай полную анкету сразу.

Работай небольшими блоками:

```text
1–2 вопроса
→ ответ
→ адаптация следующего вопроса
→ периодическое резюме
```

### 12.2. Основные области интервью

Агент должен получить минимально достаточное понимание следующих областей.

#### Исходный импульс

- Что привело к инициативе?
- Это проблема, возможность, обязательство или идея?
- Почему работа нужна сейчас?
- Что произойдёт, если ничего не менять?

#### Intended Outcome

- Что должно появиться или измениться?
- Какой результат ожидается?
- Кто будет им пользоваться?
- Как будет понятно, что работа принесла пользу?

#### System of Interest

- Что является системой интереса?
- Где её границы?
- Что входит в scope?
- Что явно не входит?
- Есть ли надсистема, подсистемы и внешние системы?

#### Receiving Use

- Где будет использоваться результат?
- Кто первым будет на него опираться?
- Какое решение или действие он поддержит?

#### Sources

- Какие материалы уже существуют?
- Где они находятся?
- Какие из них authoritative?
- Какие являются draft, example, assumption или historical artifact?

#### Stakeholders and Authority

- Кто инициатор?
- Кто принимает решения?
- Кто владеет предметной областью?
- Кто проверяет?
- Кто может допустить результат к использованию?

#### Constraints

- сроки;
- бюджет;
- технологии;
- организационные ограничения;
- нормативные требования;
- security;
- safety;
- compatibility;
- доступность людей и данных.

#### Current State

- существует ли уже система;
- существует ли код;
- существуют ли требования;
- существует ли архитектура;
- есть ли действующий процесс;
- что уже было сделано;
- что считается baseline.

#### Desired Mode

- исследование;
- быстрый pilot;
- формальная разработка;
- восстановление документации;
- исправление существующей системы;
- полный lifecycle.

### 12.3. Язык интервью

Не требуй от пользователя терминов:

```text
system of interest
receiving use
admission authority
bounded scope
```

Задавай понятные вопросы, а профессиональные термины используй в итоговом Work Context.

### 12.4. Инженерные представления — только по полезному триггеру

Не добавляй universal diagram interview. При material engineering object, аудитории/решении или repeated receiving use заранее предложи обычным языком полезное представление и назови, перед каким first relying decision оно понадобится; до этого раннее предложение само по себе работу не блокирует. При отсутствии trigger продолжай без catalogue/profile ceremony.

Первое применение по умолчанию локально. При повторном или cross-team receiving use один раз предложи explicit project persistence; silence ничего не закрепляет. Authority, first relying use и Human Gate остаются в Working Process, а вся selection/content/source/freshness/confidentiality mechanics находится в [`catalog/engineering_views/README.md`](catalog/engineering_views/README.md). Разработчик не обязан знать notation или служебные `EV-*`/strength codes.

---

## 13. Source Intake

### 13.1. Каталог источников

По умолчанию исходные материалы размещаются в:

```text
project/source/
```

Не создавай конкурирующий каталог `project/sources/`.

Если пользователь определил иной project root или каталог источников, используй его.

### 13.2. Действия агента

При наличии источников:

1. сообщи точный путь размещения;
2. найди существующие файлы;
3. исключи scaffold markers, включая `.gitkeep`, из source inventory;
4. идентифицируй содержательные источники;
5. не изменяй оригиналы;
6. сохрани provenance;
7. классифицируй состояние;
8. отдели source statements от интерпретаций;
9. зафиксируй пробелы и конфликты.

### 13.3. Классификация источников

Рекомендуемые статусы:

```text
authoritative
approved
working
draft
historical
example
reference
unknown
superseded
conflicting
```

### 13.4. Отсутствие источников

Отсутствие файлов не блокирует Bootstrap.

Work Context может быть основан на интервью, если явно указано:

- какие сведения предоставлены Initiator;
- что не подтверждено документами;
- какие утверждения являются assumptions;
- какие источники потребуются позже.

Не допускай превращения неподтверждённого интервью в ложный authoritative baseline.

### 13.5. Конфликт источников

Конфликт источников не разрешается агентом молча и не всегда останавливает весь Bootstrap.

- идентифицируй конфликтующие source statements, версии, loci и заявленную authority;
- отдели сам конфликт от частей Work Context, которые от него не зависят;
- продолжай формирование bounded Candidate Work Context, если границы зависимости и uncertainty восстанавливаемы;
- не допускай consequential reliance на спорный claim до решения уполномоченной стороны;
- используй Extended mode для material authoritative conflict;
- используй `honest_stop`, если конфликт нельзя ограничить, отсутствует resolution authority или невозможно выбрать безопасный Entry Route.

---

## 14. Первое содержательное резюме

Draft не создаётся после каждого ответа.

После того как получено минимально достаточное понимание, агент должен представить первое содержательное резюме.

Оно включает:

- исходную потребность;
- предполагаемый intended outcome;
- систему интереса;
- предварительный scope;
- известные источники;
- ключевых участников;
- ограничения;
- assumptions;
- open questions;
- вероятный режим Bootstrap;
- возможные Entry Routes.

После проверки этого резюме может быть создан draft Work Context.

---

## 15. Work Context

### 15.1. Минимальное содержание

Work Context должен включать:

- идентификатор;
- status;
- название инициативы;
- Initiator;
- initial need;
- pain or opportunity;
- intended outcome;
- system of interest;
- level of consideration;
- in scope;
- out of scope;
- receiving use;
- first relying use;
- sources;
- current state;
- stakeholders;
- authority;
- применимые established participant facts: responsibility, product accountability scope, review competence basis/currentness, Admission authority scope и availability/route — только когда они нужны текущему context;
- constraints;
- assumptions;
- open questions;
- consequence profile;
- proposed Entry Routes;
- recommended Entry Route;
- admission status.

### 15.2. Work Context не является

Work Context не является автоматически:

- полным Project Charter;
- ТЗ;
- набором требований;
- архитектурой;
- Working Process;
- планом проекта;
- Loop;
- Task;
- Run.

Он должен быть достаточным для выбора следующего управляемого маршрута.

---

## 16. Хранение Work Context

### 16.1. Lite-режим

Для одной небольшой инициативы:

```text
project/artifacts/WORK_CONTEXT.md
```

### 16.2. Несколько инициатив

Для проекта с несколькими инициативами:

```text
project/artifacts/
├── WORK_CONTEXT_REGISTER.md
└── work_contexts/
    ├── WC-001_PRODUCT_INITIATION.md
    ├── WC-002_REQUIREMENTS.md
    └── WC-003_ARCHITECTURE.md
```

### 16.3. Переход между режимами

Если один `WORK_CONTEXT.md` перестал быть достаточным:

1. не создавай второй competing root context;
2. предложи переход к реестру;
3. сохрани связь с исходным контекстом;
4. назначь идентификаторы;
5. зафиксируй migration decision.

---

## 17. Шаблон `WORK_CONTEXT.md`

```markdown
# Work Context

## Identification

- ID:
- Title:
- Status:
- Bootstrap Mode:
- Date:
- Version:

## Initiator

## Initial Need

## Pain or Opportunity

## Intended Outcome

## System of Interest

## Level of Consideration

## In Scope

## Out of Scope

## Receiving Use

## First Relying Use

## Existing State

## Sources

| Source | Location | Status | Authority | Notes |
|---|---|---|---|---|

## Stakeholders

| Stakeholder | Role | Interest | Authority | Availability |
|---|---|---|---|---|

## Constraints

## Consequence Profile

## Assumptions

## Open Questions

## Candidate Entry Routes

## Recommended Entry Route

## Interaction Preference Reference

- Project preference carrier: `project/INTERACTION_PREFERENCES.yaml` или `not_created`
- Initiative override: Work Context ID или `none`

Этот раздел содержит только ссылку на mutable preference overlay. Значения настроек не входят в admission boundary Work Context.

## Verification Performed

## Admission

- Decision:
- Decision Authority:
- Conditions:
- Date:

## Change History
```

---

## 18. Шаблон `WORK_CONTEXT_REGISTER.md`

```markdown
# Work Context Register

| ID | Initiative | Status | System of Interest | Intended Outcome | Entry Route | Current Process | Owner |
|---|---|---|---|---|---|---|---|
```

Дополнительные поля:

- parent initiative;
- related contexts;
- last review;
- next decision;
- archived status;
- superseded by.

---

## 19. Review и Admission Work Context

### 19.1. Представление Candidate Work Context

До admission агент обязан представить пользователю:

- краткое понимание инициативы;
- границы;
- intended outcome;
- first relying use;
- sources;
- assumptions;
- open questions;
- consequence profile;
- возможные Entry Routes;
- рекомендуемый маршрут и основания.

### 19.2. Verification

Verification Candidate Work Context может включать:

- сверку с сообщениями Initiator;
- сверку с источниками;
- проверку непротиворечивости;
- проверку scope;
- проверку authority;
- проверку пригодности для выбора Entry Route;
- проверку отделения facts от assumptions;
- проверку наличия open questions;
- независимый review для Extended-режима.

### 19.3. Admission status

Используй явные статусы:

```text
admitted
rejected
returned_for_refinement
deferred
```

Не используй неопределённое `готово`.

`honest_stop` фиксирует невозможность или преждевременность продолжения Bootstrap Session. Он не заменяет решение admission authority.

### 19.4. Условия Admission

Work Context может быть admitted с условиями.

Примеры:

- подтвердить authority до consequential work;
- получить недостающий источник;
- ограничить pilot конкретной подсистемой;
- не использовать неподтверждённые сведения как baseline;
- провести отдельный risk review.

Условия должны быть явно переданы downstream process.

### 19.5. Отсутствие возражений

Отсутствие возражений, продолжение разговора или предоставление дополнительных материалов не считаются admission.

---

## 20. Entry Decision

### 20.1. Назначение

Entry Decision определяет, как Admitted Work Context будет передан в дальнейшую работу.

### 20.2. Возможные решения

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

Недоступный или неинтегрированный внешний процесс не может быть выбран как Entry Route.

### 20.3. Требования к Entry Decision

Entry Decision должен содержать:

- идентификатор Work Context;
- выбранный Entry Route;
- основания выбора;
- альтернативы;
- ограничения;
- required authority;
- первый ожидаемый инженерный результат;
- первый proposed bounded scope;
- expected downstream concern/result coverage и independently relied-on results;
- decision-relevant inputs для последующего `FC-13`: последствия ошибки, обратимость, применимые system/lifecycle/source constraints и first relying use;
- возможные reference components либо явный non-use как вход для Working Process, но не как окончательный профиль выбора;
- known architecture/data/state/integration/transition commitment triggers;
- current data/baseline reliance state, если применимо;
- следующий Human Gate;
- дату и decision authority.

### 20.4. Entry Decision не создаёт Working Process

Выбор маршрута не означает, что Working Process уже существует.

После Entry Decision применяй `WORKING_PROCESS_AND_LOOPS_GUIDE.md`.

---

## 21. Шаблон `ENTRY_DECISION.md`

```markdown
# Entry Decision

## Identification

- Work Context ID:
- Decision ID:
- Date:
- Status:

## Selected Entry Route

## Rationale

## Alternatives Considered

## First Expected Engineering Result

## Proposed Initial Scope

## Applicable Existing Process

## Required Process Changes

## Required Authority

## Constraints and Conditions

## Downstream Concern/Result Handover

- Material concerns/results expected for the declared scope:
- Independently relied-on results and first relying uses:
- DPF profile inputs: consequence, reversibility, system/lifecycle/source applicability:
- Known dependencies/shared assumptions:
- Candidate composition inputs, optional reference options or explicit non-use (not a final selection):
- Potential Commitment Guard triggers:
- Data/baseline reliance state:
- Integration/system-property responsibility:
- Deferred/omitted/not-applicable items and reopen triggers:

## Next Human Gate

## Decision

- Decision:
- Decision Authority:
- Date:
```

В Lite-режиме Entry Decision может быть разделом внутри `WORK_CONTEXT.md`.

---

## 22. Новая инициатива внутри действующего проекта

### 22.1. Обнаружение

Признаки новой инициативы:

- новый intended outcome;
- новая system of interest;
- новый receiving use;
- новый stakeholder set;
- новая authority;
- другой consequence profile;
- отдельный набор источников;
- необходимость иного Working Process;
- изменение scope, которое нельзя считать обычной Task.

### 22.2. Поведение агента

Агент должен:

1. показать, почему запрос может быть новой инициативой;
2. не включать его молча в текущий Work Context;
3. предложить отдельный Bootstrap;
4. указать предполагаемую связь с существующим проектом;
5. после согласия создать новый Candidate Work Context.

### 22.3. Связи между контекстами

Фиксируй:

- parent initiative;
- related Work Contexts;
- shared sources;
- shared stakeholders;
- upstream decisions;
- affected Working Processes;
- integration implications.

### 22.4. Отказ от нового Bootstrap

Если после анализа выясняется, что запрос полностью покрывается действующим контекстом, зафиксируй:

```text
existing context remains applicable
```

и продолжай существующий Working Process.

---

## 23. Структура каталогов

Рекомендуемая общая структура:

```text
/
├── AGENTS.md
├── ENGINEERING_WORK_BOOTSTRAP_GUIDE.md
├── WORKING_PROCESS_AND_LOOPS_GUIDE.md
├── AI_SDLC_DPF/
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

Не создавай все элементы заранее.

Создавай только необходимые carriers.

---

## 24. Передача в Working Process

### 24.1. Handover package

Минимальная передача содержит:

- Admitted Work Context;
- Entry Decision;
- идентифицированные источники;
- known constraints;
- authority;
- assumptions;
- open questions;
- conditions of admission;
- proposed first result;
- material concerns/results expected downstream и their first relying uses;
- decision-relevant inputs для `FC-13`: последствия ошибки, обратимость и применимость system/lifecycle/source concerns;
- known shared assumptions/dependencies;
- candidate composition inputs, optional reference options or explicit non-use без подмены последующего выбора;
- potential architecture/data/integration/transition guard triggers;
- current data/baseline reliance state and reopen conditions.

Bootstrap передаёт known concerns, `FC-13` inputs и triggers, но не проектирует lifecycle, полный project-specific result map, PEC topology или Loop map вместо Working Process authority.

### 24.2. Передача в существующий Working Process

Проверь:

- охватывает ли процесс новый Work Context;
- существует ли подходящий Loop;
- не изменился ли receiving use;
- не требуется ли новая authority;
- не нарушаются ли scope и side-effect boundaries.
- охватывает ли admitted process downstream material concerns/results без broad-name proxy;
- изменились ли shared assumptions, data reliance, interfaces или system properties, требующие Process Review.

### 24.3. Передача в новый Working Process

Если существующего процесса недостаточно:

1. используй `WORKING_PROCESS_AND_LOOPS_GUIDE.md`;
2. передай downstream concern/result handover, decision-relevant `FC-13` inputs и known guard triggers;
3. потребуй применения `WPC-01`–`WPC-09`: DPF-first selection, расширение project-relevant coverage до сокращений и явное представление решений;
4. передай Working Process authority проектирование lifecycle, result map, reference composition и Loop map;
5. получи явное решение пользователя по Candidate Working Process и предлагаемым сокращениям;
6. только после этого создавай процессные файлы.

### 24.4. Передача в bounded pilot Loop

Допускается, если:

- Work Context admitted;
- первый result определён;
- receiving use понятен;
- последствия ошибки ограничены;
- существует применимый approved Working Process либо представлена его минимальная Candidate map;
- Loop существует или представлен как Candidate и может быть явно утверждён;
- material concerns/results для pilot scope disposition, а broad Loop name не считается coverage;
- shared persistence/interface/system-property/baseline triggers переданы для проверки до consequential commitment;
- verification и admission определены.

Если Working Process или Loop ещё не утверждены, установи Handover `candidate_process_pending_approval`. Не создавай process files и не начинай Run до explicit process authority decision.

---

## 25. Stop Conditions и Honest Return

Bootstrap должен остановиться, если продолжение невозможно безопасно ограничить, в частности когда:

- пользователь не может определить исходную потребность;
- отсутствует доступ к критическим источникам;
- material authoritative sources конфликтуют, а зависимость нельзя ограничить или отсутствует resolution authority;
- невозможно определить system of interest;
- authority не установлена;
- цели stakeholders несовместимы;
- requested work выходит за допустимые границы;
- последствия ошибки требуют unavailable assurance;
- пользователь не готов утвердить Work Context;
- нельзя обоснованно выбрать Entry Route.

При остановке агент должен вернуть:

- что удалось установить;
- что осталось неизвестным;
- почему продолжение небезопасно или преждевременно;
- какие сведения или решения требуются;
- какой return route возможен.

Не маскируй honest stop под завершённый Bootstrap.

---

## 26. Возврат и повторный вход

Bootstrap может быть продолжен после honest stop.

При повторном входе:

1. найди последний Candidate Work Context;
2. проверь актуальность источников;
3. проверь изменения assumptions;
4. обнови open questions;
5. не начинай интервью с нуля без необходимости;
6. представь пользователю восстановленное состояние;
7. продолжи с ближайшего unresolved decision.

---

## 27. Изменение admitted Work Context

Admitted Work Context не считается неизменным навсегда.

Его пересмотр требуется, если:

- изменился intended outcome;
- изменилась system of interest;
- изменился scope;
- появился новый authoritative source;
- изменилась authority;
- Entry Route оказался непригоден;
- последствия ошибки стали выше;
- downstream process выявил существенную ошибку контекста;
- инициатива разделилась на несколько;
- несколько инициатив объединяются.

Не изменяй admitted context молча.

Для существенного изменения:

1. создай новую Candidate revision;
2. укажи причину;
3. выполни impact analysis;
4. повтори Review;
5. получи новое Admission Decision;
6. обнови связанные Entry Decisions и Working Processes.

---

## 28. Минимальный режим

Для небольшой инициативы достаточно одного carrier:

```text
project/artifacts/WORK_CONTEXT.md
```

В нём могут быть объединены:

- краткий discovery summary;
- Candidate Work Context;
- Admission;
- Entry Decision.

Это допустимо, если:

- риск невысок;
- одна initiative;
- authority проста;
- контекст остаётся понятным;
- admission явно зафиксирован;
- Entry Route однозначен.

Не создавай тяжёлую документную систему без необходимости.

---

## 29. Extended-режим

Для сложной или регулируемой инициативы могут потребоваться:

```text
project/artifacts/
├── WORK_CONTEXT_REGISTER.md
├── work_contexts/
│   └── WC-001_*.md
├── SOURCE_REGISTER.md
├── STAKEHOLDER_MAP.md
├── AUTHORITY_MAP.md
├── SYSTEM_CONTEXT.md
├── ASSUMPTIONS_AND_OPEN_QUESTIONS.md
├── CONSEQUENCE_PROFILE.md
└── ENTRY_DECISION.md
```

Это не обязательный комплект.

Каждый carrier должен иметь обоснованный receiving use.

---

## 30. Критерий готовности Candidate Work Context

Candidate Work Context готов к Review, когда:

- исходная потребность понятна;
- intended outcome сформулирован;
- system of interest определена;
- уровень рассмотрения указан;
- in scope и out of scope различены;
- receiving use понятен;
- first relying use известен или явно открыт;
- источники идентифицированы;
- факты отделены от assumptions;
- stakeholders и authority определены в достаточной степени;
- ограничения зафиксированы;
- open questions перечислены;
- варианты входа сформированы;
- рекомендация объяснена.

---

## 31. Критерий готовности Admitted Work Context

Work Context готов к downstream use, когда:

- Candidate Work Context представлен authority;
- выполнена достаточная verification;
- известные ограничения прозрачны;
- admission status явный;
- conditions of admission записаны;
- Entry Decision имеет отдельный статус `pending`, `selected` или `deferred`;
- first relying use указан;
- нет скрытого расширения scope;
- отсутствующие данные не представлены как факты.

---

## 32. Критерий готовности Entry Decision

Entry Decision готов, когда:

- выбран один основной маршрут;
- основания выбора понятны;
- альтернативы рассмотрены;
- первый ожидаемый результат определён;
- initial bounded scope определён;
- required authority известна;
- следующий Human Gate указан;
- ограничения и условия переданы downstream;
- expected material concern/result coverage и first relying uses переданы downstream;
- known shared assumptions, data reliance, integration и transition triggers не скрыты;
- explicit non-use/defer имеет reopen route;
- пользователь явно согласовал решение.

---

## 33. Quality Checklist

Перед завершением Bootstrap проверь:

- новая ли это инициатива;
- выбран ли корректный Bootstrap mode;
- агент кратко объяснил свою роль;
- интервью было адаптивным;
- пользователь не был перегружен терминологией;
- draft создан после содержательного резюме;
- source intake выполнен;
- provenance сохранён;
- facts отделены от assumptions;
- system of interest определена;
- scope ограничен;
- receiving use понятен;
- authority определена;
- Candidate Work Context представлен;
- admission явный;
- Entry Routes предложены;
- Entry Decision принят;
- handover package сформирован;
- downstream concerns/results и independently relied-on results обозначены;
- known architecture/data/integration/transition guard triggers переданы;
- minimal map не представлен как coverage proof;
- downstream Guide указан;
- open questions не скрыты;
- honest stop использован при необходимости;
- не создано лишних файлов.

---

## 34. Формат ответа агента

### 34.1. На старте

Агент кратко сообщает:

1. применимую presentation-настройку или default;
2. кто он;
3. для чего предназначен Bootstrap;
4. почему он запускается;
5. optional model-guidance offer, если он применим;
6. какой первый содержательный вопрос требуется.

Preference notice и optional model-guidance offer не являются дополнительными содержательными вопросами и не блокируют начало discovery.

### 34.2. Во время интервью

Агент:

- задаёт 1–2 вопроса;
- отражает существенные выводы;
- указывает допущения;
- сообщает, когда контекста достаточно для первого summary.

### 34.3. При первом summary

Агент показывает:

- понимание потребности;
- intended outcome;
- границы;
- sources;
- assumptions;
- open questions;
- рекомендуемый режим;
- Candidate Model Assignment, если пользователь принял offer и scope уже достаточен;
- возможные Entry Routes.

### 34.4. Перед Admission

Агент показывает Candidate Work Context или Entry Decision как структурированный документ: подписывает смысловые блоки, отделяет основания, риски, ограничения и последствия, затем показывает `Рекомендация` и единый блок `Варианты решения` с точными действиями и последствиями (`WPC-06`). Первая и повторная relying reference сохраняют одно понятное название вместе с exact ID; filename/path остаётся служебной деталью.

Пользовательские заголовки и поясняющий текст формулируются прежде всего по-русски (`WPC-07`). Точные системные термины, идентификаторы, статусы, пути и цитаты сохраняются, когда перевод меняет системный смысл; обычный пояснительный English переводится по смыслу. Marker: `interaction_clarity_russian_first`.

Bootstrap подготавливает достаточные входы для последующей DPF-first composition (`WPC-01`), но не выбирает Working Process вместо его process authority.

### 34.5. После Admission

Агент сообщает:

- что принято;
- какой Entry Route выбран;
- какой следующий исполнительский шаг предлагается;
- какой Guide или Working Process применяется дальше.

### 34.6. Применение presentation-настроек

- `guided` добавляет смысл этапа, последствия решений и объяснение следующего перехода;
- `standard` сохраняет рабочий баланс без необязательного обучения;
- `compact` оставляет только необходимый контекст, результат, ограничение и решение;
- `detailed` поясняет группы внешне значимых действий;
- `milestone` поясняет state transitions, decisions, gates и ключевые результаты.

Во всех комбинациях Candidate, authority, gate, risk и limitation остаются явными.

### 34.7. Progress и completion

При существенном изменении этапа, после Human Gate, перед handoff или по прямому запросу показывай `Этапы работы`: одна полезная строка на этап, `✅` завершено, `🔄` выполняется, `⏳` ожидается, `↩️` возвращено, `⛔` заблокировано. Текст сохраняет смысл без emoji. Не повторяй неизменившийся блок и не показывай его для простой одношаговой работы; существенные `Открытые вопросы` и ближайший Human Gate указывай отдельно. Не подменяй наблюдаемое состояние процентом готовности. Различай завершение Task, Run, Loop, Admission baseline и всей initiative. `Mission Complete!` допустимо только когда admitted intended outcome существует и весь required scope завершён либо явно disposed; Candidate, passing check, закончившийся Run или exhausted budget этого статуса не создают. После initiative completion можно отдельно предложить optional Post-Initiative Lessons Review, но не выполнять его без explicit consent. Marker: `work_stages_generated`.

Progress Projection выводится из admitted Working Process и factual Loop/Task/Run/Decision records, а не из chat memory или отдельного progress store. После Gate покажи outcome и следующий authorized stage. При deterministic re-entry восстанови recognizable completed/current/remaining map; при reopen верни affected stage с причиной, сохранив unaffected history. Если process map изменилась, покажи понятный before/after meaning. Projection не предоставляет authority и не заменяет exact carriers. Marker: `progress_projection_gate_reentry_reopen_continuity`.

---

## 35. Default Workflow

Если иной порядок не определён:

```text
получить первое сообщение
→ проверить состояние репозитория
→ определить, требуется ли Bootstrap
→ разрешить presentation preferences или применить default без блокировки
→ кратко представиться
→ определить тип инициативы
→ выбрать предварительный Bootstrap mode
→ провести адаптивное интервью
→ выполнить source intake
→ представить первое содержательное резюме
→ создать draft Work Context
→ уточнить context
→ сформировать Candidate Work Context
→ предложить Entry Routes
→ рекомендовать Entry Route
→ выполнить Review
→ получить Admission Decision
→ получить Entry Decision
→ сформировать handover package
→ передать работу в WORKING_PROCESS_AND_LOOPS_GUIDE
→ найти или предложить Working Process
→ найти или предложить первый bounded Loop
```

---

## 36. Связь с `AGENTS.md`

`AGENTS.md` должен содержать короткий обязательный trigger:

```markdown
При первом взаимодействии проверь состояние Engineering Work Bootstrap.

Если для текущей инициативы отсутствует admitted Work Context,
кратко представь назначение bootstrap-модуля и самостоятельно
начни адаптивное discovery-интервью.

Если пользователь начинает новую инициативу внутри действующего проекта,
предложи отдельный Bootstrap и кратко объясни его назначение.

Пользователь не обязан знать специальную команду запуска.

Не начинай основную инженерную работу до представления и явного
утверждения Candidate Work Context и Entry Decision.

Подробные правила определены в
`ENGINEERING_WORK_BOOTSTRAP_GUIDE.md`.
```

`AGENTS.md` не должен дублировать подробную механику этого Guide.

---

## 37. Антипаттерны

Не допускай следующих сценариев.

### 37.1. Мгновенный старт работы

```text
неструктурированная идея
→ немедленное создание требований или кода
```

Без согласованного Work Context это создаёт риск работы не над той задачей.

### 37.2. Полная анкета первым сообщением

Длинный опрос ухудшает onboarding и заставляет пользователя заранее структурировать то, что должен помочь структурировать Bootstrap.

### 37.3. Создание полного проекта из одного сообщения

Не превращай первичную формулировку в:

- утверждённую концепцию;
- полный scope;
- архитектуру;
- backlog;
- Working Process

без Review и Admission.

### 37.4. Молчаливое расширение текущей инициативы

Новый intended outcome не должен автоматически включаться в существующий Work Context.

### 37.5. Bootstrap ради Bootstrap

Не запускай полный Standard или Extended Bootstrap для каждой маленькой Task.

### 37.6. Формальная документация без receiving use

Не создавай registers, maps и reports только потому, что они перечислены в Guide.

### 37.7. Подмена authority

Агент не становится project owner или admission authority из-за того, что он организует Bootstrap.

---

## 38. Главная формула

```text
Engineering Work Bootstrap
— управляемый вход в новую инженерную работу.

Initiator
— человек, который приносит исходную потребность или намерение начать работу.

Work Context
— согласованное описание того, над чем и зачем ведётся работа.

Candidate Work Context
— ещё не утверждённое понимание инициативы.

Admission
— явное решение о допустимости использования Work Context.

Entry Route
— возможный способ продолжения работы.

Entry Decision
— явный выбор дальнейшего рабочего маршрута.

Admitted Work Context
+ Entry Decision
→ основание для создания или выбора Working Process.

Агент
— организатор Bootstrap и автор Candidate Work Context,
но не источник authority.
```
