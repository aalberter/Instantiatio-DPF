# Instantiatio DPF (iDPF) 4.0.1 — Engineering Work Runtime · Beta

**iDPF — среда, в которой человек и AI-агенты выполняют инженерную работу вместе.**

Вы задаёте задачу обычным языком и, если нужно, добавляете исходные материалы. iDPF организует дальнейшую работу: помогает определить, что именно нужно получить, какие источники и инженерные правила применимы, что можно поручить AI, что должен решить человек и как проверить результат перед его дальнейшим использованием.

Цель iDPF — не просто получить ответ или сгенерировать артефакт, а **довести работу до проверенного результата, на который можно обоснованно опираться дальше**. Таким результатом может быть код, требования, архитектура, исследование, техническая документация, инженерное решение или изменение рабочего процесса.

iDPF не задаёт один универсальный процесс для всех задач. Он сначала определяет, какой объём работы действительно нужен. Простой вопрос может закончиться сразу готовым ответом; небольшое обратимое изменение — короткой прямой работой; для новой или более существенной инициативы iDPF сформирует подходящий Working Process с необходимыми проверками и точками решения человека.

AI при этом остаётся исполнительной частью инженерной работы. Существенные полномочия, ответственность и решение о том, можно ли использовать полученный результат дальше, остаются за человеком.

**Текущая версия:** iDPF Runtime `4.0.1` · `Beta` · release state `released`.  
Включённые HAWS DPF `1.0` Final Admitted и AI SDLC DPF `1.0.1` в этом выпуске не изменялись. 

Подробности — в [Release Notes 4.0.1](docs/releases/RELEASE_NOTES_4_0_1.md), точная конфигурация выпуска — в [`PACKAGE_MANIFEST.md`](PACKAGE_MANIFEST.md).

## Содержание

