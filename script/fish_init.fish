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
  fish_add_path -v $HOMEBREW_PREFIX/bin
  fish_add_path -v /usr/local/bin
  fish_add_path -v $HOME/bin
end

function set_abbrs
  echo '> Setting abbreviations'
  abbr --add e 'cd (ghq list -p | peco)'
end

function set_greet
  echo '> Setting greeting message'
  set --local fish_trace 1
  set -U fish_greeting
end

function install_plugins
  echo '> Install fisher plugins'
  fisher list jethrokuan/z || fisher install jethrokuan/z
end

check_fisher_installed
set_variables
set_paths
set_abbrs
set_greet
install_plugins

echo '> Run "fish_config" to choice color (Tomorrow Night) and prompt (Informative Vcs). '
