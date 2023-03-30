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
  fish_add_path -mv $HOME/.cargo/bin
end

function set_abbrs
  echo '> Setting abbreviations'
  abbr --add e 'cd (ghq list -p | peco)'
  abbr --add ls 'ls --color=auto'
  abbr --add acco 'acc task | grep -Eo https://.+ | xargs open'
  for i in "" 1 2 3 4 5
    abbr --add ojt$i oj test -c \"python main$i.py\"
  end
  abbr --add acp asdf global python 3.11.0
  abbr --add acy asdf global python 3.11.0
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
  fisher list IlanCosman/tide@v5 || fisher install IlanCosman/tide@v5
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
set_paths
set_abbrs
set_greet
install_plugins
tide_custom

echo '> Run "fish_config" to choice color (Tomorrow Night) and prompt (Informative Vcs). '
