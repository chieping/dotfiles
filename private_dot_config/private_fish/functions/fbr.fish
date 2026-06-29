function fbr --description "Switch git branch with fzf (recent first)"
    set -l current (git symbolic-ref --short HEAD 2>/dev/null)

    # reflogから最近checkoutしたブランチを順に取得 → dedup → 現在のブランチを除外
    set -l recent (git reflog --pretty=%gs \
        | string match -r '^checkout: moving from \S+ to (\S+)$' --groups-only \
        | awk '!seen[$0]++' \
        | string match -v -- $current)

    # 全ローカルブランチから recent に含まれないものを後ろにくっつける
    set -l all (git for-each-ref --format='%(refname:short)' refs/heads/ \
        | string match -v -- $current)
    set -l rest (printf '%s\n' $all | awk 'NR==FNR{seen[$0]=1; next} !seen[$0]' \
        (printf '%s\n' $recent | psub) -)

    set -l branch (printf '%s\n' $recent $rest | fzf --height=40% --reverse --no-sort \
        --preview 'git log --oneline --decorate --color=always -20 {}')

    if test -n "$branch"
        git switch $branch
    end
end
