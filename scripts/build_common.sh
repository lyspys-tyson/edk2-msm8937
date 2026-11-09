#!/usr/bin/env bash

# Resolve paths relative to this file so the script works from any directory.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EDK2_ROOT="$(cd "$REPO_ROOT/../edk2" && pwd)"

export PACKAGES_PATH="${PACKAGES_PATH:-$EDK2_ROOT:$EDK2_ROOT/../edk2-platforms:$REPO_ROOT}"
export WORKSPACE="${WORKSPACE:-$REPO_ROOT/workspace}"
export EDK_TOOLS_PATH="${EDK_TOOLS_PATH:-$EDK2_ROOT/BaseTools}"
export CONF_PATH="${CONF_PATH:-$WORKSPACE/Conf}"

mkdir -p "$WORKSPACE" "$CONF_PATH"

# The Actions workflow has already sourced edksetup.sh.
# Set it up only for standalone/local builds where `build` is unavailable.
if ! command -v build >/dev/null 2>&1; then
  set +u
  source "$EDK2_ROOT/edksetup.sh"
  set -u
fi
