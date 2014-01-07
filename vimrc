if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
" NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'rking/ag.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'tpope/vim-dispatch'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'rodjek/vim-puppet'
" NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kana/vim-smartword'
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'wesleyche/SrcExpl'
" NeoBundle 'wesleyche/Trinity'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'mhinz/vim-signify'

filetype plugin on

NeoBundleCheck

if has('kaoriya')
  " Suppress to overwrite key mappings
  let plugin_dicwin_disable = 1
endif

" Map ✠ (U+2720) to <S-CR>, so we have <S-CR> mapped to ✠ in iTerm2 and
" ✠ mapped back to <S-CR> in Vim.
imap ✠ <S-CR>
map ✠ <S-CR>

syntax enable

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
set ambiwidth=double "Also need iTerm configuration(But tmux sucks...)
set backspace=2      "Make backspace work like most other apps
set whichwrap=h,l    "Keys which can stride over
set helplang=en

let mapleader=","

let g:submode_timeout=0

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:agprg="`brew --prefix`/bin/ag --column --smart-case"

" TODO: consider beside mac
if has('kaoriya')
  let g:tagbar_ctags_bin = '/Applications/MacVim.app/Contents/MacOS/ctags'
endif

nnoremap <Leader>p :set invpaste<CR>
set pastetoggle=<Leader>p

nnoremap U :redo<cr>

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
nnoremap D "_d
nnoremap C "_c
nnoremap s "_s

inoremap {} {}<Left>
inoremap <> <><Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

imap hhhhh <Esc>
imap jjjjj <Esc>
imap kkkkk <Esc>
imap lllll <Esc>

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

nmap <Leader>d :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a\| :Tabularize /\|<CR>
vmap <Leader>a\| :Tabularize /\|<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

nmap <Leader>t  :TagbarToggle<CR>

" #################### Unite.vim ####################

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
        \ -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
        \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
        \ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]f
        \ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]d
        \ :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
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
let g:unite_source_file_mru_long_limit = 3000
let g:unite_source_directory_mru_long_limit = 3000

" Like ctrlp.vim settings.
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

" Prompt choices.
let g:unite_prompt = '❫ '
let g:unite_prompt = '» '

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
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
  nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
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
  nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ?
          \ ['sorter_reverse'] : [])

  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

if executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

" For ack.
if executable('ack-grep')
  " let g:unite_source_grep_command = 'ack-grep'
  " let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
  " let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit = 100

nnoremap <Leader>o :<C-u>Unite -vertical -winwidth=50 -direction=botright -no-focus -toggle -no-quit outline<CR>
nnoremap <Leader>u :<C-u>Unite file_mru directory_mru<CR>
nnoremap <leader>y :<C-u>Unite history/yank<CR>

" #################### Unite.vim ####################

" <Leader>gs go into signify submode
call submode#enter_with('signify-move', 'n', '', '<Leader>gs')
call submode#map('signify-move', 'n', 'r', 'j', '<Plug>(signify-next-hunk)')
call submode#map('signify-move', 'n', 'r', 'k', '<Plug>(signify-prev-hunk)')
call submode#map('signify-move', 'n', 'r', 'gg', 'gg<Plug>(signify-next-hunk)')
call submode#map('signify-move', 'n', 'r', 'G', 'G<Plug>(signify-prev-hunk)')

nmap <Leader>gj <Plug>(signify-next-hunk)
nmap <Leader>gk <Plug>(signify-prev-hunk)

map <C-w>L <C-w>>
map <C-w>H <C-w><
map <C-w>K <C-w>-
map <C-w>J <C-w>+

cabbrev a    Ag!
cabbrev h    tab help
cabbrev t    tabnew

call submode#enter_with('winsize', 'n', '', '<C-w>L', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w>H', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>K', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>J', '<C-w>+')
call submode#map('winsize', 'n', '', 'L', '<C-w>>')
call submode#map('winsize', 'n', '', 'H', '<C-w><')
call submode#map('winsize', 'n', '', 'K', '<C-w>-')
call submode#map('winsize', 'n', '', 'J', '<C-w>+')

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

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

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

" If no files were specified, open with NERDTree.
" autocmd vimenter * if !argc() | NERDTree | endif

" For immediate reaction of 'C' key
let g:NERDTreeMapCWD = 'cD'

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
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
