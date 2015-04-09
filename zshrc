setopt print_eight_bit
export LANG=ja_JP.UTF-8
setopt no_flow_control
setopt nobeep
export TERM=screen-256color
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export GIT_EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export CC=gcc

case ${OSTYPE} in
  darwin*)
    source ~/.zshrc.darwin
    ;;
  linux*)
    source ~/.zshrc.linux
    ;;
esac

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
alias ag='ag --smart-case'
alias ssh='TERM=xterm ssh'
alias gg='ghq get'
alias gl='ghq look'
alias vimrc='vim ~/.vimrc'
alias sshconf='vim ~/.ssh/config'
alias e='cd $(ghq list -p | peco)'
alias bundlep='cd $(bundler_gems | peco)'
alias b='git checkout $(git branch -a | peco | sed -e "s|^\*\s*||;s|remotes/origin/||")'
alias -g P='| peco'
alias -g C='| pbcopy'

source ~/.zshrc.local
