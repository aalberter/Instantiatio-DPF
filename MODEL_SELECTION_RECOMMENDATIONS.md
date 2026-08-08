# Рекомендации по выбору LLM для Engineering Work Kit

> Recommendation version: `1.0.0`
> Status: `admitted_informative_guidance`
> Evidence snapshot: `2026-08-02`
> Scope: agent-enabled engineering work с применением Instantiatio DPF — Engineering Work Kit
> Receiving use: выбор Candidate Model Assignment для Working Process, Loop, Task или Run
> Language/encoding: русский, UTF-8

## TL;DR

Для работы по Kit важна не одна «лучшая модель», а композиция ролей: сильная модель ведёт требования, архитектуру и решения с большим последействием; более экономичная выполняет bounded implementation; независимая модель другого семейства проверяет критические результаты. Ни одна модель не получает authority на Human Gate или Admission.

| Конфигурация | Рекомендуемая композиция | Для чего подходит | Главный риск |
|---|---|---|---|
| **Максимальная** | `GPT-5.6 Sol` (`high`, для критичного `xhigh/max`) как lead; `Claude Opus 5` (`high/xhigh`) как независимый architecture/V&V reviewer; `Claude Sonnet 5` как основной implementer | Сложные продукты и системы, дорогая ошибка, data migrations, security, много интеграций, release-critical работа | Высокая стоимость и latency; две сильные модели всё равно могут согласованно ошибиться без реальных тестов и domain review |
| **Оптимальная** | `Claude Sonnet 5` как основной инженер; `GPT-5.6 Sol` только для architecture/data/security/final V&V; `DeepSeek V4 Flash` или `Gemini 3.6 Flash` для bounded bulk work | Большинство коммерческих проектов среднего и высокого уровня сложности | Ошибка маршрутизации: слишком сложная задача может остаться у дешёвой модели и создать скрытый architectural debt |
| **Бюджетная** | `DeepSeek V4 Pro` в Thinking mode как lead; `DeepSeek V4 Flash` для реализации, тестовых заготовок и документации; `GLM-5.2` или разовый frontier-review на критических gates | Скрипты, внутренние сервисы, прототипы, ограниченные приложения и проекты с большим объёмом типовой реализации | Коррелированные ошибки Pro/Flash одного семейства, слабее независимость review, больше человеческой проверки и повторных Runs |

Базовая рекомендация для нового проекта — **оптимальная конфигурация**. Максимальная нужна не на каждом этапе, а в точках необратимости. Бюджетная допустима, если scope хорошо ограничен, тесты исполнимы, а архитектура, data model, migration, security и Final V&V имеют отдельную проверку.

---

## 1. Что именно означает рекомендация модели

Рекомендация относится к роли модели внутри Working Process, а не передаёт ей authority:

```text
lead / architect
→ bounded implementer
→ independent reviewer
→ executable verification
→ Human Gate / Admission
```

При выборе учитываются одновременно:

- сложность рассуждения и длительность agentic work;
- цена ошибки и обратимость решения;
- размер и качество доступного контекста;
- необходимость tool use, запуска кода и чтения репозитория;
- доступность независимой проверки;
- privacy, data residency и contractual constraints;
- фактическое качество модели на representative KIT evals, а не только публичный benchmark.

Название этапа само по себе недостаточно. Небольшой CRUD endpoint может быть bounded Task для экономичной модели, а маленький kernel driver или migration script способен потребовать frontier lead и независимый review.

## 2. Уровни задач

