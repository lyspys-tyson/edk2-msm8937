#!/usr/bin/env bash
# Build the existing land image when the workflow's generic device input is "8917".
# This only produces an artifact; it is NOT an MSM8917/ugglite-compatible image.
set -Eeuo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec bash "$SCRIPT_DIR/land.sh" "$@"
