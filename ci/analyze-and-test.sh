#!/usr/bin/env bash
# The CI workflow's analyze-and-test job (ci.yml, IR-19): the workflow lint, formatting, analysis, the boundary
# rules, the tests with coverage and the protocol gate (IR-06). Run from anywhere; it works from the repository's
# root. Coverage has no threshold, so it never fails the build; coverage/lcov.info is kept with the build
# (`archive` in yggdrasil.yml).
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Every workflow, including the one only a manual run starts (.github/workflows/release-windows.yml), so a file
# GitHub cannot parse fails here rather than after the merge. The old job ran actionlint's container image, which
# also carries shellcheck and pyflakes; the release binary used here runs without them.
#
# Renovate follows this version (the comment below), but not the checksums: when it moves the version, copy the
# sha256 of the two archives from the release's actionlint_<version>_checksums.txt into this file by hand.
# renovate: datasource=github-releases depName=rhysd/actionlint
ACTIONLINT_VERSION=1.7.12

case $(uname -m) in
  x86_64)
    actionlint_arch=amd64
    actionlint_sha256=8aca8db96f1b94770f1b0d72b6dddcb1ebb8123cb3712530b08cc387b349a3d8 ;;
  aarch64)
    actionlint_arch=arm64
    actionlint_sha256=325e971b6ba9bfa504672e29be93c24981eeb1c07576d730e9f7c8805afff0c6 ;;
  *)
    echo "ci/analyze-and-test.sh: no pinned actionlint build for $(uname -m)" >&2
    exit 1 ;;
esac
actionlint_dir=$(mktemp -d)
trap 'rm -rf "$actionlint_dir"' EXIT
curl --fail --silent --show-error --location --retry 3 -o "$actionlint_dir/actionlint.tar.gz" \
  "https://github.com/rhysd/actionlint/releases/download/v${ACTIONLINT_VERSION}/actionlint_${ACTIONLINT_VERSION}_linux_${actionlint_arch}.tar.gz"
echo "$actionlint_sha256  $actionlint_dir/actionlint.tar.gz" | sha256sum --check --strict -
tar -xzf "$actionlint_dir/actionlint.tar.gz" --no-same-owner -C "$actionlint_dir" actionlint
"$actionlint_dir/actionlint"

# shellcheck source=ci/flutter-env.sh
source ci/flutter-env.sh

flutter pub get --enforce-lockfile

dart format --output=none --set-exit-if-changed lib test tool

# An analyzer failure is a failure (Development Workflow §4, Step 5).
flutter analyze

# IR-12 and the rules beside it; see tool/boundary_rules.dart.
dart run tool/check_boundaries.dart

flutter test --coverage

# IR-06. After the tests, so any vectors it finds have also passed.
dart run tool/check_protocol_gate.dart