| Уровень | Типичная работа | Требуемая модель |
|---|---|---|
| **Critical** | Architecture, system decomposition, data model с будущими slices, migration strategy, authorization model, safety/security, Final V&V | Frontier lead на `high/xhigh`; для наиболее трудных задач — `max`; cross-family review обязателен |
| **Complex** | Requirements synthesis, ConOps, integration registry, API contracts, сложная реализация, verification plan, системная диагностика | Frontier или сильная near-frontier модель на `high`; независимый review по риску |
| **Bounded** | Реализация по утверждённому контракту, локальный refactoring, тесты, UI integration, traceability updates | Экономичная сильная coding-модель на `medium/high` при строгом Task contract |
| **Mechanical** | Форматирование, scaffolding, перенос согласованной структуры, простые test fixtures | Быстрая модель на `low/medium`, но с deterministic checks |

Термины effort у поставщиков различаются. В этом документе `high/xhigh/max` — смысловой уровень требуемой глубины. Для DeepSeek ему соответствует выбор Thinking mode и достаточного token budget; для Gemini — `thinking_level`; для Anthropic и OpenAI используются их поддерживаемые effort-настройки.

## 3. Максимальная конфигурация

### 3.1. Состав

| Роль | Модель | Режим | Назначение |
|---|---|---|---|
| Lead systems engineer | `GPT-5.6 Sol` | `high`; `xhigh/max` по trigger | Requirements mediation, ConOps, architecture, data model, cross-artifact consistency, сложная диагностика |
| Independent critical reviewer | `Claude Opus 5` | `high`; `xhigh` для hardest coding/agentic work | Независимый разбор архитектуры, migrations, security, verification evidence и release readiness |
| Primary implementer | `Claude Sonnet 5` | `medium/high` | Длительная agentic implementation, refactoring, tool use, тесты и исправления по verification feedback |
| Optional high-volume worker | `GPT-5.6 Terra/Luna` | `medium` | Параллельные bounded Tasks, документация, traceability и test expansion при наличии контракта |

OpenAI официально позиционирует Sol для сложного reasoning и coding, Terra — как баланс качества и стоимости, Luna — для cost-sensitive high-volume workloads. Anthropic рекомендует Opus 5 для complex agentic coding и Sonnet 5 как сочетание скорости и frontier-level capability.

### 3.2. Размещение по этапам

| Этап | Primary | Required review |
|---|---|---|
| Requirements, MVP Scope, ConOps | Sol `high` | Opus 5 для material conflict или consequential scope |
| Integration Registry, Operational Scenarios | Sol `high` | Opus 5 по critical interfaces и degraded modes |
| Data Model, Architecture, API Contracts, Permission Matrix | Sol `xhigh`; `max` по сложности | Opus 5 `high/xhigh`, затем domain/security authority |
| Test Cases, Traceability, Verification Plan | Sonnet 5 или Sol `high` | Sol/Opus 5 проверяет coverage и system-level properties |
| Scaffolding и реализация | Sonnet 5 `medium/high` | Sol для architectural drift; автоматические тесты обязательны |
| Post-Implementation Verification | Sol и Sonnet 5 с разделёнными ролями | Opus 5 анализирует спорное evidence |
| Final V&V / MVP Acceptance | Sol `xhigh/max` | Opus 5 cross-family review и Human Admission |

### 3.3. Риски

- Максимальная цена токенов и заметная latency на `xhigh/max`.
- Overengineering: сильная модель способна предложить более сложную систему, чем требует MVP.
- Long context не гарантирует, что каждый фрагмент был правильно понят и сопоставлен.
- Cross-family review снижает, но не устраняет общие ошибки, вызванные одинаковыми неполными inputs.
- Избыточное применение `max` может увеличить стоимость и время без измеримого улучшения.
- Frontier-модель может уверенно оформить неверное domain assumption; требуется accountable human/domain authority.

Использовать эту конфигурацию следует, когда стоимость предотвращённой ошибки выше стоимости model usage и дополнительного review.

## 4. Оптимальная конфигурация

### 4.1. Состав

