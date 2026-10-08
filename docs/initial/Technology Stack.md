# Technology Stack — Cerberus UI

Cerberus UI is built the same way as the [Heimdall UI](https://github.com/artur-rios/heimdall-ui)
and the [Fortuna UI](https://github.com/artur-rios/fortuna-ui): the same framework, the same state
and routing libraries, the same generated-client approach, the same testing tools. That is
deliberate — one person maintains all three, and a pattern learned in one is a pattern known in the
others. What Cerberus adds is what no sibling has: **client-side cryptography** and, on desktop and
Android, **a local encrypted store with synchronization**.

Exact versions are **not** pinned here. They are pinned once, in the formal Technology Stack
Document, which every other document links to instead of restating.

## Platform & Language

- **Flutter**, stable channel, with the **Dart** SDK that ships with it — the latest stable release
  at implementation time, recorded once chosen.
- **Material 3** as the design system, with light and dark schemes derived from one seed color.
- `flutter_lints` for analysis, with strict casts and strict raw types enabled. Generated code is
  excluded from analysis.

## Application Type

A **multi-platform Flutter client application** — a pure consumer of the
[Cerberus API](https://github.com/artur-rios/cerberus-api), with no server component of its own.

| Target | Storage modes | Notes |
| --- | --- | --- |
| **Web** | Online only, always | Served as a static build from a container. Persists nothing in the browser. |
| **Windows** | Default (offline-capable) or online only | Desktop build. |
| **Linux** | Default (offline-capable) or online only | Desktop build. |
| **Android** | Default (offline-capable) or online only | Mobile build. |

**No iOS and no macOS.** Neither platform folder exists.

The application is organized by feature, mirroring the sibling UIs' `lib/` layout: `app` for the
shell, router and guard; `core` for configuration, networking, cryptography, storage, session and
result types; `features` with one self-contained folder per domain area; and `shared` for layout
and reusable widgets.

## Data Storage

What the application stores depends on the device's storage mode, and the rule underneath all of
them is the same: **plaintext vault content and usable keys are never written anywhere.**

| What | Default mode (desktop, Android) | Online-only mode (desktop, Android) | Web |
| --- | --- | --- | --- |
| Vault content | **Local store** of the same ciphertext envelopes the API holds | Memory only, while displayed | Memory only, while displayed |
| Server-visible metadata (identifiers, folder parents, memberships, revisions) | Local store | Memory only | Memory only |
| Wrapped key bundle | Local store, encrypted under password-derived keys | Memory only | Memory only |
| Signed offline lease and synchronization cursor | Local store | Not used | Not used |
| Pending offline edits | Local store, as ciphertext | Not used | Not used |
| Session token | **flutter_secure_storage** | flutter_secure_storage | **Memory only** — a reload signs out |
| Preferences (theme, auto-lock, clipboard clearing) and device settings (mode, device profile) | **shared_preferences** | shared_preferences | Memory only, defaults each visit |
| Unlocked keys and decrypted items | Memory only | Memory only | Memory only |

The **local store** is a SQLite database accessed through **drift**. It deliberately holds nothing
the API's own database does not already hold: ciphertext, the structure the server can see, and
the client-encrypted key bundle. That is why it needs no second encryption layer of its own — a
stolen copy reveals what a stolen server backup would, which the protocol's threat model already
treats as safe. It lives in the platform's application support directory.

## Data Access

- **dio** for HTTP. One configured instance carries the bearer-token interceptor, the base address,
  the timeouts, and `Cache-Control: no-store` handling — no HTTP cache is ever configured.
- **retrofit** as the generated client's runtime, with **json_annotation** for the models.
- The API client is **generated, not hand-written**: `swagger_parser` reads the Cerberus API's
  OpenAPI document (`docs/contracts/openapi.json` in `cerberus-api`, copied to `api/cerberus.json`
  here) and emits DTOs and typed clients into a local package, `cerberus_api_client`, the way the
  sibling UIs produce theirs. The generated package is committed and never hand-edited.
- **flutter_riverpod** for dependency injection and state. Providers are the only global wiring.
- **go_router** for routing, giving the web real URLs and hosting the single redirect that guards
  every route by session, vault lock state and device storage mode.
- A **repository seam** per feature. Online, every repository calls the API, and in the default
  mode it also writes the confirmed result into the local store. Offline (default mode only),
  reads come from the local store and writes go to its outbox, which synchronization uploads on
  reconnection. Features above the repository cannot tell which path served them.

## Cryptography

Cryptography is the most consequential part of this stack, and the one the application may not
improvise.

- The application implements the **Cerberus protocol** proposed in the API's
  [protocol review](https://github.com/artur-rios/cerberus-api/blob/develop/docs/security/protocol-review.md):
  AES-256-GCM content envelopes with fixed authenticated metadata, Argon2id password derivation,
  HKDF-SHA-256 subkeys, HPKE recipient key wrapping, ECDSA P-256 vault-access proofs, a
  client-generated recovery secret and ES256-signed offline leases.
- That protocol is **proposed, not approved**. Every flow that encrypts, wraps, proves or recovers
  is blocked until it passes the security and client-interoperability review the API requires.
  This application contributes the client half of that review: an independent implementation that
  produces and verifies the interoperability vectors, and Argon2id cost measurements on real
  devices of every target.
- Primitives come from **maintained, reviewed libraries**, never hand-rolled code. The candidates
  are `webcrypto` (AES-GCM, HKDF, ECDH and ECDSA P-256 on every target, backed by the browser's
  WebCrypto on the web) and an Argon2id implementation that performs acceptably on all four
  targets. The selection is made during the protocol review, because it depends on the measured
  results, and it is recorded in the formal Technology Stack Document when made.
- All cryptographic code lives in one `core/crypto` module behind an interface. Nothing else calls
  a primitive.

## Authentication

All authentication goes through the Cerberus API, which delegates identity to Heimdall. This
application never calls Heimdall, and holds no second API client.

- **Email and password** sign-in and registration through the Cerberus API.
- **Second-factor challenges** where Heimdall requires them, completed through the API's challenge
  endpoint.
- **Fresh authentication** for account closure, permanent deletion, export and recovery.
- **Vault unlock is separate from sign-in.** Signing in yields an identity session; opening the
  vault needs the master or profile password and produces the vault-access proof locally.
- The token lives in secure storage on desktop and Android, and in memory only on the web. When it
  is rejected mid-session the application signs out and locks; it does not refresh silently or
  replay the interrupted action.

## Testing

- **flutter_test** for unit and widget tests, **integration_test** for end-to-end journeys.
- **mocktail** as the single mocking library, chosen over `mockito` because it needs no code
  generation.
- Dio's `HttpClientAdapter` is replaced in tests by a local adapter answering from memory, so no
  test reaches the network.
- drift's in-memory database backs local-store tests.
- Cryptography is tested against **known-answer vectors** — the RFC vectors for each primitive and
  the Cerberus interoperability vectors shared with the API — never only against itself.
- Tests are named and written **Given / When / Then**.

## External Dependencies

| Dependency | Role | Notes |
| --- | --- | --- |
| **Cerberus API** | Everything | The only service this application calls. Its OpenAPI document is the input to client generation. |

Heimdall is reached only through the Cerberus API. There is no analytics, crash reporting or other
third-party service.

## Localization

**English (`en-US`)** at the first release. Every user-facing string lives in ARB files from the
start, so adding a locale is an addition rather than a rewrite.

## Deployment

Each target ships differently, all from the same source and the same pipeline, following the
sibling UIs:

| Target | Shipped as |
| --- | --- |
| **Web** | A static build served from a **Docker** container on the VPS, behind **Traefik** as reverse proxy and TLS terminator, deployed through [yggdrasil](https://github.com/artur-rios/yggdrasil). |
| **Windows** | An `.exe` installer, plus a portable `.zip`. |
| **Linux** | An installer. |
| **Android** | An APK. |

Every build talks to a Cerberus API instance named at build time; there is no bundled server.
