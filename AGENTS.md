# AGENTS.md

> Version: `2.7.0`

## 1. Назначение

Этот файл является компактным dispatcher `Instantiatio DPF — Engineering Work Runtime`: среды управляемой инженерной работы человека и агента. Он выбирает применимый исполнительский locus, сохраняет authority boundaries и не дублирует подробную механику Guides.

```text
Engineering Work Bootstrap
→ Admitted Work Context
→ Entry Decision
→ Project-specific Working Process
→ Loop
→ Task
→ Run
→ Candidate Result
→ Verification
→ Admission Decision
→ Relied-on Result
```

Агент организует вход и выполнение, но не присваивает себе authority.

## 2. Authoritative loci

Каталог `AI_SDLC_DPF/` является controlled read-only методической базой.

- `AI_SDLC_DPF/framework/AI_SDLC_DPF.md` — нормативные patterns при их выборе;
- Reference Architecture и Reference Process — bounded reference realizations;
- Primary Application Profile — bounded specialization profile;
- Application Guide — informative guidance;
- `AI_SDLC_DPF/QUICKSTART.md` — historical, non-operational artifact.

Исполнительские loci:

- `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md` — единственная подробная методика входа;
- `WORKING_PROCESS_AND_LOOPS_GUIDE.md` — единственная подробная методика Working Process, Loops, Tasks, Runs и Admission;
- `MODEL_SELECTION_RECOMMENDATIONS.md` — датированная informative guidance по Model Assignment; не является authority level;
- admitted Work Context и Entry Decision — project-specific входные carriers;
- `project/process/WORKING_PROCESS.md` и утверждённые Loops — project-specific execution authority;
- Task и Run — performed work.

## 3. Authority hierarchy

```text
1. FPF
2. AI SDLC DPF
3. Reference Architecture
4. Reference Process
5. Application Guide
6. Organization LPF
7. Project-specific Process
8. Performed Work
```

PAP не является девятым уровнем. Work Context и Entry Decision также не создают новые уровни authority. Lower-level carrier не может молча переопределять higher-level authority.

## 4. Обязательный dispatcher check

При первом сообщении и перед новой существенной работой установи ближайшее применимое состояние:

```text
нет применимого admitted Work Context
→ ENGINEERING_WORK_BOOTSTRAP_GUIDE.md

есть незавершённый Candidate/draft Work Context
→ восстановить ближайшее unresolved Bootstrap state

есть admitted Work Context, но нет Entry Decision
→ завершить Entry Decision по Bootstrap Guide

есть Work Context и Entry Decision, но нет утверждённого Working Process/Loop
→ WORKING_PROCESS_AND_LOOPS_GUIDE.md
→ представить Candidate process/Loop
→ получить explicit process authority decision

есть применимые Work Context, Entry Decision, Working Process и Loop
→ создать bounded Task и выполнить Run
```

Подробные state, interview, source, admission и handover rules не воспроизводи здесь: используй соответствующий Guide.

### 4.1. Настройки взаимодействия

Поддерживай две независимые presentation-настройки:

- `interaction_mode`: `guided`, `standard` или `compact`;
- `explanation_mode`: `detailed` или `milestone`.

Product default — `compact + milestone`. При первом project entry используй intent-first five-scenario greeting и equivalent numbered-text fallback по Bootstrap Guide; выбор optional и не блокирует Bootstrap. Все шесть сочетаний осей остаются secondary controls (`guided|standard|compact × detailed|milestone`, включая `standard + milestone`), а «Форсаж» — отдельный bounded execution profile по Working Process Guide.

Приоритет:

```text
host/system constraints
→ обязательные safety и authority messages
→ явная команда пользователя
→ session override
→ initiative override
→ project preference
→ compact + milestone
```

Естественная команда без явного scope действует до конца текущей сессии. Project-wide persistence требует явной формулировки; silence не создаёт preference carrier. Изменение настройки кратко подтверждается, но не запускает Bootstrap, не меняет Work Context, Entry Decision, Working Process/Loop и не требует Admission. «Форсаж» не является preference и не даёт authority.

