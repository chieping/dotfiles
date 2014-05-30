if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundleLazy 'Shougo/vimshell', {
        \ 'autoload' : {
        \ 'commands' : [ 'VimShell', 'VimShellPop', 'VimShellInteractive' ]
        \ }}
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-help'
" NeoBundle 'rhysd/accelerated-jk'
" NeoBundle 'rking/ag.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'vim-scripts/taglist.vim'
" NeoBundle 'majutsushi/tagbar'
NeoBundle 'tomtom/tcomment_vim', {
        \ 'autoload' : {
        \ 'mappings' : [ '<Plug>TComment-' ]
        \ }}
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'tpope/vim-dispatch'
" NeoBundleLazy 'Lokaltog/vim-easymotion', {
"         \ 'autoload' : {
"         \ 'mappings' : [ '<Plug>(easymotion-' ]
"         \ }}
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'tpope/vim-endwise'
" NeoBundle 'rodjek/vim-puppet'
NeoBundle 'mv/mv-vim-puppet'
" NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'
" NeoBundle 'tsaleh/vim-matchit'
" NeoBundle 'ecomba/vim-ruby-refactoring'
" NeoBundle 'taku-o/vim-toggle'
NeoBundleLazy 'kana/vim-smartword', {
        \ 'autoload' : {
        \ 'mappings' : [ '<Plug>(smartword-' ]
        \ }}
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
NeoBundle 'rhysd/vim-textobj-word-column' " forked from coderifous
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
" NeoBundle 'wesleyche/SrcExpl'
" NeoBundle 'wesleyche/Trinity'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'mhinz/vim-signify'
NeoBundleLazy 'closetag.vim', {
        \ 'autoload' : {
        \ 'filetypes' : [ 'html', 'xml', 'xsl', 'ant' ],
        \ }}
NeoBundleLazy 'szw/vim-tags', {
        \ 'autoload' : {
        \ 'commands' : [ 'TagsGenerate', 'TagsGenerate!' ],
        \ }}
NeoBundleLazy 'kannokanno/previm', {
        \ 'autoload' : {
        \ 'filetypes' : [ 'markdown' ],
        \ }}
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'dhruvasagar/vim-table-mode'

filetype plugin on

NeoBundleCheck

if has('kaoriya')
  " Suppress to overwrite key mappings
  let plugin_dicwin_disable = 1
endif

" Map ✠ (U+2720) to <S-CR>, so we have <S-CR> mapped to ✠ in iTerm2 and
" ✠ mapped back to <S-CR> in Vim.
imap ✠ <S-CR>
map  ✠ <S-CR>

set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set clipboard+=unnamed
set smartcase
set scrolloff=100
set helpheight=100
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set cursorline
set number
set noeb vb t_vb=           "Disable beep and flash
set ambiwidth=double        "Also need iTerm configuration(But tmux sucks...)
set backspace=2             "Make backspace work like most other apps
set whichwrap=h,l,<,>,[,]   "Keys which can stride over
set helplang=en
set list
set listchars=tab:›\ 
if exists('+colorcolumn')
  set colorcolumn=80
endif

let mapleader=","

let g:submode_timeout=0

" ######################### Syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_ruby_checkers = ['rubocop']

" ######################### vim-operator-replace
map r <Plug>(operator-replace)

" ######################### open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" ######################### vim-sneak
"replace 'f' with inclusive 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with exclusive 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nnoremap <Leader>p :set invpaste<CR>
set pastetoggle=<Leader>p

nnoremap U :redo<CR>

nmap <Leader>v :tabedit $MYVIMRC<CR>
nmap <Leader>r :<C-u>source $MYVIMRC<CR>

" <S-CR> needs special setting on CLI Vim
inoremap <S-CR> <Esc>o
nnoremap <S-CR> o

" Yank like Tmux copy mode
vnoremap <CR> y

" Very magic is good
noremap / /\v
noremap ? ?\v
cnoremap s/ s/\v

" use black hole register
noremap c "_c
noremap C "_C

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-^> <Esc>^i

inoremap <C-e> <End>
inoremap <C-a> <Home>

inoremap <C-d> <Delete>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge <Plug>(smartword-ge)

" ######################### NERDTree
nmap <Leader>d :NERDTreeToggle<CR>
nmap <Leader>s :NERDTreeFind<CR>

let NERDTreeMinimalUI=1

" Disable NERDTree's mappings
let g:NERDTreeMapJumpNextSibling = ''   " C-j
let g:NERDTreeMapJumpPrevSibling = ''   " C-k
let g:NERDTreeMapToggleFilters = ''     " f
let g:NERDTreeMapToggleFiles = ''       " F
let g:NERDTreeMapCWD = ''               " CD

" ######################### fugitive
command! -nargs=* Gc :Gcommit -v <args>

" ######################### Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a\| :Tabularize /\|<CR>
vmap <Leader>a\| :Tabularize /\|<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" ######################### Unite.vim
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    m [unite]

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
" directory_mru
nnoremap <silent> [unite]d  :<C-u>Unite
        \ -default-action=nerdtree directory_mru<CR>
" unite-help
nnoremap <silent> [unite]h  :<C-u>Unite
        \ help<CR>
nnoremap <silent> [unite]f
        \ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]ma
        \ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
        \ :<C-u>Unite output:message<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>

nnoremap <silent> [unite]s
        \ :<C-u>Unite -buffer-name=files -no-split
        \ jump_point file_point buffer_tab
        \ file_rec:! file file/new file_mru<CR>

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
  let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
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

" ######################### vim-expand-region
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

" ######################### Signify
call submode#enter_with('signify-move', 'n', '', '<Leader>g')
call submode#map('signify-move', 'n', 'r', 'j', '<Plug>(signify-next-hunk)')
call submode#map('signify-move', 'n', 'r', 'k', '<Plug>(signify-prev-hunk)')
call submode#map('signify-move', 'n', 'r', 'gg', 'gg<Plug>(signify-next-hunk)')
call submode#map('signify-move', 'n', 'r', 'G', 'G<Plug>(signify-prev-hunk)')

map <C-w>L <C-w>>
map <C-w>H <C-w><
map <C-w>K <C-w>-
map <C-w>J <C-w>+

call submode#enter_with('easymotion', 'n', 'r', '<Leader>;', '<Plug>(easymotion-next)')
call submode#map('easymotion', 'n', 'r', ';', '<Plug>(easymotion-next)')
call submode#map('easymotion', 'n', 'r', ',', '<Plug>(easymotion-prev)')

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

cabbrev h    tab help
cabbrev t    tabnew
cabbrev bu   NeoBundleUpdate
cabbrev bul  NeoBundleUpdatesLog

" Clear WhitespaceEOL
nmap <Leader>c :%s/\s\+$//g<CR>

function! ToggleWrap()
  if (&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunction

map <Leader>w :call ToggleWrap()<CR>

" force write
map <Leader>fw :w !sudo tee %<CR>

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

inoremap <expr><CR> <SID>ExCr()
function! s:ExCr()
  if col('.') != col('$')
    return "\<CR>"
  endif
  let l = getline('.')
  if l =~ '{$'
    return "\<CR>}\<Up>\<End>\<CR>"
  elseif l =~ '($'
    return "\<CR>)\<Up>\<End>\<CR>"
  elseif l =~ '[$'
    return "\<CR>]\<Up>\<End>\<CR>"
  else
    return "\<CR>"
  endif
endfunction

" ######################### Lightline.vim
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

let g:solarized_termtrans=1
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

highlight WhitespaceEOL ctermbg=124 guibg=#880000
match WhitespaceEOL /\s\+$/
