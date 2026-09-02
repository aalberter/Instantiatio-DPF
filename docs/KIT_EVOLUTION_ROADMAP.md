# Instantiatio DPF — Engineering Work Runtime
## Evolution Roadmap

> **Status:** Informative / Roadmap
> **Scope:** развитие `Instantiatio DPF — Engineering Work Runtime` как successor public identity admitted baseline `Engineering Work Kit 3.1.0`
> **Authority:** этот документ не изменяет AI SDLC DPF, Bootstrap Guide, Working Process Guide или project-specific процессы
> **Use:** ориентир для накопления практики, выбора следующих улучшений и предотвращения преждевременного усложнения

---

## 1. Назначение

Этот документ фиксирует направления развития `Instantiatio DPF — Engineering Work Runtime`. Название `Engineering Work Kit 3.1.0` ниже сохраняется там, где обозначает exact released baseline и историю продукта.

Текущая released configuration — `Instantiatio DPF 4.0.1 — Engineering Work Runtime · Beta`; product maturity — `Beta`, external publication — `not performed`. Её delta и ограничения зафиксированы в [Release Notes 4.0.1](releases/RELEASE_NOTES_4_0_1.md). Published predecessor — `4.0.0`. Exact Human package Admission ещё не завершён; release state, Verification evidence, Admission и внешняя публикация остаются раздельными состояниями/решениями.

Текущий Runtime уже включает:

```text
FPF 31.08 + HAWS DPF 1.0 Final Admitted
→ current universal и bounded subject baselines

AI SDLC DPF 1.0.1
→ protected software-engineering specialization

Engineering Work Bootstrap
→ вход в новую инженерную инициативу

Working Process and Loops
→ процессный движок проекта

AGENTS.md
→ state-driven активация и маршрутизация

Project-specific Work
→ фактические Tasks, Runs, Candidate Results,
  Verification, Admission и Relied-on Results
```

На текущем этапе комплект считается достаточным для end-to-end пилотного применения.

Released Work Kit `2.2.0` устранил process-composition gap; `2.3.0` добавил model-selection guidance; `2.4.0` исправил operational projection gap; `2.5.2` завершил Decision UI specializations. Admitted `3.0.0` добавил release-level identity, Released Work Kit `3.1.0` — progress/completion grammar и optional state projection, а Runtime `3.5.0` — раннее планирование material Human decisions. Released Runtime `3.6.0` добавил Engineering Review View в том же Gate, host-neutral capability/substrate boundary, proportional CAP/reviewer guards, deterministic re-entry и согласованную release documentation. Corrective Runtime `3.6.1` замкнул фактическое предъявление Engineering Views и human-empty review-checklist. Runtime `3.7.0` добавил ordinary human-friendly entry, decision-local authority routing, affected-only stop и progress continuity. Corrective `3.7.1` отделил полноту basis от обязательной видимости каждого internal element; `3.7.2` усилил pre-send guard, plain-language approval и Gate replay. Released `4.0.0` добавил HAWS DPF 1.0 subject-baseline selection, FPF 31.08 current DPF formation, bounded A.10.1 affected-use route, conditional E.16 enactment и observable current-first-result/stop semantics. Released `4.0.1` устраняет universal AI-SDLC/FC-13 routing, делает Working Process formation situation-driven и упрощает first-entry/capabilities interface. FPF, HAWS DPF и controlled DPF `1.0.1` не изменяются.

Следующее развитие должно основываться прежде всего на:

- integrity review;
- поведенческих тестах в агентной среде;
- реальных Bootstrap sessions;
- pilot Loops;
- returned Candidate Results;
- failed Runs;
- Admission Decisions;
- Process Reviews;
- field counterexamples.

---

## 2. Архитектурная позиция

DPF, Bootstrap, Process Engine и Agent Layer следует считать не четырьмя уровнями authority, а четырьмя компонентами системы.

| Компонент | Основная функция |
|---|---|
| AI SDLC DPF | Определяет устойчивые доменные проблемы, принципы и паттерны |
| Engineering Work Bootstrap | Определяет, во что именно входит человек и агент |
| Working Process and Loops | Организует выполнение конкретной инженерной работы |
| Agent Layer | Определяет состояние и активирует применимый Guide или процесс |

`AGENTS.md` не должен превращаться в отдельную методологию.

Его задача:

