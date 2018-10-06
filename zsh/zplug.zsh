zplug "peco/peco", as:command, from:gh-r
zplug "clvv/fasd", as:command, use:fasd
zplug "superbrothers/zsh-kubectl-prompt"
zplug "zsh-users/zsh-history-substring-search", use:"zsh-history-substring-search.plugin.zsh"
zplug "zsh-users/zsh-syntax-highlighting", use:"zsh-syntax-highlighting.plugin.zsh"
zplug "plugins/git-prompt", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/rbenv", from:oh-my-zsh
# zplug "plugins/tmux", from:oh-my-zsh  # Disable temporarily for startup time
zplug "plugins/fasd", from:oh-my-zsh
zplug "~/.zsh", from:local, as:theme, use:gallois.zsh-theme
zplug "~/.zsh", from:local, use:history.zsh
zplug "~/.zsh", from:local, use:edit-command-line.zsh
zplug "chriskempson/base16-shell", use:base16-shell.plugin.zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
