" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/matchit.zip'
Plug 'kana/vim-smartword'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'thinca/vim-textobj-between'
Plug 'lucapette/vim-textobj-underscore'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/neomru.vim'
" Plug 'Shougo/vimshell'
" Plug 'Shougo/vimproc.vim', {'do': 'make'}
" Plug 'thinca/vim-quickrun'
" if has('python3')
"   Plug 'SirVer/ultisnips'
" endif
" Plug 'honza/vim-snippets'
" Plug 'Shougo/unite-outline'
" Plug 'tsukkee/unite-help'
" Plug 'sorah/unite-ghq'
" Plug 'rhysd/accelerated-jk'
" Plug 'rking/ag.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
" Plug 'w0rp/ale'
" Plug 'AndrewRadev/switch.vim'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'farmergreg/vim-lastplace'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'godlygeek/tabular'
" Plug 'vim-scripts/taglist.vim'
" Plug 'majutsushi/tagbar'
" Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/base16-vim'
" Plug 'tpope/vim-dispatch'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'justinmk/vim-sneak'
" Plug 'haya14busa/incsearch.vim'
" Plug 'vim-scripts/star-search'
" Plug 'tpope/vim-rsi'
" Plug 'jiangmiao/auto-pairs'
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
" Plug 'othree/yajs.vim'
" Plug 'elzr/vim-json'
" Plug 'justmao945/vim-clang'
" Plug 'vim-ruby/vim-ruby'
" Plug 'jgdavey/vim-blockle'
" Plug 'rodjek/vim-puppet'
" Plug 'mv/mv-vim-puppet'
" Plug 'dougireton/vim-chef'
" Plug 'thoughtbot/vim-rspec'
" Plug 'GEverding/vim-hocon'
" Plug 'tsaleh/vim-matchit'
" Plug 'ecomba/vim-ruby-refactoring'
" Plug 'taku-o/vim-toggle'
" Plug 'tommcdo/vim-exchange'
" Plug 'rhysd/vim-textobj-word-column'
" http://vimcasts.org/episodes/supercharged-substitution-with-subvert/
" Plug 'kana/vim-submode'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-repeat'
" Plug 'wesleyche/SrcExpl'
" Plug 'wesleyche/Trinity'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-unimpaired'
" Plug 'chrisbra/vim-diff-enhanced'
" Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
" Plug 'closetag.vim'
" Plug 'szw/vim-tags'
" Plug 'soramugi/auto-ctags.vim'
" Plug 'kannokanno/previm'
" Plug 'rizzatti/dash.vim'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'glidenote/memolist.vim'
" Plug 'lambdalisue/vim-gista'
" Plug 'embear/vim-localvimrc'
" Plug 'Shougo/dein.vim'
call plug#end()

filetype plugin indent on

set nocompatible
set hlsearch
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
set listchars=tab:›\        "dummy comment to suppress trailing white space
set comments=:#
" Get rid of comment leaders when joining lines
" Tips: to do opposite, *gq* handles very well!
set formatoptions+=j
if has('mac') || has('win32') || has('win64')
  set clipboard+=unnamed
elseif has('unix')
  set clipboard=unnamedplus
endif
"set diffopt+=internal,algorithm:patience,context:5
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

nnoremap <Leader>p :set invpaste<CR>
set pastetoggle=<Leader>p

nnoremap U :redo<CR>

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

if has_key(plugs, 'lightline.vim')
  set laststatus=2            " This helps lightline.vim visible
  set noshowmode
  let g:lightline = {
          \ 'colorscheme': 'Tomorrow_Night',
          \ }
endif

if has_key(plugs, 'vim-smartword')
  map w  <Plug>(smartword-w)
  map b  <Plug>(smartword-b)
  map e  <Plug>(smartword-e)
  map ge <Plug>(smartword-ge)
endif

if has_key(plugs, 'vim-operator-replace')
  map r <Plug>(operator-replace)
endif

if has_key(plugs, 'vim-multiple-cursors')
  let g:multi_cursor_next_key='<C-d>'  " default mapping <C-n> is reserved
endif

if has_key(plugs, 'open-browser.vim')
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
endif

syntax enable

set background=dark
