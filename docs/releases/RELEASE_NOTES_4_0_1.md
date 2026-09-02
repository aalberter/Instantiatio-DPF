# Instantiatio DPF 4.0.1 — Engineering Work Runtime · Beta

> Release status: `released`
> Product maturity: `Beta`
> Release closure date: `2026-09-02`
> Published predecessor: `4.0.0 Beta`
> External publication: `not performed`

## Кратко

`4.0.1` исправляет маршрутизацию формирования Working Process и упрощает первый контакт с iDPF. Non-software Human–AI работа больше не должна подключать AI SDLC DPF как скрытый универсальный process framework. Рабочий путь начинается с первого практически полезного результата и использует только действительно применимые DPF.

Новый Runtime не добавляет lifecycle, Gate, Registry или отдельный process layer. Включённые HAWS DPF 1.0 Final Admitted и AI SDLC DPF 1.0.1 сохранены без изменения bytes.

## Что теперь работает иначе

- Операционный вход однозначен: root `AGENTS.md` выполняет deterministic re-entry и выбирает Cheap Exit, bounded Direct Work, reuse или conditional Bootstrap.
- Working Process формируется из `Runtime mechanics + applicable DPF + project sources/context`.
- HAWS DPF применяется situation-driven только к фактически возникшим AUTH/RELY/CURR/VER situations.
- AI SDLC DPF выбирается как governing route только для software-specific receiving use; возможная будущая software-задача не создаёт applicability заранее.
- `FC-13` больше не является universal entry: он применяется только внутри уже обоснованного AI SDLC route.
- Если Runtime/DPF/context недостаточны, bounded reference search начинается с exact operational gap, имеет stop rule и не даёт reference автоматическую authority.
- Loop создаётся только для повторяемого result contract с собственными receiving use, Verification и return route; отдельный concern, pattern или check сам по себе Loop не создаёт.
- После первого полезного admitted результата Runtime останавливается, пока не появится следующий receiving use.

## Что изменилось для пользователя

- Первый экран README отвечает, что делает iDPF, как начать, куда положить материалы, что будет результатом и когда требуется решение человека.
- Canonical greeting стал короче и task-first. Normal empty-project state не сопровождается служебным сообщением об отсутствии инициативы.
- В подходящем introductory context используется одна точная необязательная фраза: **«Могу подробно рассказать о возможностях iDPF.»**
- По такому запросу Runtime даёт human-facing руководство о возможностях, маршрутах, Human–AI работе, проверке, Admission, автономности, Engineering Views, ограничениях и типовых запросах.
- Engineering Views можно запрашивать обычным языком; они остаются производными представлениями инженерного состояния и не создают отдельную истину или authority.

## Проверяемое поведение

Новые Runtime 4.0.1 scenarios покрывают:

- non-software HAWS formation без normative AI SDLC route;
- прямой software-specific AI SDLC route;
- mixed work с bounded DPF applicability;
- Cheap Exit, Direct Work, reuse и first-useful-result stop;
- greeting, capabilities-on-request и Engineering Views;
- clean package, protected DPF hashes и link dispositions.

Executable integrity checker обновлён только для software-specific receiving use проверки exact `4.0.1` package configuration. Это bounded direct AI SDLC use и не делает AI SDLC общей основой Runtime process.

## Известные ограничения и deferred findings

- Семь унаследованных relative links в трёх protected AI SDLC files не открывают package-root targets напрямую после relocation. Root navigation и checker projection остаются рабочими; изменение protected bytes требует отдельной framework-authority/maintenance decision.
- Четыре self-links в admitted HAWS DPF body используют legacy slugs, отличающиеся от generated Markdown anchors. Exact body не изменён; correction требует отдельной HAWS maintenance/successor authority.
- Structural tree cleanup не выполнялся: независимый assessment не обнаружил перемещения или удаления с пользой, превышающей link/manifest/portability churn.
- Passing semantic/integrity checks являются Evidence, а не Human Admission и не доказательством universal field effectiveness.

## Совместимость и границы

- Existing admitted Work Contexts, Working Processes, Loops, Tasks, Runs и results остаются valid для их exact prior uses; mass migration не выполняется.
- Source change по-прежнему переоткрывает только affected reliance slice, а supervised AI assistance не классифицируется как E.16 autonomy.
- Clean release package содержит только empty `project/` scaffold; development initiative history и source materials в ZIP не входят.
- Release state `released` фиксирует завершённую локальную package closure и не означает external publication. Tag, push, upload и GitHub Release не входят в эту initiative и не выполнялись; historical `4.0.0` notes остаются snapshot опубликованного predecessor.

## Admission boundary

Точный ZIP, manifest, checksum и Verification summary должны пройти frozen-configuration review и отдельное Human final Admission. Internal release state не создаёт Admission или publication authority. Любое изменение после freeze создаёт новый Candidate result и переоткрывает только затронутые checks.