```text
определить состояние
→ выбрать применимый механизм
→ сохранить authority boundaries
→ передать работу дальше
```

---

## 3. Текущая полнота комплекта

Текущий Runtime уже поддерживает полный маршрут:

```text
неструктурированная потребность
→ адаптивное интервью
→ Work Context
→ Entry Decision
→ Working Process
→ Loop
→ Task
→ Run
→ Candidate Result
→ Verification
→ Admission
→ Relied-on Result
→ Process Review
```

Поэтому на ближайшем этапе не требуется добавлять новые концептуальные уровни.

Начиная с Work Kit `2.1.0`, операционный слой также поддерживает две независимые presentation-настройки: `Interaction Mode` и `Explanation Mode`. Они не изменяют authority hierarchy или engineering assurance; их применение проверяется behavioral contract и integrity automation.

Начиная с Candidate Work Kit `2.2.0`, optional PEC добавляет navigation backbone, explicit concern/result dispositions и proportional Commitment Guards. Это experimental reference realization, а не новый authority level, mandatory lifecycle или reusable Loop library.

Начиная с Work Kit `2.3.0`, model guidance разделяет устойчивые правила назначения по риску и датированный каталог моделей. Optional offer не блокирует Bootstrap; фактический Model Assignment остаётся host-bounded Candidate частью Working Process/Loop и не изменяет authority или assurance.

Work Kit `2.4.0` требует сначала показать полную project-relevant карту результатов и только затем предлагать её явную оптимизацию. Инженерное и управленческое представления должны описывать одну configuration, а решение пользователя — иметь отдельный структурированный блок. Это operational repair, а не изменение DPF или превращение PEC в обязательный lifecycle.

Candidate Work Kit `2.5.0` развил эту основу в Decision UI: основной decision layer находится в чате, подробный adjacent `.md` остаётся optional, а оба слоя связываются с одной exact Candidate configuration. Independent challenge привёл к Candidate `2.5.1` с exact DI-01—DI-08, полным Layer C, risk owner/reopen trigger и bounded one-scan guidance. Re-verification нашла оставшиеся partial-supersession, conflict-resolution, Choice/Missing-input route и S-49 guard gaps; Candidate `2.5.2` завершает их в primary WPC-06, S-46/S-49 и section-scoped integrity. Native Codex controls, CSS, fonts и persistence не входят в Candidate scope; usability effectiveness и repair sufficiency требуют downstream L-DUX-004-R2 challenge и field evidence.

Released Work Kit `3.1.0` делает состояние инициативы видимым без псевдоточного процента, ограничивает `Mission Complete!` admitted initiative outcome, отделяет «Форсаж» от presentation preferences и переводит Lessons Review в optional post-initiative route. YAML остаётся только проверяемой projection exact carriers, а не второй authority.

Основная задача следующей стадии:

> проверить, насколько существующие компоненты действительно работают вместе в реальных инициативах.

---

## 4. Накопленная программа стабилизации

Разделы `4.1…4.5` сохраняют исторические и повторно используемые направления проверки. Они не обозначают текущую версию продукта и не заменяют released configuration `4.0.1`, её exact package review и Human Admission route.

### 4.1. Integrity Review

Провести статическую проверку:

- ссылок между файлами;
- путей;
- фактической структуры пакета;
- терминологии;
- состояний;
- authority;
- границ между DPF, Bootstrap и Process Engine;
- README;
- AGENTS;
- Guides;
- шаблонов carriers;
- version declarations.

### 4.2. Behavioral Tests

Released Work Kit `3.1.0` regression contract содержит фактические `60 scenarios`. Это inventory count, а не оценка семантической полноты. Помимо Bootstrap/authority/preferences, он проверяет:

1. первое сообщение `Привет` в пустом проекте;
2. старт с файлами в `project/source/`;
3. Interview-first без файлов;
4. разработка требований;
5. архитектурная инициатива;
6. вход в существующий проект;
7. новая инициатива внутри действующего проекта;
8. admitted Work Context без Working Process;
9. Working Process без подходящего Loop;
10. конфликт authoritative sources;
11. отсутствие authority;
12. отказ пользователя утверждать Candidate Work Context;
13. direct reversible и script/driver non-use;
14. lightweight web MVP без artifact-count proxy;
15. source-heavy multi-slice data/state readiness;
16. reuse/supersession для medium product slices;
17. integration responsibility и system properties;
18. PAP strengthening без upward leakage;
19. legacy change, research spike, source revision и Candidate Lesson return;
20. progress/completion и initiative-only `Mission Complete!`;
21. six-mode onboarding и отдельный «Форсаж»;
22. category-first model recommendation;
23. post-initiative consent/lesson template и immediate critical evidence;
24. recovery по exact carriers и rejection stale/contradictory YAML.

