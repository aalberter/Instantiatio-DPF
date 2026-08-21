# Instantiatio DPF 3.3.0 — Engineering Work Runtime · Beta
Версия Runtime: `3.3.0`  
Зрелость продукта: `Beta`  
Статус публикации: `released`  
Release Admission: `admitted` для bounded reliance  
Внешняя публикация: не выполнялась в рамках этой инициативы  
Точная конфигурация пакета: [`PACKAGE_MANIFEST.md`](../../PACKAGE_MANIFEST.md)

## Что изменилось в 3.3.0
IDPF 3.3.0 — это релиз **runtime hardening**.

Архитектура и основной процесс IDPF не менялись. Версия 3.2.0 уже задавала правильные различия между Task и Run, Candidate Result и Relied-on Result, Verification и Admission, capability и authority, а также правила работы с baseline, Human Gates и Engineering Views.

В 3.3.0 улучшено другое: **насколько надёжно Runtime способен исполнять эти правила в реальной агентной среде и насколько явно он показывает фактическое состояние работы**.

Коротко:

```text
3.2.0:
правила и границы определены семантически

3.3.0:
для существенных случаев стало явнее,
какие границы реально обеспечены,
какое состояние результата действительно сохранено
и на какие evidence можно опираться
```

Главный эффект релиза:

> **IDPF стал меньше зависеть от предположения «агент должен правильно соблюдать процесс» и лучше различает заявленное правило, фактически обеспеченную границу, компенсирующий контроль и невозможность безопасного выполнения.**

---

## 1. Runtime Conformance & Enforcement
Контроль соответствия Runtime и принудительное обеспечение ограничений

### Что было
IDPF 3.2.0 уже позволял определить:

- разрешённые и запрещённые действия;
- side-effect boundaries;
- ограничения Run;
- Human Gates;
- условия остановки;
- правила перехода Candidate Result → Verification → Admission.

Но наличие правила ещё не доказывало, что конкретный runtime / harness / tool способен технически это правило удержать.

Например:

```text
«не изменять защищённую область»
```

могло быть корректным process rule, но само по себе не означало наличие реального технического ограничения.

### Что стало лучше
В 3.3.0 появилась явная связь:

```text
semantic boundary
→ required runtime capability
→ actual capability конкретной среды
→ enforcement / compensating control / honest_stop
→ conformance evidence
```

Runtime теперь различает состояния, эквивалентные:

- `declared` — ограничение задано;
- `enforced` — ограничение технически обеспечено;
- `compensated` — прямого enforcement недостаточно, но действует другой контроль;
- `unsupported` — необходимой runtime capability нет.

Это означает, что **текстовый запрет больше нельзя молча выдавать за техническую гарантию**.

Если критичная граница не поддерживается конкретной средой, Runtime должен либо использовать допустимый компенсирующий контроль, либо вернуть решение Human Authority, либо остановить выполнение через `honest_stop`.

### Что это даёт
До:

```text
правило существует
→ предполагаем, что агент его соблюдёт
```

После:

```text
правило существует
→ проверяем, чем оно реально обеспечивается
→ фиксируем фактическую силу гарантии
```

Именно это является главным усилением 3.3.0.

---

## 2. Runtime Capability теперь рассматривается отдельно от Authority
Фактические возможности Runtime рассматриваются отдельно от полномочий

Версия 3.3.0 усилила практическое применение уже существующего принципа:

```text
Capability ≠ Authority
```

То, что агентная среда **может** выполнить действие, не означает, что Runtime **разрешил** его выполнить.

И наоборот: наличие process rule не означает, что host технически способен его гарантировать.

Поэтому для существенных execution boundaries теперь учитывается конкретная конфигурация runtime / harness / tools и её реальные возможности.

Практический результат:

- сильный host не получает дополнительных полномочий автоматически;
- слабый host не изображается более защищённым, чем он есть;
- conformance claim относится к **конкретной проверенной конфигурации**, а не к абстрактному «Codex», «Claude Code» или другому классу инструментов.

---