| Роль | Модель | Режим | Назначение |
|---|---|---|---|
| Everyday lead/implementer | `Claude Sonnet 5` | `medium/high` | Основной Working Process, complex implementation, tools, review и исправления |
| Critical escalation | `GPT-5.6 Sol` | `high`; редко `xhigh/max` | Architecture, data model, migration, security, сложный failure analysis и Final V&V |
| Bulk bounded worker | `DeepSeek V4 Flash` или `Gemini 3.6 Flash` | Thinking/`medium` | Scaffolding, реализация по контракту, тестовые заготовки, UI integration, документация |
| Cross-check | Sol проверяет Sonnet; Sonnet проверяет Flash | По риску | Независимость между семействами без постоянной оплаты двух frontier-моделей |

Это рекомендуемый default: дорогая модель применяется в точках, где решение начинает ограничивать последующие slices, а не ко всему объёму кода.

### 4.2. Маршрутизация

| Работа | Назначение |
|---|---|
| Requirements, ConOps, operational scenarios | Sonnet 5 `high`; Sol при конфликте источников или safety impact |
| MVP Scope, user stories, UI screen map | Sonnet 5 `medium/high` |
| Data model, migrations, architecture, security boundaries | Sol `high/xhigh`; Sonnet 5 выполняет independent challenge |
| API contracts и integration design | Sonnet 5 `high`; Sol для public/irreversible contracts |
| Bounded backend/frontend implementation | DeepSeek V4 Flash или Gemini 3.6 Flash; Sonnet 5 принимает Candidate implementation |
| Сложный refactoring или многочасовой debugging | Sonnet 5 `high`; Sol после repeated failure |
| Test generation | Flash-модель; Sonnet 5 проверяет negative paths и coverage intent |
| Verification Plan и Final V&V | Sol `high/xhigh`; Sonnet 5 cross-check; Human Gate |

### 4.3. Риски

- Основной риск — неверная классификация задачи как bounded.
- Передача между моделями теряет assumptions, если Task contract и evidence неполны.
- Flash-модель может локально «починить» код, нарушив architecture или traceability.
- Reviewer может поверхностно принять большой diff; review должен опираться на требования, тесты и runtime evidence.
- Несколько API и provider accounts усложняют privacy, audit, billing и reproducibility.
- Текущая вводная цена Sonnet 5 действует ограниченное время; после её окончания экономика изменится.

## 5. Бюджетная конфигурация

### 5.1. Состав

| Роль | Модель | Режим | Назначение |
|---|---|---|---|
| Lead | `DeepSeek V4 Pro` | Thinking mode | Requirements synthesis, bounded architecture, data/API design, сложная реализация и verification planning |
| Bulk implementer | `DeepSeek V4 Flash` | Thinking для reasoning; non-thinking только для механики | Scaffolding, реализация по утверждённому design, тесты, документация и локальные исправления |
| Independent reviewer | `GLM-5.2` или `Gemini 3.6 Flash` | Высокий доступный effort | Cross-family review важных решений и diff |
| Red-gate escalation | Разовый `GPT-5.6 Sol` или `Claude Sonnet 5` | `high` | Data migration, security, system architecture, repeated verification failure, Final V&V |

По официальным ценам DeepSeek на дату snapshot обе модели имеют 1M context: V4 Flash — `$0.14` input / `$0.28` output за 1M tokens, V4 Pro — `$0.435` / `$0.87`. Производитель характеризует Flash как быстрый экономичный вариант, близкий к Pro на простых agent tasks, а Pro — как модель для advanced agentic coding и reasoning. Это делает пару сильной бюджетной основой, но не доказывает равенство frontier-моделям на каждом KIT concern.

### 5.2. Допустимая область

Бюджетная конфигурация хорошо подходит, если:

- Engineered System ограничен и хорошо наблюдаем;
- есть исполнимые тесты и быстрый feedback loop;
- interfaces и data ownership ясны;
- migrations отсутствуют либо отдельно проектируются и проверяются;
- пользователь готов тратить больше времени на review;
- ошибочный Run обратим и не создаёт внешних consequential side effects.

