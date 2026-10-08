# Testing Specification Document — Cerberus UI

## 1. Purpose

This document defines **how a use case is tested once it has been implemented**. It is a standard to
be followed by any human or agent that builds tests for this project, so that every use case in the
[Use Case Specification Document](Use%20Case%20Specification%20Document.md) receives the same shape
of testing, with the same tools, naming and structure.

The rule is simple:

> **After a use case is developed, tests are built for it in the same change — before it is
> considered done.** A use case without its tests is incomplete.

The tools and versions used are defined in the
[Technology Stack Document](Technology%20Stack%20Document.md); when the tests run in the delivery
flow is defined in the [Development Workflow Document](Development%20Workflow%20Document.md).

## 2. Testing philosophy

1. **Behavior-driven.** A test describes what the user or the caller observes, not how the code
   arranges itself.
2. **Test at the right layer.** Validation, cryptography, state transitions, repository contracts
   and synchronization are unit-tested. Anything a user sees is widget-tested. A complete journey
   across several screens is integration-tested.
3. **Isolation in unit tests.** A unit test reaches no network, no platform channel, no real secure
   storage and no clock it does not control. Collaborators are replaced at the repository seam.
4. **Realism where it counts.** Widget and integration tests run against a stubbed API answering
   with payloads shaped exactly as the API's contract defines them — the output envelope, the error
   codes, the encrypted envelopes — rather than hand-simplified fixtures.
5. **Secrets are tested harder than anything else.** Where plaintext goes is where a defect is
   silent and catastrophic. Every content-bearing flow carries an assertion that plaintext did not
   go anywhere it must not (§6.4).
6. **Cryptography is tested against the outside world.** A primitive or construction that only
   round-trips with itself proves nothing. Every one is tested against vectors produced by an
   independent implementation (§6.5).
7. **Same pattern every time.** The workflow in §8 is applied identically to every use case.

## 3. What to test for each use case

| Artifact produced | Test kind | Test location |
| --- | --- | --- |
| A repository interface and its implementations | Unit | `test/features/<feature>/data/` |
| A provider, notifier or controller | Unit | `test/features/<feature>/state/` |
| A form validator or template rule | Unit | `test/features/<feature>/validation/` |
| A cryptographic operation | Unit, against vectors | `test/core/crypto/` |
| Local store tables, queries and synchronization | Unit, drift in memory | `test/core/local_store/`, `test/features/sync/` |
| A screen or reusable widget | Widget | `test/features/<feature>/ui/` |
| A route guard rule | Unit + widget | `test/app/` |
| A complete user journey across screens | Integration | `integration_test/` |

**What deliberately gets no tests**, so the suite does not fill with ceremony:

- **Generated code** — the API client and drift's generated code. They are regenerated and
  drift-checked in CI.
- **Plain data holders with no behavior**, which are exercised by the tests of whatever uses them.
- **Pure layout with no logic.**
- **The Flutter framework and the packages this project depends on** — except that the chosen
  cryptographic libraries are run against the vectors, because *how this project uses them* is
  exactly what the vectors check.

## 4. Test project layout

The test tree mirrors the source tree exactly.

```
lib/
├── app/                         → test/app/
├── core/
│   ├── config/                  → test/core/config/
│   ├── crypto/                  → test/core/crypto/
│   ├── local_store/             → test/core/local_store/
│   ├── network/                 → test/core/network/
│   ├── result/                  → test/core/result/
│   ├── session/                 → test/core/session/
│   └── storage/                 → test/core/storage/
├── features/
│   └── <feature>/
│       ├── data/                → test/features/<feature>/data/
│       ├── state/               → test/features/<feature>/state/
│       ├── validation/          → test/features/<feature>/validation/
│       └── ui/                  → test/features/<feature>/ui/
└── shared/                      → test/shared/

integration_test/                → complete journeys, one file per journey
test/support/                    → fakes, stub payloads, the leak recorder, pump helpers
test/vectors/                    → RFC and Cerberus interoperability vectors, as data
```

**Naming rule:** a production file `lib/<path>/thing.dart` is tested by
`test/<path>/thing_test.dart`. One production unit, one test file.

