# Instantiatio DPF — Engineering Work Runtime 3.2.0

## Статус

- Version: `3.2.0`.
- Publication status: `released`.
- Historical admitted baseline: `Instantiatio DPF — Engineering Work Kit 3.1.0`.
- Admitted release-readiness basis: `RRP-INST_DPF_EVOL_001-002-v0.1.0`, SHA-256 `A5478A6515CF1932C0043355D16D29FCD5D47EAFF360F9C17240054117E6AB52`.
- Controlled `AI_SDLC_DPF/**`: unchanged.

Эта запись описывает admitted released configuration. Проверенный ZIP и checksum создаются локальным exact transition process и служат handoff для отдельного publication-проекта. Git tag, GitHub Release, upload и внешняя публикация этим репозиторием не выполняются и не заявляются. Точный состав и hashes определяются в [`PACKAGE_MANIFEST.md`](../../PACKAGE_MANIFEST.md).

## Кратко об изменениях

Runtime 3.2.0 превращает набор связанных engineering files в явно позиционированную среду управляемой работы человека и агента. Старт стал понятнее, режим по умолчанию компактнее, объединённый пакет полномочий получил строгие условия остановки, сторонние методы не могут молча подменить DPF-процесс, а инженерные представления и композиции процессов вынесены в контекстно выбираемые non-authoritative каталоги.

Изменения развивают admitted baseline 3.1.0 и не изменяют controlled AI SDLC DPF edition.

## S-01 — Identity, onboarding and interaction

- Current public identity: `Instantiatio DPF — Engineering Work Runtime`.
- Historical `Engineering Work Kit 3.1.0` сохраняется как exact baseline/provenance identity.
- Первый вход использует пять понятных intent-сценариев; все шесть combinations presentation-настроек остаются secondary controls.
- Default при отсутствии более приоритетной настройки: non-persistent `compact + milestone`.
- Existing explicit project/session/initiative preferences не мигрируют автоматически и сохраняют прежний смысл.
- CAP при первом упоминании объясняется как объединённый пакет полномочий и не активируется без exact approval.
- Основная выдача использует порядок `Статус` → при необходимости `Требуемое решение` → полезная `Служебная информация`.

## S-02 — Bounded authority and external methods

- CAP связывает exact inputs, loci, phases, predicates, budgets, Verification и recovery.
- Отклонение прекращает CAP как `terminated_on_deviation`; тот же CAP не возобновляется.
- После понятной причины может быть один раз предложен successor package, но он не создаётся и не активируется автоматически.
- Сторонний skill/method классифицируется по фактическому использованию как capability-only, process-bearing mappable или incompatible.
- Внешний lifecycle, plan, state, source of truth, Verification или Admission не заменяет admitted Runtime process.
- При отсутствии стороннего метода никакое постоянное сканирование skills не требуется.

## S-03 — Engineering views

- Добавлен модуль [`catalog/engineering_views/`](../../catalog/engineering_views/README.md).
- Каталог содержит initial set `EV-01`–`EV-09`, включая system context, component responsibility, sequence, state, ER/data, API, deployment and trace views.
- Представления выбираются по контексту и first relying use; каталог не является checklist полноты или authority level.
- View сохраняет source, configuration, level, freshness, non-coverage и confidentiality boundaries.
- Actual project profile не создаётся автоматически.

## S-04 — Working Process compositions

- Добавлен модуль [`catalog/working_process_compositions/`](../../catalog/working_process_compositions/README.md).
- Он различает contextual compositions `CC-01`–`CC-06`, engineering methods `EM-01`–`EM-05` и reusable modules `WM-01`–`WM-08`.
- Initial method set включает V-диаграмму, specification-based development, User Stories, Use Cases и Domain-Driven Design.
- Выбор выполняется после admitted context, `FC-13` и expanded project-relevant coverage.
- Catalogue selection не создаёт Working Process, Task, Run, CAP или authority.
- Use Cases не скрывают отдельные operational-scenario gaps; DPF остаётся универсальной методологической основой.

## Integration refinement

Первичная system Verification обнаружила `F-01`: старые `S-14/S-53` противоречили новому `S-81` по default и first-entry behavior. Successor refinement изменил ровно три строки в behavioral contract, сохранил `S-1`–`S-136` и stable aliases и закрыл finding на declared static/existing-behavioral scope.

