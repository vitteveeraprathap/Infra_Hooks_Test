#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.."; pwd)"
cd "$REPO_ROOT"
echo "Setting core.hooksPath to .githooks in $(pwd)"
git config core.hooksPath .githooks
chmod +x .githooks/commit-msg || true
echo "Hooks installed. Local commits to feature branches will be validated."
