if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'SirVer/ultisnips', {
    \ 'disabled' : !has('python')
    \ }
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-help'
" NeoBundle 'sorah/unite-ghq'
" NeoBundle 'rhysd/accelerated-jk'
" NeoBundle 'rking/ag.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
" NeoBundle 'Yggdroot/indentLine'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'vim-scripts/taglist.vim'
" NeoBundle 'majutsushi/tagbar'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'jszakmeister/vim-togglecursor'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'tpope/vim-dispatch'
" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'justinmk/vim-sneak'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'matchit.zip'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'elzr/vim-json'
NeoBundle 'vim-ruby/vim-ruby'
" NeoBundle 'rodjek/vim-puppet'
NeoBundle 'mv/mv-vim-puppet'
NeoBundle 'dougireton/vim-chef' " notice: this line must be below of vim-ruby
" NeoBundle 'thoughtbot/vim-rspec'
" NeoBundle 'tsaleh/vim-matchit'
" NeoBundle 'ecomba/vim-ruby-refactoring'
" NeoBundle 'taku-o/vim-toggle'
NeoBundle 'kana/vim-smartword'
NeoBundle 'kana/vim-submode'

" vim-textobj-user list
" https://github.com/kana/vim-textobj-user/wiki
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'thinca/vim-textobj-between'
" NeoBundle 'rhysd/vim-textobj-word-column' " forked from coderifous
" http://vimcasts.org/episodes/supercharged-substitution-with-subvert/
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
" NeoBundle 'wesleyche/SrcExpl'
" NeoBundle 'wesleyche/Trinity'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'mhinz/vim-signify'
" NeoBundle 'closetag.vim'
" NeoBundle 'szw/vim-tags'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'kannokanno/previm'
" NeoBundle 'rizzatti/dash.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'dhruvasagar/vim-table-mode'
" NeoBundle 'glidenote/memolist.vim'
" NeoBundle 'lambdalisue/vim-gista'
NeoBundle 'embear/vim-localvimrc'

call neobundle#end()

filetype plugin indent on

if has('kaoriya')
  " Suppress to overwrite key mappings
  let plugin_dicwin_disable = 1
endif

set hlsearch
set laststatus=2            " This helps lightline.vim visible
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set ignorecase
set smartcase
set showcmd
set wildmenu
set scrolloff=100
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
set shell=bash              "Workaround for zsh's awkward $PATH"
set listchars=tab:›\        "dummy comment to suppress trailing white space
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
if has("patch-7.4.775")
  set completeopt=menu,menuone,preview,noselect
endif

let g:mapleader=","

" Copy the filename including its full path
if has('mac')
  nnoremap yp :let @*=expand("%:p")<CR>
elseif has('unix')
  nnoremap yp :let @+=expand("%:p")<CR>
endif

nnoremap <Leader>p :set invpaste<CR>
set pastetoggle=<Leader>p

nnoremap U :redo<CR>

nmap <Leader>v :tabedit $MYVIMRC<CR>
nmap <Leader>R :<C-u>source $MYVIMRC<CR>

nnoremap ; :
vnoremap ; :

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

inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-^> <Esc>^i
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

nnoremap <C-e> <End>
nnoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-d> <Delete>

inoremap <C-d> <Delete>
inoremap <C-h> <BS>

inoremap <C-k> <Esc>ld$a
inoremap <C-u> <Esc>ld0i

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" display candidates by default
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>

map <C-w>L <C-w>>
map <C-w>H <C-w><
map <C-w>K <C-w>-
map <C-w>J <C-w>+

cabbrev h    tab help
cabbrev t    tabnew
cabbrev bu   NeoBundleUpdate
cabbrev bul  NeoBundleUpdatesLog
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

" plugin config sample
"
" if neobundle#tap('{plugin}')
"   call neobundle#config({
"     \ 'lazy' : 1,
"     \ 'autoload' : {
"     \   'insert' : 1,
"     \ }})
"
"   function! neobundle#hooks.on_source(bundle)
"     " Settings, Init, ...
"     " Timing of adding rtp
"     " Like vimrc time
"     let g:foo#bar = 1
"     let g:foo#path = a:bundle.path
"     call foo#baz()
"   endfunction
"
"   function! neobundle#hooks.on_post_source(bundle)
"     " Settings, Init, ...
"     " Timing of after source plugin files
"     " Like VimEnter time
"     let g:foo#bar = 3
"     call foo#bazbaz()
"   endfunction
"
"   " Define plugin mappings, commands, ...
"   map f <Plug>(foo)
"   command! FOO call foo#foo()
"
"   call neobundle#untap()
" endif

if neobundle#tap('vimproc.vim')
  call neobundle#config({
    \ 'build' : {
    \   'mac' : 'make -f make_mac.mak',
    \   'linux' : 'make'
    \ }})

  call neobundle#untap()
endif

if neobundle#tap('vim-smartword')
  map w  <Plug>(smartword-w)
  map b  <Plug>(smartword-b)
  map e  <Plug>(smartword-e)
  map ge <Plug>(smartword-ge)

  call neobundle#untap()
