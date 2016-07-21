set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/bundle'))
call dein#add('Shougo/dein.vim')

" call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
" call dein#add('Shougo/vimshell')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('thinca/vim-quickrun')
call dein#add('SirVer/ultisnips', { 'if': has('python') })
call dein#add('honza/vim-snippets')
call dein#add('Shougo/unite-outline')
call dein#add('tsukkee/unite-help')
" call dein#add('sorah/unite-ghq')
" call dein#add('rhysd/accelerated-jk')
" call dein#add('rking/ag.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('scrooloose/syntastic')
call dein#add('AndrewRadev/switch.vim')
call dein#add('AndrewRadev/splitjoin.vim')
" call dein#add('Yggdroot/indentLine')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('godlygeek/tabular')
" call dein#add('vim-scripts/taglist.vim')
" call dein#add('majutsushi/tagbar')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tomtom/tcomment_vim')
call dein#add('jszakmeister/vim-togglecursor')
call dein#add('altercation/vim-colors-solarized')
" call dein#add('tpope/vim-dispatch')
" call dein#add('Lokaltog/vim-easymotion')
" call dein#add('justinmk/vim-sneak')
call dein#add('haya14busa/incsearch.vim')
call dein#add('star-search')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-rsi')
call dein#add('matchit.zip')
call dein#add('jiangmiao/auto-pairs')
call dein#add('elixir-lang/vim-elixir')
call dein#add('elzr/vim-json')
call dein#add('vim-ruby/vim-ruby')
call dein#add('jgdavey/vim-blockle')
" call dein#add('rodjek/vim-puppet')
call dein#add('mv/mv-vim-puppet')
" call dein#add('dougireton/vim-chef') " notice: this line must be below of vim-ruby
" call dein#add('thoughtbot/vim-rspec')
call dein#add('GEverding/vim-hocon')
" call dein#add('tsaleh/vim-matchit')
" call dein#add('ecomba/vim-ruby-refactoring')
" call dein#add('taku-o/vim-toggle')
call dein#add('kana/vim-smartword')
call dein#add('kana/vim-submode')

" vim-textobj-user list
" https://github.com/kana/vim-textobj-user/wiki
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-line')
call dein#add('kana/vim-textobj-entire')
call dein#add('lucapette/vim-textobj-underscore')
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-operator-replace')
call dein#add('tommcdo/vim-exchange')
call dein#add('thinca/vim-textobj-between')
" call dein#add('rhysd/vim-textobj-word-column') " forked from coderifous
" http://vimcasts.org/episodes/supercharged-substitution-with-subvert/
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
" call dein#add('wesleyche/SrcExpl')
" call dein#add('wesleyche/Trinity')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-unimpaired')
call dein#add('chrisbra/vim-diff-enhanced')
call dein#add('terryma/vim-expand-region')
call dein#add('mhinz/vim-signify')
" call dein#add('closetag.vim')
" call dein#add('szw/vim-tags')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('kannokanno/previm')
" call dein#add('rizzatti/dash.vim')
call dein#add('tyru/open-browser.vim')
call dein#add('dhruvasagar/vim-table-mode')
" call dein#add('glidenote/memolist.vim')
" call dein#add('lambdalisue/vim-gista')
call dein#add('embear/vim-localvimrc')

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
set synmaxcol=240
set autoindent
set autoread
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
cabbrev di   call dein#install()
cabbrev du   call dein#update()
" TODO: dein#get_updates_log() is not working?
cabbrev dul  call dein#get_updates_log()
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

if dein#tap('vimproc.vim')
  " TODO: follow dein's way
  " call dein#config({
  "   \ 'build' : {
  "   \   'mac' : 'make -f make_mac.mak',
  "   \   'linux' : 'make'
  "   \ }})


endif

if dein#tap('vim-quickrun')
  let g:quickrun_config = {}
  let g:quickrun_config['ruby.rspec'] = {
    \ 'command': 'rspec',
    \ 'cmdopt': '--no-color',
    \ 'exec': '%c %o %s:%{line(".")} %a'
    \ }


endif

if dein#tap('vim-smartword')
  map w  <Plug>(smartword-w)
  map b  <Plug>(smartword-b)
  map e  <Plug>(smartword-e)
  map ge <Plug>(smartword-ge)


endif

