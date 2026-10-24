# Third-Party Notices

AegisCeptor is made by [Prontera Labs](https://aegisceptor.com) and bundles the open-source
components below. Each component remains under its own license; the AegisCeptor license does not
change those terms.

The full license texts of every bundled component (including the Python packages inside mitmproxy, the npm
packages and the Rust crates) ship inside the app: **About → Third-party notices**.

## Bundled in the app

| Component | Version | License | Source |
|---|---|---|---|
| mitmproxy (standalone build, includes its own Python runtime and Python packages) | 12.2.3 | MIT | https://github.com/mitmproxy/mitmproxy |
| Python | 3.14 (bundled with mitmproxy) | PSF License | https://docs.python.org/3/license.html |
| Node.js (bridge runtime) | 26.12.1 | MIT and others | https://github.com/nodejs/node/blob/main/LICENSE |
| ws | 8.22.0 | MIT | https://github.com/websockets/ws |
| qrcode | 1.5.4 | MIT | https://github.com/soldair/node-qrcode |
| Tauri and Tauri plugins (dialog, notification, opener, process, updater, log) | 2.x | MIT or Apache-2.0 | https://github.com/tauri-apps/tauri |
| React and React DOM | 19.3 | MIT | https://github.com/facebook/react |
| TanStack Virtual | 3.14 | MIT | https://github.com/TanStack/virtual |
| Rust crates used by the app (serde, serde_json, log and their dependencies) | various | MIT or Apache-2.0 | https://crates.io |

mitmproxy is shipped inside the app as the official standalone build from downloads.mitmproxy.org
(`AegisCeptor.app/Contents/Resources/engine/mitmproxy.tar.gz`), unmodified. Its license is reproduced below.

## mitmproxy license (MIT)

```
Copyright (c) 2013, Aldo Cortesi. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

"mitmproxy" is a project of its respective authors; AegisCeptor is not affiliated with or endorsed by them.
