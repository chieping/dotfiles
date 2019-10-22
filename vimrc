" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
" Plug 'Shougo/vimshell'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'thinca/vim-quickrun'
if has('python3') || has('python')
  Plug 'SirVer/ultisnips'
endif
Plug 'honza/vim-snippets'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-help'
" Plug 'sorah/unite-ghq'
" Plug 'rhysd/accelerated-jk'
" Plug 'rking/ag.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'farmergreg/vim-lastplace'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
" Plug 'vim-scripts/taglist.vim'
" Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'jszakmeister/vim-togglecursor'
" Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
" Plug 'tpope/vim-dispatch'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'vim-scripts/star-search'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rsi'
Plug 'vim-scripts/matchit.zip'
Plug 'jiangmiao/auto-pairs'
" Plug 'elixir-lang/vim-elixir'
" if filereadable(".nrepl-port")
"   Plug 'tpope/vim-fireplace'
"   Plug 'SevereOverfl0w/clojure-check', {'do': './install'}
" endif
" Plug 'kovisoft/paredit', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-static'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'venantius/vim-eastwood'
" Plug 'rust-lang/rust.vim'
" Plug 'tpope/vim-classpath'
" Plug 'kovisoft/slimv'
" Plug 'udalov/kotlin-vim'
Plug 'othree/yajs.vim'
Plug 'elzr/vim-json'
Plug 'vim-ruby/vim-ruby'
Plug 'jgdavey/vim-blockle'
" Plug 'rodjek/vim-puppet'
" Plug 'mv/mv-vim-puppet'
" Plug 'dougireton/vim-chef'
" Plug 'thoughtbot/vim-rspec'
" Plug 'GEverding/vim-hocon'
" Plug 'tsaleh/vim-matchit'
" Plug 'ecomba/vim-ruby-refactoring'
" Plug 'taku-o/vim-toggle'
Plug 'kana/vim-smartword'
Plug 'kana/vim-submode'

" vim-textobj-user list
" https://github.com/kana/vim-textobj-user/wiki
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'lucapette/vim-textobj-underscore'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'tommcdo/vim-exchange'
Plug 'thinca/vim-textobj-between'
" Plug 'rhysd/vim-textobj-word-column'
" http://vimcasts.org/episodes/supercharged-substitution-with-subvert/
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'wesleyche/SrcExpl'
" Plug 'wesleyche/Trinity'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
" Plug 'chrisbra/vim-diff-enhanced'
Plug 'terryma/vim-expand-region'
" Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
" Plug 'closetag.vim'
" Plug 'szw/vim-tags'
Plug 'soramugi/auto-ctags.vim'
Plug 'kannokanno/previm'
" Plug 'rizzatti/dash.vim'
Plug 'tyru/open-browser.vim'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'glidenote/memolist.vim'
" Plug 'lambdalisue/vim-gista'
Plug 'embear/vim-localvimrc'
" Plug 'Shougo/dein.vim'
call plug#end()

filetype plugin indent on

if has('kaoriya')
  " Suppress to overwrite key mappings
  let plugin_dicwin_disable = 1
endif

set nocompatible
set hlsearch
set laststatus=2            " This helps lightline.vim visible
set expandtab
set shiftwidth=2
set softtabstop=2
set synmaxcol=480
set autoindent
set autoread
set ignorecase
set smartcase
set showcmd
set wildmenu
set scrolloff=5
set helpheight=100
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undofile
set undodir=~/.vim/undo
set cursorline
set number
set modeline
set noeb vb t_vb=           "Disable beep and flash
set ambiwidth=double        "Also need iTerm configuration(But tmux sucks...)
set backspace=2             "Make backspace work like most other apps
set whichwrap=h,l,<,>,[,]   "Keys which can stride over
set helplang=en
set list
" set shell=bash              "Workaround for zsh's awkward $PATH"
set shell=zsh               "to use zsh in :terminal
set listchars=tab:›\        "dummy comment to suppress trailing white space
set comments=:#
if exists('+colorcolumn')
  set colorcolumn=80
endif
" Get rid of comment leaders when joining lines
" Tips: to do opposite, *gq* handles very well!
set formatoptions+=j
if has('mac') || has('win32') || has('win64')
  set clipboard+=unnamed
