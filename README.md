# Flutter + GitHub Codespaces (Web)

Develop Flutter **in the browser** using **GitHub Codespaces**.

This repository provides a ready-to-use dev container that installs Flutter in the user’s home directory (no root permissions required) and automatically creates a project in `app/`.

---

## ✅ What’s Included

- `.devcontainer/`
    - **Dockerfile**: Installs Flutter (stable) to `~/.flutter`
    - **post_create.sh**: Enables web support, precaches, and creates `app/` on first boot
- `.vscode/` with Dart/Flutter extensions configured
- `scripts/run_web.sh` to run the app on **port 8080**

> Android/Chrome are **not** required for the web-server target in Codespaces.

---

## 🚀 Quick Start

1. **Open a Codespace**
     - GitHub → your repo → **Code** → **Codespaces** → **Create codespace on main**

2. **Wait for the container to build**
     - The first build takes a few minutes.
     - When done, you should see an `app/` folder created automatically.

3. **Run the app**
     - **Option A (VS Code Task)**
         - `Terminal → Run Task… → Run Flutter (web-server)`
     - **Option B (Manual)**
         ```bash
         cd app
         flutter pub get
         flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
         ```

4. **Open the forwarded port**
     - Go to the **Ports** tab → find **8080** → **Open in Browser**

---

## 🔁 Daily Development Loop

- Keep **one terminal** running `flutter run` for hot reload:
    - Press `r` for **hot reload**
    - Press `R` for **hot restart**
    - Press `q` to quit
- Use a **second terminal** for `git add/commit/push`, running scripts, etc.

---

## 🌿 Git Basics (in this repo)

```bash
# See changes
git status

# Create a feature branch
git checkout -b feat/my-change

# Stage & commit
git add -A
git commit -m "feat: my first change"

# Push
git push -u origin feat/my-change
```

---

## 🛠️ Useful Commands

```bash
# Show Flutter info
flutter doctor -v
flutter --version

# Clean & restore dependencies
cd app
flutter clean
flutter pub get

# Build static web (optional)
flutter build web
```

---

## ❗ Troubleshooting

**1) Blank page in the browser**

Try running with an explicit hostname/renderer or in release mode:

```bash
cd app
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0 --web-renderer html
# or
flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0 --release
```

**2) Port 8080 not visible**

Open the Ports panel and add 8080 manually if needed.

**3) Import errors / “package:flutter/material.dart” not found**

Ensure VS Code points to the correct SDK location:

- Either remove `dart.flutterSdkPath` from `.vscode/settings.json`
- Or set it to:
    ```json
    "dart.flutterSdkPath": "/home/vscode/.flutter"
    ```

Then reload the window: Command Palette → Developer: Reload Window.

Also clear analyzer cache:

```bash
cd app
rm -rf .dart_tool
flutter pub get
```

**4) Permission issues (writing to Flutter cache)**

This setup installs Flutter under the user HOME (`~/.flutter`), which avoids permission errors.
If you previously installed under `/usr/local/flutter`, remove or ignore it.

**5) Rebuild the container after changing devcontainer files**

Use Command Palette → Codespaces: Rebuild Container.

---

🧪 **Optional: Run in Chrome instead of web-server**

If you want auto-reload-on-save and browser debugging, you can add Chrome to the container and run:

```bash
flutter run -d chrome
```

_Not required for this template; web-server is simpler in Codespaces._