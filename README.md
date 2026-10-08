# Cerberus UI

Cerberus is an end-to-end encrypted vault for passwords, login credentials, notes and any other
sensitive information. **This repository is the client:** a single Flutter application that runs on
the web, Windows, Linux and Android from one code base, and reads and writes everything through the
[Cerberus API](https://github.com/artur-rios/cerberus-api). The API stores ciphertext and enforces
ownership, sharing and lifecycle without ever being able to read the vault; this application is
where the vault is actually opened — it derives the keys, encrypts before anything leaves the
device, and decrypts only what the user is looking at.

[![Open issues](https://img.shields.io/github/issues/artur-rios/cerberus-ui?style=flat-square&label=open)](https://github.com/artur-rios/cerberus-ui/issues)
[![Closed issues](https://img.shields.io/github/issues-closed-raw/artur-rios/cerberus-ui?style=flat-square&label=closed)](https://github.com/artur-rios/cerberus-ui/issues?q=is%3Aissue+is%3Aclosed)
[![Milestones](https://img.shields.io/github/milestones/all/artur-rios/cerberus-ui?style=flat-square&label=milestones)](https://github.com/artur-rios/cerberus-ui/milestones)
[![Project board](https://img.shields.io/badge/project-Cerberus%20UI-8250df?style=flat-square)](https://github.com/users/artur-rios/projects/16)

> **Status:** the foundation, sign-in and its second-factor challenge are in place; the other use
> cases are next. Most of them wait on the Cerberus API, and everything that encrypts waits on its
> protocol review: see [Dependencies on the Cerberus API](#dependencies-on-the-cerberus-api). The
> [project board](https://github.com/users/artur-rios/projects/16) is the live view.

## What it does

- **Signs the user in** through the Cerberus API, which delegates identity to Heimdall — with a
  second-factor challenge when Heimdall asks for one.
- **Keeps the vault locked until it is unlocked.** Signing in opens nothing; a master password, or
  the password of the profile being opened, unlocks the vault on the device. It locks again on
  request, after inactivity, and on sign-out.
- **Encrypts and decrypts on the device.** Plaintext never leaves it. An item is decrypted when
  opened and discarded when closed; hidden fields stay hidden until revealed; copied secrets are
  cleared from the clipboard.
- **Stores records** with a required name and fields of four types — text, numeric, boolean and
  hidden text — from scratch or from a password, login or note template.
- **Organizes the vault** in nested folders, collections and profiles, and restricts a device to
  one profile so that the device holds nothing else.
- **Shares collections** read-only or read/write, after the owner verifies the recipient's key
  fingerprint, and **grants software** read access to selected secrets.
- **Works offline on desktop and Android** in the default mode, keeping only ciphertext on the
  device, locking when the offline authorization expires, and synchronizing on reconnection with
  revocations applied first and every conflicting edit's outcome shown.
- **Works online only** where the user chooses it — and always on the web, which stores nothing in
  the browser.
- **Recovers and forgets safely** — a one-time recovery key, a 30-day trash, account closure with a
  30-day change of mind, immediate deletion, and a data export.

## What it doesn't do

- **It does not run on iOS or macOS.**
- **It does not talk to anything but the Cerberus API** — not Heimdall, not an analytics service,
  not a crash reporter.
- **It does not store anything in the browser** — not the vault, not the session, not a preference.
- **It does not write plaintext anywhere** — not to disk, a log, a preference or a screenshot.
- **It does not invent cryptography.** It implements the reviewed Cerberus protocol, and every flow
  that depends on it waits for that review.
- **It does not decide who may see what.** Ownership and grants are the API's; the client presents
  them and enforces the offline obligations the API hands it.
- **It does not promise what cannot be kept**: a disconnected device learns of a revocation when it
  reconnects, and nothing retracts what a recipient already copied.

## Specifications

The project is specified before it is built. Start with the `initial/` documents for context, then
the `requirements/` documents for the normative detail.

| Document | What's in it |
|---|---|
| [Brainstorm](docs/initial/Brainstorm.md) | The original free-form notes this project grew from. |
| [Project Overview](docs/initial/Project%20Overview.md) | What the project is, who it's for, and how success is measured. |
| [Technology Stack](docs/initial/Technology%20Stack.md) | The informal stack decisions, including storage per mode and cryptography. |
| [Workflow](docs/initial/Workflow.md) | How one use case is delivered, step by step. |
| [Business Rules](docs/initial/Business%20Rules.md) | What the client owns, and the `BR-01` … `BR-43` rules. |
| [Vision Document](docs/requirements/Vision%20Document.md) | Stakeholders, positioning, and the `F-01` … `F-15` features. |
| [System Requirements Document](docs/requirements/System%20Requirements%20Document.md) | The `FR-<AREA>-xx` and `NFR-xx` requirements, the data model, the screen surface, the API dependencies and traceability. |
| [Use Case Specification Document](docs/requirements/Use%20Case%20Specification%20Document.md) | The `UC-01` … `UC-48` use cases, their flows, and their `AF-xx` alternatives. |
| [Development Workflow Document](docs/requirements/Development%20Workflow%20Document.md) | The normative branch pattern, issue lifecycle, gates, and Definition of Done. |
| [Testing Specification Document](docs/requirements/Testing%20Specification%20Document.md) | How tests are written, named and run, including the leak rule and the cryptography vectors. |
| [Technology Stack Document](docs/requirements/Technology%20Stack%20Document.md) | The single source of truth for every technology and version. |
| [Operations & Infrastructure Document](docs/requirements/Operations%20%26%20Infrastructure%20Document.md) | Layout, the protocol gate, storage per target, configuration, CI, packaging, and the `IR-xx` platform requirements. |

## Installation

The prerequisite is the **Flutter SDK**, stable channel, at the latest stable release (the lock
file currently needs Dart 3.13.2, which ships with Flutter 3.47.2) — with the toolchain for
whichever platform you build. The version policy is in the
[Technology Stack Document](docs/requirements/Technology%20Stack%20Document.md) §1.1.

```bash
git clone https://github.com/artur-rios/cerberus-ui.git
cd cerberus-ui
git switch develop
flutter pub get
```

Configuration is supplied at build time, so a run names the API instance it talks to:

```bash
flutter run -d linux --dart-define=CERBERUS_API_BASE_URL=http://localhost:5000
```

Replace `-d linux` with `windows`, `chrome` or your Android device. A run with no
`CERBERUS_API_BASE_URL` starts at the setup screen. Plain HTTP is accepted in debug builds only.
Building for Linux needs the GTK and libsecret development packages, as in
[`build.yml`](.github/workflows/build.yml).

The web build is served as a container image — static files behind an unprivileged nginx on port
8080, with a `/healthz` probe:

```bash
docker build -t cerberus-ui --build-arg CERBERUS_API_BASE_URL=https://cerberus-api.example.com .
docker run --rm -p 8080:8080 cerberus-ui
```
The configuration surface is in the
[Operations & Infrastructure Document](docs/requirements/Operations%20%26%20Infrastructure%20Document.md) §3.

`main` holds only released code. Development happens on `develop`.

## Roadmap

Seven milestones, in dependency order. Every milestone after `M-01` depends on it. The progress
badges are read from GitHub when this page renders, so they are never stale — click one for the
milestone itself. The [project board](https://github.com/users/artur-rios/projects/16) carries every
issue, and its `Status` field carries the lifecycle the
[Development Workflow Document](docs/requirements/Development%20Workflow%20Document.md) defines:
**Todo → In Progress → Testing → Done**.

| Milestone | Delivers | Depends on | Issues | Progress |
|---|---|---|---|---|
| [M-01 — Foundation](https://github.com/artur-rios/cerberus-ui/milestone/1) | The project scaffold, storage per target, the crypto boundary and protocol gate, the generation pipeline, the leak recorder and CI that every use case is built on | — | 1 | [![Progress](https://img.shields.io/github/milestones/progress/artur-rios/cerberus-ui/1?style=flat-square&label=)](https://github.com/artur-rios/cerberus-ui/milestone/1) |
| [M-02 — Access and session](https://github.com/artur-rios/cerberus-ui/milestone/2) | Instance setup, registration, sign-in with second factor, session restore and sign-out, the route guard, identity details and preferences | M-01 | 9 | [![Progress](https://img.shields.io/github/milestones/progress/artur-rios/cerberus-ui/2?style=flat-square&label=)](https://github.com/artur-rios/cerberus-ui/milestone/2) |
| [M-03 — Vault protection](https://github.com/artur-rios/cerberus-ui/milestone/3) | Client-side encryption, vault protection, unlock and lock, protection changes, one-time recovery and recovery-key refresh, and the encrypted account details | M-01, M-02 | 8 | [![Progress](https://img.shields.io/github/milestones/progress/artur-rios/cerberus-ui/3?style=flat-square&label=)](https://github.com/artur-rios/cerberus-ui/milestone/3) |
| [M-04 — Organized vault](https://github.com/artur-rios/cerberus-ui/milestone/4) | Profiles and device restriction, records with typed fields and templates, reveal and copy, nested folders and collections | M-01, M-02, M-03 | 14 | [![Progress](https://img.shields.io/github/milestones/progress/artur-rios/cerberus-ui/4?style=flat-square&label=)](https://github.com/artur-rios/cerberus-ui/milestone/4) |
| [M-05 — Sharing and software access](https://github.com/artur-rios/cerberus-ui/milestone/5) | Verified collection sharing, changing and revoking shares, using shared collections, and software grants | M-01, M-02, M-03, M-04 | 5 | [![Progress](https://img.shields.io/github/milestones/progress/artur-rios/cerberus-ui/5?style=flat-square&label=)](https://github.com/artur-rios/cerberus-ui/milestone/5) |
| [M-06 — Offline use and synchronization](https://github.com/artur-rios/cerberus-ui/milestone/6) | Per-device storage modes, the offline policy and lease, the ciphertext local store, offline edits and synchronization | M-01, M-02, M-03, M-04, M-05 | 6 | [![Progress](https://img.shields.io/github/milestones/progress/artur-rios/cerberus-ui/6?style=flat-square&label=)](https://github.com/artur-rios/cerberus-ui/milestone/6) |
| [M-07 — Recoverable deletion and data rights](https://github.com/artur-rios/cerberus-ui/milestone/7) | The trash, account closure and its cancellation, immediate deletion and data export | M-01, M-02, M-03, M-04 | 6 | [![Progress](https://img.shields.io/github/milestones/progress/artur-rios/cerberus-ui/7?style=flat-square&label=)](https://github.com/artur-rios/cerberus-ui/milestone/7) |

## Backlog

49 issues: one per use case, plus one foundation issue. Every one of them is on the
[project board](https://github.com/users/artur-rios/projects/16), which — together with the roadmap
badges above — is the live view of what is done. The tables below list each issue, where its
specification is, and the status it held when this page was last edited.

**Legend:** ✅ merged and closed &nbsp;·&nbsp; 🚧 in progress &nbsp;·&nbsp; ⬜ not started

### Dependencies on the Cerberus API

This client can only build what the API serves, and the API is itself at its foundation: its
business endpoints are specified but not yet implemented
([Cerberus API backlog](https://github.com/artur-rios/cerberus-api#backlog)). Each use case lists
the endpoints it calls; it can be implemented once they exist. Beyond that, these items block use
cases here and are recorded in the
[System Requirements Document §5.4](docs/requirements/System%20Requirements%20Document.md):

| Needed from the API | Blocks |
|---|---|
| Approval of the Cerberus protocol after its security and interoperability review | UC-08, UC-11 … UC-36, UC-39 … UC-43, UC-48 — everything that encrypts, decrypts, wraps or proves |
| Challenge issuance for vault-access proofs | UC-13 |
| Looking up a recipient's public key and fingerprint | UC-32 |
| A software identity's public key | UC-35 |
| Listing a collection's grants | UC-30, UC-33 |
| Listing the account's software grants | UC-36 |
| Publication of the offline lease verification keys | UC-39 |
| A distinct report that an account is pending closure, at sign-in and on session restore | UC-46 (and its offer from UC-03 and UC-05) |
| A distinct report that a second-factor challenge has expired, apart from a refused code | UC-04 (its AF-02 return to sign-in) |

The protocol review needs this repository too: an independent client implementation of the
protocol is what produces and checks the interoperability vectors it requires.

### M-01 — Foundation

| Issue | Status | Work | Spec |
|---|---|---|---|
| [#1](https://github.com/artur-rios/cerberus-ui/issues/1) | ✅ | Project scaffold and initial infrastructure | [Operations & Infrastructure](docs/requirements/Operations%20%26%20Infrastructure%20Document.md) |

### M-02 — Access and session

| Issue | Status | Work | Spec |
|---|---|---|---|
| [#2](https://github.com/artur-rios/cerberus-ui/issues/2) | ⬜ | UC-01 — Configure the instance | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-01-configure-the-instance) |
| [#3](https://github.com/artur-rios/cerberus-ui/issues/3) | ⬜ | UC-02 — Register an account | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-02-register-an-account) |
| [#4](https://github.com/artur-rios/cerberus-ui/issues/4) | ✅ | UC-03 — Sign in | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-03-sign-in) |
| [#5](https://github.com/artur-rios/cerberus-ui/issues/5) | ✅ | UC-04 — Complete a second-factor challenge | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-04-complete-a-second-factor-challenge) |
| [#6](https://github.com/artur-rios/cerberus-ui/issues/6) | ⬜ | UC-05 — Restore a session at start | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-05-restore-a-session-at-start) |
| [#7](https://github.com/artur-rios/cerberus-ui/issues/7) | ⬜ | UC-06 — Sign out | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-06-sign-out) |
| [#8](https://github.com/artur-rios/cerberus-ui/issues/8) | ⬜ | UC-07 — Guard a route | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-07-guard-a-route) |
| [#10](https://github.com/artur-rios/cerberus-ui/issues/10) | ⬜ | UC-09 — Update identity details | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-09-update-identity-details) |
| [#11](https://github.com/artur-rios/cerberus-ui/issues/11) | ⬜ | UC-10 — Choose preferences | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-10-choose-preferences) |

### M-03 — Vault protection

| Issue | Status | Work | Spec |
|---|---|---|---|
| [#9](https://github.com/artur-rios/cerberus-ui/issues/9) | ⬜ | UC-08 — View and update account details | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-08-view-and-update-account-details) |
| [#12](https://github.com/artur-rios/cerberus-ui/issues/12) | ⬜ | UC-11 — Encrypt and decrypt vault content | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-11-encrypt-and-decrypt-vault-content) |
| [#13](https://github.com/artur-rios/cerberus-ui/issues/13) | ⬜ | UC-12 — Initialize vault protection | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-12-initialize-vault-protection) |
| [#14](https://github.com/artur-rios/cerberus-ui/issues/14) | ⬜ | UC-13 — Unlock the vault | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-13-unlock-the-vault) |
| [#15](https://github.com/artur-rios/cerberus-ui/issues/15) | ⬜ | UC-14 — Lock the vault | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-14-lock-the-vault) |
| [#16](https://github.com/artur-rios/cerberus-ui/issues/16) | ⬜ | UC-15 — Change vault protection | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-15-change-vault-protection) |
| [#17](https://github.com/artur-rios/cerberus-ui/issues/17) | ⬜ | UC-16 — Recover vault access | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-16-recover-vault-access) |
| [#18](https://github.com/artur-rios/cerberus-ui/issues/18) | ⬜ | UC-17 — Refresh the recovery key | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-17-refresh-the-recovery-key) |

### M-04 — Organized vault

| Issue | Status | Work | Spec |
|---|---|---|---|
| [#19](https://github.com/artur-rios/cerberus-ui/issues/19) | ⬜ | UC-18 — Manage profiles | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-18-manage-profiles) |
| [#20](https://github.com/artur-rios/cerberus-ui/issues/20) | ⬜ | UC-19 — Restrict a device to a profile | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-19-restrict-a-device-to-a-profile) |
| [#21](https://github.com/artur-rios/cerberus-ui/issues/21) | ⬜ | UC-20 — Set a profile's contents | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-20-set-a-profiles-contents) |
| [#22](https://github.com/artur-rios/cerberus-ui/issues/22) | ⬜ | UC-21 — Create a record | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-21-create-a-record) |
| [#23](https://github.com/artur-rios/cerberus-ui/issues/23) | ⬜ | UC-22 — Browse and search the vault | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-22-browse-and-search-the-vault) |
| [#24](https://github.com/artur-rios/cerberus-ui/issues/24) | ⬜ | UC-23 — Open a record and reveal its fields | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-23-open-a-record-and-reveal-its-fields) |
| [#25](https://github.com/artur-rios/cerberus-ui/issues/25) | ⬜ | UC-24 — Edit a record | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-24-edit-a-record) |
| [#26](https://github.com/artur-rios/cerberus-ui/issues/26) | ⬜ | UC-25 — Move a record | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-25-move-a-record) |
| [#27](https://github.com/artur-rios/cerberus-ui/issues/27) | ⬜ | UC-26 — Delete a record | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-26-delete-a-record) |
| [#28](https://github.com/artur-rios/cerberus-ui/issues/28) | ⬜ | UC-27 — Manage folders | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-27-manage-folders) |
| [#29](https://github.com/artur-rios/cerberus-ui/issues/29) | ⬜ | UC-28 — Move a folder | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-28-move-a-folder) |
| [#30](https://github.com/artur-rios/cerberus-ui/issues/30) | ⬜ | UC-29 — Delete a folder | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-29-delete-a-folder) |
| [#31](https://github.com/artur-rios/cerberus-ui/issues/31) | ⬜ | UC-30 — Manage collections | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-30-manage-collections) |
| [#32](https://github.com/artur-rios/cerberus-ui/issues/32) | ⬜ | UC-31 — Set a collection's members | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-31-set-a-collections-members) |

### M-05 — Sharing and software access

| Issue | Status | Work | Spec |
|---|---|---|---|
| [#33](https://github.com/artur-rios/cerberus-ui/issues/33) | ⬜ | UC-32 — Share a collection | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-32-share-a-collection) |
| [#34](https://github.com/artur-rios/cerberus-ui/issues/34) | ⬜ | UC-33 — Change or revoke a collection share | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-33-change-or-revoke-a-collection-share) |
| [#35](https://github.com/artur-rios/cerberus-ui/issues/35) | ⬜ | UC-34 — Use a collection shared with me | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-34-use-a-collection-shared-with-me) |
| [#36](https://github.com/artur-rios/cerberus-ui/issues/36) | ⬜ | UC-35 — Grant software access | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-35-grant-software-access) |
| [#37](https://github.com/artur-rios/cerberus-ui/issues/37) | ⬜ | UC-36 — Review and revoke software access | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-36-review-and-revoke-software-access) |

### M-06 — Offline use and synchronization

| Issue | Status | Work | Spec |
|---|---|---|---|
| [#38](https://github.com/artur-rios/cerberus-ui/issues/38) | ⬜ | UC-37 — Choose the device storage mode | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-37-choose-the-device-storage-mode) |
| [#39](https://github.com/artur-rios/cerberus-ui/issues/39) | ⬜ | UC-38 — Set the offline policy | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-38-set-the-offline-policy) |
| [#40](https://github.com/artur-rios/cerberus-ui/issues/40) | ⬜ | UC-39 — Renew offline authorization | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-39-renew-offline-authorization) |
| [#41](https://github.com/artur-rios/cerberus-ui/issues/41) | ⬜ | UC-40 — Synchronize changes | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-40-synchronize-changes) |
| [#42](https://github.com/artur-rios/cerberus-ui/issues/42) | ⬜ | UC-41 — Use the vault offline | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-41-use-the-vault-offline) |
| [#43](https://github.com/artur-rios/cerberus-ui/issues/43) | ⬜ | UC-42 — Upload offline edits | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-42-upload-offline-edits) |

### M-07 — Recoverable deletion and data rights

| Issue | Status | Work | Spec |
|---|---|---|---|
| [#44](https://github.com/artur-rios/cerberus-ui/issues/44) | ⬜ | UC-43 — Browse and restore the trash | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-43-browse-and-restore-the-trash) |
| [#45](https://github.com/artur-rios/cerberus-ui/issues/45) | ⬜ | UC-44 — Empty the trash | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-44-empty-the-trash) |
| [#46](https://github.com/artur-rios/cerberus-ui/issues/46) | ⬜ | UC-45 — Close the account | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-45-close-the-account) |
| [#47](https://github.com/artur-rios/cerberus-ui/issues/47) | ⬜ | UC-46 — Cancel account closure | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-46-cancel-account-closure) |
| [#48](https://github.com/artur-rios/cerberus-ui/issues/48) | ⬜ | UC-47 — Permanently delete the account | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-47-permanently-delete-the-account) |
| [#49](https://github.com/artur-rios/cerberus-ui/issues/49) | ⬜ | UC-48 — Export account data | [Use Case Specification](docs/requirements/Use%20Case%20Specification%20Document.md#uc-48-export-account-data) |

## Changelog

Notable changes in each release are recorded in [CHANGELOG.md](./CHANGELOG.md).

## Contributing

Building from source, regenerating the API client, running the tests, the delivery workflow and its
review gates, the branching model and the release process are described in
[CONTRIBUTING.md](./CONTRIBUTING.md).
