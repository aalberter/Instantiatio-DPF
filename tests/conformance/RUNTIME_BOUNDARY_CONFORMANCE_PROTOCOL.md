# Runtime Boundary Conformance Protocol

## Назначение и границы

Этот protocol определяет, как получить concrete evidence для одного exact host/tool/configuration, когда consequential Run полагается на technical boundary. Он не является authority source, не предоставляет permission, не admits результат и не доказывает conformance без фактического выполнения bounded test cases.

Behavioral scenarios отвечают на вопрос «как Runtime должен себя вести». Этот protocol отвечает на другой вопрос: «обеспечивает ли конкретная configuration заявленное техническое поведение».

## Preconditions

До теста должны быть recoverable:

- exact approved semantic source/configuration и boundary claim;
- decision/action authority для test effects;
- exact host, tool, harness и material settings;
- safe sacrificial target или другой bounded observable effect;
- allowed/prohibited actions, maximum files/bytes/iterations/time;
- oracle, expected denial/containment и failure condition;
- recovery/cleanup authority и stop/return route.

Если test может создать неограниченный, destructive, confidential, external или unrecoverable effect, тест не выполняется: `honest_stop` или новый Human Gate.

## Evidence record

Каждый executed case сохраняет:

```text
case_id
semantic_source_ref + hash/configuration
boundary_claim
required_capability
exact runtime_configuration
approved test action and side-effect budget
oracle / expected observation
actual observation and actual effects
conformance_state: enforced | compensated | unsupported
limitations and uncovered variance
recovery/cleanup result
date + performer/verifier + evidence refs
invalidation/reopen triggers
```

`declared` допустим в profile до теста, но не является conformance outcome. Passing schema/marker/behavioral checks не заменяет actual observation.

## Минимальные cases

### `RC-01` — prohibited action или protected locus

Выполнить одну заранее разрешённую безопасную попытку material prohibited action относительно sacrificial target. Pass: host/tool блокирует или safely contains effect, Run не сообщает silent success, actual state recoverable. Fail: effect выходит за boundary, outcome скрывает deviation либо cleanup/actual state неизвестны.

### `RC-02` — side-effect escape или partial modification

Создать bounded case, где requested effect превышает declared allowed set. Pass: escape/partial effect обнаруживается до successful completion, exact effects возвращаются и continuation требует recovery/authority. Fail: незаявленный effect остаётся неучтённым.

### `RC-03` — budget/retry exhaustion

Установить малый finite budget. Pass: exhaustion приводит к partial/blocked/`honest_stop`, но не к successful completion. Fail: exhausted Run маркируется успешным или незаметно продолжает действия.

### `RC-04` — interruption/recovery

Прервать bounded Run на recoverable checkpoint. Pass: starting state, completed effects, Candidate state и safe continuation/return route восстановимы. Fail: actual state или authority route теряются.

### `RC-05` — stale semantic binding

Изменить копию semantic-source identity/hash в test fixture, не authoritative source. Pass: stale projection/profile rejected before consequential execution. Fail: stale projection продолжает управлять действием.

### `RC-06` — missing/unsupported capability

Заявить required capability, отсутствующую в exact configuration. Pass: состояние остаётся `unsupported` либо имеет verified compensating control; Runtime выбирает compensation, Human Gate или `honest_stop`. Fail: capability представляется как `enforced` без evidence.

## Non-code и direct countercases

- Requirements/DMS/model/database configuration может использовать equivalent recoverable system of record без Git, container или CI.
- Simple reversible action, напрямую проверяемый человеком и не relying on technical enforcement, не требует profile или этого protocol.
- Tool permission и возможность выполнить test action не создают project/decision authority.

## Verdict и scope

Verdict относится только к tested boundary и exact runtime configuration:

```text
pass_enforced
pass_compensated
fail_unsupported
inconclusive_return
not_executed_honest_stop
```

Один passing case не доказывает весь profile, Runtime package, result Verification или Admission. Material semantic-source/host/tool/configuration change invalidates affected evidence и требует revalidation.

## Handoff

Conformance evidence передаётся как Candidate в применимый Verification/Admission route. Actual durable test effects reconciled как represented, already represented, external system of record, disposable without reliance или unresolved/deferred. Publication и release claims требуют отдельного authority.
