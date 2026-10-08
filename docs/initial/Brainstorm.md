# Cerberus

## Overview

Cerberus is a vault that stores credentials, passwords and any other kind of information that needs
protection. It is inspired by Bitwarden and AWS Secrets Manager.

This repository is the front end. The back end is the [Cerberus API](https://github.com/artur-rios/cerberus-api),
and everything the API specifies (its brainstorm, business rules and use cases) is the source of truth
for what this app must offer. The API never sees plaintext: the app encrypts and decrypts everything
locally, so this front end is where the vault actually gets opened.

## Platforms

- One Flutter app, shared among all supported platforms: Windows desktop, Linux desktop, Android and
  a web app that runs in the browser
- No iOS and no macOS

## App workflow

- The user creates an account and logs in with email and password. Identity belongs to
  [Heimdall](https://github.com/artur-rios/heimdall-api), but the app only talks to the Cerberus API,
  which delegates identity to Heimdall
- Logging in does not open the vault. The vault is unlocked separately, with a master password or
  with the password of the profile being opened
- Desktop and Android work in two modes:
  - **Default**: the vault is kept on the device so it is available even offline. Everything stays
    encrypted at rest and is only decrypted when the user opens an item, then encrypted again (and
    wiped from memory) once the user closes it
  - **Online only**: data is retrieved from the API only and never stored on the device
- The web app never stores anything in the browser: no local storage, no cache, no IndexedDB
- All communication with the API is encrypted (HTTPS), on top of the end-to-end encryption of the
  vault content
- Offline access has to be renewed periodically (24 hours by default, the user can change the
  interval or disable it). When the authorization expires the app locks the offline vault until it
  can renew online. Revocations are enforced when the device reconnects
- Conflicting offline edits are resolved by the latest edit, as the API decides

## What the user can do

- Register, log in, manage the account and identity details
- Set up vault protection (master password or one password per profile) and keep a one-time recovery
  key, refreshable at any time
- Store passwords, login credentials and notes, and add custom fields to any record: text, numeric,
  boolean or hidden text
- Organize records in folders (nested), and records and folders in collections
- Put collections in profiles, and choose which profile a device opens, so that, for example, the
  banking profile only exists on one specific device
- Share collections with other Cerberus users, read-only or read/write
- Give other software services read access to selected secrets (the secret manager part)
- Delete things into a trash bin, restore them within 30 days, or purge them right away
- Close the account (30 days to change your mind) or delete it immediately, and export all of
  their data
- Everything must be compliant with LGPD and GDPR

## Technology

- Flutter for the front end, the same app for every platform
- Use the latest stable version of Flutter, Dart and every library
- Build it the same way as the other front ends ([Heimdall UI](https://github.com/artur-rios/heimdall-ui)
  and [Fortuna UI](https://github.com/artur-rios/fortuna-ui)): same structure, same state, routing,
  generated API client and testing tools
- Implement all the user-facing features of the [Cerberus API](https://github.com/artur-rios/cerberus-api)
