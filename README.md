# Chrome Extension Template — Manifest V3

This repository is a **production-grade template** for building Chrome extensions using **Manifest V3**, written in **TypeScript**.

It includes:

* background and content scripts
* a real extension panel UI
* a standalone demo build (no extension APIs required)
* a documented publishing and review workflow

This is **not a finished product**.
It is a starting point designed to be **cloned and renamed exactly once**.

---

## Repository structure (high level)

* `assets/`
  Extension icons (PNG only, generated from SVG)

* `src/`
  Extension source code (background, panel, content, shared)

* `demo/`
  Standalone demo (Vite-based, mock runtime)

* `docs/`
  Documentation site (GitHub Pages), checklists, demo embed

* `scripts/`
  Build, release, versioning scripts

* `tools/`
  Initialization tools and templates
  *(used once, then removed)*

Build artifacts (`dist/`, `build/`, `node_modules/`) are **not committed**.

---

## Recommended workflow: initialize a new extension

### 1. Create the GitHub repository

Create a **new empty repository** on GitHub named `<project_code>`
(do **not** add README, license, or `.gitignore`).

---

### 2. Clone the template and rename the folder

```bash
git clone https://github.com/nathabee/extension-generic.git
mv extension-generic <project_code>
cd <project_code>
rm -rf .git
```

---

### 3. Point the repository to the new GitHub project

This step is **mandatory** to avoid pushing back into the template repository.
Always verify that `origin` points to your new repository before pushing.


```bash

git remote add origin git@github.com:<youruser>>/<project_code>.git
git branch -M main
git remote -v   # MUST show your new repo before any push

```

---

### 4. Edit the initialization configuration

```bash
nano tools/scripts/change-name.conf
```

Fill in **all** `GENERIC_*` values (name, description, URLs, trigram, etc.).

---

### 5. Run the initialization scripts

```bash
chmod +x ./tools/scripts/*.sh
./tools/scripts/change-name.sh
./tools/scripts/change-docs.sh
./tools/scripts/change-logo.sh
```

#### What these scripts do

* replace all `GENERIC_*` placeholders across the repository
* update `package.json` and `manifest.json`
* generate and copy branded SVG assets into `docs/`
* replace `/README.md` and `/docs/*` using the project templates
* verify that no `GENERIC_*` placeholders remain (outside `tools/scripts`)

After this step, the project is no longer “generic”.

> **Important**
> The `tools/` directory is intended for initialization only
> and should be removed before the first public release.

---

### 6. Commit and push

```bash

git add -A
git commit -m "chore(init): initialize project from template"
git push -u origin main
```

---

## Build the extension

```bash
npm install
npm run build
./scripts/build-zip.sh
```

### Load in Chrome (development)

1. Open `chrome://extensions`
2. Enable **Developer mode**
3. Click **Load unpacked**
4. Select the repository root (the folder containing `manifest.json`)

---

## Demo (standalone, no extension APIs)

The demo runs the **real panel UI** in a normal web page using mock runtime and storage seams.

```bash
cd demo
npm install
npm run build
npm run preview -- --host
```

---

## Documentation

The GitHub Pages site is served from the `docs/` directory.

It contains:

* user documentation
* publishing and review notes
* interactive checklists
* the embedded demo panel

---

## License

MIT — see `LICENSE`

---
 