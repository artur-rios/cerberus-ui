#!/usr/bin/env bash
# The release files (`release.build` in yggdrasil.yml), run on the release agent from the checkout of the release's
# tag. It ports the Linux jobs of the old build.yml (IR-21): the protocol gate, then web, Android and Linux; the
# Windows files are the release-windows.yml workflow. Everything lands in dist/, named with the version like the old
# artifacts were:
#
#   dist/cerberus-ui-<version>-web.zip
#   dist/cerberus-ui-<version>-android-debug-signed.apk
#   dist/cerberus-ui_<version>_amd64.deb
#
# RELEASE_VERSION is the tag without its v (set by the pipeline); run by hand, the version in pubspec.yaml is used.
# The old build named its files with the pubspec.yaml version, which CONTRIBUTING.md says is the release's; a tag that
# disagrees with it is reported, since the application embeds the pubspec.yaml one.
#
# The Android APK is signed with the debug key, as android/app/build.gradle.kts does for a release build until a
# signing config exists (there is no release keystore, so no release credential), and is named for that. Do not
# distribute it.
#
# The web image the old job built to prove the Dockerfile builds (IR-22) is not built here: this runs in a container
# without the Docker engine.
#
# The Linux build needs desktop packages the Flutter image may not carry; they are installed with apt when this runs
# as root, as it does on the release agent.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
root=$PWD

# shellcheck source=ci/flutter-env.sh
source ci/flutter-env.sh

pubspec_version=$(sed -n 's/^version: \([0-9.]*\).*/\1/p' pubspec.yaml)
version=${RELEASE_VERSION:-$pubspec_version}
if [ "$version" != "$pubspec_version" ]; then
  echo "ci/release-build.sh: WARNING: this releases $version, but pubspec.yaml says $pubspec_version, which the application embeds" >&2
fi

rm -rf dist
mkdir dist

flutter pub get --enforce-lockfile

# ---- Protocol gate (the old build's `gate` job) ----
# A build whose protocol gate is open without its vectors fails before anything is built (IR-06).
flutter test test/core/crypto
dart run tool/check_protocol_gate.dart

# ---- Web ----
flutter build web --release --no-web-resources-cdn
tool/check_web_bundle.sh build/web
rm -f build/web/flutter_service_worker.js
(cd build/web && zip -qr "$root/dist/cerberus-ui-$version-web.zip" .)

# ---- Android ----
flutter build apk --release
cp build/app/outputs/flutter-apk/app-release.apk "dist/cerberus-ui-$version-android-debug-signed.apk"

# ---- Linux ----
# libsecret-1-dev is not part of Flutter's generic desktop list: it is flutter_secure_storage_linux's own
# dependency, and the session token lives in libsecret, so it is not optional here.
packages=(clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev libsecret-1-dev)
missing=()
for package in "${packages[@]}"; do
  dpkg -s "$package" >/dev/null 2>&1 || missing+=("$package")
done
if [ "${#missing[@]}" -gt 0 ]; then
  if [ "$(id -u)" -ne 0 ]; then
    echo "ci/release-build.sh: ${missing[*]} must be installed to build for Linux, and this is not run as root" >&2
    exit 1
  fi
  apt-get update
  apt-get install -y --no-install-recommends "${missing[@]}"
fi
flutter build linux --release
packaging/linux/build_deb.sh "$version" build/linux/x64/release/bundle dist

ls -l dist
