setopt print_eight_bit
export LANG=ja_JP.UTF-8
setopt no_flow_control
setopt nobeep
export TERM=screen-256color
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export GIT_EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

fpath=($HOMEBREW_ROOT/share/zsh-completions $fpath)
fpath=($HOMEBREW_ROOT/share/zsh/functions $fpath)
fpath=($HOMEBREW_ROOT/share/zsh/site-functions $fpath)

# need to rebuild ("rm -f ~/.zcompdump; compinit"), maybe
autoload -U compinit && compinit

# oh-my-zsh tmux plugin confs
ZSH_TMUX_ITERM2=false
ZSH_TMUX_AUTOSTART=true

source /opt/boxen/env.sh

# golang settings
export GOPATH=$HOME/gocode
export PATH="$HOME/gocode/bin:$PATH"

export PATH="$(brew --prefix gnu-tar)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix gnu-sed)/libexec/gnuman:$MANPATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias diff="colordiff"
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias gvim='/Applications/MacVim.app/Contents/MacOS/mvim --remote-tab-silent'
alias v='vim'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
alias vup='vagrant up --no-provision'
alias vh='vagrant halt'
alias vst='vagrant status'
alias vp='vagrant provision'
alias vd='vagrant destroy'
alias vssh='vagrant ssh'
alias vs='vagrant sandbox'
alias ag='ag --smart-case'
alias brews='brew list -1'
alias p4merge='/Applications/p4merge.app/Contents/Resources/launchp4merge'
alias ssh='TERM=xterm ssh'
alias atom='~/Applications/Atom.app/Contents/Resources/app/atom.sh'

function google() {
  open http://google.co.jp/\#q\=`echo "$@" | nkf -wMQ | tr = %`
}
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast common-aliases bundler tmux colored-man golang brew-cask)

source $ZSH/oh-my-zsh.sh

# User configuration

[ -f `brew --prefix`/etc/profile.d/z.sh ] && source `brew --prefix`/etc/profile.d/z.sh

if [ -f ~/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors ~/.dircolors)
  fi
fi

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[' backward-word
bindkey '^]' forward-word

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

