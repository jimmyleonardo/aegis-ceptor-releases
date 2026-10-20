# AegisCeptor — Releases

Official installer for **AegisCeptor** on macOS (Apple Silicon, M1 and newer).
mitmproxy and the bridge are bundled inside the app: no Homebrew, Node or Python needed.

Created by **[Jimmy Leonardo](https://www.jimmyleonardo.com)**.

![AegisCeptor](screenshots/cover.png)

**New in 1.2:** connect AI assistants (Claude Code, Codex CLI, Antigravity, Claude Desktop, Cursor…) through MCP in one
click, session files, Copy as cURL / fetch / Python / Swift / Kotlin, WebSocket breakpoints, a native macOS menu bar and
a cleaner toolbar.

![AegisCeptor traffic list with a JSON response](screenshots/01-traffic-json.png)

## Screenshots

| | |
|---|---|
| **Breakpoints** – pause a response and edit it before it reaches the app<br>![Breakpoint](screenshots/02-breakpoint.png) | **Map Local** – mock responses, grouped into folders<br>![Map Local](screenshots/08-map-local.png) |
| **GraphQL** – operation names and errors, even on HTTP 200<br>![GraphQL error](screenshots/03-graphql-error.png) | **Security** – hints such as secrets in URLs<br>![Security](screenshots/04-security.png) |
| **Streaming (SSE)** – every event with its arrival time<br>![SSE stream](screenshots/05-sse-stream.png) | **Timing** – connect, TLS, waiting and download per request<br>![Timing](screenshots/06-timing.png) |
| **Insights** – error rate, latency, slowest and largest requests<br>![Insights](screenshots/07-insights.png) | **Light theme**<br>![Light theme](screenshots/09-light-theme.png) |
| **Connect** – phone, browser, iOS Simulator / Mac app, Android Emulator or terminal from one menu<br>![Connect menu](screenshots/10-connect-menu.png) | **AI assistants (MCP)** – let your own AI assistant read traffic and create mocks; no API key needed<br>![AI assistants](screenshots/11-mcp-assistants.png) |

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

If you connected AI assistants, click **Disconnect** for each one first (**⋯ → Settings → AI assistants (MCP)**).

```bash
rm -rf /Applications/AegisCeptor.app
# optional: also remove rules and the CA certificate
rm -rf ~/Library/Application\ Support/id.aegis-sentinel.ceptor ~/.mitmproxy
```

## License

AegisCeptor is free to use for personal and commercial work. See [LICENSE](LICENSE) for the terms
(no resale, no modified redistribution, no warranty). Bundled open-source components are listed in
[THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

---

Made by [Jimmy Leonardo](https://www.jimmyleonardo.com).