1. [Что такое iDPF](#что-такое-idpf)
2. [Почему Instantiatio](#почему-instantiatio)
3. [Быстрый старт](#быстрый-старт)
4. [Позиционирование и отличие от других инструментов](#позиционирование-и-отличие-от-других-инструментов)
5. [Как работает iDPF Runtime](#как-работает-idpf-runtime)
6. [Архитектура](#архитектура)
7. [Ключевые инженерные идеи](#ключевые-инженерные-идеи)
8. [Основные возможности](#основные-возможности)
9. [Где iDPF полезен](#где-idpf-полезен)
10. [Границы применимости и зрелость](#границы-применимости-и-зрелость)
11. [Состав поставки и дальнейшее изучение](#состав-поставки-и-дальнейшее-изучение)
12. [Происхождение, версия и лицензия](#происхождение-версия-и-лицензия)

## Что такое iDPF

iDPF — это `Engineering Work Runtime`: исполняемая среда, которая организует совместную инженерную деятельность человека и AI-агентов. Её предметом является не отдельный запрос (prompt), задача или фрагмент кода, а полный путь от исходного намерения до результата, пригодность которого установлена для конкретного дальнейшего использования.

Такой результат может быть программой, набором требований, архитектурой, исследованием, инженерной моделью, проектным решением, технической документацией, планом миграции или изменением самого рабочего процесса. Разработка программного обеспечения — важная, но не единственная область применения iDPF.

Обычная агентная среда предоставляет модели контекст и инструменты. iDPF добавляет недостающую инженерную конструкцию: определяет, с какой системой и проблемой ведётся работа, какие источники применимы, что уже принято человеком, какие действия разрешены, какой результат ожидается, как он будет проверен и кто вправе допустить его к дальнейшему использованию.

В результате AI используется не как автономный носитель ответственности, а как масштабируемая исполнительная способность более широкой обеспечивающей системы:

```text
Человек
+ iDPF Runtime
+ AI-агенты и инструменты
→ обеспечивающая система инженерной работы
→ создаёт и изменяет целевую систему
```

Целевая система и система, которая её создаёт, рассматриваются раздельно. Для целевой системы задаются требования, архитектура, интерфейсы и свойства. Для обеспечивающей системы проектируются процесс, полномочия, состояния работы, границы эффектов, проверки, точки решений и восстановление после сбоев. В этом состоит рекурсивный системно-инженерный ход iDPF: инженерная дисциплина применяется не только к создаваемому объекту, но и к самой деятельности по его созданию.

Краткая формула продукта:

> **iDPF превращает намерение в инженерный результат, на который можно обоснованно опереться, сохраняя полномочия за человеком и адаптируя процесс к конкретной задаче.**

## Почему Instantiatio

`Instantiatio` обозначает переход от общей идеи или намерения к конкретному воплощению. Современный AI резко сокращает расстояние между текстовым описанием и производимым изменением: сформулированная мысль может быстро стать кодом, документом, конфигурацией или действием во внешней системе. Однако скорость материализации сама по себе не делает результат инженерно надёжным.

iDPF добавляет к этому переходу контролируемую последовательность:

```text
Намерение
→ контекст
→ инженерная работа
→ результат-кандидат
→ проверка
→ решение о допуске
→ результат, на который разрешено опираться
```

Поэтому `Instantiatio` в названии означает не просто быстрое воплощение замысла, а его **инженерно контролируемое воплощение**. Существенно не только получить результат, но и сохранить основания, ограничения и решение, позволяющие безопасно использовать его дальше.

## Быстрый старт

Для нового проекта из package после его Admission:

1. Распакуйте exact verified package ZIP.
2. Переименуйте корневую папку в название своего проекта.
3. Откройте эту папку в агентной среде с поддержкой `AGENTS.md`.
4. Если у вас есть исходные документы, поместите их в `project/source/`.
5. Опишите агенту задачу естественным языком.

В clean extraction каталог `project/` содержит только пустой пользовательский scaffold. Встроенные framework baselines и authority evidence находятся отдельно в `frameworks/` и при re-entry не считаются предыдущей пользовательской инициативой.

Например:

```text
Нужно разработать требования и архитектуру новой подсистемы на основе материалов в project/source/.
```

Заранее изучать внутреннюю терминологию iDPF не требуется. iDPF сначала восстановит существующее состояние и выберет current first result. Если current FPF/subject baseline/source уже закрывает immediate use, он завершит вопрос через Cheap Exit. Для одной low-consequence reversible/observable action доступен bounded Direct Work с явными authority/effect/check boundaries. Только когда initiative требует отдельного context, scope, authority, source, process или receiving-use decision, Runtime проведёт Bootstrap и представит Candidate Work Context/Entry Decision для решения человека.

**Product identity precedence.** Внутри iDPF workspace общие introductory-вопросы о «тебе», возможностях, назначении или способе работы по умолчанию относятся к iDPF Engineering Work Runtime. Execution host или model не подменяют этот ответ и называются по явному вопросу либо когда их capability/limitation существенно влияет на текущую работу.

В уместном первом контакте iDPF может один раз предложить: **«Могу подробно рассказать о возможностях iDPF.»** Предложение можно проигнорировать: оно не повторяется после содержательной задачи, отказа или молчания и не создаёт обязательный onboarding, preference, process или Gate.

Для небольшого обратимого изменения iDPF может использовать прямой облегчённый маршрут. Для сложной или существенной по последствиям работы он сначала сделает видимыми границы, риски, ожидаемые результаты, проверки и точки решения человека (Human Gates). Строгость выбирается по характеру задачи, а не по количеству файлов или желанию формализовать всё заранее.

Подробные правила первого входа и восстановления работы находятся в [Engineering Work Bootstrap Guide](ENGINEERING_WORK_BOOTSTRAP_GUIDE.md).

## Позиционирование и отличие от других инструментов

iDPF не конкурирует с моделями, редакторами, coding agents, оркестраторами или CI-системами на уровне их основных функций. Он задаёт инженерную среду, в которой эти средства используются совместно, с явными состояниями, полномочиями и основаниями для дальнейшего обоснованного использования результата (reliance).

| Подход | Основной объект организации | Роль AI | Принципиальная граница |
|---|---|---|---|
| AI coding assistant | код и локальная задача разработчика | генерирует, объясняет и изменяет код | обычно не проектирует полную обеспечивающую систему инженерной работы |
| Agent framework или orchestration | агенты, инструменты, сообщения и автоматизация выполнения | исполняет распределённый workflow | технические возможности оркестрации сами по себе не определяют полномочия, проверку и допуск результата |
| Agile + AI | итеративная разработка продукта | ускоряет работу внутри принятого процесса | AI добавляется в существующий процесс; сам процесс совместной работы не обязательно проектируется как система |
| Systems Engineering + AI | требования, архитектура и жизненный цикл системы | помогает выполнять системно-инженерные работы | в типичном применении основной объект — целевая система; системная инженерия также умеет работать с enabling systems и процессами жизненного цикла |
| **iDPF** | **целевая система и обеспечивающая система её создания** | **масштабируемая исполнительная способность под полномочиями человека (human authority)** | **проектирование обеспечивающей AI-насыщенной инженерной работы становится явной частью Runtime** |

Главное отличие iDPF — не новый универсальный workflow. Напротив, iDPF отделяет устойчивые инженерные инварианты от способа их реализации и формирует рабочий процесс (Working Process) под конкретный рабочий контекст (Work Context). Исследование, legacy-модификация, greenfield-разработка, архитектурный анализ и подготовка документации могут использовать разные процессы, сохраняя одинаково ясные правила доверия к результатам.

iDPF также не сводится к набору запросов (prompts). Prompt помогает модели выполнить отдельное действие; iDPF поддерживает связное состояние длительной инициативы, переживающее смену чата, модели, агента или host. Не является он и автономным «AI-менеджером»: право изменить систему, принять риск или допустить результат не выводится из способности агента вызвать инструмент.

Практическая ценность iDPF проявляется там, где высокая скорость генерации начинает усиливать дрейф. Чем быстрее создаются документы, код и решения, тем важнее различать текущий источник, его интерпретацию, фактическое действие, результат, подтверждающие свидетельства (Evidence), проверку (Verification) и человеческое решение. iDPF делает эти различия частью рабочей среды, а не надеждой на внимательность участников.

## Как работает iDPF Runtime

Основной Runtime route ветвится по текущей потребности и не является обязательным универсальным lifecycle:

```text
deterministic re-entry + current subject/use selection
→ Cheap Exit / bounded Direct Work
  or
→ Engineering Work Bootstrap
  → Admitted Work Context
  → Entry Decision
  → Project-specific Working Process
  → Loop → Task → Run
→ Candidate Result
→ Verification
→ Admission Decision
→ Relied-on Result
→ stop at the first useful admitted result
```

**Bootstrap — входная инженерная настройка** — применяется после current-result selection, когда initiative действительно нужен отдельный Work Context. Он устанавливает систему интереса, intended use, границы, источники, ограничения и существенные риски. Entry Decision выбирает существующий или specialized Working Process; Cheap Exit и bounded Direct Work являются альтернативными более ранними outcomes и не проходят Bootstrap ради формы.

**Working Process — рабочий процесс** — является операционной организацией конкретной инициативы. Он не копирует универсальный lifecycle, а определяет необходимые результаты, зависимости, ответственность за интеграцию, проверки и точки решений. Работа разворачивается через ограниченные контуры (Loops), конкретные задания (Tasks) и фактические выполнения (Runs), поэтому широкое намерение не превращается в неограниченное разрешение агенту.

**Candidate Result — результат-кандидат** — любой существенный результат, который ещё не получил права быть основанием для следующего шага. Проверка (Verification) устанавливает его пригодность для определённого использования и формирует подтверждающие свидетельства (Evidence). После этого уполномоченный человек принимает решение о допуске (Admission Decision): допускает результат, отклоняет его, возвращает на уточнение или откладывает решение.

**Relied-on Result — результат, на который разрешено опираться**, — не синоним «хорошего файла». Это точный результат с известной конфигурацией, назначением, ограничениями и решением о допустимом использовании. Следующий участок работы может опираться только на соответствующее принятое основание, а не на последний убедительный ответ агента или наиболее новый файл по времени изменения.

Human Gate — точка решения человека — в iDPF является интерфейсом полномочий (authority), а не ритуальной паузой. Пользователь получает понятную картину: что произошло, что проверено, какие ограничения сохраняются, к чему приведёт каждый вариант и какое конкретное действие рекомендуется. В структурированной выдаче основные блоки — `## Статус`, `## Этапы работы`, `## Рекомендация` и `## Варианты решения` — оформляются крупными заголовками, чтобы смысл решения не терялся в тексте.

После прерывания, сжатия контекста, смены модели, агента или host iDPF выполняет воспроизводимое восстановление состояния (deterministic re-entry). Он раздельно восстанавливает полномочия из принятых решений, опорную конфигурацию — из точных carriers и hashes, а фактическое состояние выполнения — из Runs и реальных устойчивых эффектов (durable effects). История чата и optional State Index помогают навигации, но не подменяют authoritative state.

## Архитектура

Технически iDPF — не daemon и не hosted service. Это переносимая, repository-native директория с диспетчером `AGENTS.md`, методическими и операционными Guides, шаблонами, проверочными сценариями и project-specific состоянием. Агентная среда читает эти носители, выполняет разрешённые действия и записывает результаты в установленных границах.

Архитектура разделяет устойчивое знание, организацию работы и фактическое исполнение:

```text
FPF 31.08
→ current universal principles и conditional operational routes

frameworks/subject/HAWS_DPF
→ HAWS DPF 1.0 Final Admitted:
  current primary subject baseline для его exact AUTH/RELY/CURR/VER scope

frameworks/specializations/AI_SDLC_DPF
→ AI SDLC DPF 1.0.1:
  edition-qualified direct software route, controlled read-only

iDPF Runtime
→ state dispatch, conditional Bootstrap, process design,
  Human Gates, Verification и recovery contracts

Project-specific Working Process
→ конкретные результаты, Loops, Tasks, Runs,
  полномочия, ограничения и проверки

Execution host и инструменты
→ фактическое чтение, вычисление и изменение среды

Project state и work products
→ источники, carriers, результаты, Evidence и история решений
```

| Архитектурный слой | Ответственность |
|---|---|
| `frameworks/subject/HAWS_DPF/**` | exact HAWS DPF 1.0 body и authority/currentness evidence для его admitted предметного scope |
| `frameworks/specializations/AI_SDLC_DPF/**` | controlled read-only software specialization: edition-qualified direct route, когда он достаточно закрывает named software-specific use |
| `AGENTS.md` | компактный state-driven dispatcher, выбирающий применимый исполнительский locus и сохраняющий authority boundaries |
| Bootstrap и Working Process Guides | подробная механика входа, проектирования процесса, выполнения, Verification, Admission и восстановления |
| Project-specific carriers | точный контекст инициативы, процесс, Loops, Tasks, Runs, решения и relied-on configuration |
| Execution host | наблюдаемые capabilities чтения, изменения, изоляции, контроля эффектов и получения Evidence |
| Engineering Views | понятные человеку или агенту проекции authoritative state без создания второго источника истины |

Такое разделение позволяет изменять модели, инструменты и способы оркестрации без постоянной переделки нормативного ядра. iDPF ориентируется прежде всего на наблюдаемые capabilities exact configuration: какие эффекты host действительно способен контролировать, какое Evidence возвращает и как восстанавливается после сбоя. Version/build сохраняется как часть Evidence и диагностический trigger, но не становится основной семантикой iDPF.

Базовый host contract — поддержка корневого `AGENTS.md`. Поэтому iDPF не должен прекращать работу только потому, что среда не является Codex. Для Codex предусмотрен датированный reference capability profile и допустимы host-specific оптимизации, однако generic host использует тот же смысловой contract. Если требуемая граница не обеспечивается технически, iDPF выбирает компенсацию, Human Gate или honest stop, а не объявляет capability существующей.

Project-specific материалы размещаются внутри `project/`: исходные документы — в `project/source/`, процессные carriers — в `project/process/`, а рабочие результаты — в подходящих проектных loci. Package-owned DPF baselines, specializations и authority evidence размещаются отдельно в `frameworks/`; они доступны Runtime, но не образуют project history. Ветви `subject` и `specializations` классифицируют package content, но не задают authority precedence: FPF остаётся governing; HAWS — primary subject route для своего exact admitted scope; sufficient software-specific use может идти прямо к edition-qualified AI SDLC DPF без обязательной HAWS wrapper. Для mixed use Runtime выбирает smallest decision-changing route, а не подключает оба DPF автоматически. Наличие файла ещё не делает его authoritative: статус и допустимое использование определяются соответствующим carrier и Admission Decision.

## Ключевые инженерные идеи

### Процесс проектируется под задачу

Универсального оптимального процесса инженерной работы не существует. iDPF сначала проверяет достаточный current result, Direct Work и reuse; только затем при необходимости устанавливает новый контекст, риск и intended use и предлагает Working Process. Устойчивыми остаются инженерные обязательства; порядок, глубина и форма работы адаптируются к инициативе.

### Главный объект — надёжный результат, а не завершённое выполнение

Завершившийся Run означает только то, что агент перестал выполнять действия. Он не доказывает корректность, полноту или пригодность результата. iDPF отделяет факт выполнения от Candidate Result, Verification, Admission и завершённости всей инициативы.

### Reliance важнее убедительности

Основной вопрос — не «выглядит ли ответ правильным», а «достаточно ли он подтверждён для конкретного следующего использования». Поэтому существенный результат хранит intended use, Evidence, допущения, ограничения, связи с источниками и route пересмотра.

### Capability не означает authority

Доступ к файлу, shell, сети или внешней системе показывает техническую возможность, но не разрешение. Полномочия определяются человеком и точными carriers. Успешная проверка, уверенность модели и рекомендация reviewer также не создают Admission.

### Инженерные представления — человеческий интерфейс

Пользователь не обязан искать внутренние carriers или знать названия диаграмм. Runtime сам показывает нужное представление перед существенным решением либо строит его по естественному запросу: «Покажи текущее понимание задачи», «Какая сейчас архитектура?», «Как проверялся вывод?», «На какие источники опирается решение?» или «Какие ограничения остаются?».

Текст, таблица, схема или другой Engineering View строятся из текущего инженерного состояния и остаются проверяемой проекцией: они не создают отдельный source of truth, authority или Admission. При расхождении iDPF возвращается к точным Work Context, решениям, Runs, effects и relied-on configuration; представление можно восстановить из этой basis без ручной навигации пользователя по файлам.

### Строгость должна быть пропорциональна последствиям

Маленькая обратимая задача не нуждается в церемонии большого проекта. Но архитектурное решение, необратимый эффект, интеграция, release или утверждение, на которое будут полагаться другие работы, требуют явных границ и Verification. iDPF масштабирует контроль по риску и последствиям, а не по формальному размеру задания.

### Ошибка должна иметь адрес возврата

Проверка полезна, если понятно, что делать при её неуспехе. Для существенных элементов задаются responsible source, return route, recovery и reopen trigger. Обнаруженная проблема возвращается к наименьшему ответственному месту, после чего повторяется затронутая Verification, а незатронутые результаты могут быть переиспользованы.

### Эволюция должна быть управляемой

iDPF собирает field evidence, Patterns, Antipatterns и внешнее инженерное знание, но не переписывает собственные правила автоматически. Изменение DPF является отдельным Candidate Change с impact analysis, review, Verification и Admission. Новая модель, prompt или локальная проблема проекта не считаются достаточным основанием для изменения нормативного ядра.

## Основные возможности

| Возможность | Практический смысл |
|---|---|
| Управляемый вход | Dispatcher сначала выбирает достаточный current result, Direct Work или reuse и только при необходимости запускает Bootstrap |
| Current first result | Cheap Exit и bounded Direct Work закрывают immediate low-consequence use без обязательной полной process ceremony |
| Адаптивный Working Process | состав инженерных результатов и порядок работы проектируются под конкретную инициативу |
| Bounded execution | Loop, Task и Run ограничивают цель, разрешённые эффекты, ресурсы, stop conditions и route продолжения |
| Candidate и Admission | AI-output не становится основанием автоматически; решение остаётся за accountable authority |
| Verification и Evidence | проверки связываются с intended use, конфигурацией, наблюдаемыми эффектами и ограничениями доказательства |
| Deterministic re-entry | работа восстанавливается после смены чата, модели, агента или host без догадок по памяти переписки |
| Traceability и durable state | источники, интерпретации, решения, результаты и их замещения остаются различимыми во времени |
| HAWS subject baseline | Final Admitted HAWS DPF 1.0 применяется без копирования/переоткрытия к authority, reliance, currentness и verification-dependency challenge |
| Current DPF formation | `E.4.DPF` выбирает Cheap Exit, PFAD answer или отдельный conditional result; DPF.DA и positive `E.8:11` comparison применяются по receiving use |
| Affected-use revalidation | `A.10.1` ограничивает claim change, two-direction discovery и action-changing `depends` branches без universal dependency graph |
| Conditional autonomy | `E.16` требует enactment-bound budget/actuals/guards/ledger/depletion только для unsupervised decision или actuation |
| Engineering Review Views | material decision получает подходящее архитектурное, инженерное или управленческое представление в том же Gate |
| Decision-local routing | продуктовая ответственность, компетентный engineering review и Admission exact result маршрутизируются раздельно по явно установленным сведениям об участниках |
| Affected-only stop | неизвестная или частичная competence останавливает только зависимое решение; независимая ранее разрешённая работа может продолжаться |
| Понятная карта прогресса | ordinary projection сохраняет completed/current/remaining stages после Gate, re-entry и reopen без отдельного progress store |
| Minimal effective representation | текст, таблица или схема выбираются по фактической потребности решения, а крупные Mermaid-схемы компонуются вертикально либо разделяются |
| Capability profiles | host и substrate описываются через наблюдаемые свойства exact configuration без переноса vendor semantics в Runtime |
| Пропорциональные усиления | CAP, дополнительная Verification и независимый challenge применяются по подтверждённой необходимости, а не автоматически |

По умолчанию используется обычный human-friendly уровень: Runtime показывает понятные этапы, существенные основания, риски, результаты проверок и только необходимые человеку решения. Инженерный и Runtime/Audit уровни доступны по запросу; внутренние presentation-параметры сохраняются, но не перегружают первый контакт. Для совместимости Runtime по-прежнему поддерживает `guided`, `standard` и `compact` вместе с `detailed` или `milestone`, однако выбирать эти параметры на старте не требуется. Любой уровень сохраняет смысл предварительного результата, Human Gates, authority boundaries, рисков, ограничений и consequential actions.

iDPF поддерживает controlled handoff. Новый агент получает не пересказ прежнего разговора, а точный набор принятых оснований, текущую конфигурацию, фактическое состояние выполнения и открытые маршруты. Это позволяет вести длительные инициативы и менять исполнительские модели без потери границ ответственности.

iDPF допускает внешние методы и инструменты, если их полезные части сопоставимы с текущим lifecycle. Навык, plugin, provider approval или внешний workflow не заменяют Work Context, authority, Verification и Admission. Несовместимый процесс отклоняется либо используется только как capability под контролем текущего Working Process.

## Где iDPF полезен

iDPF рассчитан на инженерную работу, где результат должен стать основанием для дальнейших решений или изменений. Это особенно важно при высокой стоимости ошибки, длительном жизненном цикле, нескольких участниках, противоречивых источниках, смене агентов, необходимости handoff или сочетании локальных и системных свойств.

Типичные области применения включают разработку и изменение программных систем, системные требования, архитектуру, интеграцию, анализ legacy, исследовательские инициативы, impact analysis, миграционные планы, программы и методики испытаний, техническую документацию и подготовку release. Тот же подход применим к более широким инженерным проектам, если их работа может быть выражена через контекст, результаты, проверки, решения и контролируемые эффекты.

iDPF полезен и для фрагмента работы: можно подготовить архитектурное решение, проверить требования или провести bounded research spike без моделирования всего жизненного цикла продукта. Важно лишь честно определить границу результата и не представлять локальную Verification как доказательство system-level свойств.

Полный маршрут избыточен для одноразового вопроса, чернового текста без downstream reliance или небольшой полностью обратимой правки. В таких случаях Runtime сохраняет прямой путь и базовые authority boundaries. Если по ходу работы появляются необратимость, внешние эффекты, material risk или зависимые потребители, контроль усиливается до принятия соответствующего обязательства.

## Границы применимости и зрелость

iDPF находится в зрелости `Beta`. Архитектура и end-to-end lifecycle реализованы и проверяются на практических инициативах, но field effectiveness, организационная применимость и экономическая эффективность требуют накопления реальных Runs и независимого опыта. Внутренний AI challenge полезен для поиска противоречий, однако не является организационно независимым assurance.

iDPF организует инженерную работу, но сам по себе не доказывает корректность предметной модели, безопасность системы, regulatory compliance, полноту требований или пригодность продукта в эксплуатации. Эти свойства требуют domain authority, соответствующих методов Verification/Validation и Evidence из фактической среды применения.

iDPF не является автономным субъектом, daemon или hosted service. Он не выдаёт модели собственных полномочий, не выполняет публикацию без решения и не гарантирует, что любой host способен обеспечить требуемую изоляцию или контроль эффектов. При недостаточной capability точной конфигурации ограничение должно быть явно компенсировано либо работа останавливается.

iDPF не навязывает один универсальный lifecycle, не требует формализовать каждую мысль и не превращает количество документов в показатель качества. Carriers создаются тогда, когда они хранят значимое состояние, полномочие, проверяемый результат или route продолжения.

`frameworks/specializations/AI_SDLC_DPF/**` является protected read-only locus. `frameworks/subject/HAWS_DPF/**` хранит unchanged admitted HAWS body/authority. Это controlled framework content, а не место для оперативного исправления особенностей текущего host, tool или проекта. Framework-level изменение допускается только после доказанного semantic gap и отдельного release process.

Capability qualification относится к наблюдаемым capabilities exact configuration. Смена version/build является диагностическим trigger, но не должна автоматически обнулять всю прежнюю qualification, если существенное поведение сохранилось. Аналогично execution substrate изолируется стабильным contract — isolation, controlled effects, exact configuration, resource bounds, Verification, Evidence, recovery и durable-state reconciliation — без переноса внутренней реализации конкретного substrate в core Runtime.

## Состав поставки и дальнейшее изучение

| Компонент | Назначение |
|---|---|
| [`AGENTS.md`](AGENTS.md) | основной dispatcher, правила re-entry, authority boundaries и user-facing interaction contract |
| [`ENGINEERING_WORK_BOOTSTRAP_GUIDE.md`](ENGINEERING_WORK_BOOTSTRAP_GUIDE.md) | первый вход, Work Context, Entry Decision, source intake и восстановление инициативы |
| [`WORKING_PROCESS_AND_LOOPS_GUIDE.md`](WORKING_PROCESS_AND_LOOPS_GUIDE.md) | проектирование Working Process, Loops, Tasks, Runs, Verification, Human Gates и Admission |
| [`MODEL_SELECTION_RECOMMENDATIONS.md`](MODEL_SELECTION_RECOMMENDATIONS.md) | датированная informative guidance по назначению моделей в зависимости от риска и стоимости |
| [Engineering Views Guide](catalog/engineering_views/README.md) | выбор, построение и review производных инженерных представлений |
| [Runtime Capability Profile template](templates/RUNTIME_CAPABILITY_PROFILE_TEMPLATE.yaml) и другие `templates/**` | optional carriers для capability profiles, состояния, процессов и результатов |
| [Runtime Boundary Conformance Protocol](tests/conformance/RUNTIME_BOUNDARY_CONFORMANCE_PROTOCOL.md) | проверка capability/effect boundary точной конфигурации Runtime |
| [Runtime 3.6 Operational Scenarios](tests/behavioral/RUNTIME_3_6_OPERATIONAL_SCENARIOS.md) | observable behavioral contract 3.6-series, включая corrective extension `3.6.1` |
| [Runtime 3.7 Operational Scenarios](tests/behavioral/RUNTIME_3_7_OPERATIONAL_SCENARIOS.md) | integrated behavior для human interaction, decision routing, review projection и progress continuity |
| [Runtime 4.0 Operational Scenarios](tests/behavioral/RUNTIME_4_0_OPERATIONAL_SCENARIOS.md) | HAWS/FPF routing, clean-project re-entry, affected-use, conditional autonomy и first-result stop behavior |
| [HAWS DPF 1.0](frameworks/subject/HAWS_DPF/HAWS_DPF_1_0.md), [Final Admission](frameworks/subject/HAWS_DPF/authority/FINAL_ADMISSION.md) и [currentness decision](frameworks/subject/HAWS_DPF/authority/CURRENTNESS_DECISION.md) | package-owned exact current subject baseline и неизменённое authority evidence; не user-project history |
| [AI SDLC DPF](frameworks/specializations/AI_SDLC_DPF/framework/AI_SDLC_DPF.md) | controlled software-specialization patterns и связанная reference documentation; прямой route при достаточном software-specific use |
| `project/` | пустой при clean extraction пользовательский scaffold; затем исходные материалы, project-specific process state и рабочие результаты реальных пользовательских инициатив |
| [`PACKAGE_MANIFEST.md`](PACKAGE_MANIFEST.md) | точный состав и hashes допущенной release configuration после package closure |
| [`scripts/check_integrity.ps1`](scripts/check_integrity.ps1) | release-level integrity и executable embedded Gate replay; не доказывает универсальную field effectiveness |

Для понимания принципов начните с этого README. Для реальной инициативы следуйте предложению iDPF и открывайте Bootstrap Guide или Working Process Guide только когда требуется подробная механика. Нормативная архитектура идёт от current FPF к smallest applicable route: current HAWS DPF subject baseline для его admitted scope либо edition-qualified AI SDLC DPF для достаточного software-specific direct use; tutorial-примеры, исторические документы и directory nesting authority не создают.

Текущие версии основных компонентов iDPF 4.0.1:

| Компонент | Версия | Состояние |
|---|---:|---|
| iDPF Runtime | `4.0.1` | released · Beta |
| AI SDLC DPF | `1.0.1` | controlled working, unchanged |
| AGENTS dispatcher | `2.11.1` | operational |
| Bootstrap Guide | `1.11.1` | operational |
| Working Process Guide | `1.13.1` | operational |
| Engineering Views review contract | `0.3.0-candidate` | candidate module |
| Runtime Capability Profile schema | `1.1` | backward-compatible Candidate schema |
| Model Selection Recommendations | `1.1.0` | admitted informative guidance |

История развития и направления дальнейшей проверки описаны в [Evolution Roadmap](docs/KIT_EVOLUTION_ROADMAP.md). Release delta находится в [Release Notes 4.0.1](docs/releases/RELEASE_NOTES_4_0_1.md); опубликованный predecessor snapshot сохранён в [Release Notes 4.0.0](docs/releases/RELEASE_NOTES_4_0_0.md).

## Происхождение, версия и лицензия

iDPF возник на пересечении системной инженерии, процессного управления, разработки программного обеспечения, управления качеством, архитектурной практики и опыта работы с AI-агентами. Первоначальная попытка организовать AI-насыщенную разработку за пределами кодирования показала, что код нельзя оставлять «чёрным ящиком» в центре процесса: прослеживаемая инженерная работа должна быть сквозной. Затем выяснилось, что та же конструкция применима не только к software development, но и к другим инженерным результатам.

Концептуальной основой является [First Principles Framework — FPF](https://github.com/ailev/FPF). iDPF использует связанные идеи первых принципов, предметных DPF и локализации методов, но не является официальной дистрибуцией FPF; affiliation или endorsement авторами FPF не заявляются. Внешние FPF-файлы не включаются в пакет и не relicensed.

Release identity текущей released configuration — `Instantiatio DPF 4.0.1 — Engineering Work Runtime · Beta`; external publication для неё не выполнялась. Опубликованный предшественник — `Instantiatio DPF 4.0.0 — Engineering Work Runtime · Beta`. Исторические обозначения `Engineering Work Kit 3.1.0`, DPF assembly `Released 2.2.0` и более ранние local baselines сохраняются только как provenance и не являются текущей версией Runtime.

Release flow разделяет dependent publication closure, package assembly/Verification, Human Admission точного package и внешнюю публикацию:

```text
Verified Runtime Candidate
→ dependent README и Candidate Release Notes closure
  без отдельного development stream или Gate
→ manifest, checker, final metadata и ZIP
→ clean-extraction Verification
→ local release-state closure: released · Beta
  external publication: not performed
→ Human Admission точного package
→ отдельно разрешённые tag, upload и внешняя публикация
```

README и Release Notes описывают ту же реализованную и проверенную Runtime configuration и не получают отдельного Admission. До Human Admission точного package рабочую директорию или автоматически сформированный source archive нельзя представлять как admitted release asset. При package decision следует проверять точные имя, размер и SHA-256 подготовленного ZIP.

- Canonical repository: [github.com/instantiatio/iDPF](https://github.com/instantiatio/iDPF)
- Copyright (c) 2026 Instantiatio DPF contributors
- Distributed under the [MIT License](LICENSE)