elseif has('unix')
  set clipboard=unnamedplus
endif
" ttimeoutlen is used for key code delays. This makes esc key to respond
" immediately. http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set ttimeoutlen=0
set splitbelow splitright
" 'lazyredraw' will buffer screen updates instead of updating all the time.
" This mitigates delay of cursor movement well.
set lazyredraw
set nrformats-=octal
set completeopt=menu,menuone,preview
" https://github.com/tpope/vim-sensible/issues/51
set complete-=i

" assume Bash, roughly
let g:is_bash=1

let g:mapleader="\<Space>"

" Copy the filename including its full path
if has('mac')
  nnoremap <silent> yp :let @*=expand("%:p")<CR>:echo expand("%:p")<CR>
elseif has('unix')
  nnoremap <silent> yp :let @+=expand("%:p")<CR>:echo expand("%:p")<CR>
endif

nnoremap <Leader>p :set invpaste<CR>
set pastetoggle=<Leader>p

nnoremap U :redo<CR>

nmap <Leader>v :tabedit $MYVIMRC<CR>
nmap <Leader>R :<C-u>source $MYVIMRC<CR>

" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Yank like Tmux copy mode
vnoremap <CR> y

" use black hole register
noremap c "_c
noremap C "_C
noremap s "_s
noremap S "_S
noremap x "_x
noremap X "_X

if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif

" TODO: not to use "normal" http://vi.stackexchange.com/a/8336
function! SmartBeginningOfLine()
  let l:chars_left_side_of_cursor = getline('.')[0:col('.') - 2]
  if empty(matchstr(l:chars_left_side_of_cursor, '^\s\+$'))
    normal! ^
  else
    normal! 0
  endif
endfunction

function! SmartBeginningOfLineVisual()
  normal! gv
  call SmartBeginningOfLine()
endfunction

nnoremap <silent> 0 :<C-u>call SmartBeginningOfLine()<CR>
vnoremap <silent> 0 :<C-u>call SmartBeginningOfLineVisual()<CR>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" TODO: below line (enter key to choose candidate) doesn't work.
" https://github.com/tpope/vim-endwise/pull/16
" inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

" * and # to search selected text in visual mode
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" display candidates by default
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>

map <C-w>L <C-w>>
map <C-w>H <C-w><
map <C-w>K <C-w>-
map <C-w>J <C-w>+

nnoremap zL zR
nnoremap zl zo
nnoremap zh zc
nnoremap zH zM

cabbrev h    tab help
cabbrev t    tabnew
cabbrev fd   filetype detect
cabbrev sf   set filetype=
cabbrev ds   diffsplit
cabbrev vd   vertical diffsplit

