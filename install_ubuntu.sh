#!/bin/bash
set -e
cd

if [ -e .dotfiles ]; then
  cd .dotfiles
  git fetch && git merge --ff-only
else
  git clone https://github.com/chieping/dotfiles ~/.dotfiles
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

# direnv {{{
go get -u github.com/zimbatm/direnv
# }}}

# ghq {{{
go get -u github.com/motemen/ghq
# }}}

# dircolors {{{
ghq get seebi/dircolors-solarized
ln -s ~/src/github.com/seebi/dircolors-solarized/dircolors.256dark ~/.dircolors
# }}}
# jq

# massren {{{
go get -u github.com/laurent22/massren
# }}}

# peco {{{
go get -u github.com/peco/peco/cmd/peco
# }}}

# Fonts ( Ricty, Takao )

# IME (Mozc)

# Terminal solor scheme (http://d.hatena.ne.jp/tatanaideyo/20130122/1358872017)

# zeal( dash for Linux and Windows )

# firefox plugins ( vimperator )

# aws cli
# aws_completer
