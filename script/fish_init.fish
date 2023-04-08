#!/usr/bin/env fish
# set fish_trace 1

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

function set_greet
  echo '> Setting greeting message'
  set --local fish_trace 1
  set -U fish_greeting
  set -U fish_prompt_pwd_dir_length 10
end

function install_plugins
  echo '> Install fisher plugins'
  fisher list jethrokuan/z || fisher install jethrokuan/z
  fisher list ilancosman/tide@v5 || fisher install IlanCosman/tide@v5
  fisher list jomik/fish-gruvbox || fisher install jomik/fish-gruvbox
end

function tide_custom
  echo '> Customize tide'

  function _tide_item_python
    # print item       with this name  and this icon          with this text
    _tide_print_item   python          $tide_python_icon' '   (grep ^python ~/.tool-versions | cut -d\  -f2)
  end
  funcsave _tide_item_python # Save it to ~/.config/fish/functions

  set -U tide_python_icon ''
  set -U tide_python_color black
  set -U tide_python_bg_color cyan
  set -U tide_left_prompt_items pwd python git newline character
end

check_fisher_installed
set_variables
set_greet
install_plugins
tide_custom

echo '> Run "fish_config" to choice color (Tomorrow Night) and prompt (Informative Vcs). '