if dein#tap('vim-diff-enhanced')
  " diff algorithm
  " 'histogram' algorithm is fast version of patience algorithm
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'


endif

if dein#tap('vim-ruby')
  augroup RubyRspec
    autocmd!
    autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
  augroup END


endif

if dein#tap('ultisnips')
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetDirectories=['UltiSnips', '~/.vim/UltiSnips']
  let g:snips_github="https://github.com/chieping"
  let g:snips_author="chieping"
  let g:snips_email="takashi.honda.01@gmail.com"


endif

if dein#tap('vim-localvimrc')
  let g:localvimrc_ask=0
  let g:localvimrc_sandbox=0


endif

if dein#tap('vim-json')
  let g:vim_json_syntax_conceal = 0

  " default brace color(red) is not very good
  highlight link jsonBraces Function


endif

if dein#tap('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 1

  if ! has('gui_running')
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  guibg=#1c1c1c ctermbg=0
    autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=#585858 ctermbg=8
  endif


endif

if dein#tap('syntastic')
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_puppet_puppetlint_args = "--no-80chars-check"
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
  " http://stackoverflow.com/questions/29635150/how-do-i-fix-this-annoying-syntastic-rails-error
  let g:syntastic_eruby_ruby_quiet_messages =
      \ {'regex': 'possibly useless use of a variable in void context'}
  let g:syntastic_check_on_wq = 0


endif

if dein#tap('vim-operator-replace')
  map r <Plug>(operator-replace)


endif

if dein#tap('vim-table-mode')
  let g:table_mode_corner = '|'


endif

if dein#tap('switch.vim')
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


endif

if dein#tap('vim-multiple-cursors')
  let g:multi_cursor_next_key='<C-d>'  " default mapping <C-n> is reserved


endif

if dein#tap('open-browser.vim')
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)


endif

if dein#tap('previm')
  let g:previm_show_header = 0


endif

if dein#tap('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)


endif

if dein#tap('nerdtree')
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


endif

if dein#tap('vim-fugitive')
  nnoremap gst :<C-u>Gstatus<CR>
  nnoremap gb  :<C-u>Gblame<CR>
  nnoremap gl  :<C-u>Glog -- % \| cwindow<CR>
  nnoremap gdi :<C-u>Gdiff<CR>
  nnoremap gdd :<C-u>Gdiff develop..@<CR>
  nnoremap gdm :<C-u>Gdiff master..@<CR>
  nnoremap gdp :<C-u>Gdiff HEAD@{1}<CR>

  vnoremap gb :<C-u>'<,'>Gblame<CR>
  vnoremap gl :<C-u>'<,'>Glog -- % \| cwindow<CR>
endif

if dein#tap('tabular')
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


endif

if dein#tap('unite.vim')
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


endif

if dein#tap('vim-surround')
  " erb
  " 61: '='
  autocmd FileType eruby let g:surround_61 = "<%= \r %>"


endif

if dein#tap('vim-expand-region')
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


endif

if dein#tap('vim-signify')
  call submode#enter_with('signify-move', 'n', '', '<Leader>g')
  call submode#map('signify-move', 'n', 'r', 'j', '<Plug>(signify-next-hunk)')
  call submode#map('signify-move', 'n', 'r', 'k', '<Plug>(signify-prev-hunk)')
  call submode#map('signify-move', 'n', 'r', 'gg', 'gg<Plug>(signify-next-hunk)')
  call submode#map('signify-move', 'n', 'r', 'G', 'G<Plug>(signify-prev-hunk)')


endif

if dein#tap('vim-submode')
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


endif

if dein#tap('auto-ctags.vim')
  if has('mac')
    " Use homebrew's ctags instead of kaoriya bundled one
    let g:auto_ctags_bin_path = $HOMEBREW_ROOT . '/bin/ctags'
  endif

  if expand("%:p") =~ "/src/"
    let g:auto_ctags = 1
  endif


endif

if dein#tap('lightline.vim')
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


endif

" TODO: follow dein's way
" if !has('vim_starting')
"   " Call on_source hook when reloading .vimrc.
"   call dein#call_hook('on_source')
" endif

call dein#end()

let g:solarized_contrast="high"
let g:solarized_termtrans=1
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" These highlight settings make so much easier to distinguish them!
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
