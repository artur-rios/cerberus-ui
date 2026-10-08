# Contributing

One use case = one branch = one issue = one pull request. The full process — branch naming, the
issue status lifecycle, the four approval gates, the testing gate, and the Definition of Done — is
in the
[Development Workflow Document](docs/requirements/Development%20Workflow%20Document.md). Work
branches are cut from and merged into `develop`; see the [branching model](#branching-model) below.

## Prerequisites

The **Flutter SDK**, stable channel, at the latest stable release — with the toolchain for whichever
platform you are building. The version policy, and why no number is pinned here, is in the
[Technology Stack Document](docs/requirements/Technology%20Stack%20Document.md) §1.1.

```bash
git clone https://github.com/artur-rios/cerberus-ui.git
cd cerberus-ui
git switch develop
flutter pub get
```

## Before you touch anything cryptographic

Read the Cerberus API's
[protocol review](https://github.com/artur-rios/cerberus-api/blob/develop/docs/security/protocol-review.md).
Every flow that encrypts, decrypts, wraps, proves or recovers stays behind the protocol gate until
that protocol passes its security and interoperability review. Only `core/crypto` may import a
cryptographic package, and no primitive is implemented by hand.

## Generated code

All generated code is committed, so a clean clone needs no generation step. Never hand-edit it; the
Check generated workflow regenerates everything below and fails on any difference from what is
committed.

**The API client**, only after taking a new API contract — copy `docs/contracts/openapi.json` from
`cerberus-api` to `api/cerberus.json` — and then:

```bash
dart run tool/generate_api_client.dart
```

**The local store's drift code**, after any change to `lib/core/local_store/`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

A schema change also bumps `schemaVersion`, adds a migration step and a migration test, and
snapshots the schema and regenerates the migration test helpers:

```bash
dart run drift_dev make-migrations
dart run drift_dev schema generate drift_schemas/local_store/ test/core/local_store/generated/
```

**The localizations**, after editing `lib/l10n/app_en.arb` (also run by any `flutter run` or
`flutter build`):

```bash
flutter gen-l10n
```

## Testing

The suite described in the
[Testing Specification Document](docs/requirements/Testing%20Specification%20Document.md) runs with:

```bash
flutter analyze
flutter test
```

An analyzer failure is a failure. Integration tests live in `integration_test/` and are invoked
deliberately:

```bash
flutter test integration_test -d linux
```

There is no numeric coverage floor. The standard is that every use case's main flow and each of its
`AF-xx` alternative flows has a test that names it, and that every flow sending or storing content
carries a leak assertion proving no plaintext went where it must not. Every use case ships with its
tests before its pull request is opened.

CI also verifies formatting, the import boundaries, the protocol gate and the web bundle:

```bash
dart format --output=none --set-exit-if-changed lib test tool
dart run tool/check_boundaries.dart
dart run tool/check_protocol_gate.dart
flutter build web --release --no-web-resources-cdn && tool/check_web_bundle.sh build/web
```

The boundary check keeps cryptographic packages in `core/crypto`, storage packages in `core/storage`
and `core/local_store`, `dio` and the local store in repositories, logging in `core/logging`, each
feature off the others, and browser storage and observing packages out altogether; every rule is in
[`tool/boundary_rules.dart`](tool/boundary_rules.dart). The gate check fails a build whose protocol
gate is open without the Cerberus vectors in `test/vectors/cerberus/` and a test that runs them.

## Branching model

```
feature/<name> ─┐
fix/<name> ─────┴─▶ develop ──▶ release/x.y.z ──▶ main  (tag vx.y.z)
```

| Branch | Cut from | Merges into | How |
|---|---|---|---|
| `feature/<name>`, `fix/<name>` | `develop` | `develop` | Pull request. The branch is deleted on merge. |
| `release/x.y.z` | `develop` | `main` | Pull request, merge commit only. |
| `develop`, `main` | — | — | Protected: no direct pushes, no force pushes, no deletion. |

Use case branches are named `feature/uc-##-use-case-name`. Names are lowercase: letters, digits,
`.`, `_` and `-`. A `release/` branch is a snapshot of `develop` and carries no commits of its own:
a fix for a release lands on `develop` through a `fix/` branch and a new release branch is cut. The
Branch Policy workflow checks this on every pull request.

## Commits and the changelog

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/) with a lowercase
subject, e.g. `feat: unlock the vault (UC-13)` or `fix: clear the clipboard after the interval`.

Record every change a user would notice under `## [Unreleased]` in [CHANGELOG.md](./CHANGELOG.md),
in the same pull request that makes it.

## Versioning

The application follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html). A release is
numbered `<major>.<minor>.<patch>`, measured against what users and existing installations depend
on:

- **Major** — a change someone has to act on: a supported platform dropped; a local store the new
  version cannot open or migrate; a protocol version the new build no longer reads; a build-time
  setting removed or renamed; a feature removed; or a requirement for a Cerberus API contract that a
  deployment still running the previous one does not provide.
- **Minor** — a backward-compatible addition: a new screen or feature, a new optional setting, or
  support for something the API added while still working with the contract it replaces.
- **Patch** — a fix that changes nothing anyone depends on: a bug fix, a layout or wording
  correction, or a dependency upgrade that does not touch the cryptographic libraries.

The version lives in `version: x.y.z+n` in `pubspec.yaml`, which every build embeds; the build
number `n` only ever increases, because Android refuses to install a package over one with a higher
number. The release branch `release/x.y.z` names the same version.

## Releasing

1. Because a release branch carries no commits of its own, finalize the changelog on `develop`
   first: in a `feature/` branch, set `version:` in `pubspec.yaml`, rename `## [Unreleased]` in
   [CHANGELOG.md](./CHANGELOG.md) to `## [x.y.z] - <yyyy-mm-dd>` above a fresh, empty
   `## [Unreleased]`, update the links at the bottom, and merge it into `develop`.
2. Cut `release/x.y.z` from an up-to-date `develop` and push it.
3. Open a pull request `release/x.y.z → main` and merge it with a merge commit once every check
   passes.
4. Tag the merge `vx.y.z`. The tag starts the Build workflow, which builds every target and
   publishes the artifacts; the web image is deployed through
   [yggdrasil](https://github.com/artur-rios/yggdrasil), like the sibling UIs.
