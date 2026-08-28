# Instantiatio DPF 3.7.0 — Engineering Work Runtime · Beta

> Release status: `released`
> Release date: `2026-08-28`
> Product maturity: `Beta`
> Released predecessor: `3.6.1`
> Included AI SDLC DPF: unchanged `1.0.1`

## Кратко

iDPF `3.7.0` делает взаимодействие человека и Runtime понятнее без создания параллельной инженерной семантики. По умолчанию используется обычный human-friendly уровень: человек видит задачу, этапы, существенные основания, риски, результаты проверок и только необходимые решения, а инженерные и Runtime/Audit подробности доступны по запросу.

Решения маршрутизируются по явно установленным сведениям об участниках. Product accountability, компетентный engineering review и Admission authority exact result остаются разными ролями и действиями, даже когда их выполняет один человек. Краткая граница: `Authority ≠ Competence`.

## Основные изменения

### Обычный режим и первый контакт

Приветствие сокращено до task-first входа: iDPF объясняет назначение, различает новую инициативу и продолжение существующей работы, сообщает об обычном уровне взаимодействия и предлагает описать задачу либо поместить материалы в `project/source/`. Внутренние параметры, полный список режимов и «Форсаж» не выводятся на первом экране.

Термин `Candidate` может быть скрыт в обычной речи, но его смысл скрывать нельзя: предварительный или ещё не допущенный результат явно обозначается как непригодный для reliance до требуемой проверки или решения.

### Decision routing и человеческие роли

Runtime восстанавливает только применимые к конкретному решению сведения: product accountability, установленную review competence, основание её установления, Admission authority, доступность и route эскалации. Должность, стиль ответа или предполагаемые способности человека не используются как доказательство competence или authority.

При неизвестной или частично подходящей competence останавливается только зависимое решение. Независимая работа может продолжаться внутри ранее предоставленной authority, admitted Working Process/Loop и без нового material commitment.

### Progress и Engineering Review Views

Обычное представление сохраняет узнаваемую карту этапов — завершённые, текущий и оставшиеся — после Human Gate, re-entry и reopen. Эта карта вычисляется из существующих process carriers; отдельный progress store не создаётся.

Engineering Review Views выбираются по принципу minimal effective representation: текст — для линейного смысла, таблица — для точных сопоставлений, диаграмма — для действительно сложных связей. Крупные Mermaid-схемы используют `TB`/`TD` или разделяются; уменьшение до плохо читаемого масштаба не считается приемлемым представлением.

### Parsimony и authority boundary

Версия не добавляет новый Participant registry, универсальную competence taxonomy, routing state, Gate type, Admission status, progress store, authority level или отдельную Human Projection truth. Human-facing, Engineering и Runtime/Audit уровни остаются производными представлениями одного engineering state.

## Реализованная конфигурация

Функциональное изменение выполнено в восьми loci: dispatcher, два execution Guides, Engineering Views guidance, Bootstrap и Runtime 3.6 behavioral carriers, новый Runtime 3.7 carrier и integrity checker. Release integration обновляет только component identity и публичные release surfaces, не расширяя допущенную функциональную семантику.

Версии затронутых компонентов: `AGENTS 2.10.0`, Bootstrap Guide `1.10.0`, Working Process Guide `1.12.0`, Engineering Views `0.3.0-candidate` и Runtime 3.7 scenario carrier `0.1.0`.

## Verification

До package assembly подтверждены:

- непрерывная behavioral sequence `S-1…S-204`;
- сохранённый Runtime 3.6 regression carrier: `53` scenarios;
- Runtime 3.7 integration carrier: `10` scenarios;
- cross-locus trace human interaction, routing, role separation, affected-only stop, delegated continuation, progress и View selection;
- canonical greeting contract и отсутствие внутренних presentation-параметров на первом экране;
- `INTEGRITY_CHECK_PASS`, strict UTF-8/LF и отсутствие изменений controlled `AI_SDLC_DPF/**`;
- exact eight-locus functional scope и неизменность исходного архива `3.6.1`.

Package-level Verification является отдельным доказательством exact ZIP. Действителен только архив, чьи имя и SHA-256 совпадают с adjacent `SHA256SUMS.txt` и для которого adjacent `PACKAGE_VERIFICATION.md` подтверждает manifest inventory, безопасные пути, CRC, byte equality, чистую распаковку и повторный integrity-check.

## Быстрый старт

1. распакуйте `Instantiatio-DPF-3.7.0-Beta.zip`;
2. переименуйте корневую папку в название своего проекта;
3. откройте её в агентной среде с поддержкой корневого `AGENTS.md`;
4. при наличии исходных материалов поместите их в `project/source/`;
5. опишите, что хотите сделать.

iDPF восстановит существующую инициативу либо подготовит начальный контекст новой работы для подтверждения. Инженерный или Runtime/Audit уровень можно запросить в любой момент.

## Совместимость

- Host contract по-прежнему требует поддержку корневого `AGENTS.md`.
- Existing admitted Work Context, Working Process и project carriers сохраняют authority для своих exact uses; массовая миграция не требуется.
- Runtime 3.6 operational scenarios сохраняются как regression evidence; Runtime 3.7 carrier является additive successor contract.
- Controlled AI SDLC DPF остаётся `1.0.1` byte-for-byte; framework и authority hierarchy не меняются.
- Внутренние presentation controls и «Форсаж» сохраняются, но не перегружают обычный старт и не создают authority.

## Ограничения

iDPF `3.7.0` сохраняет зрелость `Beta`. Functional implementation и Verification выполнены одним агентом; независимый engineering review не проводился. Это ограничение было явно принято Functional Admission и не должно интерпретироваться как независимое assurance.

Verification не доказывает universal human comprehension, cross-host adherence, field effectiveness, correctness предметной модели, production safety, regulatory compliance или сертификацию. Package не подписан; SBOM, external malware scan и cross-host byte-identical reproducibility не заявляются.

## ISO/IEC/IEEE 29148 currentness condition

Для successor release применена disposition:

`ISO29148-REL370 = reopened_assessed_nonblocking_for_3_7_0; no external currentness refresh; no successor-status/compliance claim; DPF unchanged`.

Релиз не делает утверждений о текущей стадии successor, превосходстве current edition, adoption или compliance и не изменяет controlled source register. Condition должна быть reopened при material standards applicability/currentness claim, отдельной authorized source-maintenance task либо следующей successor publication.

## Целостность пакета и публикация

`PACKAGE_MANIFEST.md` внутри архива содержит exact distributed inventory и SHA-256 каждого файла, кроме self-unhashed manifest. После распаковки используйте:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\check_integrity.ps1
```

Встроенный статус `released` описывает конфигурацию bytes и не означает фактическую внешнюю публикацию. Tag, GitHub Release, upload, push и публикация не выполнялись этой инициативой и требуют отдельной authority.

## Происхождение и лицензия

FPF является концептуальной основой iDPF, однако Instantiatio DPF не является официальной дистрибуцией FPF и не заявляет affiliation или endorsement его авторов. Внешние FPF-файлы не включаются в пакет и не relicensed.

Runtime распространяется по MIT License. Canonical repository: `https://github.com/instantiatio/iDPF`.
