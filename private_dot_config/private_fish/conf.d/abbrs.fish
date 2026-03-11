if not status is-interactive
    exit
end

abbr --add v nvim
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
