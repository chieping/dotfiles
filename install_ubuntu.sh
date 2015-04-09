#!/bin/bash
set -e

# This script is WIP

# Symlinks
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/ctags ~/.ctags
ln -sf ~/.dotfiles/git_templates ~/.git_templates
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


mkdir -p ~/.vim/{backups,swaps,undo}

# Vim
#   neobundle install
#   ctags install

# go
# tig
# tmux
# tmux package manager
# tmux color scheme ( tmux-colors-solarized )
# xclip or xsel (tmux-yank)

# oh-my-zsh
# oh-my-zsh custom plugins ( zsh-syntax-highlighting k )

# dircolors

# rainbarf
# direnv
# ghq
# jq
# massren
# peco

# rbenv
# rbenv plugins ( ruby-build default-gems )

# Fonts ( Ricty )

# IME (Mozc)

# Terminal solor scheme (http://d.hatena.ne.jp/tatanaideyo/20130122/1358872017)

# zeal( dash for Linux and Windows )

# firefox plugins ( vimperator )
# vimperator plugins

# aws cli
# aws_completer
