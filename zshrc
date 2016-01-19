setopt print_eight_bit
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
setopt no_flow_control
setopt nobeep
export TERM=xterm-256color
export CC=gcc

case ${OSTYPE} in
  darwin*)
    source ~/.zshrc.darwin
    ;;
  linux*)
    source ~/.zshrc.linux
    ;;
esac

# User configuration

# setup direnv
type direnv >/dev/null 2&>/dev/null && eval "$(direnv hook zsh)"

if [ -e ~/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  fi
fi

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# zsh-history-substring-search
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Editing command by EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# surround
autoload -Uz surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround
bindkey '^xd' delete-surround
bindkey '^xcs' change-surround
bindkey '^xys' add-surround

# expand global aliases by space
# http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
  if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}

zle -N globalias

bindkey " " globalias
# "^ " is reserved by IME switching. Besides, I can do with tab key to expand
# history. (!! and all that) That's why below line is commented out.
# bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac=tac
  else
    tac='tail -r'
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

peco-find-file() {
  local source_files
  local result
  local selected_files
  local file

  if type ag >/dev/null 2>&1; then
    source_files=$(ag -g '')
  elif git rev-parse 2> /dev/null; then
    source_files=$(git ls-files)
  else
    source_files=$(find . -type f)
  fi
  selected_files=$(echo $source_files | peco --prompt "[find file]")

  result=''
  for file in $selected_files; do
    result="${result}$(echo $file | tr '\n' ' ')"
  done

  BUFFER="${BUFFER}${result}"
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N peco-find-file
bindkey '^xf' peco-find-file

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rm='rm -I'
alias diff="colordiff"
alias v='vim'
alias tigd='tig develop...@'
alias tigm='tig master...@'
alias vup='vagrant up --no-provision'
alias vr='vagrant reload --no-provision'
alias vh='vagrant halt'
alias vst='vagrant status'
alias vp='vagrant provision'
alias vpp='vagrant provision --provision-with puppet'
alias vd='vagrant destroy'
alias vssh='vagrant ssh'
alias vs='vagrant sandbox'
alias knl='knife node list'
alias ks='knife search -i'
alias kcu='knife cookbook upload'
alias kcd='knife cookbook download'
alias kcs='knife cookbook show'
alias kds='knife data bag show'
alias ag='ag --smart-case'
alias ssh='TERM=xterm ssh'
alias gg='ghq get'
alias gl='ghq look'
alias vimrc='vim ~/.vimrc'
alias sshconf='vim ~/.ssh/config'
# excludes ec2 because very long directory name annoy me.
# mount the directory to short named one.
# a way to mount over reboot:
# /etc/fstab
# /path/to/source/dir /path/to/mount/point none bind 0 0
alias e='cd $(ghq list -p | grep -v amazonaws.com | {peco || pwd;})'
alias bundlep='cd $(bundler_gems | {peco || pwd;})'
alias -g B='`git branch -a | grep -v HEAD | peco | sed -e "s|^\*\s*||;s|remotes/origin/||"`'
alias -g X='| xargs -I %'
alias -g H='| head'
alias -g T='| tail'
# make today's tmp dir and go there
alias taket="take ~/tmp/`date +%Y%m%d`"

# git local ignore
alias gli='git status >/dev/null && mkdir -p $(git rev-parse --show-toplevel)/.git/info && $EDITOR $(git rev-parse --show-toplevel)/.git/info/exclude'

source ~/.zshrc.local
