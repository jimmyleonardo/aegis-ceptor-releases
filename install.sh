#!/usr/bin/env bash
# Install AegisCeptor (Apple Silicon) dari GitHub Releases terbaru.
# Pemakaian: curl -fsSL https://raw.githubusercontent.com/jimmyleonardo/aegis-ceptor-releases/main/install.sh | bash
set -euo pipefail

REPO="jimmyleonardo/aegis-ceptor-releases"
APP="AegisCeptor.app"
DEST="/Applications"

if [ "$(uname -s)" != "Darwin" ]; then
  echo "AegisCeptor hanya untuk macOS." >&2; exit 1
fi
if [ "$(uname -m)" != "arm64" ]; then
  echo "Build ini untuk Apple Silicon (M1 ke atas). Mac Intel belum didukung." >&2; exit 1
fi

echo "→ Mencari rilis terbaru…"
URL=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
  | grep -o '"browser_download_url": *"[^"]*aarch64\.dmg"' | head -1 | cut -d'"' -f4)
if [ -z "$URL" ]; then
  echo "DMG tidak ditemukan di rilis terbaru $REPO." >&2; exit 1
fi

TMP=$(mktemp -d)
MNT="$TMP/mnt"
cleanup() { hdiutil detach "$MNT" -quiet 2>/dev/null || true; rm -rf "$TMP"; }
trap cleanup EXIT

echo "→ Download $(basename "$URL")…"
curl -fL --progress-bar "$URL" -o "$TMP/AegisCeptor.dmg"

echo "→ Install ke $DEST…"
mkdir -p "$MNT"
hdiutil attach "$TMP/AegisCeptor.dmg" -nobrowse -readonly -mountpoint "$MNT" -quiet
if pgrep -xq aegis-ceptor; then
  echo "  Menutup AegisCeptor yang sedang berjalan…"
  osascript -e 'quit app "AegisCeptor"' 2>/dev/null || pkill -x aegis-ceptor || true
  sleep 2
fi
SUDO=""
[ -w "$DEST" ] || SUDO="sudo"
$SUDO rm -rf "$DEST/$APP"
$SUDO cp -R "$MNT/$APP" "$DEST/"
# App belum di-sign Apple: hapus tanda quarantine supaya Gatekeeper tidak memblokir
$SUDO xattr -dr com.apple.quarantine "$DEST/$APP" 2>/dev/null || true

echo "✓ AegisCeptor terpasang di $DEST/$APP"
open "$DEST/$APP"