## 5. Naming & structure

Every test is named with the **Given / When / Then** pattern, as a readable sentence:

```dart
test('Given an envelope whose authenticated resource identifier was swapped '
     'When it is decrypted '
     'Then the result is tampered and no plaintext is returned', () { … });
```

Every test body follows the same three-part shape, separated by blank lines rather than comments:

```dart
test('Given an unlocked vault '
     'When the inactivity timeout elapses '
     'Then the vault locks and every revealed item is discarded', () async {
  final clock = FakeClock();
  final vault = unlockedVault(clock: clock, revealed: [record]);

  clock.advance(vault.autoLockTimeout);

  expect(vault.state, isA<Locked>());
  expect(vault.revealedItems, isEmpty);
});
```

Group related tests with `group()` named after the unit under test.

## 6. Unit testing standard

### 6.1 Scope of a unit test

One unit test exercises **one production unit** with every collaborator replaced. It must not reach
the network, real secure storage, a platform channel, or the real clock, and must not assert on more
than the unit's own observable behavior.

### 6.2 Test doubles

| Collaborator | Double |
| --- | --- |
| A repository | A hand-written fake in `test/support/` |
| A single-method collaborator | `mocktail` |
| `dio` | The `HttpClientAdapter` replaced by a local adapter answering from memory and recording every request |
| The local store | drift's in-memory database with the real schema |
| Secure storage and preferences | In-memory fakes that record every write |
| The clock | An injected clock, never `DateTime.now()` in production code |
| Randomness | Injected only for vector tests that fix a nonce or key; production code never accepts a fixed nonce |
| The clipboard | A fake that records writes and clears |

**`mocktail` is the only mocking library.** Do not introduce a second one.

### 6.3 Coverage per unit

For each production unit, walk this checklist:

- [ ] The happy path.
- [ ] Each validation failure the unit itself enforces.
- [ ] Each failure result the unit can receive, including each API refusal its use case lists.
- [ ] Each boundary: empty, one, many; first and last page; an expired and a just-valid lease.
- [ ] Each state transition the unit can make, including the ones it must refuse.
- [ ] For anything holding plaintext: that it is gone after close, lock and sign-out.
- [ ] For anything decrypting: a wrong key, a corrupted tag, and each swapped authenticated field.

### 6.4 The leak rule, as a test

Every use case that sends content or keys, or writes to any storage, carries a **leak assertion**:
the test seeds the plaintext with a distinctive marker, runs the flow through the real repository
and the recording doubles, and asserts the marker appears in **no** recorded request body, local
store row, preference, secure-storage entry or log line. The shared recorder lives in
`test/support/`. A flow without a leak assertion is not done.

Two standing tests back this up: one asserts the web build's storage wrappers write nothing, and
one asserts that the `dio` instance has no cache interceptor.

### 6.5 Cryptography vectors

`core/crypto` is tested against:

- the **RFC known-answer vectors** for AES-256-GCM, HKDF-SHA-256, Argon2id, HPKE, ECDSA P-256 and
  ES256 as the protocol uses them;
- the **Cerberus interoperability vectors** — encoded envelopes, authenticated metadata bytes,
  recipient wrapping, access proofs and leases — produced by the API's independent implementation,
  including every negative vector (wrong owner, resource, epoch or recipient fingerprint; nonce, tag
  and encoding corruption; replayed challenges; malformed lease claims).

Vectors are data files in `test/vectors/`, never constants a test author computed with the code
under test. Until the protocol review produces the Cerberus vectors, the protocol-dependent use
cases are blocked (`FR-CR-02`) and these tests do not exist yet.

## 7. Widget and integration testing standard

### 7.1 Widget tests

A widget test pumps **one screen** with its providers overridden to fakes, and asserts what the user
sees. For every screen a use case adds or changes, it covers:

- the **locked** state, where the screen depends on an unlocked vault — and that it shows no
  content;
- the **loading**, **loaded**, **empty** and **failed** states, with a working retry;
- every **alternative flow** of the use case that has a visible outcome;
- that hidden-text fields render concealed until revealed, where the screen shows them;
- that actions not permitted to the current actor are not offered.

