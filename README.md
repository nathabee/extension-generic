
# Chrome Extension Template — Manifest V3

This repository is a production-grade template for building Chrome extensions using Manifest V3, written in TypeScript, with:

- background + content scripts
- a real extension panel UI
- a standalone demo build (no extension APIs required)
- a documented publishing and review workflow

This is not a finished product.
It is a starting point designed to be cloned and renamed once.

## Repository structure (high level)

- `assets/`        extension icons
- `src/`           extension source code (background, panel, content, shared)
- `demo/`          standalone demo (Vite-based, mock runtime)
- `docs/`          documentation site (GitHub Pages), checklists
- `scripts/`       build, release, versioning scripts
- `tools/`         initialization tools + templates (used once, then removed)

Build artifacts (`dist/`, `build/`, `node_modules/`) are not committed.

## Recommended workflow: initialize a new extension

Clone the template and rename the folder:

```bash
git clone https://github.com/nathabee/extension-generic.git
mv extension-generic <project_code>
cd <project_code>
````

Edit the initialization config:

```bash
nano tools/scripts/change-name.conf
```

Run the initialization scripts:

```bash
chmod +x ./tools/scripts/*.sh
./tools/scripts/change-name.sh
./tools/scripts/change-logo.sh
./tools/scripts/change-docs.sh
```

What these scripts do:

* rename `extension-generic` references across the repo
* update `package.json` and `manifest.json` (name, version, description, URLs)
* generate/copy branded SVG assets into `docs/`
* replace `/README.md` and `/docs/*` with the project templates
* verify no `GENERIC_*` placeholders remain in copied docs

After that, `tools/` is meant to be deleted before your first public release.

## Build the extension

```bash
npm install
npm run build
./scripts/build-zip.sh
```

Load in Chrome:

1. Open `chrome://extensions`
2. Enable Developer mode
3. Click Load unpacked
4. Select the repository root folder (the folder containing `manifest.json`)

## Demo (standalone, no extension APIs)

```bash
cd demo
npm install
npm run build
npm run preview -- --host
```

The demo runs the real panel UI in a normal web page using mock runtime/storage seams.

## Documentation

The GitHub Pages site is served from `docs/`.
It contains the checklist, publishing notes, and the embedded demo panel.

## License

MIT — see `LICENSE`

````