# Workflow — Cerberus UI

How a single use case is delivered, from picking it up to closing it out. The formal, normative
version of this process lives in the
[Development Workflow Document](../requirements/Development%20Workflow%20Document.md); this document
is the operational form an implementer follows step by step.

It is the same workflow the [Cerberus API](https://github.com/artur-rios/cerberus-api), the
[Heimdall UI](https://github.com/artur-rios/heimdall-ui) and the
[Fortuna UI](https://github.com/artur-rios/fortuna-ui) use, deliberately — one process across every
repository.

> **One use case = one branch = one issue = one pull request.**

The repository is [artur-rios/cerberus-ui](https://github.com/artur-rios/cerberus-ui). GitHub issues
and the public [Cerberus UI project](https://github.com/users/artur-rios/projects/16) track the
backlog. Specifications live in `docs/initial/` and `docs/requirements/`; the README sits at the
repository root.

## Invocation

Work starts when a use case is named by its identifier, e.g. `UC-05`. If the identifier is missing
or ambiguous, ask which one before doing anything else. One pass handles exactly **one** use case —
unless a batch run has been authorized up front, in which case see
[Step 7.1](#step-71--authorized-batch-runs).

## The golden rule: pause at every stage boundary

The work is reviewed before it advances. Therefore:

- **The only status change made unattended is `Todo → In Progress`**, right after the branch is
  created. It signals that work has begun.
- **Every other stage transition requires explicit approval first.** Before moving to **Testing**,
  before opening a **pull request**, and before moving to **Done**, stop, show what was done, and
  ask. Do not batch these.
- **Never merge the pull request, never self-approve, never delete the branch.** Review, merge and
  branch deletion are human actions. An agent may *prepare and push* the pull request.

When pausing, summarize what the stage completed, state what comes next, and wait for a clear
go-ahead.

## Workflow overview

```
Load specs → Refine (design → plan) → [approval] → Branch + issue→In Progress
  → Implement → [approval] → issue→Testing → Test until green → [approval]
  → Open PR → [human review + merge + delete branch] → [approval] → issue→Done
```

Steps 1–2 and every `[approval]` gate are where the implementer stops.

---

## Step 1 — Load the specifications

Read the relevant requirements documents before designing anything. Pull the specifics for this use
case; do not work from memory:

- [Use Case Specification Document](../requirements/Use%20Case%20Specification%20Document.md)
  — the target use case: actors, pre/postconditions, main flow, and every `AF-xx` alternative flow.
- [System Requirements Document](../requirements/System%20Requirements%20Document.md)
  — the `FR-xx` requirements traced to it, the screen surface, the storage model and the
  authorization matrix.
- [Development Workflow Document](../requirements/Development%20Workflow%20Document.md)
  — the normative delivery process.
- [Testing Specification Document](../requirements/Testing%20Specification%20Document.md)
  — how the tests will be written.
- [Technology Stack Document](../requirements/Technology%20Stack%20Document.md)
  — the libraries, versions, and patterns to build with.

Because this application is a client, two more sources are often needed:

- **The endpoints this use case calls**, in the
  [Cerberus API](https://github.com/artur-rios/cerberus-api)'s System Requirements and Use Case
  Specification documents. Read the API's contract rather than guessing at it, and never assume a
  field the generated client does not carry.
- **The Cerberus protocol**, in the API's
  [protocol review](https://github.com/artur-rios/cerberus-api/blob/develop/docs/security/protocol-review.md),
  for any use case that encrypts, decrypts, wraps, proves or recovers. If the protocol has not
  passed its review, the use case is blocked; say so rather than improvising.

Then locate the tracking issue for this use case and confirm the API endpoints it depends on exist.

## Step 2 — Refine the design and plan

The specification is the *what*; a repository-specific *how* is still needed before coding.

1. **Design** — turn the specification and its traced requirements into a concrete design for this
   codebase: which screens, routes, providers, repositories, validators and widgets are needed;
   which generated client calls each flow makes; what is read from or written to the local store in
   the default mode; what plaintext exists in memory and when it is discarded; and how every
   alternative flow maps to what the user actually sees. Ground it in the patterns already present
   in the repository — and, where this repository has not grown one yet, in the equivalent pattern
   in the Heimdall UI or Fortuna UI.
2. **Plan** — capture the result as a written, step-by-step implementation plan, sequenced
   test-first per the Testing Specification.

**Present the refined design and plan, and wait for approval before writing any code.** This is the
first review gate.

## Step 3 — Branch and move the issue to In Progress

Once the plan is approved, create the branch from an up-to-date `develop` using the naming pattern
`feature/uc-##-use-case-name`:

```bash
git switch develop && git pull
git switch -c feature/uc-05-sign-in
```

- `##` — the zero-padded use case number.
- `use-case-name` — the use case name in lower-case kebab-case.

Then — the **one** status change made without asking — move the issue to **In Progress**.

## Step 4 — Implement

Execute the approved plan, following the repository's established patterns. Implement the main flow
**and every alternative flow** from the specification. Grow the implementation and its tests
together. Commit on the branch as you go.

Three rules bind every change in this repository specifically:

- **No plaintext and no unwrapped key leaves memory.** Not to the API, the local store, a
  preference, a log or a test snapshot.
- **Only `core/crypto` calls a cryptographic primitive**, and it implements only the reviewed
  protocol.
- **Never hand-edit the generated API client.** If the client is wrong, the API's OpenAPI document
  is wrong; fix it there and regenerate.

## Step 5 — Pause for review before Testing

When the implementation is code-complete, **stop and ask** before advancing. Summarize what was
built. Only after approval, move the issue to **Testing**.

## Step 6 — Test until green

Following the [Testing Specification Document](../requirements/Testing%20Specification%20Document.md),
write the tests for this use case (main flow + each applicable `AF-xx`), run the suite, fix
failures, and **re-run until everything passes**:

```bash
flutter analyze
flutter test
```

An analyzer failure is a failure. Integration tests are run separately, per the Testing
Specification. A use case does not leave the Testing stage until the full suite is green.

Report the passing results. **Do not open a pull request yet — stop and ask.**

## Step 7 — Open the pull request (after approval)

Once approved, push the branch and open a pull request from `feature/uc-##-…` into `develop`,
referencing the issue so the merge closes it. Then **hand off to a human** for review and merge.
Do **not** merge or delete the branch.

### Step 7.1 — Authorized batch runs

When several use cases are delivered in one unattended run, the approval gates would stop the run at
every use case, which defeats the point of batching them. For a **batch run only**, an agent may
merge its own pull requests, subject to all of the following:

- **The batch was authorized up front.** A human agreed to the specific use cases, in order, and was
  told explicitly that the agent would merge, close the issues and delete the branches. A general
  instruction to work autonomously is not this authorization.
- **The invariant still holds.** One use case = one branch = one issue = one pull request. Use cases
  are never batched into a shared branch or a shared pull request.
- **The testing gate is unchanged.** The full suite is run and read for every use case, per Step 6.
  A merge on an unread or failing suite is never permitted.
- **No protection is bypassed.** No administrative override merge, no self-approval to satisfy a
  required review, no force-push, and no disabling or filtering of a test to make the suite green.
- **The protocol gate is unchanged.** A batch never implements a use case blocked on the protocol
  review, whatever the batch authorization says.
- **A failure stops the whole run.** A red suite, a merge conflict, an ambiguous specification, a
  missing API endpoint, or a requirement that does not exist ends the batch. Already-merged use
  cases stay merged; the failing branch and its pull request are left in place as evidence.

Outside an authorized batch run, Step 7 applies as written: a human reviews and a human merges.

## Step 8 — Close out (after the merge)

After the pull request is merged and the branch deleted, **ask** before finishing, then move the
issue to **Done**, confirm it is closed, and update the use case's row in the README backlog.

---

## Definition of Done

- [ ] Implemented on a `feature/uc-##-use-case-name` branch created from `develop`.
- [ ] Main flow and every alternative flow implemented, each with the interface behavior the
      specification defines for it.
- [ ] Unit tests cover each provider, repository, validator and crypto operation the use case adds
      (main + applicable `AF-xx`).
- [ ] Widget tests cover each screen the use case adds or changes, including its loading, empty,
      failed and locked states.
- [ ] Integration tests cover the end-to-end journey where the Testing Specification calls for one.
- [ ] `flutter analyze` is clean and `flutter test` is green. There is no numeric coverage floor
      (Testing Specification §7.5).
- [ ] No plaintext or unwrapped key reaches the API, the local store, preferences or a log — and a
      test proves it for every content-bearing request the use case adds.
- [ ] The generated API client was not hand-edited.
- [ ] The pull request was merged to `develop` — reviewed by a human, or merged by an agent under an
      authorized batch run (Step 7.1).
- [ ] The branch was deleted.
- [ ] The issue is in **Done** and closed, and the README backlog row is updated.