### 7.2 Integration tests

An integration test drives a **complete journey** across screens against a stubbed API, using the
real routing, providers, widgets, `core/crypto` and — for default-mode journeys — a real local store
in a temporary directory. Only the transport is stubbed.

Integration tests are deliberately few. At minimum:

- register, initialize protection, create a record, lock, unlock and reveal it;
- sign in with a second-factor challenge;
- share a collection and see it as the recipient, read-only;
- in the default mode: edit offline, reconnect, synchronize and read each outcome;
- reconnect after a revocation and see the revoked collection removed before anything else;
- on the web: reload the page and land on sign-in with nothing persisted.

### 7.3 External dependencies

| Dependency | In tests |
| --- | --- |
| The Cerberus API | A local `dio` adapter answering with contract-shaped payloads. **No test reaches the network.** |
| Platform secure storage and preferences | In-memory fakes. |
| The local store | drift in memory for unit tests; a temporary file for integration tests. |
| The file saver | A fake returning a path, a cancellation or a refusal. |
| `FLAG_SECURE` | Verified by a widget test that the platform channel was invoked; its effect is the platform's. |

### 7.4 Coverage per use case

A use case is covered when its **main flow and every applicable `AF-xx`** are exercised, at whichever
layer that flow becomes observable. Each alternative flow maps to at least one named test, and the
test's name says which flow it is:

```dart
test('Given a pending edit to a record that a newer edit superseded '
     'When the edits are uploaded '
     'Then the outcome is superseded and the user\'s version stays available (UC-42 AF-02)', () { … });
```

Citing the flow in the name is what makes an audit of "is every `AF-xx` covered?" a search rather
than a reading.

### 7.5 Coverage expectations

There is **no numeric coverage floor**, deliberately, matching the sibling UIs. A percentage target
rewards testing what is easy. The standard is instead:

- every main flow and every applicable `AF-xx` has a test that names it;
- every unit walked the §6.3 checklist;
- every content-bearing flow carries its leak assertion (§6.4);
- `core/crypto` passes every vector (§6.5).

Coverage is still measured and reported, as a signal to read rather than a number to satisfy.

## 8. Per-use-case workflow

Apply this every time:

1. Read the use case's flows and the `FR-xx` requirements traced to it.
2. List the production units the implementation adds or changes, and the screens it touches.
3. Write the unit tests: happy path first, then the §6.3 checklist for each unit.
4. Add the leak assertion for each content-bearing request or write.
5. Write the widget tests: every state, then each alternative flow with a visible outcome.
6. Add an integration test where the use case completes a journey listed in §7.2.
7. Run `flutter analyze` and `flutter test`, and fix until both are clean.
8. Run the integration suite where this use case touched a journey it covers.
9. Confirm every `AF-xx` of the use case appears in a test name.

## 9. Running the suites

```bash
flutter test
```

| Suite | Command |
| --- | --- |
| Static analysis | `flutter analyze` |
| Unit and widget | `flutter test` |
| One file | `flutter test test/features/records/state/record_form_test.dart` |
| Cryptography vectors | `flutter test test/core/crypto` |
| With coverage | `flutter test --coverage` |
| Integration, desktop | `flutter test integration_test -d linux` (or `-d windows`) |
| Integration, web | `flutter test integration_test -d chrome` |
| Integration, Android | `flutter test integration_test -d <device-id>` |

Unit and widget tests share one runner and are separated by **location**: `test/` mirrors `lib/`.
Integration tests live in `integration_test/`, which `flutter test` does not pick up by default —
so the fast suite stays fast, and the slow one is invoked deliberately.

## 10. References

- [Use Case Specification Document](Use%20Case%20Specification%20Document.md) — the flows that must be covered.
- [Development Workflow Document](Development%20Workflow%20Document.md) — when the testing gate applies.
- [Technology Stack Document](Technology%20Stack%20Document.md) — the testing tools and versions.
- [System Requirements Document](System%20Requirements%20Document.md) — the requirements each use case realizes.