## 3. Result Persistence & Baseline Reconciliation
Сохранение результата и сверка фактического состояния с baseline

### Что было
IDPF уже различал Candidate Result, Verification, Admission и Configuration Baseline.

Но оставался operational gap: после выполнения Loop могли существовать долговременные изменения, которые фактически влияют на дальнейшую работу, но не были явно сопоставлены с объявленным результатом или relied configuration.

### Что стало лучше
Перед consequential handoff или успешным закрытием Loop Runtime теперь должен сверить:

```text
фактическое durable state
↔
объявленный результат / baseline / authoritative locus
```

Существенное долговременное изменение должно иметь понятный disposition, например:

- входит в результат или baseline;
- уже было учтено существующим baseline;
- находится во внешнем authoritative system of record;
- является временным / disposable и не предназначено для дальнейшего reliance;
- остаётся unresolved / deferred и требует отдельного маршрута.

Неучтённое durable state больше не должно молча исчезать за статусом «работа завершена».

### Что это даёт
До возможна была ситуация:

```text
Verification прошла
+
часть фактических изменений осталась вне объявленной конфигурации
```

После consequential closure должен быть понятен ответ:

> **Какое точное состояние результата передаётся дальше и где оно восстанавливается?**

При этом IDPF не сделал Git обязательным. Baseline может быть представлен Git commit/tag, DMS version, immutable artifact, package identity, manifest, engineering database, versioned model или другим recoverable system of record.

И сохраняется важное различие:

```text
Persistence ≠ Verification
Persistence ≠ Admission
Persistence ≠ Release
```

---

## 4. Proportional Runtime Hardening
Пропорциональное усиление Runtime с учётом риска и последствий

Ещё одна важная идея 3.3.0 — **усиливать runtime controls пропорционально риску, а не превращать каждый Run в тяжёлую процедуру**.

Строгость может возрастать с учётом:

```text
consequence
× autonomy
× irreversibility
× repeatability
× relying use
× assurance need
```

Поэтому 3.3.0 не вводит обязательные для каждой задачи:

- отдельные Run Contracts;
- новые Human Gates;
- container/worktree/CI;
- отдельные quality profiles;
- специальные baseline records.

Небольшая обратимая работа по-прежнему может идти коротким маршрутом.

Главное изменение не в количестве документов, а в том, что **если сильная гарантия действительно нужна, Runtime должен уметь показать, откуда она берётся**.

---

## 5. Conformance evidence стали отдельным предметом проверки
Свидетельства соответствия Runtime проверяются отдельно от описания требуемого поведения

3.3.0 явнее отделяет два разных вопроса:

```text
Behavioral specification:
как IDPF должен вести себя

Runtime conformance:
может ли конкретная execution configuration
действительно обеспечить это поведение
```

Это важный сдвиг.

Раньше основной акцент был на корректности process semantics и behavioral scenarios. Теперь отдельно проверяется, насколько claims об enforcement соответствуют реальным возможностям среды.

В проверенной release configuration:

- одна внешняя workspace boundary подтверждена как `pass_enforced`;
- часть гарантий подтверждена через `pass_compensated`;
- одна capability признана `unsupported`;
- для unsupported capability правильным поведением является не фиктивный PASS, а `honest_stop`.

То есть **ограничение теперь считается нормальным результатом проверки, если оно честно обнаружено и правильно обработано**.

---

## 6. Failure не должен маскироваться под успешное завершение
Сбой или отсутствие требуемой гарантии не должны считаться успешным результатом

Практическая логика Runtime стала жёстче в отношении ситуаций, где требуемая гарантия отсутствует или execution state неизвестен.

Такие состояния, как отсутствие требуемой capability или невозможность подтвердить существенную execution boundary, не должны автоматически превращаться в:

```text
completed
candidate_ready
verified
admitted
```

Правильный маршрут — сохранить фактическое состояние и выполнить возврат, компенсирующий контроль или `honest_stop`.

Это делает Runtime надёжнее именно как **исполняемую инженерную среду**, а не только как хорошо описанный процесс.

---

