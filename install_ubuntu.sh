#!/bin/bash
set -e

if [ ! -e ~/.dotfiles ]; then
  git clone https://github.com/chieping/dotfiles ~/.dotfiles
fi

cd ~/.dotfiles

script/clone-repos
script/link

if go version >/dev/null 2>&1 ; then
  script/go-get
else
  echo 'Note: go-get has skipped.'
  echo '  Do script/go-get after golang setting.'
fi

# This script is WIP

# Vim
##   ctags install

# go
# tig
# tmux
# ag
# xclip or xsel (tmux-yank)

# rainbarf

# jq

# Fonts ( Ricty, Takao )

# IME (Mozc)

# Terminal solor scheme (http://d.hatena.ne.jp/tatanaideyo/20130122/1358872017)

# zeal( dash for Linux and Windows )

# firefox plugins ( vimperator )

# aws cli
# aws_completer
