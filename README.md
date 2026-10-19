# AegisCeptor — Releases

Installer resmi **AegisCeptor** untuk macOS (Apple Silicon, M1 ke atas).
mitmproxy dan bridge sudah ada di dalam app: tidak perlu Homebrew, Node, atau Python.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/jimmyleonardo/aegis-ceptor-releases/main/install.sh | bash
```

Script ini mengambil DMG dari [rilis terbaru](https://github.com/jimmyleonardo/aegis-ceptor-releases/releases/latest),
memasang `AegisCeptor.app` ke `/Applications`, lalu membukanya. Jalankan perintah yang sama untuk update.

### Manual

1. Download `AegisCeptor_<versi>_aarch64.dmg` dari [Releases](https://github.com/jimmyleonardo/aegis-ceptor-releases/releases/latest).
2. Buka DMG, drag **AegisCeptor** ke **Applications**.
3. App belum di-sign Apple. Kalau macOS memblokir saat pertama dibuka, jalankan:
   ```bash
   xattr -dr com.apple.quarantine /Applications/AegisCeptor.app
   ```

## Data

Rules disimpan di `~/Library/Application Support/id.aegis-sentinel.ceptor/` dan sertifikat CA di `~/.mitmproxy/`.
Keduanya tetap ada saat update atau install ulang.

## Uninstall

```bash
rm -rf /Applications/AegisCeptor.app
# opsional, hapus rules & sertifikat:
rm -rf ~/Library/Application\ Support/id.aegis-sentinel.ceptor ~/.mitmproxy
```