function! ToggleWrap()
  if (&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunction

map <Leader>w :call ToggleWrap()<CR>

function! NumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>n :call NumberToggle()<cr>

" vim-quickrun
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {
  \ 'command': 'rspec',
  \ 'cmdopt': '--no-color',
  \ 'exec': '%c %o %s:%{line(".")} %a'
  \ }

function! QuickrunSetArgs(args)
  if ! has_key(g:quickrun_config, &filetype)
    let g:quickrun_config[&filetype] = {}
  endif
  let g:quickrun_config[&filetype]['args'] = a:args
endfunction

command! -nargs=1 QuickrunSetArgs call QuickrunSetArgs('<args>')

" vim-smartword
map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge <Plug>(smartword-ge)

" vim-diff-enhanced
" diff algorithm
" 'histogram' algorithm is fast version of patience algorithm
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'

" vim-ruby
augroup RubyRspec
  autocmd!
  autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
augroup END

" ultisnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['UltiSnips', '~/.vim/UltiSnips']
let g:snips_github="https://github.com/chieping"
let g:snips_author="chieping"
let g:snips_email="takashi.honda.01@gmail.com"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" vim-localvimrc
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" vim-json
let g:vim_json_syntax_conceal = 0

" default brace color(red) is not very good
highlight link jsonBraces Function

" vim-operator-replace
map r <Plug>(operator-replace)

" vim-table-mode
let g:table_mode_corner = '|'

" switch.vim
nnoremap - :Switch<CR>

let g:switch_custom_definitions = [
  \   {
  \     '"\(\k\+\%([?!]\)\=\)"':                '''\1''',
  \     '''\(\k\+\%([?!]\)\=\)''':              ':\1',
  \     ':\(\k\+\%([?!]\)\=\)\@>\%(\s*=>\)\@!': '"\1"\2',
  \   },
  \   {
  \     '\[ \]': '\[x\]',
  \     '\[x\]': '\[ \]'
  \   },
  \   {
  \     '`\([^`]\+\)`': '\$(\1)',
  \     '\$(\([^)]\+\))': '`\1`'
  \   },
  \ ]

autocmd FileType diff call add(g:switch_custom_definitions, {
  \ '^ \(.*\)': '-\1',
  \ '^-\(.*\)': ' \1'
  \ })

" vim-multiple-cursors
let g:multi_cursor_next_key='<C-d>'  " default mapping <C-n> is reserved

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" previm
let g:previm_show_header = 0

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" nerdtree
nmap <Leader>f :NERDTreeToggle<CR>
nmap <Leader>s :NERDTreeFind<CR>

let NERDTreeMinimalUI=1

" Disable NERDTree's mappings
let g:NERDTreeMapJumpNextSibling = ''   " C-j
let g:NERDTreeMapJumpPrevSibling = ''   " C-k
let g:NERDTreeMapToggleFilters = ''     " f
let g:NERDTreeMapToggleFiles = ''       " F
let g:NERDTreeMapCWD = ''               " CD

" this makes possible to use unite in nerdtree window
autocmd FileType nerdtree nnoremap <buffer> <silent> mg  :wincmd w<CR>:<C-u>Unite
        \ grep:. -buffer-name=search-buffer<CR>

" vim-fugitive
nnoremap gst :<C-u>Gstatus<CR>
nnoremap gb  :<C-u>Gblame<CR>
nnoremap gl  :<C-u>Glog \| cwindow<CR>
nnoremap gdi :<C-u>Gdiff<CR>
nnoremap gdd :<C-u>Gdiff develop..@<CR>
nnoremap gdm :<C-u>Gdiff master..@<CR>
nnoremap gdp :<C-u>Gdiff HEAD@{1}<CR>

vnoremap gb :<C-u>'<,'>Gblame<CR>
vnoremap gl :<C-u>'<,'>Glog \| cwindow<CR>

function! GdiffAutoDetectSourceBranch(...)
  let l:default_source_branch = 'master'
  if a:1 == ''
    let l:source_branch = l:default_source_branch
  else
    let l:source_branch = a:1
  endif
  let l:diff_against = substitute(system('git merge-base ' . l:source_branch . ' HEAD'), '\n', '', '')
  echom 'diff against: ' . l:diff_against
  execute 'Gdiff' l:diff_against
endfunction

command! -nargs=? GdiffAutoDetectSourceBranch call GdiffAutoDetectSourceBranch('<f-args>')

" tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a\| :Tabularize /\|<CR>
vmap <Leader>a\| :Tabularize /\|<CR>
nmap <Leader>a: :Tabularize /^[^:]*\w:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /^[^:]*\w:\zs/l0l1<CR>
nmap <Leader>as :Tabularize /:\w\+,\?<CR>
vmap <Leader>as :Tabularize /:\w\+,\?<CR>

" unite.vim
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    m [unite]

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.my = {
        \   'description': 'my menu',
        \ }

function! ToggleIwhite()
  if (&diffopt =~ 'iwhite')
    set diffopt-=iwhite
  elseif (&diffopt !~ 'iwhite')
    set diffopt+=iwhite
  endif
endfunction

let g:unite_source_menu_menus.my.command_candidates = {
        \   'remove extra whitespaces': '%s/\s\+$//g',
        \   'remove empty lines': '%g/^\s*$/d',
        \   'force write': 'w !sudo tee %',
        \   'toggle ignore whitespace in diff': 'call ToggleIwhite()',
        \   'make this file excutable': '!chmod +x %:p',
        \ }

let g:unite_source_alias_aliases = {
        \   'messages' : {
        \     'source': 'output',
        \     'args': 'message',
        \   },
        \ }
call unite#custom#source('messages', 'sorters', 'sorter_reverse')

nnoremap <silent> [unite]p  :<C-u>Unite file_rec/async<CR>
nnoremap <silent> [unite]P  :<C-u>new<CR>:<C-u>Unite file_rec/async<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
        \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
        \ -buffer-name=register register<CR>
" outline
nnoremap <silent> [unite]o  :<C-u>Unite
        \ -vertical -winwidth=61 -direction=botright -no-focus -toggle -no-quit -no-start-insert outline<CR>
" grep
nnoremap <silent> [unite]g  :<C-u>Unite
        \ grep:. -buffer-name=search-buffer<CR>
" file_mru
nnoremap <silent> [unite]u  :<C-u>Unite
        \ file_mru<CR>
" diff
nnoremap <silent> [unite]d  :<C-u>Unite
        \ file_rec/async -default-action=diff<CR>
" unite-help
nnoremap <silent> [unite]h  :<C-u>Unite
        \ help -default-action=tabopen<CR>
" set
nnoremap <silent> [unite]c  :<C-u>Unite
        \ output:set\ all<CR>
" variables:all
nnoremap <silent> [unite]va  :<C-u>Unite
        \ output:let<CR>
nnoremap <silent> [unite]vg  :<C-u>Unite
        \ output:let\ g\:<CR>
nnoremap <silent> [unite]vb  :<C-u>Unite
        \ output:let\ b\:<CR>
nnoremap <silent> [unite]vw  :<C-u>Unite
        \ output:let\ w\:<CR>
nnoremap <silent> [unite]vt  :<C-u>Unite
        \ output:let\ t\:<CR>
nnoremap <silent> [unite]vs  :<C-u>Unite
        \ output:let\ s\:<CR>
nnoremap <silent> [unite]vl  :<C-u>Unite
        \ output:let\ l\:<CR>
nnoremap <silent> [unite]vv  :<C-u>Unite
        \ output:let\ v\:<CR>
nnoremap <silent> [unite]ma :<C-u>Unite
        \ mapping<CR>
nnoremap <silent> [unite]me :<C-u>Unite
        \ messages<CR>
" snippets
nnoremap <silent> [unite]s :<C-u>Unite
        \ ultisnips<CR>

nnoremap <silent> [unite]my :<C-u>Unite menu:my<CR>

" See FAQ - Unite does not respect 'splitright' option
call unite#custom#profile('default', 'context', {
        \   'prompt_direction': 'top'
        \ })

