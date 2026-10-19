# AegisCeptor — Releases

Official installer for **AegisCeptor** on macOS (Apple Silicon, M1 and newer).
mitmproxy and the bridge are bundled inside the app: no Homebrew, Node or Python needed.

![AegisCeptor traffic list with a JSON response](screenshots/01-traffic-json.png)

## Screenshots

| | |
|---|---|
| **Breakpoints** – pause a response and edit it before it reaches the app<br>![Breakpoint](screenshots/02-breakpoint.png) | **Map Local** – mock responses, grouped into folders<br>![Map Local](screenshots/08-map-local.png) |
| **GraphQL** – operation names and errors, even on HTTP 200<br>![GraphQL error](screenshots/03-graphql-error.png) | **Security** – hints such as secrets in URLs<br>![Security](screenshots/04-security.png) |
| **Streaming (SSE)** – every event with its arrival time<br>![SSE stream](screenshots/05-sse-stream.png) | **Timing** – connect, TLS, waiting and download per request<br>![Timing](screenshots/06-timing.png) |
| **Insights** – error rate, latency, slowest and largest requests<br>![Insights](screenshots/07-insights.png) | **Light theme**<br>![Light theme](screenshots/09-light-theme.png) |

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
