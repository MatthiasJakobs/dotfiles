set nocompatible
set cursorline
set nu
filetype off
syntax on
color dracula

set t_Co=256

" correct indentation
set tabstop=4 shiftwidth=4 expandtab
set autoindent

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on

let g:tex_flavor='tex'

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

" Window controll
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Sane searching
set incsearch
set hlsearch

" I don't know why but otherwise the backspace key doesn't work as expected
set backspace=indent,eol,start
