function set_abbrs
  abbr --add e 'cd (ghq list -p | peco)'
  abbr --add ls 'ls --color=auto'
  abbr --add acco 'acc task | grep -Eo https://.+ | xargs open'
  for i in "" 1 2 3 4 5
    abbr --add ojt$i "oj test --mle 1024 -e 1e-5 -c \"python main$i.py\""
  end

  abbr --add acp asdf global python 3.11.4
  abbr --add acy asdf global python 3.11.4
  abbr --add apy asdf global python pypy3.10-7.3.12
  # git-top-level: ex) rg some_text gtl
  abbr --add gtl --position anywhere '(git rev-parse --show-toplevel)'

  function multicd
      echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
  end
  abbr --add dotdot --regex '^\.\.+$' --function multicd

  # docker compose
  abbr --add dco       docker compose
  abbr --add dcup      docker compose up
  abbr --add dcupd     docker compose up -d
  abbr --add dcdn      docker compose down
  abbr --add dcl       docker compose logs
  abbr --add dclf      docker compose logs -f
end

function custom_prompt
  set --global tide_pwd_color_dirs        c5c8c6
  set --global tide_pwd_color_anchors     c5c8c6

  set --global tide_git_color_branch      000000
  set --global tide_git_color_conflicted  000000
  set --global tide_git_color_dirty       000000
  set --global tide_git_color_staged      000000
  set --global tide_git_color_stash       000000
  set --global tide_git_color_untracked   000000
  set --global tide_git_color_upstream    000000

  set --global tide_python_icon           \ue606
  set --global tide_python_color          c5c8c6
  set --global tide_python_bg_color       444444

  set --global tide_left_prompt_items pwd python git newline character
end

function _tide_item_python
  # print item      with this name  and this icon         with this text
  _tide_print_item  python          $tide_python_icon' '  (grep ^python ~/.tool-versions | cut -d\  -f2)
end

set_abbrs
custom_prompt
