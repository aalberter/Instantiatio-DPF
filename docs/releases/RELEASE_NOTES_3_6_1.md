# Instantiatio DPF 3.6.1 — Engineering Work Runtime · Beta

> Release status: `released`
> Release date: `2026-08-26`
> Product maturity: `Beta`
> Released predecessor: `3.6.0`
> Included AI SDLC DPF: unchanged `1.0.1`

## Кратко

iDPF `3.6.1` — corrective patch-release для Engineering Review Human Gates. Он замыкает разрыв между наличием Engineering Views и их фактическим использованием: перед первым material relying decision Runtime автоматически разрешает применимые представления, предъявляет их минимальную достаточную text-complete Gate Projection в том же Gate и затем формирует review-checklist точной конфигурации с незаполненными полями Human Response.

Изменение не вводит новый authority level, не изменяет controlled `AI_SDLC_DPF/**` и не делает заполнение checklist автоматическим Admission. Ссылки, hashes и IDs остаются полезными реквизитами, но не заменяют предъявление содержания для review.

## Основные изменения

### Фактическое предъявление Engineering Views

Для первого существенного решения, которое опирается на инженерный объект или его производное представление, Runtime теперь:

1. определяет current applicable Engineering Review Views для exact Candidate/configuration;
2. в том же Human Gate показывает smallest sufficient text-complete projection до блока рекомендации и вариантов решения;
3. сохраняет связь элементов View с authority, source, evidence, currentness и first relying use;
4. блокирует только затронутое решение, если required View отсутствует или устарела.

Для простой обратимой работы церемония View не создаётся. Если host не может предоставить native или secure surface, Runtime использует допустимое текстовое предъявление либо честно блокирует затронутое решение; наличие одной ссылки не считается предъявлением.

### Runtime review-checklist

После Gate Projection Runtime формирует checklist, связанный с exact Candidate, View и configuration. Обязательные human disposition, comment/ref и outcome fields создаются пустыми: агент не заполняет их от имени человека и не выводит согласие из молчания.

Runtime различает полный и неполный Human Response:

- partial, ambiguous или early response уточняет только незакрытые items;
- aggregate response допустим лишь когда однозначно покрывает exact presented items и предусмотренный outcome;
- configuration drift регенерирует затронутые items, сохраняя применимое evidence по неизменившимся элементам;
- deterministic re-entry восстанавливает pending Gate из exact authority/configuration/factual state, а не из chat memory или stale index;
- completion checklist означает полноту Human Response, но не correctness, Verification или automatic Admission;
- существующий lightweight route сохраняется для trivial/reversible work.

Addressed feedback связывается с exact Candidate/View/configuration/element ref и возвращается в минимальный ответственный source или carrier. После изменения затронутая View регенерируется и повторно проверяется; feedback сам по себе не переписывает source и не создаёт Admission.

## Реализованная конфигурация

Corrective behavior реализовано и допущено как точная пятифайловая конфигурация:

- `AGENTS.md` — компактный dispatcher invariant предъявления View, checklist validity и запрета automatic Admission;
- `WORKING_PROCESS_AND_LOOPS_GUIDE.md` — полная operational mechanics Gate Projection, checklist, partial/aggregate response, drift и re-entry;
- `catalog/engineering_views/README.md` — contract фактического предъявления, privacy/currentness и supplementary-link boundary;
- `tests/behavioral/RUNTIME_3_6_OPERATIONAL_SCENARIOS.md` — 3.6-series observable contract и exact behavioral oracles;
- `scripts/check_integrity.ps1` — структурные guards, которые проверяют распространение обязательных markers, но явно не заменяют behavioral Verification.

Версии внутренних компонентов сохраняются: `AGENTS 2.9.0`, Working Process Guide `1.11.0`, Engineering Views review contract `0.2.0-candidate` и Runtime scenario carrier `0.2-candidate`. Версия `3.6.1` идентифицирует целую release configuration, а не скрытую смену component authority.

## Verification corrective behavior

До подготовки release package для exact functional Candidate выполнены:

- bounded behavioral replay `20/20 pass` в одном primary model/context;
- unprompted synthetic ТОиР-like Gate, где projection и четыре human-empty checklist items фактически предшествовали вариантам решения;
- isolated Candidate integrity check `INTEGRITY_CHECK_PASS` с disposable verification-only manifest projection;
- структурная и semantic trace-проверка exact пяти файлов;
- внутренний read-only Candidate challenge с outcome `pass_with_visible_limitations`.

