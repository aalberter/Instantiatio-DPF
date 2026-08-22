# Instantiatio DPF 3.5.0 — Engineering Work Runtime · Beta

## TL;DR

Версия 3.5.0 улучшает планирование **существенных человеческих решений** в инженерном процессе.

Раньше Runtime уже умел работать с Human Gates, Verification, Admission, authority и reopen semantics. Но не всегда было достаточно явно зафиксировано заранее:

- **какой именно результат потребует отдельного решения человека**;
- **что именно человек должен решить**;
- **кто имеет право принять это решение**;
- **до какого перехода решение обязательно**;
- **что именно блокируется до решения**;
- **какое изменение делает решение устаревшим и требует повторного рассмотрения**.

В 3.5.0 эта логика добавлена в формирование Working Process.

Ключевая идея релиза:

```text
не каждый artifact требует согласования

но

если дальнейшая работа materially зависит
от отдельного Human decision,
это решение должно быть запланировано заранее
```

Версия не вводит новый authority layer, обязательную taxonomy решений, обязательные Decision Views, CAV или TL;DR ceremony.

---

## 1. Что именно стало лучше

### Было

IDPF уже различал:

```text
Verification ≠ Admission
Capability не создаёт Authority
Human Validation не является Verification
Engineering View ≠ Authoritative Source
```

и позволял создавать Human Gates для существенных решений.

Но необходимость отдельного human decision могла обнаружиться слишком поздно — например, уже после:

- build;
- manifest integration;
- freeze;
- independent review;
- package preparation;
- подготовки production transition.

Это создавало риск дорогого возврата назад.

### Стало

При формировании project-specific Working Process Runtime теперь отдельно проверяет:

> Есть ли среди будущих результатов такой material object, для которого до конкретного downstream transition требуется самостоятельное человеческое решение?

Если да, процесс заранее фиксирует:

- exact object или configuration;
- смысл требуемого решения;
- accountable authority;
- evidence basis;
- момент, до которого решение должно быть принято;
- конкретный blocked downstream effect;
- reopen / invalidation trigger;
- disposition: отдельное решение, совместимое объединение, наследование существующего Admission или отсутствие отдельного решения.

Для этой обязанности используется stable semantic marker:

```text
material_human_decision_obligation
```

Это **не новый status enum** и не отдельная машина состояний.

---

### 2. Главный новый принцип работы

Для material artifact теперь явно различаются:

```text
artifact identity
≠ content meaning
≠ human intent
≠ Verification evidence
≠ Admission
≠ authority decision
≠ permission for downstream action
```

Практический смысл простой:

- успешный checker не означает approval;
- hash closure не означает content approval;
- Verification не означает Admission;
- Release Admission не означает, что человек отдельно одобрил содержание публичного текста;
- наличие технической возможности продолжить не создаёт authority;
- наличие review не заменяет требуемый Human decision.

---

### 3. Как работает новый механизм

Логика теперь выглядит так:

```text
Working Process formation
        ↓
выявление material decision-critical result
        ↓
фиксация decision obligation
        ↓
Loop inheritance
        ↓
Verification / evidence preparation
        ↓
Human Gate
        ↓
canonical Decision Record
        ↓
разрешённый downstream transition
```

Если отдельного material decision нет:

```text
no_material_decision_no_ceremony
```

и новый Gate, form, approval carrier или обязательный TL;DR не создаются.

---

### 4. Что именно планируется заранее

Для каждого подтверждённого material decision достаточно зафиксировать:

| Что фиксируется | Смысл |
|---|---|
| **Decision Object** | какой exact result / artifact / configuration рассматривается |
| **Receiving use** | кто и для чего будет на него опираться |
| **Decision meaning** | что именно должен решить человек |
| **Accountable authority** | кто имеет право принять решение |
| **Evidence basis** | на каких проверках и данных основывается решение |
| **Required timing** | до какого transition решение обязательно |
| **Blocked effect** | что нельзя делать до решения |
| **Reopen trigger** | какое изменение делает решение stale |
| **Disposition** | отдельное решение, combined Gate, inherited Admission или отсутствие отдельного решения |

Это планируется как часть существующего Working Process, а не как новый самостоятельный subsystem.

---

## 5. Decision View — только представление для решения

Если Human Gate действительно нужен, Runtime должен показать объект так, чтобы человек мог принять осмысленное решение.

В зависимости от задачи это может быть:

- полный artifact с вариантами решения;
- decision table;
- questionnaire;
- annotated diff / redline;
- walkthrough;
- evidence decision package;
- обычное компактное текстовое представление.

Логика:

```text
Decision Object
→ derived Decision View
→ Human Response
→ canonical Decision Record
```

При этом:

```text
Decision View остаётся производным представлением, а не Authoritative Source
Decision View ≠ Decision Record
```

Generated view не становится requirements source и не получает authority только потому, что он удобен или интерактивен.

Human-owned поля не должны быть заранее заполнены агентом как принятое решение.

---

### 6. Что происходит с решениями «принять с условиями»

Conditional approval теперь должен оставаться восстанавливаемым.

Если решение принято с условиями, сохраняется связь:

```text
Condition
→ object / locus
→ responsible disposition
→ downstream effect
→ closure criterion
→ reopen semantics
```

Сам факт `approved_with_conditions` не означает, что любой downstream transition автоматически разрешён.

Blocking condition должен быть явно закрыт, dispositioned или учтён в допустимом scope.

---

### 7. Несколько решений не схлопываются в одно «approved»

Один объект может требовать нескольких независимых решений.

Например:

```text
Content Approval
+ Security Decision
+ Release Admission
→ Publication
```

Они могут быть представлены в одном Human Gate только если остаются отдельно различимыми:

- смысл решения;
- authority;
- conditions;
- effect;
- reopen trigger;
- exact object/configuration.

Одна общая галочка не должна молча заменять несколько разных решений.

---

### 8. Missing / stale decision не считается approval

В 3.5.0 явно сохраняется правило:

```text
missing
unknown
ambiguous
stale
required decision

≠ implicit approval
```

Если обязательное решение отсутствует или стало неприменимо после material change, зависимый downstream transition должен быть заблокирован либо отправлен на clarification / return / honest stop.

---

## 9. Пример: Release Notes

Показательный пример — публичные Release Notes.

Они одновременно являются:

- packaged file;
- human-facing communication artifact;
- частью release configuration.

Но это не означает, что одно решение автоматически покрывает всё.

Правильная цепочка может выглядеть так:

```text
Candidate Release Notes
→ Content Verification
→ Human Content Approval
→ Independent Content Review, если нужен
→ Manifest / Package Integration
→ Deterministic Build and Freeze
→ Independent Frozen-Artifact Review
→ Release Admission
```

Здесь:

```text
Согласование содержания не заменяет Release Admission
```

Human approval содержания Release Notes не заменяет Release Admission exact package configuration.

И наоборот: Admission ZIP/package не означает, что содержание Notes было отдельно прочитано и одобрено для целевой аудитории.

---

## 10. Простая работа остаётся простой

Это принципиально важная часть релиза.

Новый mechanism **условный**.

Само наличие:

- файла;
- Candidate label;
- AI-generated content;
- большого документа;
- красивой формы;
- возможности построить Decision View;

не создаёт Human Gate.

Триггер появляется только тогда, когда есть самостоятельная decision value, например:

- внешний или публичный receiving use;
- human / operational intent;
- authority effect;
- consequential relying use;
- legal / safety / security / compliance effect;
- дорогой или труднообратимый downstream transition;
- высокая стоимость позднего обнаружения ошибки.

Если material decision отсутствует, Runtime сохраняет прямой маршрут без новой церемонии.

---

## 11. Что намеренно не добавлено

Версия 3.5.0 **не вводит**:

- новую hierarchy authority;
- универсальную taxonomy decision types;
- новый approval subsystem;
- обязательный `Artifact Approval Map` carrier;
- обязательный `Decision View Plan` carrier;
- mandatory CAV;
- mandatory TL;DR для всех документов;
- отдельный Human Gate для каждого файла;
- новый source of truth;
- parallel requirements authority.

Candidate terms вроде:

```text
content_approval
intent_validation
engineering_admission
release_admission
authority_decision
evidence_acceptance
```

могут использоваться как понятные project-level формулировки, но не образуют новую универсальную state machine Runtime.

---

### 12. TL;DR — не отдельный механизм Runtime

Идея TL;DR рассматривалась как часть исходного Candidate Improvement, но в финальной логике 3.5.0 она не превращена в обязательную ceremony.

Для длинного material artifact краткое summary может быть полезным navigation view, но:

- не заменяет полный artifact;
- не скрывает Candidate status;
- не скрывает limitations;
- не заменяет Human decision;
- не становится authoritative source;
- не создаётся для простой работы без необходимости.

