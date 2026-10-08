# Technology Stack Document — Cerberus UI

## 1. Purpose

This document is the **single source of truth for the technologies used to build Cerberus UI** —
the framework, language, state management, routing, HTTP client, cryptography, local storage, code
generation and testing tools, together with the version each is pinned to and the role it plays.

Every other document in this folder **references this document** for technical choices instead of
restating them, so that:

- The domain documents ([Vision](Vision%20Document.md),
  [System Requirements](System%20Requirements%20Document.md),
  [Use Case Specification](Use%20Case%20Specification%20Document.md)) stay focused on *what* the
  application does.
- The [Operations & Infrastructure Document](Operations%20%26%20Infrastructure%20Document.md) stays
  focused on the platform's structure and operations.
- The [Testing Specification Document](Testing%20Specification%20Document.md) stays focused on *how*
  to test.
- Technology versions and roles are maintained in exactly **one** place.

> **Rule:** when a technology choice changes, it changes here first. Other documents link to this
> one rather than duplicating the detail.

### 1.1 The version policy

No version in this document is a number, and that is deliberate rather than unfinished. Every
technology below is taken at **the latest stable release at implementation time**, resolved when the
work is actually done rather than guessed in advance and stale by the time anyone builds. This is
the brainstorm's own rule: every dependency on its latest stable version.

What makes that safe rather than vague:

- `pubspec.yaml` declares the constraint that was current when the dependency was added.
- **`pubspec.lock` is the authoritative record** of what a build actually resolved, and it is
  committed.
- An upgrade is a deliberate change to those files, reviewed like any other.

Where a version genuinely matters — a package that must not be upgraded, or one whose behavior a
requirement depends on — it is recorded here as a constraint with its reason. The cryptographic
libraries of §5 will be such constraints once selected: a change to them invalidates the
interoperability evidence and requires the vectors to be run again.

---

## 2. Platform & Language

| Concern | Choice | Notes |
| --- | --- | --- |
| Framework | **Flutter**, stable channel | Latest stable at implementation time. One code base for every target. |
| Language | **Dart** | Whichever SDK ships with the Flutter version above. Sealed classes and exhaustive `switch` expressions back the session, lock and result models. |
| Design system | **Material 3** | Light and dark schemes derived from one seed color. |
| Targets | **Web, Windows, Linux, Android** | No iOS and no macOS platform folder exists. |
| Analysis | `flutter_lints`, with `strict-casts` and `strict-raw-types` enabled | Generated code — the API client and drift's output — is excluded from analysis. Nothing else is. |

---

## 3. Libraries

All at the latest stable release at implementation time, per §1.1.

### 3.1 Application

| Package | Version | Used by | Role |
| --- | --- | --- | --- |
| **flutter_riverpod** | latest stable at implementation time | Every feature | Dependency injection and state. Providers are the only global wiring; each feature owns its own. `Notifier` and `AsyncNotifier` back the session, the vault lock and the preferences. |
| **go_router** | latest stable at implementation time | `app` | Declarative routing. Gives the web target real URLs, and hosts the single redirect that guards every route by session, vault lock state, device profile and storage mode. |
| **dio** | latest stable at implementation time | `core/network` | One configured instance shared by the generated client, carrying the bearer-token interceptor, the base address and the timeouts. No cache interceptor is ever added. |
| **retrofit** | latest stable at implementation time | The generated client | The generated clients' runtime: turns the annotated interfaces into `dio` calls. |
| **json_annotation** | latest stable at implementation time | The generated models | The models' runtime, paired with `json_serializable` at build time. |
| **flutter_secure_storage** | latest stable at implementation time | `core/storage` | The session token on Android (Keystore), Windows (DPAPI) and Linux (libsecret). **Not used on the web**, where the token is held in memory only. |
| **shared_preferences** | latest stable at implementation time | `core/storage` | Preferences and device settings on desktop and Android. Never a token, a credential or vault content. **Not used on the web.** |
| **drift** | latest stable at implementation time | `core/local_store` | The local store of the default mode: typed SQLite access, schema migrations, transactions for atomic synchronization. Desktop and Android only; the web build does not include it. |
| **sqlite3_flutter_libs** | latest stable at implementation time | `core/local_store` | Bundles SQLite for drift on Android, Windows and Linux. |
| **path_provider** | latest stable at implementation time | `core/local_store` | Locates the application support directory where the local store lives. |
| **uuid** | latest stable at implementation time | `features/sync` | Client-generated public identifiers (random, version 4) for entities created offline. |
| **file_saver** | latest stable at implementation time | `features/account` | Saving a data export through the platform's own save mechanism, including a browser download on the web. |
| **intl** | latest stable at implementation time | `l10n` | Message formatting and dates through generated localizations. |

### 3.2 Code generation