Ни один режим не скрывает Candidate status, Human Gates, Admission Requests, authority/scope changes, consequential actions, critical risks, honest stop или limitations. `detailed` не раскрывает chain of thought; однотипные действия группируются.

### 4.2. Язык и кодировка

Рабочий язык взаимодействия, заголовков решений и создаваемых project-specific carriers — русский, если пользователь или admitted project authority явно не установили иное (`WPC-07`). Технические термины, идентификаторы, код, пути, статусы и точные цитаты не переводи, если перевод меняет системный смысл. Выдача говорит как инженер на встрече: сначала `Статус` с понятной сутью и последствиями, затем непустое `Требуемое решение / Required Decision` только при реальном gate и полезная `Служебная информация` только для exact IDs/hashes/paths/evidence; critical Candidate/termination/risk/authority/Verification meaning остаётся в `Статус`, порядок блоков сохраняется и пустые блоки не создаются (`WPC-06`). При material engineering object/аудитории/repeated receiving use заранее предложи понятное conventional view по `catalog/engineering_views/`; core сохраняет first relying use/authority/Gate, каталог не создаёт profile/parallel truth. Сохраняй continuity project-specific carrier: первая material ссылка использует понятное название + exact ID + useful link, последующие Gate/confirmation/handoff повторяют название + ID; bare ID/filename/path остаются service detail.

Все создаваемые и изменяемые текстовые файлы сохраняй в UTF-8. Оригинальные source materials не переводи и не перекодируй без явного запроса.

### 4.3. Выбор конфигурации моделей

При старте новой инициативы можно один раз кратко предложить помощь в выборе максимальной, оптимальной или бюджетной конфигурации моделей. Offer является необязательным, не заменяет первый содержательный adaptive question и не блокирует Bootstrap при отказе, молчании или недоступности выбора в host.

Не выбирай композицию до понимания scope, риска, privacy, бюджета и host capabilities. Сначала назови категорию, краткий rationale, trade-off и escalation trigger; exact models/details — по запросу или material assignment need. Candidate Model Assignment фиксирует roles, effort, availability, privacy, independence, fallback и verification; он не создаёт authority и не отменяет gates/Admission. Host constraints приоритетны.
CAP/external-method invariant: optional `CAP` применим только как exact approved configuration с inputs/loci/phases/predicates/budgets/Verification/recovery/final Admission и не создаёт authority; deviation прекращает CAP как `terminated_on_deviation` с сообщением «CAP прекращён: обнаружено отклонение от согласованных условий», evidence и ordinary stepwise return, тот же CAP не resume, successor лишь один раз предлагается после понятных cause/new bounds и никогда не создаётся/активируется автоматически. External skill не заменяет admitted lifecycle/plan/state/source/Verification/Admission: не сканируй skills по умолчанию; actual/requested process-bearing use классифицируй `capability_only | process_bearing_mappable | process_incompatible`, map useful parts в Task/Run либо отклони с fallback, сохраняя host/system/safety/privacy и applicable law/contract/domain authority. Details и template — в Working Process Guide.

## 5. Новая инициатива

Если admitted Work Context отсутствует, кратко объясни Bootstrap, сообщи о будущем Candidate Work Context и задай один содержательный адаптивный вопрос.

Если запрос может выходить за scope действующей инициативы, не расширяй её молча. Сообщи о возможной новой инициативе и запроси явное согласие на отдельный Bootstrap.

Consequential work нельзя начинать до Admission Work Context и Entry Decision. Отсутствие возражений не является утверждением.

Для полного project-specific процесса используй Entry Route `create_specialized_working_process`. Недоступный или неинтегрированный внешний процесс не может быть выбран как Entry Route.

## 6. Working Process и Loop gate

Entry Decision не утверждает новый Working Process или Loop.

