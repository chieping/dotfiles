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

source ~/.zshrc.local
