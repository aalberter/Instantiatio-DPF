# Instantiatio DPF 3.6.0 — Engineering Work Runtime · Beta

> Release status: `released`
> Release date: `2026-08-25`
> Product maturity: `Beta`
> Released predecessor: `3.5.0`
> Included AI SDLC DPF: unchanged `1.0.1`

## Кратко

iDPF `3.6.0` делает Engineering Work Runtime устойчивее в длительной инженерной работе и яснее для первого знакомства. Релиз добавляет Engineering Review Views в существующие Human Gates, формализует host-neutral capability contract, ограничивает автоматизацию и reviewer routes, усиливает восстановление после смены сессии или среды и полностью перерабатывает README.

Runtime остаётся универсальным для агентных сред, поддерживающих корневой `AGENTS.md`. Codex используется как сильная референсная среда исполнения и может получать дополнительные оптимизации, но не является обязательной зависимостью.

## Основные изменения

### Engineering Review Views

Для существенных инженерных решений Runtime теперь может подготовить понятное представление непосредственно в том Human Gate, где оно используется. View связывает exact configuration, элементы решения, ответственность, evidence и последствия выбора, но остаётся производным представлением и не создаёт второй источник истины или новый authority level.

Замечание к View возвращается в минимальный ответственный source или carrier. После исправления затронутая View регенерируется и повторно проверяется; неизменившиеся элементы могут переиспользовать прежнее evidence. Для простой обратимой работы отдельная церемония представлений не требуется.

Структурированные пользовательские сообщения используют заметные заголовки второго уровня — `## Статус`, `## Этапы работы`, `## Рекомендация` и `## Варианты решения`. Это уменьшает риск потерять смысл Human Gate в длинном инженерном ответе.

### Host-neutral execution contract

Execution host описывается через наблюдаемые capabilities и exact configuration, а не через внутреннюю реализацию или одно имя продукта. В Runtime добавлены:

- capability-profile schema `1.1`;
- conformance protocol `RC-01…RC-06`;
- стабильные состояния `declared`, `enforced`, `compensated` и `unsupported`;
- явные маршруты `enforce`, `compensate`, `Human Gate` и `honest_stop`;
- датированный Codex reference capability profile как пример, а не обязательный профиль.

Version/build среды сохраняется как evidence и диагностический trigger. Само обновление host не инвалидирует qualification, если exact configuration и наблюдаемое поведение нужных capabilities не изменились.

Execution substrate также остаётся за implementation boundary. iDPF опирается на проверяемые свойства — isolation, controlled effects, resource bounds, verification, evidence, recovery и durable-state reconciliation — и не переносит внутрь Runtime семантику конкретного substrate.

### Bounded automation и reviewer control

Optional `CAP` применяется только как exact approved configuration с входами, loci, фазами, predicates, budgets, Verification, recovery и финальным Admission. Отклонение от согласованной конфигурации прекращает CAP и возвращает работу к обычному пошаговому процессу; автоматическое создание successor CAP не допускается.

Внешний метод, skill или plugin не заменяет lifecycle iDPF. Его полезные части либо отображаются в Task/Run, либо отклоняются как несовместимые. Capability и доступ к инструменту по-прежнему не создают authority.

Reviewer получает точные claims, evidence и prohibited effects. Read-only reviewer не может исправлять продукт, расширять scope, присваивать Admission или публиковать результат. Его findings возвращаются в тот же Gate и устраняются в минимальном ответственном locus.

### Восстановление работы

При continuation, compaction, новом chat/session/model/agent, host restart, handoff, interruption или длительной паузе Runtime сначала выполняет воспроизводимое восстановление состояния.

Восстановление раздельно определяет:

- authority — из exact admitted Work Context, Entry Decision, Working Process, Loop и Admission Decisions;
- relied configuration — из exact source, baseline, carrier refs и hashes;
- factual execution state — из Task/Run, фактических durable effects, текущих результатов, Gates и незакрытых маршрутов.

Optional `STATE_INDEX` остаётся только навигационной projection. Устаревший, повреждённый или противоречивый index игнорируется для authority и не заменяет exact carriers.

### Новый README

README полностью переработан как плотное инженерное введение вместо совмещённого tutorial, справочника и истории проекта. Он последовательно отвечает на вопросы:

- что такое iDPF и для чего он нужен;
- почему используется название `Instantiatio`;
- как начать новый проект из ZIP;
- чем Runtime отличается от coding assistants, agent frameworks, Agile + AI и Systems Engineering + AI;
- как устроены lifecycle, architecture и authority boundaries;
- какие идеи и возможности являются ключевыми;
- где Runtime полезен и где заканчивается доказанная применимость.

