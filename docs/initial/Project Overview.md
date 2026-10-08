# Project Overview — Cerberus UI

## What This Is

Cerberus UI is the client of an end-to-end encrypted vault for passwords, login credentials, notes
and any other sensitive information. It is a single Flutter application that runs on the web,
Windows, Linux and Android from one code base, and reads and writes everything through the
[Cerberus API](https://github.com/artur-rios/cerberus-api).

The division of labor is sharper here than in most clients. The API stores ciphertext and enforces
ownership, sharing and lifecycle; it never holds plaintext or a usable decryption key. **This
application is where the vault is actually opened**: it derives keys from the user's passwords,
encrypts every record before it leaves the device, decrypts it only when the user looks at it, and
enforces the offline and local-storage rules the API can only state.

The [Brainstorm](Brainstorm.md) defines the scope, together with the approved
[Cerberus API specifications](https://github.com/artur-rios/cerberus-api/tree/develop/docs), which
are the authority for every capability this application exposes.

## The Problem

A vault whose server cannot read it is only as safe as the client that can. The person using
Cerberus needs one place for everything sensitive, reachable from a desktop, a phone and a browser,
and usable without a network on the devices they trust — while the browser, the device they trust
least, keeps nothing at all. They also need to show only part of the vault on a given device, share
selected collections with other people, and hand selected secrets to software, without any of that
weakening the guarantee that only they and the people they chose can read the content.

Those are client problems. The API defines the contracts; the client has to keep keys out of the
wrong places, plaintext out of storage, and revoked access off a reconnected device.

## Who It's For

| User | What they need from this application |
| --- | --- |
| **Account owner** | Manage a personal vault, choose what each profile and device shows, share collections and grant software access. |
| **Shared-collection recipient** | Read, or read and edit, exactly what was shared with them — and nothing else. |
| **The project owner as beta user** | Validate the first release through daily personal use on all four platforms. |

Software clients that retrieve granted secrets call the API directly; this application only
creates and revokes their grants.

## What It Does

- **Registers and signs the user in** through the Cerberus API, which delegates identity to
  Heimdall, including a second-factor challenge when Heimdall requires one.
- **Protects the vault** with a master password or one password per profile, a one-time recovery
  key the user can refresh at any time, and locking that is separate from signing in.
- **Encrypts and decrypts locally.** Plaintext never leaves the device; an item is decrypted only
  when opened and wiped from memory when closed.
- **Stores records** made of a required name and user-defined fields — text, numeric, boolean or
  hidden text — from scratch or from a password, login or note template.
- **Organizes the vault** in nested folders, collections, and profiles, and lets each device open
  only a chosen profile.
- **Shares collections** with other accounts, read-only or read/write, after verifying the
  recipient's key fingerprint.
- **Grants software access** to selected records or collections, and revokes it.
- **Works offline on desktop and Android** in the default mode, keeping only ciphertext on the
  device, renewing offline authorization on the owner's chosen interval, and synchronizing with
  latest-edit-wins when it reconnects.
- **Works online only** where the user chooses it, and always on the web, with nothing persisted.
- **Manages the trash** with 30-day restoration and immediate purge, and the account's closure,
  cancellation, immediate deletion and data export.

## What It Doesn't Do

- **It does not run on iOS or macOS.** Neither platform folder exists.
- **It does not talk to Heimdall or any other service directly.** Everything goes through the
  Cerberus API.
- **It does not store anything in the browser.** Not the vault, not the session token, not a
  preference.
- **It does not persist plaintext anywhere.** Not in the local store, a log, a crash report, a
  preference or a screenshot-able background preview.
- **It does not decide authorization.** Ownership, grants and lifecycle are the API's; the client
  presents them and enforces the offline obligations the API hands it.
- **It does not invent cryptography.** It implements the reviewed Cerberus protocol, and the
  flows that depend on it stay blocked until that protocol passes its review.
- **It does not promise what cannot be kept.** A disconnected device learns of a revocation when
  it reconnects, and nothing can retract what a recipient already copied.
- **It does not retrieve software secrets.** That is an API surface for software clients.
- **It does not administer the API.** Operational health and restore procedures belong to the
  operator, not to this application.

## How Success Is Measured

The first release includes every capability above; there is no smaller subset. The project owner
is the initial beta user.

| Outcome | Observable evidence |
| --- | --- |
| Plaintext stays on the device | Requests, the local store, logs and preferences contain no vault plaintext or usable key — verified by tests that inspect them. |
| Unlock is separate from sign-in | A signed-in session shows no vault content until a password unlocks it locally. |
| Offline works where it should | In the default mode, a desktop or Android device opens and edits its vault with no network, and locks it when the renewal period expires. |
| Nothing persists where it must not | Online-only devices and the web leave no vault data, cache or token behind after the app closes. |
| Revocation is honored | A reconnected device removes collections whose grant was revoked before showing anything else. |
| Sharing is bounded | A recipient sees exactly the shared collection, and a read-only recipient is offered no edit. |
| Recovery is one-time | A recovery succeeds once, the new recovery key is shown once, and the old one is refused. |
| One interface, four platforms | The same features behave the same way on the web, Windows, Linux and Android, except where storage mode genuinely differs. |
| Release quality | Every use case's main flow and alternative flows are covered by tests that name them. |

Related documents: [Technology Stack](Technology%20Stack.md),
[Business Rules](Business%20Rules.md) and [Workflow](Workflow.md).
