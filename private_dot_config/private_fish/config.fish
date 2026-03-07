/opt/homebrew/bin/brew shellenv | source
fish_add_path -g ~/.local/bin

if status is-interactive
  # Commands to run in interactive sessions can go here
  # source /opt/homebrew/opt/asdf/libexec/asdf.fish

  # fzf のシェル統合（**<Tab> fuzzy completion と Ctrl+R/T/Alt+C キーバインド）
  fzf --fish | source

  # ASDF configuration code
  if test -z $ASDF_DATA_DIR
      set _asdf_shims "$HOME/.asdf/shims"
  else
      set _asdf_shims "$ASDF_DATA_DIR/shims"
  end

  # Do not use fish_add_path (added in Fish 3.2) because it
  # potentially changes the order of items in PATH
  # if not contains $_asdf_shims $PATH
      set -gx --prepend PATH $_asdf_shims
  # end
  set --erase _asdf_shims

  function ghq_cd
    # ghq リポジトリを fzf で選択して cd する
    # fzf をキャンセルした場合（空文字）は cd しない
    set dir (ghq list -p | fzf)
    test -n "$dir"; and cd $dir
  end

  function set_abbrs
    abbr --add e ghq_cd
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

    set --global tide_left_prompt_items pwd git newline character
  end

  function _tide_item_python
    # print item      with this name  and this icon         with this text
    _tide_print_item  python          $tide_python_icon' '  (grep ^python ~/.tool-versions | cut -d\  -f2)
  end

  set_abbrs
  custom_prompt
  functions -q load_env_vars && load_env_vars
end

set -x ASDF_GOLANG_MOD_VERSION_ENABLED true

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
