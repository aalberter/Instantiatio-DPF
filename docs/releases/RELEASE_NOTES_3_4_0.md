# Instantiatio DPF 3.4.0 — Engineering Work Runtime · Beta

## Кратко о выпуске

- Runtime version: `3.4.0`
- Product maturity: `Beta`
- Publication status: `released`
- Product predecessor: `3.3.0 · Beta`

Версия 3.4.0 развивает Runtime в двух направлениях: добавляет опциональную экспериментальную (`optional experimental`) capability для Human–System Interaction / UI и делает взаимодействие с пользователем яснее на этапах работы и в точках принятия решений.

Release Admission: применимость конкретного пакета определяется отдельной exact Admission record. Сами Release Notes, publication status, integrity check или наличие файлов на GitHub не создают Release Admission.

## Главные изменения

### Optional HSI/UI capability

Новая специализация предназначена для проектов, где Human–System Interaction является существенной инженерной задачей. Она помогает вывести interaction design из уже действующих authoritative sources: Requirements, User / Operational Scenarios, roles and permissions, business rules, architectural constraints, применимых нормативных источников и существующего UI baseline.

User Interaction View, Interaction Model, Screen Specification и UI Prototype остаются производными инженерными представлениями (`derived engineering view`). Они не становятся отдельной authority требований, вторым SRS или самостоятельным источником нового поведения.

Предлагаемый маршрут применяется пропорционально задаче:

```text
Requirements / Scenarios
→ User Interaction View
→ Screen Specification, если он действительно нужен
→ Candidate UI Prototype
→ Verification
→ Human Validation, если она имеет защищаемую ценность
→ Admission
→ Production Implementation
```

Interaction Model по умолчанию является логической частью User Interaction View. Отдельный Screen Specification нужен только при собственной инженерной функции, lifecycle и receiving use. Human Validation не заменяет Verification, а прототип не становится production implementation.

Если проверка выявляет новое или изменённое поведение, finding возвращается в правильный locus: требования, сценарий, interaction/screen design или presentation layer.

### Ясность взаимодействия

- Русскоязычные пояснения даются по-русски; exact system terms, IDs, statuses, code, paths и цитаты сохраняются без переименования.
- На существенных переходах, после Human Gate, перед handoff или по запросу показывается компактный блок `Этапы работы`. Для простой или неизменившейся работы он не создаётся повторно.
- В реальной точке решения сначала показывается `Рекомендация`, затем один блок `Варианты решения`.
- Первый вариант `Принять рекомендованный вариант` повторяет точное действие и его последствие. Пользователь также видит применимые способы принять с условиями, вернуть на доработку, отложить или отклонить результат.

Двусмысленное согласие (`ambiguous assent`) не создаёт Admission. Молчание, реакция, общее «да» или номер без однозначной связи с представленной exact configuration требуют уточнения.

Целевые компоненты выпуска: Bootstrap Guide `1.8.0`, Working Process Guide `1.9.0`, AGENTS dispatcher `2.8.0`. Поведенческие сценарии образуют непрерывный диапазон `S-1`–`S-180`.

## Кому это нужно

Используйте HSI/UI capability, если interaction intent, навигация, permissions, material states, error conditions или согласованность экранов существенно влияют на инженерный результат.

Не вводите её только из-за наличия интерфейса. Для работы без material HSI concern, небольших presentation-only изменений и простых одношаговых задач сохраняется lightweight route. Simple work remains simple.

Отдельные Interaction Model, Screen Specification, prototype или Human Gate не являются обязательными deliverables: каждый carrier и Gate должен иметь самостоятельную функцию и receiving use.

## Совместимость

Существующие проекты и admitted Working Processes не мигрируют автоматически. Переход на Runtime 3.4.0 не изменяет прежние authoritative requirements, project-specific authority или exact admitted decisions.

Изменения совместимы с проектами без material HSI concern: новая specialization остаётся optional и включается через обычный Process Review. Специальная миграция данных или документов не требуется.

Выпуск не изменяет controlled `AI_SDLC_DPF/**`, source/reference materials, common promotion, общие catalogues/templates или CAV.

## Скачать и проверить

Используйте verified asset `Instantiatio-DPF-3.4.0-Beta.zip`. В нём должен быть ровно один top-level каталог `Instantiatio-DPF-3.4.0-Beta` и `46` файлов.

Точные размер и SHA-256 ZIP, количество entries, версии компонентов и verification metadata находятся в расположенном рядом `RELEASE_CANDIDATE.json`. Сверьте их до распаковки. Внешний `RELEASE_NOTES_3_4_0.md` должен совпадать с копией внутри ZIP byte-for-byte, а `PACKAGE_MANIFEST.md` — замыкать inventory и hashes packaged files.

GitHub source archives создаются платформой автоматически и не являются verified ZIP этого выпуска. Его hash, deterministic-build evidence и Python/.NET extraction evidence к ним не относятся.

После распаковки начните с `README.md`, `AGENTS.md` и `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md`.

## Проверка и ограничения

Runtime changes прошли структурную, семантическую, поведенческую, отрицательную и регрессионную Verification. Release route предусматривает full integrity, детерминированную двойную сборку, проверку безопасной структуры ZIP и независимое распаковывание средствами Python и Windows/.NET.

HSI evidence включает controlled synthetic pilot. Это не заявление о подтверждённой полевой пользе (`no field-benefit claim`): не проводились Human Validation реального product UI, production implementation, usability/accessibility evaluation или межпроектная field validation.

Human Validation проверяет реальный interaction intent, но не заменяет Verification. Integrity automation обнаруживает известные структурные и регрессионные дефекты, однако не доказывает полноту требований, понимание человеком или пригодность конкретного product UI.

Native Codex controls, CSS, fonts, persistence и host accessibility behavior не входят в заявленные результаты выпуска.

## Recovery и границы полномочий

Для использования и восстановления опирайтесь на exact hashes из применимой Release Admission и соседнего `RELEASE_CANDIDATE.json`. Одинаковые version number и filename не означают byte identity; разные handoff одной версии нельзя смешивать.

Любая правка Runtime carrier, README, Release Notes, manifest, packaged inventory или archive algorithm после freeze требует новых affected hashes, deterministic rebuild, повторной Verification, независимого review и новой exact Release Admission.

Candidate Result не становится relied-on release автоматически. Git tag, upload, GitHub Release и publication выполняются в отдельном проекте с собственной authority. Этот выпуск не создаёт UI Authority, второй SRS, common promotion или CAV.