endif

if neobundle#tap('ultisnips')
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetDirectories=['UltiSnips', '~/.vim/UltiSnips']
  let g:snips_github="https://github.com/chieping"
  let g:snips_author="chieping"
  let g:snips_email="takashi.honda.01@gmail.com"

  call neobundle#untap()
endif

if neobundle#tap('vim-localvimrc')
  let g:localvimrc_ask=0
  let g:localvimrc_sandbox=0

  call neobundle#untap()
endif

if neobundle#tap('vim-json')
  let g:vim_json_syntax_conceal = 0

  " default brace color(red) is not very good
  highlight link jsonBraces Function

  call neobundle#untap()
endif

if neobundle#tap('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 1

  if ! has('gui_running')
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  guibg=#1c1c1c ctermbg=0
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=#585858 ctermbg=8
  endif

  call neobundle#untap()
endif

if neobundle#tap('syntastic')
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_puppet_puppetlint_args = "--no-80chars-check"
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
  let g:syntastic_check_on_wq = 0
  let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'passive_filetypes': ['chef'] }

  call neobundle#untap()
endif

if neobundle#tap('vim-operator-replace')
  map r <Plug>(operator-replace)

  call neobundle#untap()
endif

if neobundle#tap('vim-table-mode')
  let g:table_mode_corner = '|'

  call neobundle#untap()
endif

if neobundle#tap('switch.vim')
  nnoremap - :Switch<CR>

  let g:switch_custom_definitions = [
    \   {
    \     '''\([^'']\+\)''': '"\1"',
    \     '"\([^"]\+\)"': '''\1'''
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
    \ '^ ': '-',
    \ '^-': ' '
    \ })

  call neobundle#untap()
endif

if neobundle#tap('vim-multiple-cursors')
  let g:multi_cursor_next_key='<C-d>'  " default mapping <C-n> is reserved

  call neobundle#untap()
endif

if neobundle#tap('open-browser.vim')
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)

  call neobundle#untap()
endif

if neobundle#tap('previm')
  let g:previm_show_header = 0

  call neobundle#untap()
endif

if neobundle#tap('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  call neobundle#untap()
endif

if neobundle#tap('nerdtree')
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

  call neobundle#untap()
endif

if neobundle#tap('vim-fugitive')
  vnoremap gl :<C-u>'<,'>Glog \| cwindow<CR>
  vnoremap gb :<C-u>'<,'>Gblame<CR>
  nnoremap gs :<C-u>Gstatus<CR>
  nnoremap gl :<C-u>Glog \| cwindow<CR>

  nnoremap gdd :<C-u>Gdiff develop..@<CR>
  nnoremap gdm :<C-u>Gdiff master..@<CR>

  call neobundle#untap()
endif

if neobundle#tap('tabular')
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

  call neobundle#untap()
endif

if neobundle#tap('unite.vim')
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
          \   'force write': 'w !sudo tee %',
          \   'toggle ignore whitespace in diff': 'call ToggleIwhite()',
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
  nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
          \ -buffer-name=files buffer file_mru bookmark file<CR>
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
    let g:unite_source_grep_default_opts = '--vimgrep --smart-case --nogroup --nocolor --column'
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

  call neobundle#untap()
endif

if neobundle#tap('vim-surround')
  " erb
  " 61: '='
  autocmd FileType eruby let g:surround_61 = "<%= \r %>"

  call neobundle#untap()
endif

if neobundle#tap('vim-expand-region')
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

  call neobundle#untap()
endif

if neobundle#tap('vim-signify')
  call submode#enter_with('signify-move', 'n', '', '<Leader>g')
  call submode#map('signify-move', 'n', 'r', 'j', '<Plug>(signify-next-hunk)')
  call submode#map('signify-move', 'n', 'r', 'k', '<Plug>(signify-prev-hunk)')
  call submode#map('signify-move', 'n', 'r', 'gg', 'gg<Plug>(signify-next-hunk)')
  call submode#map('signify-move', 'n', 'r', 'G', 'G<Plug>(signify-prev-hunk)')

  call neobundle#untap()
endif

if neobundle#tap('vim-submode')
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

  call neobundle#untap()
endif

if neobundle#tap('auto-ctags.vim')
  if has('mac')
    " Use homebrew's ctags instead of kaoriya bundled one
    let g:auto_ctags_bin_path = $HOMEBREW_ROOT . '/bin/ctags'
  endif
  let g:auto_ctags = 1

  call neobundle#untap()
endif

if neobundle#tap('lightline.vim')
  let g:lightline = {
          \ 'colorscheme': 'solarized',
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
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
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

  call neobundle#untap()
endif

NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

let g:solarized_contrast="high"
let g:solarized_termtrans=1
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" These highlight settings make so much easier to detect them!
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

highlight WhitespaceEOL ctermbg=124 guibg=#880000
match WhitespaceEOL /\s\+$/
