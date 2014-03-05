autocmd BufNewFile,BufRead *.md setf markdown

" Always start on first line of git commit message - Vim Tips Wiki
" http://vim.wikia.com/wiki/Always_start_on_first_line_of_git_commit_message
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

autocmd FileType java set tabstop=4 shiftwidth=4 softtabstop=4 noet

autocmd FileType markdown set tabstop=4 shiftwidth=4 softtabstop=4

autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