Основное краткое название — `iDPF`; при необходимости используется `iDPF Runtime`. Целевая система отделена от обеспечивающей системы её создания, а отличие от системной инженерии сформулировано без отрицания enabling systems и lifecycle processes.

## Verification

Release configuration прошла структурную, поведенческую и package-level Verification:

- root integrity checker: `INTEGRITY_CHECK_PASS`;
- independent clean extraction: `INTEGRITY_CHECK_PASS`;
- `R36-DRC-01` README first screen: `executed_pass`;
- `R36-DRC-02` release package closure: `executed_pass`;
- `43/43` release-wide `R36-*` scenarios получили выполненную disposition;
- integrated disposable fixture: `25/25` cases pass;
- additional in-memory transitions: `17/17` pass;
- affected legacy state-machine replay: `38/38` pass;
- все `78/78` затронутых legacy scenario IDs связаны с evidence;
- package inventory: `49` hashed files плюс self-unhashed `PACKAGE_MANIFEST.md`, всего `50` файлов;
- все `14` файлов `AI_SDLC_DPF/**` byte-identical исходному baseline;
- один внутренний read-only package challenge завершён без Critical, High, Medium или Low findings.

Эти проверки подтверждают exact release configuration и целостность пакета. Они не доказывают универсальную field effectiveness, организационную применимость или внешнюю сертификацию.

## Быстрый старт

1. Распакуйте `Instantiatio-DPF-3.6.0-Beta.zip`.
2. Переименуйте корневую папку в название своего проекта.
3. Откройте её в агентной среде с поддержкой `AGENTS.md`.
4. При наличии исходных документов поместите их в `project/source/`.
5. Опишите агенту инженерную задачу естественным языком.

Например:

```text
Нужно разработать требования и архитектуру новой подсистемы на основе материалов в project/source/.
```

Runtime восстановит существующее состояние либо проведёт Bootstrap и представит необходимые Human Gates. Для небольшой обратимой работы допускается облегчённый маршрут; строгость определяется риском и последствиями, а не количеством файлов.

## Совместимость

- Базовый host contract — поддержка корневого `AGENTS.md`.
- Codex-specific profile является optional reference evidence; generic host использует тот же implementation-neutral contract.
- Existing project carriers сохраняют authority только для своих admitted uses; массовая миграция не требуется.
- `RC-01…RC-06`, `EV-01…EV-09`, `DI-01…DI-08` и legacy `S-1…S-188` сохраняют непрерывность идентификаторов.
- Controlled AI SDLC DPF остаётся версией `1.0.1` byte-for-byte; framework migration не требуется.
- Conditional `EXTERNAL_INTEGRATION_PROFILE_TEMPLATE.yaml` не добавлен: predicate повторного материального независимого использования не подтверждён.

## Что не входит в релиз

- automatic fingerprinting, selective impact analysis и automatic requalification host;
- универсальная qualification всех agent environments и substrates;
- обязательный provider integration profile или parallel provider lifecycle;
- physical cross-host lock, scheduler или доказанная concurrent field effectiveness;
- внешняя организационная независимость внутреннего AI review;
- compliance или external field certification;
- изменения controlled `AI_SDLC_DPF/**` и новые core entities.

## Ограничения

iDPF `3.6.0` имеет зрелость `Beta`. Архитектура, lifecycle и release package проверены на ограниченной инженерной конфигурации, но эффективность в разных организациях, доменах, host environments и длительных production-инициативах требует дальнейших pilots и field evidence.

Внутренний challenge полезен для поиска противоречий, но не является организационно независимым assurance. Capability profile подтверждает только exact tested configuration и не предоставляет authority. Изменение наблюдаемого поведения isolation, effect control, recovery или evidence boundaries требует повторной оценки затронутой qualification.

Сохраняется admitted non-blocking limitation источника `AI_SDLC_DPF/reference/AI_SDLC_SOURCES.md`: описание стадии successor ISO/IEC/IEEE 29148 требует отдельного source-maintenance решения и не исправляется внутри этого релиза.

## Целостность пакета

`PACKAGE_MANIFEST.md` внутри архива содержит точный inventory и SHA-256 каждого distributed файла. После распаковки проверка запускается командой:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\check_integrity.ps1
```

Exact archive checksum и authority для передачи в publication project оформляются отдельно от ZIP, чтобы не создавать self-reference внутри Release Notes или manifest. Наличие embedded статуса `released` не подменяет фактическое решение о публикации во внешней системе.

## Происхождение и лицензия

FPF является концептуальной основой iDPF, однако Instantiatio DPF не является официальной дистрибуцией FPF и не заявляет affiliation или endorsement его авторов. Внешние FPF-файлы не включаются в пакет и не relicensed.

Runtime распространяется по MIT License. Canonical repository: `https://github.com/aalberter/Instantiatio-DPF`.