### 4.3. Первый реальный Pilot

Выбрать инициативу, которая:

- практически полезна;
- ограничена по scope;
- имеет понятный receiving use;
- допускает verification;
- обратима;
- позволяет пройти полный цикл Admission.

Рекомендуемый первый маршрут:

```text
Bootstrap
→ Admitted Work Context
→ Entry Decision
→ один Working Process
→ один bounded Loop
→ одна Task
→ один Run
→ Candidate Result
→ Verification
→ Admission
→ Process Review
```

### 4.4. Repair Release

Candidate `2.2.0` реализует admitted bounded repair:

1. исходный failure классифицирован как Reference Process/Application Guide + operational readiness + behavioral/integrity gap;
2. hybrid PEC выбран вместо universal artifact sequence;
3. data/state guard отделён от physical schema и relied-on migration;
4. Guides/dispatcher/scenarios/integrity синхронизированы;
5. DPF/RA/PAP сохранены;
6. release требует cross-carrier independent review, manifest/hash verification и G8/G9 decisions.

### 4.5. Coverage-first operational repair

В двух последовательных project starts наблюдалась сходная компрессия Candidate Working Process: ConOps был неявно сведён к normal/anomaly scenarios, а User Stories скрыты внутри slice contract до прямого вопроса пользователя. Корректирующая последовательность `DPF coverage → applicability/risk → rich Candidate map → reductions → explicit user decision` восстановила ожидаемую видимость результатов.

Released `2.4.0` переносит этот принцип в исполнительскую обвязку:

1. admitted context, smallest applicable DPF route и project-relevant results предшествуют optional PEC screen; `FC-13` используется только внутри уже выбранного AI SDLC route;
2. project-relevant results разворачиваются до объединений и сокращений;
3. combined results сохраняют identity, trace и smallest-responsible-result return;
4. Direct Work, scripts и drivers сохраняют proportional lightweight routes;
5. Human Gate показывает основания, риск, разрешаемые последствия и exact decision;
6. user-facing представление по умолчанию русское, без перевода machine identifiers и точных терминов.

Cross-carrier verification, fresh independent challenge и synthetic countercases подтвердили текущую реализацию как `pass_with_limitations`. Они не доказывают field effectiveness: сохраняются `R1-IC-O01`, ограничение process separation и потребность в multi-project pilot evidence.

---

## 5. Направление развития 1: библиотека типовых Loops

После появления практического evidence сформировать библиотеку повторяемых Loops.

Возможные первые кандидаты:

```text
requirements extraction
requirements clarification
requirements review
requirements traceability

architecture research
architecture decision
architecture review
interface analysis

impact analysis
change assessment

code implementation
code review
refactoring

test design
test generation
test review

technical documentation
documentation review
```

### 5.1. Условие включения Loop в библиотеку

Loop следует считать reusable только если:

- он был применён более одного раза;
- его входы и выходы стабильны;
- scope можно ограничить;
- verification определима;
- admission route понятен;
- известны stop и return conditions;
- project-specific детали можно вынести в параметры.

### 5.2. Чего избегать

Не создавать заранее:

- каталог всех возможных инженерных Loops;
- один универсальный Loop для всей разработки;
- Loops без receiving use;
- Loops без verification;
- Loops, являющиеся только большими prompts.

---

## 6. Направление развития 2: профили применения

После нескольких пилотов могут быть выделены bounded application profiles.

Возможные профили:

- Requirements Work Profile;
- Architecture Work Profile;
- Existing Project Assessment Profile;
- Regulated System Profile;
- Small Pilot Profile;
- Documentation Profile;
- Software Change Profile.

Профиль должен определять:

- тип инициативы;
- минимальный Bootstrap mode;
- типовые источники;
- consequence profile;
- рекомендуемые DPF-паттерны;
- типовые Work Context fields;
- возможные Entry Routes;
- типовые Loops;
- Human Gates;
- обязательные verification и admission conditions.

