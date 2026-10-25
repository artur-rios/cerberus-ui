#!/usr/bin/env bash
# The CI workflow's web-bundle job (ci.yml): the release web bundle builds and passes the bundle check (IR-08, IR-18,
# FR-PV-04): no service worker, no third-party font and no local store in it. Run from anywhere; it works from the
# repository's root.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# shellcheck source=ci/flutter-env.sh
source ci/flutter-env.sh

flutter pub get --enforce-lockfile

flutter build web --release --no-web-resources-cdn

tool/check_web_bundle.sh build/web