Для небольшого скрипта или внутреннего сервиса V4 Pro может подготовить design и verification intent, а V4 Flash — реализовать bounded Tasks. Для driver, security-sensitive component, финансовой логики, multi-tenant authorization или migration с production data бюджетный режим без frontier escalation не рекомендуется.

### 5.3. Основные риски

- **Коррелированная ошибка:** V4 Pro и V4 Flash принадлежат одному семейству и могут разделять одинаковые blind spots.
- **Скрытый architectural debt:** дешёвая локальная реализация может удовлетворить первый slice, но заблокировать следующие.
- **Review illusion:** повторная проверка той же моделью или близкой моделью не является независимой verification.
- **Больше человеческой нагрузки:** экономия API-бюджета переносит стоимость на review, повторные Runs и debugging.
- **Provider concentration:** outage, rate limit, policy или model update одновременно затронет lead и implementer.
- **Benchmark transfer risk:** хорошие coding/agentic показатели не гарантируют качество требований, data governance или конкретного технологического стека.
- **Privacy/contract risk:** низкая цена не отменяет проверки условий хранения данных, региона inference и допустимости передачи source code.

### 5.4. Сопоставимые альтернативы

- `GLM-5.2` может заменить V4 Pro как бюджетный long-horizon lead; официальный model card заявляет 1M context, несколько thinking effort levels и ориентацию на coding/long-horizon tasks.
- `Gemini 3.6 Flash` может заменить V4 Flash как быстрый implementer/reviewer, особенно при multimodal inputs; Google указывает 1M context, thinking, code execution и улучшения в code generation и instruction following.
- Free endpoints допустимы для эксперимента, но не должны автоматически становиться relied-on production route: availability, rate limits, data handling и reproducibility могут отличаться.

Перед заменой модели требуется один и тот же KIT-specific evaluation pack; vendor benchmark и OpenRouter popularity не заменяют project evidence.

## 6. Обязательные escalation triggers

Экономичную модель следует заменить или дополнить frontier-моделью, если возникает хотя бы один trigger:

1. Data model должен поддержать несколько будущих slices или несовместимую migration.
2. Решение трудно откатить после начала реализации.
3. Меняются public API, persisted data, authorization или trust boundary.
4. Есть concurrency, distributed transaction, recovery, safety или regulatory concern.
5. Требования или источники materially конфликтуют.
6. Два Run подряд не проходят verification по одной причине.
7. Модель предлагает расширить scope либо выполнить consequential action без authority.
8. Subsystem tests проходят, но system-level property не доказано.
9. Reviewer и implementer используют одно семейство для критического результата.
10. Приближается release, Final V&V или Human Admission.

Эскалация означает не только более сильную модель. Иногда правильный ответ — domain expert, дополнительный source, prototype, migration rehearsal, security review или honest stop.

## 7. Минимальная модельная политика по этапам

| Этап | Минимально рекомендуемый уровень | Независимость |
|---|---|---|
| Requirements / MVP Scope / ConOps | Сильный lead на `high` | Review при conflict или consequential scope |
| Integration Registry / Operational Scenarios | Сильный lead на `high` | Cross-check critical interfaces и degraded modes |
| User Stories / UI Map | Near-frontier `medium/high` | Выборочный review |
| Data Model / Architecture / Migration | Frontier `high/xhigh` | Обязательный cross-family review |
| API Contracts / Permission Matrix | Frontier или сильный near-frontier `high` | Обязательно для public/security-critical contracts |
| Scaffolding | Экономичная модель `medium` | Deterministic checks |
| Backend/Frontend Implementation | Экономичная или near-frontier по bounded contract | Review сложных diff и architecture drift |
| Test Cases / Traceability | Экономичная генерация, сильная проверка coverage | Не позволять автору единолично объявлять полноту |
| Verification Plan | Frontier `high` | Проверка system-level properties |
| Post-Implementation Verification | Сильная модель с полным evidence | Желательно не автор реализации |
| Final V&V / Acceptance | Frontier `xhigh/max` по сложности | Cross-family review и Human Admission |

