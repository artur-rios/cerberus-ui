#!/bin/sh
# The `web-bundle` check: the web image (the Dockerfile, IR-22) builds, and so does the bundle in it, which has to pass
# the bundle check (IR-08, IR-18, FR-PV-04): no service worker, no third-party font and no local store. Nothing else
# builds the Dockerfile, and it can break on its own (a file it copies, an `.dockerignore` rule, the pinned bases).
#
# The Dockerfile compiles the bundle and runs tool/check_web_bundle.sh on it in the same RUN, joined with `&&`, so a
# bundle the check rejects fails the build, and with it this script and the check. Build only: no push and no run.
# yggdrasil.yml runs it in the pinned docker CLI image (an Alpine one: no bash, hence sh) with the CI engine's socket
# (`docker: true`), from the repository's root.
#
# The image gets a tag of its own for each run, so two runs on one engine do not share it, and is removed when the
# script ends, however it ends. The layers stay in the engine's build cache, which its weekly prune clears.
set -eu

# The repository's root, wherever this is run from.
cd "$(dirname "$0")/.."

tag="cerberus-ui-check:$(date +%s)-$(head -c 6 /dev/urandom | od -An -tx1 | tr -d ' \n')"
trap 'docker rmi --force "$tag" >/dev/null 2>&1 || true' EXIT

docker build --file Dockerfile --tag "$tag" .