Эти результаты подтверждают bounded Candidate behavior и его traceability. Они не утверждают, что ещё не собранный на момент подготовки этих Notes архив прошёл package, CRC, clean-extraction или final Admission checks: применимым доказательством этого станет отдельная package Verification exact ZIP.

## Быстрый старт

После получения допущенного release archive:

1. распакуйте `Instantiatio-DPF-3.6.1-Beta.zip`;
2. переименуйте корневую папку в название своего проекта;
3. откройте её в агентной среде с поддержкой корневого `AGENTS.md`;
4. при наличии исходных материалов поместите их в `project/source/`;
5. опишите инженерную задачу естественным языком.

Runtime восстановит существующую инициативу либо проведёт Bootstrap. В первом material Human Gate он сам предъявит применимую Engineering View projection и сформирует review-checklist; специально просить View не требуется.

## Совместимость

- Базовый host contract по-прежнему требует поддержку корневого `AGENTS.md`.
- Existing admitted project carriers сохраняют authority только для своих exact uses; массовая миграция не требуется.
- Human Gate, Verification и Admission остаются раздельными состояниями и решениями.
- `tests/behavioral/RUNTIME_3_6_OPERATIONAL_SCENARIOS.md` сохраняется как 3.6-series carrier; косметического rename нет.
- Controlled AI SDLC DPF остаётся `1.0.1` byte-for-byte; framework migration и изменение DPF semantics отсутствуют.
- Released predecessor `3.6.0` и его Release Notes сохраняются как immutable historical configuration.

## Ограничения

iDPF `3.6.1` сохраняет зрелость `Beta`. Behavioral replay выполнен одним primary model/context, а внутренний challenge не является организационно независимым assurance. Host/model adherence и path/effect boundary компенсируются exact contracts, hashes, checks и recovery routes, но не заявлены как детерминированно enforced для всех сред.

Релиз не доказывает cross-host или universal field effectiveness, production correctness в предметной области, formal compliance, certification либо независимость организации review. Он не добавляет persistent checklist store, native review form или secure-surface integration. В средах с иными capabilities затронутая qualification должна оцениваться заново.

## ISO/IEC/IEEE 29148 currentness condition

Для `3.6.1` release authority явно установила:

`ISO29148-REL361 = reopened_assessed_nonblocking_for_3_6_1; no external currentness refresh; no successor-status/compliance claim; DPF unchanged; reopen on material applicability/currentness claim, source-maintenance task or next successor publication`.

Это risk disposition, а не Verification PASS или утверждение актуального официального статуса стандарта. В zero-network release process внешний currentness refresh не выполнялся; локальный controlled source register не считается currentness-qualified для successor stage. Релиз не опирается на утверждение о стадии successor, превосходстве current edition, adoption или compliance. Condition должна быть reopened при material standards applicability/currentness claim, отдельной authorized source-maintenance task либо следующей successor publication.

## Целостность пакета и публикация

После package closure `PACKAGE_MANIFEST.md` внутри архива должен содержать exact distributed inventory и SHA-256 каждого файла, кроме self-unhashed manifest. После распаковки предусмотрена команда:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\check_integrity.ps1
```

Final package evidence обязано отдельно подтвердить allowlist, safe single-top-directory ZIP, отсутствие duplicate/symlink/unsafe entries, CRC, byte equality, manifest hashes и clean-extraction checker PASS. Exact ZIP checksum оформляется вне архива и этих Notes, чтобы не создавать self-reference.

Встроенный статус `released` не означает фактическую внешнюю публикацию. В этом проекте создаётся и допускается архив для передачи; tag, upload и publication выполняются в другом проекте по его authority. До final package Admission архив нельзя представлять как publication-ready.

## Происхождение и лицензия

FPF является концептуальной основой iDPF, однако Instantiatio DPF не является официальной дистрибуцией FPF и не заявляет affiliation или endorsement его авторов. Внешние FPF-файлы не включаются в пакет и не relicensed.

Runtime распространяется по MIT License. Canonical repository: `https://github.com/aalberter/Instantiatio-DPF`.