## Compatibility and migration

### Сохранено

- canonical repository identity и корневые operational paths;
- controlled `AI_SDLC_DPF/**` identity, bytes, hierarchy and provenance;
- Candidate → Verification → Admission → Relied-on separation;
- explicit project/session/initiative preferences;
- historical Work Kit names where they identify real released baselines;
- no-catalogue/lightweight routes for small reversible work;
- actual admitted project Working Processes unless explicitly changed.

### Изменено намеренно

- current public product name is Runtime;
- default without a higher-priority preference changes from `standard + milestone` to `compact + milestone`;
- first-entry surface is intent-first rather than a raw mode matrix;
- CAP deviation and successor behavior are explicit;
- process-bearing external skills must map through Runtime;
- reusable view/process-selection guidance is modular under `catalog/**`.

### Что проверить существующим проектам

1. Existing explicit preference carriers should remain unchanged; absence of a carrier uses the new default.
2. Custom prompts or tests that assume the old first-entry wording may need adaptation.
3. Local processes that rely on external skills should verify capability/process mapping and authority boundaries.
4. Persisted engineering views or composition records remain project-specific Candidate carriers and are not created by upgrade.

## Authority, security and privacy

- Каталоги и templates предоставляют guidance/reference, а не authority.
- Confidence, successful execution, tool availability or explanation never creates authority.
- External tools inherit host/system, privacy, law, contract and admitted domain restrictions.
- Views inherit source confidentiality and cannot be auto-published.
- No project source, secret, personal data or external-service transfer is introduced by this release.

## Verification evidence

- Admitted component results: S-01, S-02, modular S-03 successor and S-04-R01.
- Admitted integrated successor: `IVR-INST_DPF_EVOL_001-002-v0.1.0`.
- Behavioral contract: exact continuous `S-1`–`S-136` with stable aliases.
- F-01: `closed_verified_static_and_behavioral_contract`.
- Release readiness was established by clean integrity automation and a separately assigned independent review.
- Repository automation is regression evidence and does not prove behavior in every agent host.

## Known limitations

- Representative field pilot was not performed and remains `not_performed_non_blocking_limitation`.
- Independent release review completed: `IRR-INST_DPF_EVOL_001-RR01-R01-001-v0.1.0`, SHA-256 `877E00A73BBC425F219BCC9DA2C3B4398D730C83A2DDCBF24CA816CF8F3188F8`, disposition `pass_with_nonblocking_limitations`.
- Product status is `released`; local ZIP/checksum are produced by the exact transition process, while Git tag, GitHub Release, upload and external publication remain outside this repository transition.
- No claim of universal method completeness, regulated adoption or field-proven usability is made.
- The accepted bounded currentness limitation for ISO/IEC/IEEE DIS 29148 Ed.3 remains recorded in the manifest; controlled DPF sources are not silently changed.

## Rollback and recovery

The exact rollback basis is the immutable admitted archive:

- `project/source/baselines/Instantiatio-DPF-3.1.0.zip`;
- SHA-256 `9E1689A3845ECCA5F70EBA55CA5F99AC09FA80640A7E6B4EE791650396931E21`;
- length `724022` bytes;
- checksum carrier `project/source/baselines/Instantiatio-DPF-3.1.0.sha256.txt`.

Rollback should restore the baseline into a separate verified directory rather than overwrite live project work. Project-specific carriers require their own compatibility/recovery decision.

## Release Admission and distribution handoff

This released configuration is based on:

1. admitted release-ready `RRP-INST_DPF_EVOL_001-002-v0.1.0`, SHA-256 `A5478A6515CF1932C0043355D16D29FCD5D47EAFF360F9C17240054117E6AB52`;
2. independent `IRR-INST_DPF_EVOL_001-RR01-R01-001-v0.1.0`, SHA-256 `877E00A73BBC425F219BCC9DA2C3B4398D730C83A2DDCBF24CA816CF8F3188F8`, disposition `pass_with_nonblocking_limitations`;
3. separately authorized exact local transition and reproducible ZIP/checksum verification.

The verified ZIP and checksum are the handoff to a separate GitHub publication project. Git writes/tag, GitHub Release, upload and external publication are not performed or claimed by this repository transition.