| Package | Version | Role |
| --- | --- | --- |
| **swagger_parser** | latest stable at implementation time | Generates the DTOs and retrofit clients in `packages/cerberus_api_client/lib` from the API's OpenAPI document. Pure Dart, so no Java toolchain is required. Configured by `swagger_parser.yaml`. |
| **build_runner** | latest stable at implementation time | Runs the generators. |
| **json_serializable** | latest stable at implementation time | Emits the `fromJson`/`toJson` bodies for the generated models. |
| **retrofit_generator** | latest stable at implementation time | Emits the client implementations. |
| **drift_dev** | latest stable at implementation time | Emits the local store's typed tables and queries. |

Generated outputs are **committed and never hand-edited**, and CI regenerates them and fails on any
difference. The pipelines are described in
[Operations & Infrastructure §2.4](Operations%20%26%20Infrastructure%20Document.md).

---

## 4. Data Storage

The application holds **no plaintext vault content and no unwrapped key anywhere but memory**. What
it does store depends on the device's storage mode.

| Concern | Default mode (Windows, Linux, Android) | Online-only mode (Windows, Linux, Android) | Web |
| --- | --- | --- | --- |
| Vault content | **drift** local store, ciphertext envelopes only | Memory only, while displayed | Memory only, while displayed |
| Server-visible metadata | Local store | Memory only | Memory only |
| Protection bundle (wrapped keys) | Local store | Memory only | Memory only |
| Offline lease, sync cursor, pending edits | Local store | Not used | Not used |
| Session token | **flutter_secure_storage** | flutter_secure_storage | **Memory only** |
| Preferences and device settings | **shared_preferences** | shared_preferences | **Memory only** |
| Unlocked keys and decrypted items | Memory only | Memory only | Memory only |

The local store holds nothing the API's own database does not already hold, which is why it carries
no second encryption layer: a copy of it reveals what a copy of the server's database would, and
the protocol's threat model treats that as safe. The web build uses **no browser storage API at
all** — no local storage, session storage, IndexedDB, cookies set by the application, Cache API or
service worker.

---

## 5. Cryptography

### 5.1 The protocol