Профиль не должен становиться новой универсальной методологией.

---

## 7. Направление развития 3: conformance checks

После стабилизации структуры полезно добавить автоматические или полуавтоматические проверки согласованности.

Возможные проверки:

- существует ли файл, на который дана ссылка;
- существует ли admitted Work Context;
- существует ли Entry Decision;
- соответствует ли Working Process выбранному Entry Route;
- утверждён ли новый Working Process;
- существует ли подходящий Loop;
- имеет ли Loop определённые inputs и outputs;
- определён ли first relying use;
- существует ли verification;
- записан ли admission status;
- не назван ли Candidate Result готовым или relied-on;
- не изменяется ли read-only DPF;
- не создан ли competing root Work Context;
- не используется ли `project/sources/` вместо `project/source/`.

Формы реализации:

```text
manual audit checklist
→ audit Loop
→ repository linter
→ CI conformance check
```

Начинать рекомендуется с audit Loop или простого скрипта.

---

## 8. Направление развития 4: process observability

После нескольких применений следует собирать минимальные данные о фактической работе комплекта.

### 8.1. Bootstrap Metrics

- число вопросов до первого summary;
- число уточняющих циклов;
- число возвратов Candidate Work Context;
- причины honest stop;
- доля Interview-first и Source-first маршрутов;
- частота ошибочного определения новой инициативы;
- полезность Work Context для downstream process.

### 8.2. Process Metrics

- число Runs на один admitted result;
- причины возврата Candidate Results;
- частота scope violations;
- частота изменения Loops;
- доля результатов, реально использованных downstream;
- время и усилия на verification;
- частота Human Gates;
- причины failed Runs.

### 8.3. Главный принцип

Наблюдаемость нужна для улучшения процесса, а не для имитации точности.

Не собирать метрики, которые:

- не влияют на решения;
- трудно интерпретировать;
- создают административную нагрузку;
- стимулируют оптимизацию количества вместо качества.

---

## 9. Направление развития 5: versioning и migration

По мере развития следует различать версии:

```text
Kit version
DPF version
Bootstrap Guide version
Working Process Guide version
AGENTS version
Application Profile version
Project Working Process version
Loop version
Work Context version
```

### 9.1. Минимальная таблица версий

В Candidate/released package фактические версии, release state, external publication, authoritative loci и SHA-256 components хранятся в [`PACKAGE_MANIFEST.md`](../PACKAGE_MANIFEST.md). Для `4.0.1` manifest закрывает exact distributed inventory; README не дублирует изменяемые hashes.

| Component | Version | Status |
|---|---:|---|
| Engineering Work Runtime | `4.0.1` | released · Beta |
| AI SDLC DPF | `1.0.1` | controlled working |
| Bootstrap Guide | `1.11.1` | operational |
| Working Process Guide | `1.13.1` | operational |
| AGENTS dispatcher | `2.11.1` | operational |
| Model Selection Recommendations | `1.1.0` | admitted informative guidance |

### 9.2. Migration Rules

Позже потребуется определить:

- совместимость версий;
- что считается breaking change;
- как обновляется existing project;
- нужно ли повторное admission;
- когда пересматривается Work Context;
- когда мигрируется Working Process;
- как сохраняется provenance.

До появления реальных migration cases достаточно централизованных component versions, release states и external-publication states в `PACKAGE_MANIFEST.md`.

---

## 10. Направление развития 6: набор эталонных сценариев

После первых пилотов полезно создать regression corpus.

Примеры сценариев:

```text
empty project hello
source-first requirements work
interview-first product concept
architecture initiative
new initiative in active project
conflicting sources
missing authority
bounded pilot
returned Candidate Result
honest stop and resume
direct/script/driver non-use
multi-slice data readiness and reuse
integrated-system property verification
PAP-strengthened route
source revision and Candidate Lesson
```

Для каждого сценария фиксировать:

- начальное состояние;
- сообщение пользователя;
- ожидаемый state transition;
- ожидаемые вопросы;
- ожидаемые carriers;
- запрещённые действия;
- Human Gates;
- критерии успешности.

Такой corpus позволит проверять поведение новых моделей и агентных сред.

---

## 11. Возможное развитие после накопления evidence

Только после появления устойчивой повторяемой потребности можно рассматривать выделение дополнительных сервисных компонентов.

