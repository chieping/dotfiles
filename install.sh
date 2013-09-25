#!/bin/zsh -e
current=$(cd $(dirname $0) && pwd)
home_dir=${1:-$HOME}
dotfiles=(zshrc zprofile gitconfig ssh vimrc)

function github() {
  local slug=$1
  local target=$2
  if [[ ! -d $target ]]; then
    git clone https://github.com/$slug.git $target >/dev/null 2>&1
    echo "$slug cloned into $target."
  fi
}

function md() {
  if [[ -d  $1 ]]; then
    mkdir -p $1
    echo "directory $1 created."
  fi
}

function install() {
  local src=$1
  local dest=${2:-$home_dir}
  md $(dirname $dest)
  if [[ -e $dest ]]; then
    echo "$src is already installed."
  else
    ln -s $src $dest
    echo "$src installed."
  fi
}

install $current/bin $home_dir
github robbyrussell/oh-my-zsh $home_dir/.oh-my-zsh
for dotfile ($dotfiles); do
  install $current/$dotfile $home_dir/.$dotfile
done