" Start insert.
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

" To track long mru history.
let g:neomru#file_mru_limit = 3000
let g:neomru#directory_mru_limit = 3000

" Like ctrlp.vim settings.
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

" Prompt choices.
let g:unite_prompt = '>>> '

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> kk      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
          \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-p>     <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  nnoremap <silent><buffer><expr> l
          \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <silent><buffer><expr> o      unite#do_action('persist_open')
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ?
          \ ['sorter_reverse'] : [])

  " Runs 'split' action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')

  nmap <buffer> <C-h> <C-w>h
  nmap <buffer> <C-l> <C-w>l
  nmap <buffer> <C-k> <C-w>k
  nmap <buffer> <C-j> <C-w>j
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--column --smart-case --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
endif

" Open by NerdTree
let nerdtree = { 'is_selectable' : 1 }
function! nerdtree.func(candidate)
  execute "lcd" a:candidate[0].word
  execute "NERDTree" a:candidate[0].word
endfunction
call unite#custom#action('directory', 'nerdtree', nerdtree)

let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit = 100

" Emphasize cursorline on unite buffer
autocmd BufEnter,BufWinEnter \[unite\]* highlight! link CursorLine PmenuSel
autocmd BufLeave \[unite\]* highlight! link CursorLine NONE

" vim-surround
" erb
" 61: '='
autocmd FileType eruby let g:surround_61 = "<%= \r %>"

" vim-expand-region
let g:expand_region_text_objects_ruby = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'im'  :0,
      \ 'am'  :0,
      \ 'ie'  :0,
      \ }

" vim-submode
let g:submode_timeout=0

call submode#enter_with('winsize', 'n', '', '<C-w>L', '<C-w>3>')
call submode#enter_with('winsize', 'n', '', '<C-w>H', '<C-w>3<')
call submode#enter_with('winsize', 'n', '', '<C-w>K', '<C-w>3-')
call submode#enter_with('winsize', 'n', '', '<C-w>J', '<C-w>3+')
call submode#map('winsize', 'n', '', 'L', '<C-w>3>')
call submode#map('winsize', 'n', '', 'H', '<C-w>3<')
call submode#map('winsize', 'n', '', 'K', '<C-w>3-')
call submode#map('winsize', 'n', '', 'J', '<C-w>3+')