The application implements the **Cerberus protocol** specified in the Cerberus API's
[protocol review](https://github.com/artur-rios/cerberus-api/blob/develop/docs/security/protocol-review.md).
It does not define cryptography of its own. As proposed there:

| Concern | Proposed construction |
| --- | --- |
| Content envelopes and key wrapping | AES-256-GCM, with fixed-order authenticated metadata binding owner, resource kind, resource identifier and key epoch |
| Password derivation | Argon2id, with parameters measured on the clients before adoption |
| Subkeys | HKDF-SHA-256 with domain-separated labels |
| Recipient key wrapping | HPKE (RFC 9180) base mode, DHKEM(P-256, HKDF-SHA256), HKDF-SHA256, AES-256-GCM |
| Vault-access proof | Client-held ECDSA P-256 key signing single-use server challenges |
| Recovery | A client-generated random recovery secret with separate encryption and proof domains |
| Offline lease | ES256 JWS signed by the server, verified against pinned keys |

**The protocol is proposed, not approved.** Until it passes the API's security and
client-interoperability review, every flow that depends on it is blocked, in this repository as in
the API. A change to the approved protocol changes this table first.

### 5.2 Libraries

| Package | Version | Role |
| --- | --- | --- |
| Primitive library | **selected during the protocol review** | AES-GCM, HKDF, ECDH and ECDSA P-256 on all four targets. The leading candidate is **webcrypto**, which uses the browser's WebCrypto on the web and BoringSSL natively. |
| Argon2id implementation | **selected during the protocol review** | Password derivation at the reviewed parameters on all four targets, including the web. Candidates are evaluated by measured cost on real devices of each target. |

These two rows are the only selections in this document that are not yet made, and that is a
recorded decision rather than a gap: the protocol review requires measured client evidence before
adoption, and the libraries are part of what is measured. When selected, each row is replaced with
the package name and a pinned version constraint, per §1.1.

### 5.3 Rules that do not wait for the review

- All cryptographic code lives in **`core/crypto`**, behind an interface. No other module imports a
  cryptographic package, and a boundary check enforces it.
- No primitive is implemented by hand. HPKE is composed only from reviewed primitives and only if it
  passes the RFC 9180 test vectors and the Cerberus interoperability vectors.
- Randomness comes only from the platform's cryptographically secure generator.
- Key derivation runs off the UI isolate.

---

## 6. Data Access

| Concern | Choice |
| --- | --- |
| HTTP | **dio** + the generated retrofit client, over HTTPS only (plain HTTP is accepted in debug builds alone). |
| API contract | The Cerberus API's OpenAPI document, copied from `cerberus-api/docs/contracts/openapi.json` to `api/cerberus.json`. |
| Access pattern | Each feature owns a repository interface. Online, the implementation calls the API and, in the default mode, writes the confirmed result into the local store. Offline, it reads the local store and queues writes in the outbox. Providers depend on the interface, never on `dio` or drift. |
| Result model | Sealed Dart classes in `core/result`. Every repository returns a result rather than throwing. |

---

## 7. Cross-Cutting Technologies

| Concern | Technology | Version | How it is used |
| --- | --- | --- | --- |
| State and injection | **flutter_riverpod** | latest stable at implementation time | Providers are the only global wiring. |
| Routing and guarding | **go_router** | latest stable at implementation time | One central redirect guards every route. |
| Localization | **flutter_localizations** + **intl** | ships with Flutter / latest stable at implementation time | ARB files, `en-US` at the first release. No hard-coded user-facing string. |
| Clipboard | Flutter `services` `Clipboard` | ships with Flutter | Copying a field; clearing it after the configured interval. |
| Lifecycle | Flutter `AppLifecycleListener` | ships with Flutter | Inactivity and backgrounding for auto-lock. |
| Screen capture protection | A platform channel in the Android runner setting `FLAG_SECURE` | — | Excludes the application from screenshots and the recent-apps preview on Android. No package. |
| Configuration | `--dart-define` at build time | — | See [Operations & Infrastructure §3](Operations%20%26%20Infrastructure%20Document.md). |
| Logging | Dart's `developer.log`, debug builds only | — | Never carries a credential, token, key, plaintext or envelope body. No log ships in a release build. |
| Crash reporting / analytics | **None** | — | Deliberately absent. |

---

## 8. Testing Technologies

These are the technologies mandated for tests. **How** they are applied is defined in the
[Testing Specification Document](Testing%20Specification%20Document.md); this section is the
canonical list of tools and versions.

| Concern | Technology | Version | How it is used |
| --- | --- | --- | --- |
| Test framework | **flutter_test** | ships with the Flutter SDK | Unit and widget tests. |
| End-to-end | **integration_test** | ships with the Flutter SDK | Drives complete journeys against a stubbed API. |
| Coverage | `flutter test --coverage` | ships with the Flutter SDK | Emits `lcov.info`. |
| Mocking | **mocktail** | latest stable at implementation time | The single mocking library. Chosen over `mockito` because it needs no code generation. Do not introduce a second one. |
| HTTP stubbing | `dio`'s `HttpClientAdapter` | — | Replaced in tests by a local adapter answering from memory, which also records every request body for the plaintext-leak assertions. |
| Local store | drift's in-memory database | — | Local-store and synchronization tests run against a real schema in memory. |
| Cryptography | RFC known-answer vectors and the Cerberus interoperability vectors | — | Every primitive and every protocol construction is tested against vectors produced independently, never only against itself. |
| Time | An injected clock | — | Lease expiry, auto-lock and clipboard clearing are tested without waiting. |

---

## 9. Version Summary

Every technology named above appears here exactly once. This is the table to check when upgrading.

| Category | Package / Tool | Version |
| --- | --- | --- |
| Platform | Flutter (stable channel) | latest stable at implementation time |
| Language | Dart | ships with Flutter |
| Design system | Material 3 | ships with Flutter |
| Analysis | flutter_lints | latest stable at implementation time |
| State | flutter_riverpod | latest stable at implementation time |
| Routing | go_router | latest stable at implementation time |
| HTTP | dio | latest stable at implementation time |
| HTTP client runtime | retrofit | latest stable at implementation time |
| Model runtime | json_annotation | latest stable at implementation time |
| Secure storage | flutter_secure_storage | latest stable at implementation time |
| Preferences | shared_preferences | latest stable at implementation time |
| Local store | drift | latest stable at implementation time |
| Local store | sqlite3_flutter_libs | latest stable at implementation time |
| Local store | path_provider | latest stable at implementation time |
| Identifiers | uuid | latest stable at implementation time |
| File saving | file_saver | latest stable at implementation time |
| Localization | flutter_localizations | ships with Flutter |
| Localization | intl | latest stable at implementation time |
| Cryptography | primitive library (candidate: webcrypto) | selected and pinned during the protocol review |
| Cryptography | Argon2id implementation | selected and pinned during the protocol review |
| Generation | swagger_parser | latest stable at implementation time |
| Generation | build_runner | latest stable at implementation time |
| Generation | json_serializable | latest stable at implementation time |
| Generation | retrofit_generator | latest stable at implementation time |
| Generation | drift_dev | latest stable at implementation time |
| Testing | flutter_test | ships with the Flutter SDK |
| Testing | integration_test | ships with the Flutter SDK |
| Testing | mocktail | latest stable at implementation time |
