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

# Symlinks
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/ctags ~/.ctags
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gitignore ~/.gitignore
ln -sf ~/.dotfiles/gvimrc ~/.gvimrc
ln -sf ~/.dotfiles/irbrc ~/.irbrc
ln -sf ~/.dotfiles/pryrc ~/.pryrc
ln -sf ~/.dotfiles/rubocop.yml ~/.rubocop.yml
ln -sf ~/.dotfiles/tigrc ~/.tigrc
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vimperatorrc ~/.vimperatorrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/zshrc.darwin ~/.zshrc.darwin
ln -sf ~/.dotfiles/zshrc.linux ~/.zshrc.linux

mkdir -p ~/.atom
ln -sf ~/.dotfiles/atom/config.cson ~/.atom/config.cson
ln -sf ~/.dotfiles/atom/init.coffee ~/.atom/init.coffee
ln -sf ~/.dotfiles/atom/keymap.cson ~/.atom/keymap.cson
ln -sf ~/.dotfiles/atom/snippets.cson ~/.atom/snippets.cson
ln -sf ~/.dotfiles/atom/styles.less ~/.atom/styles.less

mkdir -p ~/.rbenv
ln -sf ~/.dotfiles/rbenv/default-gems ~/.rbenv/default-gems

mkdir -p ~/.vim
ln -sf ~/.dotfiles/vim/filetype.vim ~/.vim/filetype.vim

mkdir -p ~/.git_templates/hooks
ln -sf ~/.dotfiles/git_templates/hooks/pre-commit ~/.git_templates/hooks/pre-commit

mkdir -p ~/.vim/{backups,swaps,undo}

mkdir -p ~/bin


# Vim
#   neobundle install
##   ctags install

# go
# tig
# tmux
# tmux package manager
# tmux color scheme ( tmux-colors-solarized )
# ag
# xclip or xsel (tmux-yank)


# oh-my-zsh
# oh-my-zsh custom plugins ( zsh-syntax-highlighting k )


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

# rbenv {{{
ghq get sstephenson/rbenv
ln -s ~/src/github.com/sstephenson/rbenv ~/.rbenv
# }}}

# rbenv plugins ( ruby-build default-gems )

# Fonts ( Ricty )

# IME (Mozc)

# Terminal solor scheme (http://d.hatena.ne.jp/tatanaideyo/20130122/1358872017)

# zeal( dash for Linux and Windows )

# firefox plugins ( vimperator )

# vimperator plugins {{{
mkdir -p ~/.vimperator/plugin
ghq get vimpr/vimperator-plugins
ln -sf ~/src/github.com/vimpr/vimperator-plugins/plugin_loader.js ~/.vimperator/plugin/plugin_loader.js
# }}}

# aws cli
# aws_completer
