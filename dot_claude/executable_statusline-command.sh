#!/bin/bash
# Claude Code ステータスライン: リポジトリ名 | ブランチ | モデル (effort) | コンテキスト使用率
input=$(cat)

IFS=$'\t' read -r repo model effort ctx_pct dir <<<"$(echo "$input" | jq -r '
  [(.workspace.repo.name // "-"),
   (.model.display_name // "-"),
   (.effort.level // "-"),
   (.context_window.used_percentage // "-"),
   (.workspace.current_dir // .cwd // "-")
  ] | map(if . == "" then "-" else tostring end) | @tsv')"

branch=""
[ "$dir" != "-" ] && branch=$(git -C "$dir" branch --show-current 2>/dev/null)

# リポジトリ名は clone の取り違え防止のためディレクトリ名を優先（ai-interview / ai-interview2 を区別する）
if [ "$dir" != "-" ]; then
  toplevel=$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null)
  [ -n "$toplevel" ] && repo=$(basename "$toplevel")
fi

cyan=$'\033[36m'
green=$'\033[32m'
yellow=$'\033[33m'
red=$'\033[31m'
dim=$'\033[2m'
reset=$'\033[0m'

model_part=""
if [ "$model" != "-" ]; then
  model_part="${yellow}${model}"
  [ "$effort" != "-" ] && model_part="${yellow}${model} (effort: $effort)"
  model_part="${model_part}${reset}"
fi

ctx_part=""
if [ "$ctx_pct" != "-" ]; then
  ctx_color="$green"
  [ "$ctx_pct" -ge 60 ] && ctx_color="$yellow"
  [ "$ctx_pct" -ge 80 ] && ctx_color="$red"
  ctx_part="${ctx_color}ctx ${ctx_pct}%${reset}"
fi

parts=()
[ "$repo" != "-" ] && [ -n "$repo" ] && parts+=("${cyan}${repo}${reset}")
[ -n "$branch" ] && parts+=("${green}${branch}${reset}")
[ -n "$model_part" ] && parts+=("$model_part")
[ -n "$ctx_part" ] && parts+=("$ctx_part")

sep="${dim} | ${reset}"
out=""
for p in "${parts[@]}"; do
  [ -n "$out" ] && out="${out}${sep}"
  out="${out}${p}"
done
printf "%s" "$out"
