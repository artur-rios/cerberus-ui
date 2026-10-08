# Changelog

All notable changes to Cerberus UI are recorded in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

No release has been tagged yet.

### Added

- The application scaffold (#1): a Flutter application for the web, Windows, Linux and Android, laid out by feature
  over a shared core — the guarded router, configuration and device settings, the session and vault lock state, the
  secure-storage and preference wrappers (memory only on the web), the drift local store with its schema and
  migration test, the configured HTTP client with no cache, the redacting debug-only log, and the result type every
  repository returns.
- Sign-in with an email and a password (#4, UC-03). The session token is kept in secure storage on desktop and
  Android and in memory on the web; a refusal shows the API's own reason and nothing inferred from it; a second-factor
  challenge is held in memory until it is completed; and a device whose secure storage is unavailable may continue for
  the run with the token in memory, never falling back to preferences or a file. Signing in never unlocks the vault.
- The second-factor challenge (#5, UC-04). The screen names each method the API offered and completes the sign-in
  through the API's challenge endpoint. A refused code shows the API's reason, keeps the challenge for another attempt
  and offers to sign in again; the API does not yet report an expired challenge apart from a wrong code, so nothing is
  inferred from the refusal. Leaving the screen discards the challenge, and nothing about it is ever stored.
- Restoring a session at start (#6, UC-05). A session kept from an earlier run is verified with the API before any
  screen that depends on it is shown, behind a neutral starting screen, by asking for the account's vault protection
  and reading only the outcome — the protection material itself is discarded unread. An accepted session resumes with
  the vault locked and goes on to unlock, to protection setup, or to the route a link asked for; a rejected one is
  deleted and sign-in says the session ended; an unreachable instance is reported with a retry, the session kept.
  A session ends only when the API states that its token was rejected (`authentication_required`), never on another
  401.
- Signing out (#7, UC-06). The vault locks, the token is deleted and every in-memory trace of the session is
  discarded. In the default mode the user chooses whether to keep the vault on the device — told that the kept copy is
  ciphertext only — or remove it, and removing it while offline edits were never uploaded states how many would be
  lost and asks again. Online only and on the web nothing is asked. A token secure storage cannot delete is reported,
  is no longer read for the rest of the run, and is overwritten by the next sign-in; a session the API rejects
  mid-session ends the same way, keeping the store, and sign-in says the session ended.
- The route guard (#8, UC-07). Every route, however it is reached, passes one guard that decides by the session, the
  vault's lock state, the device's storage mode and profile, and the protocol gate. A route it refuses is remembered on
  the way to sign-in, the second-factor challenge, protection setup or unlock, and opened through the guard again once
  that is done; only locations within the application are followed. Another profile's content is sent to unlock that
  profile instead of being shown under the open one, and a device restricted to a profile is never offered another.
  The API's refusals are honored as the API states them, and nothing the guard hides is relied on as protection.
- The protocol gate, **closed**: every flow that encrypts, decrypts, wraps, proves or recovers stays unavailable, and
  the interface says why, until the Cerberus protocol passes its review.
- The API client generated from the Cerberus API's OpenAPI document, by one command.
- Screen-capture protection on Android, and no backup of application data.
- The web build registers no service worker, uses no browser storage, and fetches nothing from a third party: CanvasKit
  and the Roboto font are bundled.
- CI: workflow linting, formatting, analysis, the import-boundary and protocol-gate checks, the test suite, a web bundle check, a
  generated-code drift check and the branching-model check on every pull request; per-target builds — a web image,
  a Windows installer and portable archive, a Linux package and an Android APK — on a version tag.
- The specifications: the brainstorm and the initial documents (project overview, technology stack, workflow and
  business rules), and the formal requirements (vision, system requirements, use case specification, development
  workflow, testing specification, technology stack and operations & infrastructure).
- The backlog: one foundation issue and one issue per use case, UC-01 through UC-48, in seven milestones, tracked on
  the public Cerberus UI project board.

[Unreleased]: https://github.com/artur-rios/cerberus-ui/commits/develop
