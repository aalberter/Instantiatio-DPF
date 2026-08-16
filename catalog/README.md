# Каталог инженерной работы Runtime

> Version: `0.1.0-candidate`

## Назначение

`catalog/**` содержит выбираемые по контексту инженерные модули Runtime. Каталог помогает подобрать представление, типовую композицию или другой reusable engineering asset, но не является Project-specific Process, источником product truth или уровнем authority.

Наличие модуля или записи:

- не делает её обязательной без применимого trigger/receiving use;
- не изменяет Work Context, Entry Decision, Working Process, Task, Run или Admission;
- не разрешает создание файлов, внешний эффект или reliance;
- не изменяет controlled `AI_SDLC_DPF/**`.

Core Runtime обнаруживает material trigger и сохраняет authority/Human Gate invariants. Подробная selection/content mechanics находится в соответствующем модуле.

## Доступные модули

| Модуль | Когда обращаться | Статус |
|---|---|---|
| [Инженерные представления](engineering_views/README.md) | material engineering object, аудитория/решение или повторное receiving use требуют понятной и проверяемой проекции | Candidate module |
| [Варианты организации инженерной работы](working_process_compositions/README.md) | после context/`FC-13`/expanded coverage нужен осмысленный выбор контекстной композиции, инженерных методов или reusable concern modules | Candidate module |

## Маршрут выбора

1. Определи инженерный объект, вопрос, receiving use, аудиторию и предстоящее решение.
2. Выбери только доступное семейство, отвечающее этому вопросу.
3. Примени его module-level triggers, counter-signals и minimum contract.
4. Верни выбранный результат в действующий Working Process/Task/Run как Candidate.
5. Сохрани применимые Verification, Human Gate и Admission boundaries.

Для малого обратимого изменения допустим явный `no catalogue` route. Выбор композиции, метода, модуля или optional record не создаёт Working Process: сначала формируется exact Candidate configuration, затем её отдельно принимает process authority.

Не загружай все модули и записи ради completeness theatre. Недоступное или планируемое семейство не является Entry Route и не может подменять обычный project-specific процесс.
