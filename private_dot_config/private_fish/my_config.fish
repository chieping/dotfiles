function set_abbrs
  abbr --add e 'cd (ghq list -p | peco)'
  abbr --add ls 'ls --color=auto'
  abbr --add acco 'acc task | grep -Eo https://.+ | xargs open'
  for i in "" 1 2 3 4 5
    abbr --add ojt$i "oj test -c \"python main$i.py\""
  end
  abbr --add acp asdf global python 3.11.0
  abbr --add acy asdf global python 3.11.0
  abbr --add apy asdf global python pypy3.8-7.3.7
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
  set --global tide_pwd_color_dirs        7cafc2
  set --global tide_pwd_color_anchors     7cafc2
  set --global tide_git_color_branch      a1b56c
  set --global tide_git_color_conflicted  c5c8c6
  set --global tide_git_color_dirty       c5c8c6
  set --global tide_git_color_staged      c5c8c6
  set --global tide_git_color_stash       c5c8c6
  set --global tide_git_color_untracked   c5c8c6
  set --global tide_git_color_upstream    c5c8c6
end

set_abbrs
custom_prompt
