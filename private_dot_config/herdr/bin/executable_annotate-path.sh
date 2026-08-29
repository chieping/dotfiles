#!/usr/bin/env bash
# Open the file path in the clipboard with plannotator-tui (herdr-annotate).
# Bound to a herdr [[keys.command]]; select a path in a pane (copy-on-select) or copy it,
# then press the key. Accepts absolute paths, ~-paths, relative paths (resolved against the
# focused pane's cwd) and file:// URLs.
set -euo pipefail

# detached shell commands inherit a minimal PATH; jq and pbpaste live outside it
export PATH="/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

notify() {
  if [ -n "${HERDR_BIN_PATH:-}" ]; then
    "$HERDR_BIN_PATH" notification show "Annotate" --body "$1" >/dev/null 2>&1 || true
  fi
  echo "$1" >&2
}

raw="$(pbpaste 2>/dev/null || true)"
# first non-empty line, trimmed of whitespace and common surrounding punctuation
path="$(printf '%s\n' "$raw" | grep -m1 -v '^[[:space:]]*$' || true)"
path="${path#"${path%%[![:space:]]*}"}"
path="${path%"${path##*[![:space:]]}"}"
path="${path%[,.:;)\]\"'\`]}"
path="${path#[(\[\"'\`]}"

if [ -z "$path" ]; then
  notify "clipboard is empty — select or copy a file path first"
  exit 1
fi

# file:// URL -> plain path (percent-decoded)
case "$path" in
  file://*)
    path="${path#file://}"
    path="$(printf '%b' "${path//%/\\x}")"
    ;;
esac

case "$path" in
  "~"/*) path="$HOME/${path#\~/}" ;;
esac

# relative -> resolve against the focused pane's cwd
case "$path" in
  /*) ;;
  *) path="${HERDR_ACTIVE_PANE_CWD:-$PWD}/$path" ;;
esac

if [ ! -e "$path" ]; then
  notify "not found: $path"
  exit 1
fi

root="$(jq -r '.[] | select(.plugin_id == "annotate") | .plugin_root' \
  "${XDG_CONFIG_HOME:-$HOME/.config}/herdr/plugins.json" 2>/dev/null || true)"
if [ -z "$root" ] || [ ! -x "$root/scripts/plannotator-tui.sh" ]; then
  notify "herdr-annotate plugin not found"
  exit 1
fi

# herdr identifies the calling plugin by env; an external command must set it itself.
# a detached [[keys.command]] does not inherit these; plannotator-tui refuses to run without them
export HERDR_ENV="${HERDR_ENV:-1}"
export HERDR_PANE_ID="${HERDR_PANE_ID:-${HERDR_ACTIVE_PANE_ID:-}}"
export HERDR_PLUGIN_ID="annotate"
export HERDR_PLUGIN_ROOT="$root"

set -- herdr open "$path"
[ -n "${HERDR_ACTIVE_PANE_ID:-}" ] && set -- "$@" --deliver-to "$HERDR_ACTIVE_PANE_ID"
exec bash "$root/scripts/plannotator-tui.sh" "$@"