call submode#enter_with('next-win', 'n', '', '<C-w>w',     '<C-w>w')
call submode#enter_with('next-win', 'n', '', '<C-w><C-w>', '<C-w>w')
call submode#enter_with('next-win', 'n', '', '<C-w>W',     '<C-w>W')
call submode#map('next-win', 'n', '', 'w',     '<C-w>w')
call submode#map('next-win', 'n', '', '<C-w>', '<C-w>w')
call submode#map('next-win', 'n', '', 'W',     '<C-w>W')

" increment/decrement number
call submode#enter_with('inc_dec', 'n', '', '<C-x>')
call submode#map('inc_dec', 'n', '', 'a', '<C-a>')
call submode#map('inc_dec', 'n', '', 'x', '<C-x>')
call submode#map('inc_dec', 'n', '', '<C-a>', '<C-a>')
call submode#map('inc_dec', 'n', '', '<C-x>', '<C-x>')

" vim-gitgutter
call submode#enter_with('gitgutter', 'n', '', '<Leader>g')
call submode#map('gitgutter', 'n', 'r', 'j', ':<C-u>GitGutterNextHunk<CR>')
call submode#map('gitgutter', 'n', 'r', 'k', ':<C-u>GitGutterPrevHunk<CR>')
call submode#map('gitgutter', 'n', 'r', 'gg', 'gg:<C-u>GitGutterNextHunk<CR>')
call submode#map('gitgutter', 'n', 'r', 'G', 'G:<C-u>GitGutterPrevHunk<CR>')

function! GGdiffAutoDetectSourceBranch(...)
  let l:default_source_branch = 'master'
  if a:1 == ''
    let l:source_branch = l:default_source_branch
  else
    let l:source_branch = a:1
  endif
  let l:diff_against = substitute(system('git merge-base ' . l:source_branch . ' HEAD'), '\n', '', '')
  echom 'diff against: ' . l:diff_against
  let g:gitgutter_diff_base = l:diff_against
  GitGutter
endfunction

function! GGdiff(diff_against)
  let g:gitgutter_diff_base = a:diff_against
  GitGutter
endfunction

command! -nargs=1 GGdiff call GGdiff('<f-args>')
command! GGdiffHead call GGdiff('HEAD^')
command! -nargs=? GGdiffAutoDetectSourceBranch call GGdiffAutoDetectSourceBranch('<f-args>')

" ale

let g:ale_sign_column_always = 1
call submode#enter_with('ale', 'n', '', '<Leader>l')
call submode#map('ale', 'n', 'r', 'j', ':<C-u>ALENext<CR>')
call submode#map('ale', 'n', 'r', 'k', ':<C-u>ALEPrevious<CR>')
call submode#map('ale', 'n', 'r', 'gg', 'gg:<C-u>ALENext<CR>')
call submode#map('ale', 'n', 'r', 'G', 'G:<C-u>ALEPrevious<CR>')

" auto-ctags.vim
if has('mac')
  " Use homebrew's ctags instead of kaoriya bundled one
  let g:auto_ctags_bin_path = $HOMEBREW_ROOT . '/bin/ctags'
endif

if expand("%:p") =~ "/src/"
  let g:auto_ctags = 1
endif

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'Tomorrow_Night',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[RO]' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%') ? expand('%') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

syntax enable

" base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
  colorscheme base16-tomorrow-night
endif

set background=dark

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

if get(g:, 'colors_name', 'default') == 'base16-tomorrow-night'
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  guibg=#1d1f21 ctermbg=0
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=#282a2e ctermbg=18
elseif get(g:, 'colors_name', 'default') == 'solarized'
  let g:indent_guides_auto_colors = 0
  if &background == 'light'
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  guibg=#ffffd7 ctermbg=230
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=#e4e4e4 ctermbg=254
  else
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  guibg=#1c1c1c ctermbg=234
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=#585858 ctermbg=240
  endif
endif

" highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
" highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
" highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
" highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
