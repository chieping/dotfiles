execute pathogen#infect()

syntax enable

set expandtab
set shiftwidth=2
set smartindent
set autoindent
set clipboard+=unnamed
set smartcase
set noswapfile
set scrolloff=5
set backupdir=~/.vim/tmp
set cursorline
set number

let mapleader=","

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

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
inoremap <C-^> <Esc>^i

inoremap <C-e> <End>
inoremap <C-a> <Home>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge <Plug>(smartword-ge)

let g:accelerated_jk_acceleration_table = [10,5,3]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

nmap <Leader>d :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
map  <Leader>l :Align
nmap <Leader>r :<C-u>source $MYVIMRC<CR>

" If no files were specified, open with NERDTree.
autocmd vimenter * if !argc() | NERDTree | endif

let NERDTreeShowHidden=1

let g:solarized_termtrans=1
set background=dark
colorscheme solarized

