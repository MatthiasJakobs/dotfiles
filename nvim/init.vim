" Basic things (based on Primeagen config)
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set nohlsearch
set incsearch
set nowrap
set nu
set hidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set guicursor=

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
call plug#end()

colorscheme gruvbox

" Remapping
let mapleader=' '

" Normal mode Remaps
nnoremap <leader>n :bnext<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>N :bprevious<CR>
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

" Easymotion
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" Terminal Remaps
tnoremap <Esc> <C-\><C-n>

" Visual Remaps
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>/ :TComment<CR>
nnoremap <leader>/ :TComment<CR>

" Latex
au BufRead,BufNewFile *.tex setlocal wrap
au BufRead,BufNewFile *.tex setlocal linebreak
au BufRead,BufNewFile *.tex nnoremap j gj
au BufRead,BufNewFile *.tex nnoremap k gk
