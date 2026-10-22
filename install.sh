#!/usr/bin/env bash
# Copyright (c) 2026 Prontera Labs (https://aegisceptor.com). MIT License.
# Install AegisCeptor (Apple Silicon) from the latest GitHub release.
# Usage: curl -fsSL https://raw.githubusercontent.com/jimmyleonardo/aegis-ceptor-releases/main/install.sh | bash
set -euo pipefail

REPO="jimmyleonardo/aegis-ceptor-releases"
APP="AegisCeptor.app"
DEST="/Applications"

if [ "$(uname -s)" != "Darwin" ]; then
  echo "AegisCeptor is only available for macOS." >&2; exit 1
fi
if [ "$(uname -m)" != "arm64" ]; then
  echo "This build is for Apple Silicon (M1 and newer). Intel Macs are not supported yet." >&2; exit 1
fi

URL="https://github.com/${REPO}/releases/latest/download/AegisCeptor.dmg"

TMP=$(mktemp -d)
MNT="${TMP}/mnt"
cleanup() { hdiutil detach "${MNT}" -quiet 2>/dev/null || true; rm -rf "${TMP}"; }
trap cleanup EXIT

echo "==> Downloading the latest AegisCeptor..."
if ! curl -fL --progress-bar "${URL}" -o "${TMP}/AegisCeptor.dmg"; then
  echo "Download failed: no AegisCeptor.dmg in the latest release of ${REPO}." >&2; exit 1
fi

echo "==> Installing to ${DEST}..."
mkdir -p "${MNT}"
hdiutil attach "${TMP}/AegisCeptor.dmg" -nobrowse -readonly -mountpoint "${MNT}" -quiet
if pgrep -xq aegis-ceptor; then
  echo "  Quitting the running AegisCeptor..."
  osascript -e 'quit app "AegisCeptor"' 2>/dev/null || pkill -x aegis-ceptor || true
  sleep 2
fi
SUDO=""
[ -w "${DEST}" ] || SUDO="sudo"
${SUDO} rm -rf "${DEST}/${APP}"
${SUDO} cp -R "${MNT}/${APP}" "${DEST}/"
# The app is not signed by Apple yet: remove the quarantine flag so Gatekeeper does not block it
${SUDO} xattr -dr com.apple.quarantine "${DEST}/${APP}" 2>/dev/null || true

echo "OK: AegisCeptor installed at ${DEST}/${APP}"
open "${DEST}/${APP}"
