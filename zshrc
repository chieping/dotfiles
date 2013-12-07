export LANG=ja_JP.UTF-8
setopt print_eight_bit   # 日本語ファイル名を表示可能にする
setopt no_flow_control
export TERM=xterm-256color
export EDITOR=vim
#node
source ~/.nvm/nvm.sh
nvm use "v0.10.13" > /dev/null

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
# gnubin: brew install coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

eval "$(rbenv init - zsh)"

autoload colors

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias gvim='TERM=xterm-256color /Applications/MacVim.app/Contents/MacOS/mvim'
alias be='bundle exec'

# GNU lsの色設定がなんかよくわからなかったからとりあえずBSDのlsでいいかなって
alias l='/bin/ls -Gpal'
alias ls='/bin/ls -Gp'
alias ll='/bin/ls -Gpl'
alias diff=colordiff
autoload -U compinit && compinit

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

PROMPT='%F{green}%n:%(5~,%-2~/.../%2~,%~)%f '

setopt prompt_subst
# setopt CORRECT_ALL # git-flow と cucumberで面倒なことになるから切る
setopt AUTO_CD
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

#補完リストが多いときに尋ねない
LISTMAX=1000
#ヒストリの一覧を読みやすい形に変更
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
     color=%F{red}
  fi
  echo "$color$name$action%f%b "
}

RPROMPT='`rprompt-git-current-branch`'

bindkey '^[[A' history-search-backward

# tmuxの自動起動
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi

bindkey -e

