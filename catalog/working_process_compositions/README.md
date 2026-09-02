# Каталог композиций рабочих процессов

> Module: `catalog/working_process_compositions/**`
> Status: `0.1.0-candidate`

## Назначение

Пользовательский маршрут «Варианты организации инженерной работы» помогает собрать понятный проекту **Candidate Working Process** из трёх разных типов элементов:

- контекстная композиция задаёт удобную общую форму движения;
- инженерные методы помогают решить конкретные классы задач;
- повторно используемые модули сохраняют необходимые инженерные результаты и проверки.

Это не библиотека готовых процессов и не новая методология поверх DPF. Каталог используется только после `admitted context → smallest applicable DPF selection → project-relevant concerns/results`. `FC-13` допустим лишь внутри уже выбранного AI SDLC route и не является universal entry для non-software или mixed work. Запись, рекомендация или заполненный шаблон не создают authority, Task, Run, CAP, файловый эффект или Admission.

## Быстрый человеческий маршрут

1. Сначала опишите систему, задачу, последствия ошибки и первое решение, которое будет опираться на результат.
2. Разверните необходимые инженерные результаты и применимые DPF/reference obligations.
3. Если работа мала, обратима и наблюдаема, используйте лёгкий Direct Work/Task route без каталожной церемонии.
4. Если общая форма действительно помогает, выберите не более одной контекстной композиции.
5. Для конкретных задач обычно достаточно одного–трёх инженерных методов. Каждый должен иметь отдельную пользу и границу применения.
6. Добавьте только сработавшие модули и project/domain-specific результаты; не втискивайте пробелы в ближайшую карточку.
7. До утверждения покажите рекомендацию, существенные альтернативы, адаптации, сокращения, остаточные пробелы и требуемое решение.
8. Только process authority может принять exact Candidate Working Process.

Совпадение ключевого слова, известность метода, число артефактов или числовой «процент соответствия» не доказывают пригодность.

## Что выбирается

| Тип | IDs | Роль | Не является |
|---|---|---|---|
| Контекстная композиция | `CC-01`–`CC-06` | навигационная форма для текущего контекста | обязательным lifecycle |
| Инженерный метод | `EM-01`–`EM-05` | способ решить названную инженерную задачу | project authority или полнотой процесса |
| Повторно используемый модуль | `WM-01`–`WM-08` | concern/result fragment с собственным receiving use | обязательной стадией |

Exact карточки находятся в [CATALOG.md](CATALOG.md). Исторические `WA-01`–`WA-06` сохраняются как aliases для `CC-01`–`CC-06`; `Working Process Archetypes` и «составные архетипы» — только прежние названия семейства.

## Правила композиции

- Контекстная композиция выбирается максимум одна; допустимо не выбирать ни одной.
- Инженерные методы выбираются независимо по наблюдаемым задачам. Обычно достаточно одного–трёх.
- Два метода для одной concern допустимы только при разных receiving uses, границах и совместимом результате.
- Несовместимые owners, authority, source-of-truth или Admission boundaries не объединяются.
- Модули не упорядочены заранее: порядок задают реальные dependencies и first relying uses.
- Проектные и отраслевые обязательства остаются first-class, даже если в каталоге нет подходящей записи.
- Существующий admitted Working Process остаётся действующим; каталог не переклассифицирует и не изменяет его автоматически.

## Как Runtime объясняет рекомендацию

Основная выдача начинается с обычного русского текста:

```text
Статус
Что рекомендуется и почему это полезно именно здесь.
Что не покрыто, какие есть ограничения и что потребуется сделать.

Требуемое решение
Какую exact Candidate configuration предлагается принять, изменить или отложить.

Служебная информация
IDs, dispositions, sources/currentness, dependencies, hashes и reopen triggers.
```

До process approval Runtime предлагает подробное обоснование, сравнение вариантов, пример для проекта, ожидаемые результаты и усилия, если пользователь просит пояснить выбор или видна существенная неопределённость. Это объяснение раскрывает evidence и trade-offs, но не имитирует private chain of thought и не меняет project/session modes молча.

## Представления и источник истины

Общие системные и продуктовые представления выбираются через [`catalog/engineering_views/**`](../engineering_views/README.md), даже если метод их не называет. Method-specific рабочие представления — например V-диаграмма, Story Map, Use Case Diagram или Context Map — остаются в соответствующей карточке метода.

Любое relied-on представление называет source/configuration, scope/level, receiving use и non-coverage. Оно не становится parallel truth. Диаграмма навигации не заменяет текстовые сценарии, данные, интерфейсы, спецификации или Verification evidence, когда они нужны.

## Внешние skills и методы

Внешняя capability может помочь выполнить bounded action. Если она приносит собственный lifecycle, plans, authority, state или verification semantics, применяется S-02 compatibility mapping: полезная техника встраивается в текущие Task/Run, а несовместимая process-bearing часть отклоняется для этого use. Каталог, plugin или skill не повышает собственный authority.

## Источники и актуальность

Карточка метода хранит source basis, существенную edition/version, дату review, ограниченную currentness claim и reopen trigger. Обычный выбор использует уже проверенную карточку без обязательного web-доступа.

Перед affected reliance сначала выполните claim-sized comparison. Если material claim change, способный изменить receiving action/result, не установлен, используйте Cheap Exit. Если several partly unknown receivers действительно возможны, примените bounded `A.10.1` route:

- зафиксируйте present question, included/excluded receiving families, surfaces, conditions, owners и gaps;
- используйте source-outward и receiver-oriented discovery;
- после inspection классифицируйте каждый candidate как `depends | mentions only | unresolved`;
- follow only exact action-changing `depends` relations и примените direct subject guidance;
- завершите resolved branches локально с coverage limits, next receiver и reopen observation.

Search hit, citation, trace или graph reach не доказывают dependence. Не создавайте universal dependency graph, registry или new status vocabulary. Новая редакция источника или полевое наблюдение создаёт Candidate review, а не автоматическое изменение общей карточки или project process. Новая common entry требует самостоятельной receiving-use ценности, признанного/primary source basis и хотя бы одного counter-signal. Поверхностный вариант остаётся alias, техникой внутри карточки или deferred proposal.

Positive `SoTA` use требует одного полного `E.8:11` comparison: exact practice question, selected best-known line, serious rival/default, defect overcome, exact pattern/process mutation, source roles/limits и reopen condition. Ярлык `SOTA`, известность, officiality, freshness или популярность метода не создают rank без этого comparison и named receiving use.

## Не подошёл ни один вариант

Это нормальный исход. Зафиксируйте `no_fit` или ordinary non-use, сохраните project/domain-specific concerns и соберите Candidate Working Process непосредственно из admitted context, DPF/reference obligations и необходимых результатов. Каталог не является completeness proof.

## Optional selection record

[Шаблон записи](templates/WORKING_PROCESS_COMPOSITION_RECORD.yaml) нужен только для сложного, повторного или persistent выбора. Его заполнение не создаёт actual project process; итоговая конфигурация и process authority decision остаются отдельными exact carriers.

## Изменение и retirement

Одноразовая полезная техника остаётся локальной. Project/domain extension получает namespaced ID. Common promotion требует повторной межпроектной ценности и полного card contract. Удаление или переименование relied-on ID требует alias/supersession, migration impact и reopen route.
