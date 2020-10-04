export TERM=xterm-256color
export CC=gcc
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

SOURCE=${(%):-%N}
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done

export DOTFILES_DIR="$(cd -P "$( dirname "$SOURCE" )" && pwd)"
export PATH="$HOME/bin:$HOME/.pub-cache/bin:$HOME/anaconda3/bin:$DOTFILES_DIR/bin:$HOME/Library/Python/3.7/bin:/usr/local/bin:$PATH"
export EDITOR=vim
export GIT_EDITOR=vim
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

case "$OSTYPE" in
  darwin*)
    # define a variable because `brew prefix` is super slow.
    export BREW_PREFIX=/usr/local
    export HOMEBREW_ROOT=/usr/local
    export DIFF_HIGHLIGHT=/usr/local/opt/git/share/git-core/contrib/diff-highlight/diff-highlight
  ;;
  linux*)
    if [ -x /usr/share/doc/git/contrib/diff-highlight/diff-highlight ]; then
      export DIFF_HIGHLIGHT=/usr/share/doc/git/contrib/diff-highlight/diff-highlight
    elif [ -f /usr/share/doc/git/contrib/diff-highlight/Makefile ]; then
      echo "trying to make diff-highlight.."
      ( cd /usr/share/doc/git/contrib/diff-highlight && sudo make )
      export DIFF_HIGHLIGHT=/usr/share/doc/git/contrib/diff-highlight/diff-highlight
    fi
  ;;
esac