### 11.1. Governance Service

Имеет смысл, если:

- много параллельных инициатив;
- распределена authority;
- появились сложные approval routes;
- требуется portfolio-level coordination.

### 11.2. Verification Library

Имеет смысл, если:

- повторяются одинаковые виды evidence;
- verification contracts стабильны;
- нужны reusable test and review strategies.

### 11.3. Admission Registry

Имеет смысл, если:

- много relied-on results;
- требуется точная история решений;
- несколько downstream users;
- нужен formal audit.

### 11.4. Context Service

Имеет смысл, если:

- Work Contexts многочисленны;
- возникают cross-project dependencies;
- требуется автоматический impact propagation.

Эти элементы не следует вводить заранее как новые уровни архитектуры.

---

## 12. Что пока не добавлять

На текущем этапе не рекомендуется создавать:

- отдельный Governance Engine;
- отдельный Verification Framework;
- отдельный Admission Engine;
- отдельный Context Engine;
- универсальный каталог агентов;
- десятки заранее подготовленных Loops;
- сложный машинный state manager;
- обязательный граф всех артефактов;
- тяжёлый процесс сертификации kit;
- новые authority levels.

Причина:

```text
существующие функции уже представлены
в DPF, Bootstrap и Process Engine
```

Выделение нового компонента оправдано только при доказанной повторяемой самостоятельной потребности.

---

## 13. Принципы развития

### 13.1. Evidence before abstraction

Не выделять новую сущность только потому, что она концептуально возможна.

Сначала должны появиться повторяющиеся случаи.

### 13.2. Repair before expansion

Сначала исправлять реальные отказы существующей архитектуры.

Только затем расширять её.

### 13.3. Project-specific before framework-wide

Локальную проблему сначала решать:

```text
в Work Context
→ Working Process
→ Loop
→ project artifact
```

и только после повторения рассматривать изменение Guides или DPF.

### 13.4. DPF stability

Не менять DPF из-за:

- новой модели;
- нового prompt;
- нового инструмента;
- одного failed Run;
- одного project-specific исключения.

### 13.5. Minimal sufficient carriers

Не создавать файл или registry без понятного receiving use.

### 13.6. Human authority remains explicit

Автоматизация не должна скрывать:

- кто принимает решение;
- для какого use;
- на основании какого evidence;
- с какими ограничениями.

---

## 14. Предлагаемая последовательность развития

```text
4.0.1 released package configuration; external publication not performed
→ exact Human package Admission
→ separate publication initiative / controlled external-project handoff
→ representative host/substrate and multi-project pilots
→ reusable Loop candidates
→ first application profile
→ conformance audit
→ process observability
→ versioning and migration rules
→ regression scenario corpus
→ controlled expansion
```

---

## 15. Критерий major-version change

Major-version change оправдан material semantic/observable compatibility boundary, подтверждённой implementation и Verification. Для release `4.0.0` таким boundary является изменение entry/stop routing вместе с current HAWS/FPF source-use, affected-use и autonomy semantics; рост документации сам по себе основанием не был.

Для следующего major change полезная evidence basis может включать:

- несколько завершённых инициатив;
- повторяющиеся Bootstrap patterns;
- reusable Loops;
- подтверждённые gaps текущих Guides;
- field counterexamples;
- migration cases;
- evidence необходимости новых компонентов;
- независимый integrity review;
- regression scenarios.

Major-версия не должна выпускаться только из-за роста объёма документации. Candidate version не создаёт Release Admission или external publication.

---

## 16. Ближайшее практическое решение

После формирования exact release package рекомендуемый план:

```text
сохранить protected FPF, HAWS DPF `1.0`, AI SDLC DPF `1.0.1` и admitted predecessor semantics
→ передавать только exact local bundle после final package Admission
→ проверить полученные identities в отдельном publication project
→ выполнить tag/upload/publication только по его authority
→ открывать следующий semantic repair только по field evidence
```

---

## 17. Итоговая позиция

Текущий Runtime находится в правильной точке:

> Он уже достаточно полный для end-to-end инженерной работы и достаточно компактный для понимания, проверки и пилотного применения.

Дальнейшее развитие должно происходить:

```text
не через добавление новых уровней,
а через накопление reusable Loops,
application profiles,
conformance checks,
observability,
versioning
и regression scenarios.
```
