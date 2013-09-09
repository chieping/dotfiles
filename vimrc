execute pathogen#infect()

syntax enable
filetype on
filetype indent on
filetype plugin on

set encoding=utf-8
set clipboard=unnamed
set nocompatible
compiler ruby

set hlsearch
set incsearch
set ignorecase
set smartcase
"set noesckeys "インサートモードでESCが即座に利くようにする
set showmatch " 閉じ括弧を打つと対応する開き括弧がハイライトされる
set matchtime=3

let ruby_space_errors=1
let NERDTreeShowHidden=1

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smartindent
set cursorline
set noswapfile

inoremap {} {}<Left>
inoremap <> <><Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap <C-e> <End>
inoremap <C-a> <Home>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

noremap ;  :
noremap :  ;

let mapleader = ','
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
map  <leader>l :Align
map  <C-n> :NERDTreeToggle<CR>
nmap <leader>r :<C-u>source $MYVIMRC<CR>

" If no files were specified, open with NERDTree.
autocmd vimenter * if !argc() | NERDTree | endif

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

colorscheme solarized

