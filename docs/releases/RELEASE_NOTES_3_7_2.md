# Instantiatio DPF 3.7.2 — Engineering Work Runtime · Beta

> Release status: `released`
> Release date: `2026-08-28`
> Released predecessor: `3.7.1`
> Included AI SDLC DPF: unchanged `1.0.1`

## Кратко о выпуске

`3.7.2` — второй corrective release после полевого replay ordinary human-friendly режима. `3.7.1` правильно определил сгруппированную presentation semantics, но реальное исполнение всё ещё могло показать пользователю внутренние IDs, потребовать approval по codes и создать отдельные review carriers без самостоятельного receiving use.

Этот выпуск превращает правило проекции в обязательный pre-send execution guard и добавляет исполняемую self-contained regression для полного маршрута Work Context → Entry Decision → Working Process.

## Усиление ordinary execution

- перед каждым material ordinary Gate Runtime проверяет фактически видимый main presentation и регенерирует его до Human Response, если необоснованный internal trace остался видимым;
- internal IDs и configuration tokens классифицируются по роли независимо от знакомого или нового prefix;
- element-level trace показывается только при самостоятельном human disposition, явном запросе либо Engineering/Runtime-Audit уровне;
- `Принять рекомендованный вариант` описывает человеческое действие и последствие; code-based approval, ranges и checklist-row approval запрещены;
- Candidate/non-admitted meaning, authority boundary, material risk/limitation, Verification state и allowed/prohibited effects остаются обязательными;
- exact internal mapping сохраняется recoverably и доступен на Engineering/Runtime-Audit уровне без создания другой runtime state.

## Proportional Review carriers

Gate-local checklist больше не считается самостоятельным receiving use для physical Review carrier. Отдельный carrier допустим, только если exact review basis имеет независимого получателя или повторное material use, которое нельзя recoverably сохранить в principal carrier. Receiving use и decision-changing consequence называются до создания.

Это не объединяет разные authority decisions и не ослабляет lifecycle, system-level Verification, real risk/commitment triggers или действительно требуемую independent review.

## Greeting routing

Canonical greeting теперь предлагает точный вопрос:

> **«Какие уровни работы доступны?»**

Ответ на него раскрывает только ordinary, Engineering и Runtime/Audit presentation levels. Internal interaction axes, Bootstrap strictness, CAP и «Форсаж» не смешиваются с этим ответом и остаются доступны только по отдельному применимому вопросу или trigger.

## Executable three-Gate regression

Runtime 3.7 behavioral carrier содержит три self-contained positive ordinary Gate и три negative Gate:

- positive Work Context, Entry Decision и Working Process fixtures сохраняют decision-changing смысл при нулевом количестве internal IDs, SHA-256 values, item-level checklist rows и code-based approval;
- фактические pre-option объёмы — `80`, `69` и `81` слово при budget `130`; bullets `0` при budget `5`; links `0` при budget `1`;
- historical families и mutations `ZETA-904`/`trace_item_42` проверяют, что detector не ограничен фиксированным prefix list;
- отдельная negative mutation проверяет checklist-based approval даже без внутреннего ID;
- separate Review carrier fixtures проверяют как prohibited no-receiving-use case, так и allowed independent-use case.

Integrity automation фактически исполняет эти fixture checks. Marker presence больше не является единственным evidence correction.

Retained regression:

- Bootstrap behavioral carrier: continuous `S-1…S-204`;
- Runtime 3.6 regression carrier: `53` scenarios;
- Runtime 3.7 integration carrier: `10` scenarios;
- positive ordinary Gate fixtures: `3`;
- negative ordinary Gate fixtures: `3`.

## Impact review

Ожидаемый эффект — material Human Gate нельзя отправить только потому, что internal basis полна: observable ordinary projection обязана пройти отдельный guard. Пользователь принимает содержательное действие, не изучая Runtime schema, а подробный trace остаётся доступным по запросу.

Изменение не добавляет lifecycle state, authority level, Gate type или automatic Admission. Three-Gate replay проверяет exact embedded outputs и identifier mutations, но не перехватывает произвольный будущий host/model response и не доказывает универсальную human comprehension или cross-host field effectiveness. Следующий clean-chat field replay остаётся необходимым evidence.

Implementation и Verification выполнены одним агентом. Отдельный Review carrier не создавался, поскольку самостоятельный assurance receiving use для него не был установлен; independent engineering review не заявляется.

## Package

Publication-ready archive: `Instantiatio-DPF-3.7.2-Beta.zip`.

Точные ZIP bytes определяются adjacent `SHA256SUMS.txt` и `PACKAGE_VERIFICATION.md`. Встроенный статус `released` означает release-конфигурацию байтов, но не утверждает Package Admission, tag, push, upload или внешнюю публикацию.

## Compatibility and limitations

- controlled AI SDLC DPF остаётся byte-identical version `1.0.1`;
- released predecessors `3.7.0` и `3.7.1` и их package outputs не изменяются;
- existing project-specific authority и relied-on results не мигрируются автоматически;
- signing, SBOM, external malware scan и cross-host byte-identical reproducibility не заявляются;
- executable replay является bounded regression evidence, а не доказательством любого будущего model output;
- внешняя публикация этим package build не выполняется.

## Known accepted release limitation

Локальный controlled source register содержит историческую запись `ISO/IEC/IEEE DIS 29148 Ed.3` со stage `40.00`. Для текущей successor publication условие открыто и оценено без network currentness refresh:

`ISO29148-REL372 = reopened_assessed_nonblocking_for_3_7_2; no external currentness refresh; no successor-status/compliance claim; DPF unchanged; reopen on material applicability/currentness claim, source-maintenance task or next successor publication`.

Это не Verification pass стандарта и не claim о current edition, adoption, compliance или superiority.

## Repository

Canonical repository: `https://github.com/instantiatio/iDPF`.

External publication remains a separate authorized action.
