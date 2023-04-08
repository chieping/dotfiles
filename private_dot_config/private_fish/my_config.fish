function set_abbrs
  abbr --add e 'cd (ghq list -p | peco)'
  abbr --add ls 'ls --color=auto'
  abbr --add acco 'acc task | grep -Eo https://.+ | xargs open'
  for i in "" 1 2 3 4 5
    abbr --add ojt$i oj test -c \"python main$i.py\"
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
end

set_abbrs