## 7. Human Gates и решения стали проще читать
Контрольные точки и решения человека представлены понятным названием и точным идентификатором

В 3.3.0 улучшена human-facing часть Runtime.

Существенные результаты и решения теперь рекомендуется показывать одновременно как:

```text
понятное человеческое название
+
точный machine-readable ID
```

Например:

```text
Контекст инициативы по доработке IDPF 3.3.0
(WC-IDPF-330-001)
```

вместо голого:

```text
WC-IDPF-330-001
```

Project-specific материалы по умолчанию формулируются по-русски, сохраняя английские системные идентификаторы, status values, paths и названия mechanisms там, где точность важнее перевода.

Это не архитектурное изменение, но заметно повышает usability Runtime для человека.

---

## 8. Что проверили, но не стали превращать в новый механизм
### 8.1. Material Verifier Fitness
Пригодность средств проверки для существенных инженерных утверждений

Проверялась идея отдельной квалификации verifier.

Результат:

```text
EXP-01 = limited_domain_specific
```

Вывод:

- deterministic verifier полезен там, где существует известный формальный oracle;
- такой verifier можно проверять на known-bad cases;
- но structural PASS не доказывает semantic correctness;
- semantic review должен честно указывать basis, independence и limitations.

Поэтому универсальная новая подсистема Verification Qualification в 3.3.0 не введена.

---

### 8.2. Increment Coordination
Координация нескольких Loops в рамках общего системного изменения

Исходная идея состояла в том, чтобы добавить отдельный механизм координации нескольких Loops вокруг одного system increment.

Проверка показала, что существующих механизмов:

```text
Loops
+ dependencies
+ baselines
+ integration responsibility
+ reuse / supersession
+ system-level Verification
+ Admission
```

достаточно.

Результат:

```text
EXP-02 = pass_no_new_mechanism
```

Поэтому новый обязательный `Increment`, `Slice` или отдельный coordination lifecycle не добавлялся.

Это хороший результат: **проблема была проверена, но архитектуру не стали расширять без необходимости**.

---

## 9. Quality & Assurance Composition — проверена, но не добавлена
Композиция требований к качеству и подтверждению соответствия проверена без введения нового механизма

Одной из исходных идей 3.3.0 была отдельная `Quality & Assurance Composition (QAC)`.

Во время реализации её ещё раз проверили против существующего baseline.

Выяснилось, что текущие механизмы:

```text
Work Context
+ contextual Working Process
+ source mediation
+ Verification
+ Admission
```

уже позволяют выявлять и маршрутизировать material quality / assurance concerns без нового subsystem.

Поэтому в финальный Runtime не добавлены:

- отдельный Quality Authority;
- второй SRS;
- обязательный Quality Profile;
- отдельная readiness-модель.

То есть QAC не «забыли реализовать». **После проверки было принято решение, что отдельный механизм пока не оправдан.**

---

## 10. Engineering Views не переделывались
Инженерные представления сохранены как производные от authoritative sources

Идея более строгого разделения authoritative artifacts и human-facing representations также проверялась.

Выяснилось, что IDPF 3.2.0 уже содержит необходимый контракт:

```text
Engineering View
→ указывает authoritative source
→ относится к exact configuration / baseline
→ имеет freshness / staleness semantics
→ показывает limitations / non-coverage
→ не становится source of truth
```

Поэтому в 3.3.0 эта часть осталась regression boundary, а не новым subsystem.

Иными словами, здесь улучшение состояло в подтверждении того, что существующая архитектура уже закрывает задачу.

---

## 11. Что сознательно отложено
В 3.3.0 не стали добавлять:

- Evidence-Qualified Autonomy;
- autonomy ladder;
- автоматическое повышение автономности;
- Process Metrics / KPI subsystem;
- отдельную telemetry architecture;
- универсальный host adapter;
- обязательные Git / CI / container workflows.

Причина общая:

> **новый mechanism появляется только после подтверждения actual gap и доказанной пользы.**

3.3.0 сначала укрепляет runtime conformance. Более сложные механизмы автономности и metrics разумно строить только после накопления field evidence.

---

