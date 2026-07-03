#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
url="$(python3 "$script_dir/extract-url.py")"

[ -n "$url" ] || exit 0
open "$url"
