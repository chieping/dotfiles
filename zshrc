setopt print_eight_bit
setopt no_flow_control
setopt nobeep

bindkey -e

# disable stop
stty stop undef

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
alias -g P='| peco'
alias c='kubectl config use-context $(kubectl config get-contexts -o=name | peco --prompt "choose k8s context to set:")'
alias b='git checkout $(git branch -a | peco | sed -e "s|^\*\s*||;s|remotes/origin/||")'
alias taket='mkdir -p ~/tmp/$(date +%Y%m%d) && cd ~/tmp/$(date +%Y%m%d)'

# git local ignore
alias gli='git status >/dev/null && mkdir -p $(git rev-parse --show-toplevel)/.git/info && $EDITOR $(git rev-parse --show-toplevel)/.git/info/exclude'
alias xpanes='xpanes -l ev'
alias show_compaudit_parmission_owner='for f in $(compaudit); do ls -l -d $f; done'
alias fix_compaudit='for f in $(compaudit); do sudo chown $(whoami):staff $f; chmod 755 $f; done'
alias tigs='tig status'
alias tigr='tig refs'


zstyle ':completion:*:default' menu select=2

if [[ $OSTYPE == *darwin* ]]; then
  PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
fi

if ! [[ $OSTYPE == *darwin* && $(which ls) =~ ^/bin/ls ]]; then
  alias ls='ls -F --color=auto'
fi
