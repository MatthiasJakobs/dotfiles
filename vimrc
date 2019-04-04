set nocompatible
set cursorline
set nu
filetype off
syntax on
set hidden

set t_Co=256

" correct indentation
set tabstop=4 shiftwidth=4 expandtab
set autoindent

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-bufferline'
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'davidhalter/jedi-vim'


call vundle#end()
filetype plugin indent on

let g:tex_flavor='tex'

colorscheme dracula

" Vim Swap files
set dir=/tmp//

" Mapleader
let mapleader=" "
let maplocaleader=","
nnoremap <leader>p :CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'

" Folding
set fdm=syntax
nnoremap <leader>a za
nnoremap <leader>c zC
nnoremap <leader>o zO

" netrw
"let g:netrw_banner=0
nnoremap <leader>e :Explore<CR>

" Visual Remaps
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>/ :TComment<CR>

" Window control
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprev<CR>

" Sane searching
set incsearch
set hlsearch

" I don't know why but otherwise the backspace key doesn't work as expected
set backspace=indent,eol,start

" Gitgutter
set updatetime=100

" Jedi-Vim
autocmd FileType python setlocal completeopt-=preview

" Airline
let g:airline_theme = 'dracula'
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" NERDTree
"" Exit if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Start NERDTree if vim opens directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "s",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "c",
    \ "Deleted"   : "d",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