## 8. Как проверить конфигурацию на своём проекте

Перед project-wide adoption сравнить 2–4 композиции на одинаковом наборе задач:

1. Requirements → architecture traceability.
2. Data model для текущего и двух ожидаемых будущих slices.
3. Migration impact и rollback strategy.
4. Bounded implementation по API contract.
5. Поиск дефекта с неполным симптомом и runtime evidence.
6. Negative-path tests и проверка coverage gaps.
7. Соблюдение authority boundary и способность сделать honest stop.
8. Independent review результата другой модели.

Оценивать следует не красоту текста, а:

- долю принятых без переработки результатов;
- дефекты, найденные verification и человеком;
- число нежелательных изменений файлов;
- полноту traceability;
- повторные Runs до прохождения acceptance criteria;
- tokens, latency и полную стоимость результата, включая human review;
- способность выявлять ограничения и останавливаться без выдумывания evidence.

## 9. Общие ограничения

- Любой substantive model output остаётся Candidate Result до предусмотренного Admission.
- Большое context window — capacity, а не доказательство корректного понимания всего контекста.
- Публичные рейтинги зависят от harness, prompts, tool environment и состава задач.
- OpenRouter programming ranking показывает usage за период, а не абсолютное качество модели.
- Цены, aliases, availability и safeguards меняются; перед закупкой или фиксацией router policy их нужно перепроверять.
- Для воспроизводимости следует фиксировать provider, model ID/snapshot, дату, effort, tools, system instructions и eval result.
- Конфиденциальный source code и production data передаются внешней модели только после проверки применимых организационных и договорных правил.

## 10. Evidence snapshot и источники

Существенные характеристики в этой рекомендации проверены по публичным материалам на `2026-08-02`:

- [OpenAI — Model guidance](https://developers.openai.com/api/docs/guides/latest-model): роли GPT-5.6 Sol/Terra/Luna и уровни reasoning effort.
- [OpenAI — Models](https://developers.openai.com/api/docs/models): model IDs, context и прямые API prices.
- [Anthropic — Choosing a model](https://platform.claude.com/docs/en/about-claude/models/choosing-a-model): назначение Claude Opus 5/Sonnet 5, effort и подход capability-first/efficiency-first.
- [Anthropic — Claude Sonnet 5](https://www.anthropic.com/news/claude-sonnet-5): agentic coding positioning и временная вводная цена.
- [DeepSeek — V4 release](https://api-docs.deepseek.com/news/news260424/): различия V4 Pro и V4 Flash, Thinking mode и 1M context.
- [DeepSeek — Models & Pricing](https://api-docs.deepseek.com/quick_start/pricing): прямые API prices и model capabilities.
- [Z.ai — GLM-5.2 model card](https://huggingface.co/zai-org/GLM-5.2): 1M context, coding и long-horizon positioning.
- [Google — Gemini 3.6 Flash](https://ai.google.dev/gemini-api/docs/latest-model): context, pricing, thinking и coding/agentic characteristics.
- [OpenRouter — Programming collection](https://openrouter.ai/collections/programming): датированный usage signal популярных coding models; не используется как единственное доказательство качества.

## 11. Порядок актуализации

Эта рекомендация должна пересматриваться при наступлении любого события:

- появился новый model generation или прежняя модель deprecated;
- изменилась цена более чем на 25%;
- изменились context, tool support, data policy или availability;
- KIT-specific eval обнаружил существенный quality gap;
- accumulated pilot evidence показывает повторяемый failure mode;
- начинается новая версия Work Kit или меняется Reference Process.

При актуализации сначала обновляется evidence snapshot и результаты evals, затем — названия моделей. Устойчивые правила назначения по риску, независимого review, Verification и Human Admission не должны меняться только из-за появления новой модели.