То есть TL;DR остаётся usability mechanism, а не новым фундаментальным процессным правилом.

---

## 13. Связь с существующей архитектурой IDPF

3.5.0 не меняет базовую модель Runtime.

Сохраняются:

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

Новый mechanism встроен в существующие:

- Working Process planning;
- Loop inheritance;
- Human Gates;
- Verification;
- Admission;
- authority semantics;
- reopen semantics;
- Engineering Views.

Это extension существующей архитектуры, а не новый lifecycle.

---

### 14. Сохранённые архитектурные границы

Следующие различения остаются обязательными:

```text
Content Approval ≠ Release Admission
Verification ≠ Admission
Human Validation ≠ Verification
Decision View ≠ Authoritative Source
Capability ≠ Authority
```

Дополнительно сохраняется:

```text
Approval ≠ permission for every downstream action
```

Решение разрешает только тот downstream effect, который был явно связан с этим exact decision.

---

## 15. Что проверено

Изменение проверено на Candidate-конфигурации Working Process Guide, integrity checker и behavioral scenarios:

```text
S-181 — S-188
```

Проверки включали:

- frozen-baseline closure;
- disposable configuration closure;
- actual Windows PowerShell 5.1 execution path;
- missing-marker controls;
- duplicate controls;
- count controls;
- Acceptance negative controls;
- восстановление полного integrity pass после каждой изолированной мутации;
- exact `14/14/14` controls, detections и restores;
- cleanup временного дерева;
- подтверждение нулевых live effects.

В процессе тестирования были выявлены реальные дефекты test harness, включая особенности UTF-8 without BOM в Windows PowerShell 5.1.

Финальная проверенная композиция использовала:

- ASCII-only wrapper;
- strict UTF-8 decoding exact payload.

Это является evidence проверенной test configuration, а не новым требованием Runtime использовать такой wrapper.

---

### 16. Ограничения evidence

Проверка:

- выполнена агентом;
- не содержит independent reviewer claim;
- не включает field study;
- не включает production rollout;
- не включает usability/accessibility study;
- не доказывает экономию времени на внешних проектах.

Поэтому релиз подтверждает:

```text
contract
+ behavioral regression sensitivity
+ exact tested configuration
```

но не заявляет доказанный production benefit.

---

## 17. Совместимость

Изменение ограничено:

```text
project-specific Working Process planning
+
Loop inheritance
```

Оно:

- не изменяет FPF;
- не изменяет `AI_SDLC_DPF/**`;
- не требует общей migration существующих проектов;
- не вводит common catalogue/template promotion;
- не делает CAV обязательным;
- не превращает generated view в requirements source;
- не отменяет существующие Human Gates, Verification или Admission;
- не требует нового carrier без independent lifecycle / receiving use.

Пересмотр existing process требуется только если materially изменились:

- relying object;
- authority;
- blocked transition;
- evidence basis;
- reopen condition.

---

## 18. Release identity и publication boundary

Release identifier:

```text
IDPF 3.5.0
```

Product maturity:

```text
Beta
```

Предназначенный release asset:

```text
Instantiatio-DPF-3.5.0-Beta.zip
```

Release Notes сами по себе **не доказывают**, что ZIP:

- собран;
- frozen;
- проверен;
- admitted;
- опубликован.

Точный статус release, размер, SHA-256 и состав handoff определяются отдельными frozen evidence и Release Admission.

После freeze exact размер, SHA-256 и состав handoff фиксируются в расположенном рядом `RELEASE_CANDIDATE.json` и подтверждаются отдельным Release Admission.

После freeze любое material изменение создаёт новый same-version release successor и требует повторного deterministic build, проверки, review и Release Admission.

Git tag, upload и GitHub publication выполняются отдельно и требуют соответствующей authority.

---

## Итог

Этот релиз добавляет не новую approval-систему, а **раннее планирование действительно существенных человеческих решений**.

Главное улучшение можно выразить так:

```text
раньше:
Human Gate мог быть корректно создан,
но необходимость отдельного решения
могла обнаружиться поздно

теперь:
Working Process заранее определяет,
какой material result требует Human decision,
кто его принимает,
до какого transition,
что блокируется
и когда решение надо переоткрыть
```

При этом сохраняется главный принцип:

```text
no material decision
→ no new ceremony
```

То есть Runtime стал точнее в работе с human authority и downstream transitions, не превращая каждый artifact в объект отдельного согласования.
