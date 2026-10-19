# AegisCeptor — Releases

Official installer for **AegisCeptor** on macOS (Apple Silicon, M1 and newer).
mitmproxy and the bridge are bundled inside the app: no Homebrew, Node or Python needed.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/jimmyleonardo/aegis-ceptor-releases/main/install.sh | bash
```

The script downloads `AegisCeptor.dmg` from the [latest release](https://github.com/jimmyleonardo/aegis-ceptor-releases/releases/latest),
installs `AegisCeptor.app` into `/Applications` and opens it. Run the same command again to update.

### Manual install

1. Download [AegisCeptor.dmg](https://github.com/jimmyleonardo/aegis-ceptor-releases/releases/latest/download/AegisCeptor.dmg) (always the latest version).
2. Open the DMG and drag **AegisCeptor** into **Applications**.
3. The app is not signed by Apple yet. If macOS blocks it on first launch, run:
   ```bash
   xattr -dr com.apple.quarantine /Applications/AegisCeptor.app
   ```

## Data

Rules are stored in `~/Library/Application Support/id.aegis-sentinel.ceptor/` and the CA certificate in `~/.mitmproxy/`.
Both are kept when you update or reinstall the app.

## Uninstall

```bash
rm -rf /Applications/AegisCeptor.app
# optional: also remove rules and the CA certificate
rm -rf ~/Library/Application\ Support/id.aegis-sentinel.ceptor ~/.mitmproxy
```
