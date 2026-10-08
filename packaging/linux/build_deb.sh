#!/usr/bin/env bash
# The Linux installer: a .deb built from the release bundle (Operations &
# Infrastructure §6.2).
#
#   packaging/linux/build_deb.sh <version> build/linux/x64/release/bundle dist
#
# Installs the bundle under /opt/cerberus with a desktop entry. Secure storage
# uses the session's secret service through libsecret, which the package
# depends on.
set -euo pipefail

version="${1:?usage: $0 <version> <bundle dir> <output dir>}"
bundle="${2:?usage: $0 <version> <bundle dir> <output dir>}"
output="${3:?usage: $0 <version> <bundle dir> <output dir>}"
here="$(cd "$(dirname "$0")" && pwd)"

root="$(mktemp -d)"
trap 'rm -rf "$root"' EXIT

install -d "$root/DEBIAN" "$root/opt/cerberus" "$root/usr/share/applications" \
  "$root/usr/share/icons/hicolor/256x256/apps"
cp -r "$bundle"/. "$root/opt/cerberus/"
install -m 0644 "$here/cerberus.desktop" "$root/usr/share/applications/cerberus.desktop"
install -m 0644 "$here/../../web/icons/Icon-512.png" \
  "$root/usr/share/icons/hicolor/256x256/apps/cerberus.png"

cat > "$root/DEBIAN/control" <<CONTROL
Package: cerberus-ui
Version: $version
Section: utils
Priority: optional
Architecture: amd64
Depends: libgtk-3-0, libsecret-1-0
Maintainer: Artur Rios <arturdev@duck.com>
Homepage: https://github.com/artur-rios/cerberus-ui
Description: Cerberus, an end-to-end encrypted vault
 The Cerberus client for Linux. Encrypts and decrypts on the device; the
 Cerberus API stores only ciphertext.
CONTROL

install -d "$output"
dpkg-deb --root-owner-group --build "$root" "$output/cerberus-ui_${version}_amd64.deb"
