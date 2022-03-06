#!/usr/bin/env fish

function check_fisher_installed
  echo '> Check if fisher is installed'
  if type -q fisher
    echo '> fisher is already installed'
  else
    echo '> Install fisher firstly'
    echo 'https://github.com/jorgebucaran/fisher'
    exit 1
  end
end

function set_variables
  echo '> Setting variables'
  set --local fish_trace 1
  set -Ux HOMEBREW_PREFIX /opt/homebrew
end

function set_paths
  echo '> Setting paths'

  fish_add_path -mv $HOMEBREW_PREFIX/bin
  fish_add_path -mv $HOMEBREW_PREFIX/sbin
  fish_add_path -mv /usr/local/bin
  fish_add_path -mv $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
  fish_add_path -mv $HOME/bin
end

function set_abbrs
  echo '> Setting abbreviations'
  abbr --add e 'cd (ghq list -p | peco)'
  abbr --add ls 'ls --color=auto'
  abbr --add acco 'acc task | grep -Eo https://.+ | xargs open'
  for i in "" 1 2 3 4 5
    abbr --add ojt$i oj test -c \"python main$i.py\"
  end
  abbr --add acy asdf global python 3.10.2
  abbr --add apy asdf global python pypy3.8-7.3.7
end

function set_greet
  echo '> Setting greeting message'
  set --local fish_trace 1
  set -U fish_greeting
  set -U fish_prompt_pwd_dir_length 10
end

function install_plugins
  echo '> Install fisher plugins'
  fisher list jethrokuan/z || fisher install jethrokuan/z
  fisher list cafedomancer/fish-nodenv || fisher install cafedomancer/fish-nodenv
end

check_fisher_installed
set_variables
set_paths
set_abbrs
set_greet
install_plugins

echo '> Run "fish_config" to choice color (Tomorrow Night) and prompt (Informative Vcs). '
