# Instantiatio DPF 3.7.1 — Engineering Work Runtime · Beta

> Release status: `released`
> Release date: `2026-08-28`
> Released predecessor: `3.7.0`
> Included AI SDLC DPF: unchanged `1.0.1`

## Кратко о выпуске

`3.7.1` — corrective successor после первого полевого испытания ordinary human-friendly режима Runtime `3.7.0`. Исправление устраняет ошибочное предъявление пользователю внутренней схемы Runtime там, где для решения достаточно сгруппированного понятного смысла.

Полная engineering basis — инженерная основа — продолжает храниться во внутренних точных carriers и остаётся восстанавливаемой. Полнота основы больше не трактуется как обязательная видимость каждого внутреннего элемента в ordinary presentation.

## Исправление ordinary presentation

- ordinary presentation покрывает все decision-changing темы в сгруппированной форме: статус результата, authority boundary, существенные риски, ограничения, последствия и требуемое решение;
- internal IDs, coverage/result codes, hashes и item-level checklist скрыты, если элемент не требует самостоятельного disposition, пользователь не запросил подробности и не выбран Engineering/Runtime-Audit уровень;
- Engineering и Runtime/Audit presentation продолжают предоставлять точную configuration, evidence и traceability той же runtime state;
- сжатие подачи не разрешает скрывать preliminary/non-admitted смысл, Verification, Human Gate или последствия решения;
- дополнительный Gate, carrier, Loop или independent-review condition для low-consequence local/test-data work должен иметь конкретный receiving use и decision-changing consequence.

Lifecycle, authority и Verification не ослаблены. Исправление меняет projection — способ предъявления — и правило пропорциональности process ceremony, но не создаёт параллельную истину или автоматический Admission.

## Regression evidence

В behavioral suite добавлены два replay-профиля на основе полевого диалога:

- ordinary replay проверяет не только наличие обязательных смыслов, но и объём видимой подачи: не более `5` bullets и `130` слов; фактический reference replay — `5` bullets и `109` слов;
- тот же ordinary replay требует `0` внутренних coverage codes, hashes и item-level checklist;
- Engineering replay по явному запросу восстанавливает точные `R/E/ER/RDX/HD/P`, configuration checklist и hash, не создавая другой runtime state;
- оба профиля сохраняют boundary, риски, последствия и требуемое решение.

Verification также сохраняет:

- Bootstrap behavioral carrier: continuous `S-1…S-204`;
- Runtime 3.6 regression carrier: `53` scenarios;
- Runtime 3.7 integration carrier: `10` scenarios;
- Polish01 field-regression profiles: `2`;
- full repository integrity и clean-extraction package integrity.

## Impact review

Ожидаемый положительный эффект — пользователь может понять состояние и принять решение без знания Runtime schema, при этом подробная трассировка остаётся доступной по запросу. Риск чрезмерного сжатия ограничен обязательной видимостью decision-changing информации и regression checks содержания.

Наблюдавшиеся в первом полевом испытании три Gate, более `683` строк carriers, `26` result items, `10` reductions, пять Loops и independent-review condition не объявлены автоматически ошибочными. Они зафиксированы как proportionality observation: каждый дополнительный механизм должен быть оправдан конкретным receiving use и способностью изменить решение. Одного диалога недостаточно для общего ослабления lifecycle или review requirements.

## Package

Publication-ready archive: `Instantiatio-DPF-3.7.1-Beta.zip`.

Точный ZIP определяется только adjacent `SHA256SUMS.txt` и `PACKAGE_VERIFICATION.md`. Встроенный статус `released` означает release-конфигурацию байтов, но не утверждает факт tag, upload, push или внешней публикации.

## Compatibility and limitations

- controlled AI SDLC DPF остаётся byte-identical version `1.0.1`;
- выпущенный predecessor `3.7.0` и его package outputs не изменяются;
- existing project-specific authority и admitted results не мигрируются автоматически;
- implementation и Verification выполнены тем же агентом; independent engineering review не заявляется;
- regression replay доказывает контрактную форму и содержание reference presentation, но не универсальное понимание всеми пользователями и не cross-host field effectiveness;
- signing, SBOM, external malware scan и cross-host byte-identical reproducibility не заявляются;
- внешняя публикация этим пакетом не выполнялась.

## Known accepted release limitation

Локальный source register содержит запись `ISO/IEC/IEEE DIS 29148 Ed.3` со stage `40.00`; прежний disposition `accepted_non_blocking` сохраняется как исторический. Для successor publication условие открыто и оценено заново:

`ISO29148-REL371 = reopened_assessed_nonblocking_for_3_7_1; no external currentness refresh; no successor-status/compliance claim; DPF unchanged; reopen on material applicability/currentness claim, source-maintenance task or next successor publication`.

Это не Verification pass стандарта и не claim о current edition, adoption или compliance.

## Repository

Canonical repository: `https://github.com/instantiatio/iDPF`.

External publication remains a separate authorized action.
