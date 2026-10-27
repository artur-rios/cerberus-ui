#!/usr/bin/env bash
# The Check generated workflow's drift job (check-generated.yml, IR-11): generated code stays generated.
#
# Regenerates the API client from api/cerberus.json, drift's code for the local store, its schema snapshot and
# migration test helpers, and the localizations, and compares them with what is committed. Any difference fails the
# build, which is what makes "never hand-edit generated code" an enforced rule rather than a request (FR-DA-02,
# NFR-15). Run from anywhere; it works from the repository's root, which must be a git checkout.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# shellcheck source=ci/flutter-env.sh
source ci/flutter-env.sh

flutter pub get --enforce-lockfile

# The API client.
dart run tool/generate_api_client.dart

# The local store code.
dart run build_runner build --delete-conflicting-outputs
dart run drift_dev make-migrations
dart run drift_dev schema generate drift_schemas/local_store/ test/core/local_store/generated/

# The localizations.
flutter gen-l10n

git add --intent-to-add --all
if ! git diff --quiet; then
  echo "ci/generated-drift.sh: Committed generated code differs from what regeneration produces." >&2
  echo "Run the commands in CONTRIBUTING.md § Generated code and commit the result." >&2
  echo "Never hand-edit generated code (IR-10, IR-11, FR-DA-02)." >&2
  git diff --stat >&2
  exit 1
fi
echo "Generated code is in sync with its sources."