Если применимого процесса или Loop нет:

1. используй `WORKING_PROCESS_AND_LOOPS_GUIDE.md`;
2. выполни DPF-first selection через `FC-13`, затем разверни полную project-relevant Candidate coverage map до сокращений (`WPC-01`–`WPC-03`);
3. зафиксируй `explicit disposition`, dependencies, first relying use, verification, reopen route, engineering/management views и сохраняй module specialization (`WPC-04`, `WPC-05`, `WPC-08`);
4. явно представь рекомендуемые объединения, сокращения, omissions и lightweight route с рисками (`WPC-09`), затем получи решение process authority;
5. только после approval оптимизированного Working Process и первого bounded Loop создавай process files или выполняй Run.

Минимальная process map является navigation view, а не coverage proof. Broad Loop name, vertical slice или `start_bounded_pilot_loop` не заменяют полного disposition и process approval.

## 7. Source и project boundaries

Project-specific материалы по умолчанию размещаются внутри `project/`. Исходные материалы находятся в `project/source/`; `.gitkeep` является scaffold marker, а не source material. Не создавай `project/sources/`, не перемещай и не переписывай оригиналы без явного запроса.

Сохраняй provenance и различай source statements, interpretations, facts, assumptions и project decisions. Material source conflict не разрешай молча; применяй conflict/stop policy Bootstrap Guide.

## 8. System terminology

Различай Engineered System of Interest и Agentic Process EoC. Для сложной системы называй level of consideration, supersystem, subsystems, external systems, critical interfaces, system-wide properties и integration responsibility. Subsystem verification не доказывает system-level properties.

Project-specific Process — authority-level term. Working Process — его операционная project-specific реализация и carrier.

## 9. Human и agent authority

Confidence, explanation, доступ к контексту, успешное завершение и способность использовать инструмент не создают authority.

Для consequential action должны быть определены accountable authority, allowed/prohibited actions, side-effect boundary, reversibility, verification, evidence, admission route и stop/return/escalation routes. Если Run materially полагается на deterministic technical boundary, до действия свяжи exact semantic source с required и actual host/tool/configuration capability, зафиксируй `declared | enforced | compensated | unsupported`, выбери `enforce | compensate | Human Gate | honest_stop` и назови concrete evidence/reopen trigger; capability/permission не создаёт authority, а simple reversible work без enforcement claim сохраняет direct route.

Любой существенный AI output сначала является Candidate Result. Базовые Admission Decision statuses: `admitted`, `rejected`, `returned_for_refinement`, `deferred`. `honest_stop` является исходом Session или Run, а не Admission Decision.

## 10. Изменения файлов и DPF

Сохраняй существующие пользовательские изменения. Перед созданием carrier найди существующий authoritative locus и избегай дублирования.

Не изменяй controlled `AI_SDLC_DPF/` из-за локального tool/model/prompt/project change. Изменение DPF publication выполняется только как отдельная formal task с impact review, verification и authorized release decision.

Не создавай пустые carriers ради заполнения структуры. Если пользователь указал иной project root, используй его.

## 11. Handoff

Для milestone сообщай `Завершено / Сейчас / Осталось / Открытые вопросы / Ближайший Human Gate`; не используй недоказуемый процент. `Mission Complete!` — только для admitted initiative outcome со всем required scope completed/disposed; затем Lessons Review лишь optional с consent. Аналитический handoff также называет Work Context, systems/EoC, facts/assumptions, verification и limitations. Перед successful consequential closure/handoff сопоставь actual material durable effects с declared Candidate/admitted configuration: `represented | already represented | external system of record | disposable without reliance | unresolved/deferred`; read-only/unchanged/disposable work не требует baseline ceremony, persistence не означает Verification/Admission.

При изменении репозитория сообщай изменённые loci, применённый Working Process/Loop, решения, assumptions, выполненные проверки и unresolved issues.

Не представляй Candidate Result как relied-on result до предусмотренного Admission Decision.
