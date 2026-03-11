/opt/homebrew/bin/brew shellenv | source
fish_add_path -g ~/.local/bin

if status is-interactive
  # Commands to run in interactive sessions can go here
  # source /opt/homebrew/opt/asdf/libexec/asdf.fish

  # fzf のシェル統合（Shift+Tab fuzzy completion と Ctrl+R/Alt+C キーバインド）
  # Ctrl+T はtmuxのprefixと競合するため無効化
  set -x FZF_CTRL_T_COMMAND ""
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

  custom_prompt
  functions -q load_env_vars && load_env_vars
end

set -x ASDF_GOLANG_MOD_VERSION_ENABLED true

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
