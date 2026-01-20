#!/usr/bin/env bash
set -euo pipefail

# install this script in ~beelab/delivery (or similar)
# expects the demo zip in current directory

GENERIC_PROJECT_CODE="GENERIC_PROJECT_CODE"
ZIP_NAME="${GENERIC_PROJECT_CODE}-demo.zip"

STAGE_DIR="./${GENERIC_PROJECT_CODE}-demo"
WEB_PUBLIC="../beelab/web/public"
TARGET_DIR="${WEB_PUBLIC}/${GENERIC_PROJECT_CODE}-demo"

# 1) Unzip into a staging folder
rm -rf "$STAGE_DIR"
mkdir -p "$STAGE_DIR"
unzip -q "$ZIP_NAME" -d "$STAGE_DIR"

# 2) Replace old public path
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"
cp -a "$STAGE_DIR"/. "$TARGET_DIR"/

# 3) Quick sanity check
echo "Installed demo to: $TARGET_DIR"
ls -la "$TARGET_DIR" | head -n 30