## 12. Что осталось неизменным
Основная архитектура IDPF не менялась:

```text
Bootstrap
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
```

Сохранились базовые различия:

```text
Capability ≠ Authority
Candidate Result ≠ Relied-on Result
Verification ≠ Admission
Task ≠ Run
Engineering View ≠ Authoritative Source
Persistence ≠ Admission
```

`AI_SDLC_DPF/**` не изменялся и остаётся authoritative source принципов.

IDPF также остаётся **Engineering Work Runtime**, а не coding-only harness.

---

## 13. Почему версия называется Beta
В 3.3.0 продукт явно обозначен как:

```text
Instantiatio DPF 3.3.0 — Engineering Work Runtime · Beta
```

`Beta` здесь означает не нестабильность архитектуры, а зрелость эксплуатации:

- базовая архитектура Runtime уже сформирована;
- дальнейшая работа направлена прежде всего на эксплуатационную проверку и hardening;
- claims должны усиливаться по мере накопления evidence на реальных проектах;
- снятие Beta должно зависеть от field evidence, а не просто от номера версии.

---

## 14. Совместимость с 3.2.0
Обязательная миграция существующих проектов не требуется.

Повторная Verification нужна только для claims, которые зависят от изменившихся:

- Runtime carriers;
- runtime / harness / tool configuration;
- semantic source;
- существенных limitations;
- evidence, привязанных к exact configuration.

Изменённые версии компонентов:

- Runtime: `3.2.0 → 3.3.0`;
- AGENTS dispatcher: `2.6.0 → 2.7.0`;
- Bootstrap Guide: `1.6.0 → 1.7.0`;
- Working Process Guide: `1.6.1 → 1.7.0`;
- behavioral scenarios: непрерывный набор `S-1`–`S-150`.

---

## 15. Что фактически проверено в релизе
- Package manifest: `44/44` файлов.
- Hash mismatches: `0`.
- Full integrity: `PASS`.
- Controlled `AI_SDLC_DPF/**`: без изменений.
- Runtime conformance проверена для exact release configuration.
- Independent Release Review: `pass_with_nonblocking_limitations`.
- Release Admission: `admitted` для bounded reliance.
- `V-LIM-01`: `closed_dispositioned_exact_configuration`.
- Release ZIP повторно распакован и проверен по manifest и integrity.

Ограничения проверки:

- conformance claims относятся только к проверенной конфигурации;
- structural verifier не заменяет semantic review;
- `RC-01 = pass_enforced`;
- `RC-02`–`RC-05 = pass_compensated`;
- `RC-06 = unsupported`;
- Для ZIP рассчитан SHA-256 и зафиксирован в evidence сборки; отдельный checksum-файл в release-папку не включается. Криптографической подписи издателя нет.

---

## 16. Recovery и reopen route
Возврат к предыдущей конфигурации и условия повторного открытия проверок

- IDPF 3.2.0 остаётся предыдущей стабильной точкой возврата; автоматический destructive rollback не предусмотрен.
- Изменение пакета, manifest или release claims повторно открывает затронутые Verification и Admission.
- Изменение host, tool/session configuration или semantic source повторно открывает зависящие от них conformance claims.

---

## Итог
IDPF 3.3.0 не меняет фундаментальную архитектуру Runtime.

Он делает три вещи заметно лучше:

```text
1. Boundary и conformance evidence:
   стало ясно, какая граница просто заявлена,
   а какая реально обеспечивается конкретной runtime configuration.

2. State:
   consequential handoff / closure лучше связан
   с точным recoverable состоянием результата.

3. Human-facing clarity:
   решения показываются понятным названием и точным ID,
   а project-specific материалы по умолчанию ведутся по-русски.
```

При этом сохранился принцип:

```text
strict semantics
+
proportional controls
+
no mechanism without demonstrated need
```

Если 3.2.0 в первую очередь задавал **правильную архитектуру инженерной работы**, то 3.3.0 заметно усиливает её как **проверяемый Engineering Work Runtime, работающий внутри реальных ограничений конкретной агентной среды**.
