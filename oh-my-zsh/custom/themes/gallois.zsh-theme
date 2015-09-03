ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[green]%}"

theme_aws_profile() {
  local agp=$(agp)
  if [ -n "$agp" ]; then
    echo "%{$reset_color%}%{$fg[blue]%}[$agp]%{$reset_color%}"
  fi
}

# Combine it all into a final right-side prompt
RPS1='$(git_super_status)%{$fg[magenta]%}[$(ruby_prompt_info)]%{$reset_color%}$(theme_aws_profile) $EPS1'

PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
