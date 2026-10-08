# Business Rules — Cerberus UI

The rules this application must enforce, independently of how it is built. They are numbered
`BR-xx`; the formal System Requirements Document traces each one to the functional requirements
that realize it, so the numbers are stable — a rule that is withdrawn keeps its number rather than
letting the ones below it shift.

This is a **client**. The vault's domain — ownership, sharing, lifecycle, recovery, offline policy
— belongs to the [Cerberus API](https://github.com/artur-rios/cerberus-api) and is stated in
[its own Business Rules](https://github.com/artur-rios/cerberus-api/blob/develop/docs/initial/Business%20Rules.md)
(referred to below as *API BR-xx*). Nothing here restates them. What follows is what this
repository owns: the keys, the plaintext, what the device keeps, and the obligations the API hands
to its clients because only a client can keep them.

## Domain Entities

The application's own entities — the things it holds and reasons about. Every vault concept it
*shows* (a record, a folder, a collection, a profile, a grant) is the API's, and appears here only
where the client adds something of its own.

| Entity | Represents |
| --- | --- |
| **Session** | The signed-in Heimdall identity, its Cerberus account context and the token that proves it. Grants no vault access by itself. |
| **IdentityCredential** | An email and password, or a second-factor code. Exists only for the instant it takes to submit it. |
| **TwoFactorChallenge** | A sign-in accepted but not completed, awaiting a second factor. Not a session. |
| **InstanceConfiguration** | Which Cerberus API instance this installation talks to. |
| **DeviceSettings** | This device's storage mode (default or online only) and, optionally, the one profile it opens. |
| **Preferences** | Presentation and safety choices: theme, auto-lock timeout and clipboard clearing interval. |
| **ProtectionBundle** | The client-encrypted key material the API stores: wrapped vault and profile keys, the access-proof key, recovery envelopes. Opaque until unlocked. |
| **VaultKeyring** | The unlocked keys of the open profile. Exists in memory only, between unlock and lock. |
| **RecoverySecret** | The one-time recovery key. Generated on the device, shown once, never stored. |
| **RecordTemplate** | A client-defined field layout — password, login or note — with the fields it requires. |
| **RevealedItem** | The decrypted content of one opened record, folder name or collection name. Exists in memory only while displayed. |
| **LocalStore** | The device's copy of the vault in the default mode: ciphertext envelopes, server-visible metadata and the protection bundle. |
| **OfflineLease** | The API-signed authorization that lets the default mode work offline, with its scope and expiry or its renewal-disabled state. |
| **PendingEdit** | An offline change waiting in the local store's outbox: ciphertext, a client edit timestamp and a stable operation identifier. |
| **SyncCursor** | The opaque position from which the next synchronization continues. |
| **PinnedFingerprint** | A share recipient's key fingerprint, verified by the owner through an independent channel. |
| **Notice** | A message shown to the user: a validation failure, a refusal, a sync outcome. Derived from an API answer or a local check, never invented. |

## Relationships

| Relationship | Cardinality |
| --- | --- |
| Application → Session | 1 : 0..1 (one signed-in identity at a time, or none) |
| IdentityCredential → Session | N : 0..1 (a credential yields a session, a challenge, or nothing) |
| TwoFactorChallenge → Session | 1 : 0..1 |
| Application → InstanceConfiguration | 1 : 1 |
| Device → DeviceSettings | 1 : 1 |
| DeviceSettings → profile | 1 : 0..1 (a device may be restricted to one profile) |
| Session → ProtectionBundle | 1 : 1 (the account's, once vault protection is initialized) |
| Session → VaultKeyring | 1 : 0..1 (unlocked, or locked) |
| VaultKeyring → profile | 1 : 1 (a keyring opens exactly one profile at a time) |
| VaultKeyring → RevealedItem | 1 : 0..N (only while displayed) |
| LocalStore → OfflineLease | 1 : 0..1 |
| LocalStore → PendingEdit | 1 : 0..N |
| LocalStore → SyncCursor | 1 : 0..1 |
| Record → RecordTemplate | N : 0..1 (records may be created without a template) |
| Owner → PinnedFingerprint | 1 : 0..N (one per verified recipient) |

## Rules

### Authority and trust

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-01** | The API is the sole authority on ownership, grants, lifecycle and every server-visible fact. The client presents its answers and does not decide them. | Two systems deciding who may see a collection means one of them is wrong. |
| **BR-02** | Client-side validation exists to give immediate feedback, never to grant permission. Every submission is sent and every refusal is honored, including one the client expected to succeed. | A client check treated as authority is a rule the API does not have. |
| **BR-03** | An online change is not reported as saved until the API confirms it. An offline change is shown as *saved on this device, pending synchronization* until its upload outcome arrives. | A vault entry that looks saved and is not is a lost password. |
| **BR-04** | Where the API refuses, the application shows the API's reason. It does not soften, replace or generalize it. | A user who cannot see why something was refused cannot fix it. |

### Encryption and keys

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-05** | Plaintext vault content and usable keys never leave the device. Every content-bearing request carries only encrypted envelopes, wrapped keys, public keys and proofs. | The API must be unable to read the vault (API BR-10); only the client can keep that true. |
| **BR-06** | The application implements only the reviewed Cerberus protocol. It never substitutes an ad hoc cipher, and the flows that depend on the protocol stay blocked until it passes its security and interoperability review. | Improvised cryptography is the classic way a correct-looking vault is broken. |
| **BR-07** | Every decrypted envelope's authenticated metadata — owner, resource kind, resource identifier and key epoch — is verified. A mismatch or a failed tag is reported as tampered content, and nothing from it is displayed. | A malicious or broken server can swap ciphertext between items; only the client can notice. |
| **BR-08** | Every encryption uses fresh randomness, and a nonce is never reused under the same key. | AES-GCM nonce reuse destroys both confidentiality and integrity. |
| **BR-09** | Vault passwords and the recovery secret are never sent to the API and never stored. Only the derived artifacts the protocol defines leave the device. | A password the server receives is a password the server can be made to use. |
| **BR-10** | A share recipient's encryption key is never trusted because the API supplied it. Before the first share, the owner verifies the recipient's key fingerprint through an independent channel; a changed fingerprint blocks sharing until it is verified again. | Server assertions alone cannot stop a key-substitution attack (protocol review, threat boundary). |

### Unlock, reveal and lock

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-11** | Signing in never unlocks the vault. Unlocking is a separate local step with the master password or the opened profile's password. | API BR-12 separates identity login from vault unlocking. |
| **BR-12** | Decrypted content exists in memory only while it is displayed. Closing an item discards it, and hidden-text fields stay concealed until the user explicitly reveals them. | The brainstorm's rule: revealed on access, encrypted again on close. |
| **BR-13** | The vault locks on request, after the configured inactivity timeout, on sign-out, and when the session ends. Locking discards every key and every decrypted item from memory. | An unlocked vault left on an unattended device is an open vault. |
| **BR-14** | A value copied to the clipboard is cleared after the configured interval, unless the clipboard has changed since. | The clipboard is readable by every other application on the device. |
| **BR-15** | Where the platform allows it, vault content is excluded from screenshots and from the system's recent-apps preview. | A preview image is plaintext written somewhere the application does not control. |

### Profiles and devices

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-16** | An open profile shows only that profile's permitted content. Opening another profile requires that profile's unlock. | Profiles are the brainstorm's way of showing only part of the vault. |
| **BR-17** | A device restricted to a profile opens, stores and synchronizes only that profile's content, and offers no other profile until the restriction is lifted, which requires fresh authentication. | "The banking profile is only on one device" must mean the other devices do not hold it. |

### Storage modes

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-18** | The default, offline-capable mode exists on Windows, Linux and Android only. Its local store holds ciphertext envelopes, server-visible metadata, the protection bundle, the signed lease and pending edits — never plaintext and never an unwrapped key. | The brainstorm's default mode, with nothing on disk the server does not already hold. |
| **BR-19** | Online-only mode persists no vault data. Switching a device from the default mode to online only deletes its local store, after warning about any pending edits. | API BR-19: online-only clients must not persist vault data. |
| **BR-20** | The web application persists nothing in the browser — no vault data, token, preference or cache — and disables HTTP caching. Reloading the page signs the user out. | The brainstorm: the web app never stores anything in the browser. |
| **BR-21** | The storage mode is chosen per device and is always visible to the user. | A user must know whether the device in their hand holds a copy of their vault. |

### Offline authorization and synchronization

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-22** | An offline lease is used only after its signature verifies against a pinned server verification key. When renewal is enabled and the lease expires, the offline vault locks until online renewal succeeds. | API BR-17 and FR-SY-05 make expiry a client obligation. |
| **BR-23** | The application never treats a lease as valid because the device clock moved backwards. It keeps the latest time it has observed and judges expiry against that. | A clock rollback must not extend offline access (protocol review, offline lease). |
| **BR-24** | On reconnection, revocations, visibility removals and deletion tombstones are applied — removing the local ciphertext — before any newly synchronized content is shown. | API FR-SY-06: revocation is enforced on reconnection, first. |
| **BR-25** | Offline edits are uploaded with their client edit timestamps and stable operation identifiers, and each one's outcome — applied, superseded, denied or permanently deleted — is shown to the user. A superseded edit is never discarded silently. | Latest-edit-wins (API BR-18) loses someone's change; the user must know whose. |
| **BR-26** | A permanently deleted item is never resurrected by a local edit; its local copy and pending edits are removed when its tombstone arrives. | API BR-26 forbids resurrection; the client is where it could happen. |

### Sharing and permissions

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-27** | The interface offers each action only to the actor who may take it: sharing, membership, parent changes and deletion to the owner; edits to the owner and read/write recipients; nothing but reading to read-only recipients. Shared content is always marked as shared. | An interface that offers what will be refused is a broken interface. |
| **BR-28** | Hiding a control is never the only protection. Nothing the interface conceals becomes possible by manipulating client state, and every refusal is honored. | Concealment is a courtesy to the user, not a security boundary. |
| **BR-29** | Revoking a share or software grant is presented honestly: it stops future access and cannot retract what the recipient already copied or decrypted. | API BR-27 and the prohibitions: never claim retraction. |

### Records

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-30** | Every record has a name. Its other fields are user-defined, each text, numeric, boolean or hidden text. A record created from a template cannot be saved without the template's required fields. | API BR-08 and BR-09 — and the API cannot check either, because it cannot read the record. |
| **BR-31** | Searching and sorting by name or content happens on the device, over decrypted data in memory. No plaintext search term is sent to the API. | A search query is plaintext about the vault. |

### Deletion and the account lifecycle

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-32** | Deleting moves an item to the trash and states the 30-day restoration window. Permanent deletion is a separate action, confirmed explicitly, and stated to be irreversible. | API BR-20 and BR-21 define two different acts; the interface never collapses them. |
| **BR-33** | Deleting a folder states that its nested folders and records go with it. Deleting a collection or a profile states that its folders and records are kept. | API BR-22 and BR-23 behave in opposite ways; the user must know which one is happening. |
| **BR-34** | Account closure requires fresh authentication and states that access is revoked immediately, with 30 days to cancel. Immediate permanent deletion is a separate, separately confirmed action that states the Heimdall identity survives it. | API BR-24 and BR-25. |

### Session and credentials

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-35** | An identity credential exists only for the submission that carries it. It is never written to disk, retained in state, logged or kept in a form the user has left. | A credential the application keeps is a credential it can leak. |
| **BR-36** | The session token is stored only in platform secure storage on desktop and Android, and only in memory on the web — never in preferences, a URL or the local store. | Every other location is readable by something that should not read it. |
| **BR-37** | When the token is rejected mid-session, the application ends the session and locks the vault. It does not refresh silently or replay the interrupted action. | A silently replayed write can happen twice. |
| **BR-38** | Signing out clears the token, locks the vault and discards all in-memory state. In the default mode the local store, which holds only ciphertext, is kept unless the user chooses to remove the vault from the device. | A shared device must keep nothing readable from the previous session. |
| **BR-39** | A second-factor challenge grants nothing. Until it is completed, the application is in the signed-out state. | A half-authenticated session is an authenticated session with extra steps. |

### Recovery

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-40** | The recovery secret is shown once, when it is generated, and the user confirms having saved it before continuing. It can never be shown again; a refresh replaces it and the old one stops working. | API BR-13 and BR-14: one-time, refreshable recovery. |

### Privacy and compliance

The application is built to satisfy the **GDPR** and the **LGPD** (API BR-29). Most of the
obligation sits with the API, which holds the data; what follows is what a client owes.

| # | Rule | Rationale |
| --- | --- | --- |
| **BR-41** | No data leaves this application except to the Cerberus API. There is no analytics, telemetry, crash reporting or third-party component that observes use. | The simplest compliant data flow is one with no second destination. |
| **BR-42** | No log carries a credential, token, key, recovery secret, plaintext or envelope body, and release builds emit no log at all. | A diagnostic channel is a channel. |
| **BR-43** | Data export and account deletion are reachable from the interface without contacting anyone. A decrypted export is plaintext on disk; it is offered only after unlock, with that consequence stated and confirmed. | A right that needs an email to exercise is rarely exercised — and a plaintext file is the user's informed choice, never a default. |

## Validation Constraints

| Concern | Constraint |
| --- | --- |
| Record name | Required; checked on the device before encryption, because the API cannot. No length limit or uniqueness is imposed. |
| Record field | Each field has a label and one of four types: text, numeric, boolean, hidden text. A numeric field accepts only a number. |
| Template fields | A password template requires the password; a login template requires the username or email and the password; a note template requires the note. |
| Vault password | Required; entered twice when set or changed. No strength rule is imposed beyond what the reviewed protocol requires. |
| Recovery secret | Accepted only in the exact encoding in which it was shown. |
| Folder parent | A folder cannot be moved into itself or its descendants; the client checks before sending and the API decides. |
| Offline renewal interval | A positive interval, or renewal disabled; the bounds are the API's. |
| Auto-lock timeout | A positive interval, or "never" with a warning. |
| Clipboard clearing interval | A positive interval, or "never" with a warning. |
| Instance address | A well-formed HTTPS URL. Plain HTTP is accepted only in debug builds. |

## Permissions

| Actor | What the application offers |
| --- | --- |
| **Anonymous** | Instance configuration, registration, sign-in, second-factor completion, and cancelling a pending closure after fresh sign-in. |
| **Signed in, vault locked** | Account and identity details, unlocking, recovery, sign-out. No vault content. |
| **Owner, vault unlocked** | Everything on their own vault: profiles, records, folders, collections, sharing, software grants, trash, protection, recovery refresh, offline policy, export, closure. |
| **Read/write recipient** | Read and edit the records and folders of the shared collection; attach it to their own profiles. No sharing, membership or deletion. |
| **Read-only recipient** | Read the shared collection; attach it to their own profiles. |

## Lifecycle

| Entity | Lifecycle |
| --- | --- |
| Session | Signed out → challenge pending → signed in → signed out (sign-out, rejection or closure). |
| VaultKeyring | Locked → unlocked on one profile → locked (request, timeout, sign-out, lease expiry). |
| RevealedItem | Opened → concealed hidden fields revealed on request → discarded on close or lock. |
| LocalStore | Absent → created on first unlock in the default mode → synchronized → removed on switch to online only or on request. |
| OfflineLease | Absent → valid → renewal due → expired (vault locks) → renewed; or valid with renewal disabled until revoked on reconnection. |
| PendingEdit | Queued → uploaded → applied, superseded, denied or deleted → removed from the outbox. |
| RecoverySecret | Generated → shown once → confirmed saved → discarded from memory. |

## Prohibitions

- Never send plaintext vault content, a vault password, the recovery secret or an unwrapped key to
  the API.
- Never write plaintext or an unwrapped key to disk, preferences, logs or the clipboard history
  beyond the clearing interval.
- Never persist anything in the browser.
- Never display content whose authenticated metadata failed verification.
- Never share with a recipient whose key fingerprint has not been independently verified.
- Never extend offline access because the clock moved backwards, or keep revoked content after
  reconnection.
- Never resurrect a permanently deleted item from a local edit.
- Never claim immediate revocation of a disconnected device, or retraction of copies already made.

Related documents: [Project Overview](Project%20Overview.md),
[Technology Stack](Technology%20Stack.md) and [Workflow](Workflow.md).
