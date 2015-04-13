autocmd BufNewFile,BufRead *.md setfiletype markdown

" Always start on first line of git commit message - Vim Tips Wiki
" http://vim.wikia.com/wiki/Always_start_on_first_line_of_git_commit_message
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

autocmd FileType java set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

autocmd FileType javascript set tabstop=4 shiftwidth=2 softtabstop=2

autocmd FileType markdown set tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType sh set tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType puppet setlocal iskeyword+=:

autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 iskeyword+=@-@,!,?,$

autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux

autocmd BufNewFile,BufRead *.gradle setfiletype groovy

autocmd BufNewFile,BufRead *.mjs setfiletype javascript
