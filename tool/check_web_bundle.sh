#!/usr/bin/env bash
# Checks a built web bundle (IR-08, IR-18, FR-PV-04).
#
#   tool/check_web_bundle.sh build/web
#
# - No service worker is registered: the bootstrap passes no
#   serviceWorkerSettings, and the image does not ship the worker file.
# - No font is fetched from fonts.gstatic.com: Roboto is bundled, and the
#   fallback base points at this origin.
# - The local store is not in the bundle: no SQLite, no drift.
set -euo pipefail

bundle="${1:?usage: $0 <web build directory>}"
bootstrap="$bundle/flutter_bootstrap.js"
main="$bundle/main.dart.js"
fail() { echo "::error::$*"; exit 1; }

# The application's own call, after flutter.js (whose minified loader names
# serviceWorkerSettings in its signature, and is not what decides).
load_call="$(awk '/^_flutter\.loader\.load\(/{found=1} found && !/^[[:space:]]*\/\//' "$bootstrap")"
[[ -n "$load_call" ]] || fail "flutter_bootstrap.js has no _flutter.loader.load call."

grep -q 'serviceWorkerSettings' <<<"$load_call" \
  && fail "flutter_bootstrap.js registers a service worker (IR-18)."

grep -q 'fontFallbackBaseUrl: "assets/fonts/fallback/"' <<<"$load_call" \
  || fail "flutter_bootstrap.js does not keep font fallback on this origin (FR-PV-04)."

grep -q '"family":"Roboto"' "$bundle/assets/FontManifest.json" \
  || fail "Roboto is not bundled, so the engine would fetch it from fonts.gstatic.com (FR-PV-04)."

grep -q '"useLocalCanvasKit":true' "$bootstrap" \
  || fail "CanvasKit is loaded from a CDN; build with --no-web-resources-cdn (FR-PV-04)."

if grep -qiE 'sqlite|NativeDatabase|sqlite3\.wasm' "$main" || ls "$bundle" | grep -qi sqlite; then
  fail "The web bundle contains the local store (IR-08)."
fi

echo "Web bundle: no service worker, no third-party fonts, no local store."
