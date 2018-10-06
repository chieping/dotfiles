setopt print_eight_bit
setopt no_flow_control
setopt nobeep

bindkey -e

# disable stop
stty stop undef

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

# delete characters just left side of the cursor.
bindkey '^U' backward-kill-line

if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh
  source ~/.zsh/zplug.zsh
else
  echo "cannot find zplug. run following command." >&2
  echo "curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh" >&2
fi

alias gg='ghq get'
alias vimrc='vim ~/.vimrc'
alias zshrc='$EDITOR ~/.zshrc*'
alias sshconf='vim ~/.ssh/config'
alias e='cd $(ghq list -p | {peco || pwd;})'
alias ev='cd $(find ~/.vim/plugged -maxdepth 1 -type d | {peco || pwd;})'
alias -g B='`git branch -a | grep -v HEAD | peco | sed -e "s|^\*\s*||;s|remotes/origin/||"`'
alias -g X='| xargs -I %'
alias -g FG='| grep -F'
alias -g PG='| grep -P'
alias -g P='"`!!`"'
alias c='kubectl config use-context $(kubectl config get-contexts -o=name | peco --prompt "choose k8s context to set:")'
# make today's tmp dir and go there
alias taket="take ~/tmp/`date +%Y%m%d`"

# git local ignore
alias gli='git status >/dev/null && mkdir -p $(git rev-parse --show-toplevel)/.git/info && $EDITOR $(git rev-parse --show-toplevel)/.git/info/exclude'
alias xpanes='xpanes -l ev'

# https://github.com/moul/advanced-ssh-config
if type assh > /dev/null 2>&1; then
  alias ssh="assh wrapper ssh"
fi

alias setxkbmaphonda='setxkbmap -device $(xinput --list --id-only "Topre Corporation HHKB Professional") -layout us -model hhk'
alias ls='ls -F --color=auto'

if type kubectl >/dev/null; then
  source <(kubectl completion zsh)
fi

if type minikube >/dev/null; then
  source <(minikube completion zsh)
fi

zstyle ':completion:*:default' menu select=2

if [ $(uname) = Darwin ]; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
