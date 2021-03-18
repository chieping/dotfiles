eval $(brew shellenv)
if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
