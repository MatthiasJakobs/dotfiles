set nocompatible
set cursorline
set nu
set rnu
filetype off
syntax on
set hidden

set t_Co=16

" correct indentation
set tabstop=4 shiftwidth=4 expandtab
set autoindent

" Plugins
call plug#begin('~/.vim/plugged')

""" Themes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tpope/vim-fugitive'

call plug#end()


filetype plugin indent on

let g:tex_flavor='tex'

colorscheme dracula
set bg=dark

" Vim Swap files
set dir=/tmp//

" Mapleader
let mapleader=" "
let maplocaleader=","

nnoremap <leader>r :source ~/.vimrc<CR>

" Folding
set fdm=syntax
nnoremap <leader>a za
nnoremap <leader>c zC
nnoremap <leader>o zO


" Visual Remaps
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>/ :TComment<CR>
nnoremap <leader>/ :TComment<CR>

" Window control
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprev<CR>
nnoremap <leader>b :b
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
" Remove terminals from bufferlist
autocmd TerminalOpen * setlocal nobuflisted

" Remove trailing whitespace on save
"autocmd BufWritePre * %s/\s\+$//e

" Omnicomplete
highlight Pmenu ctermbg=black gui=bold ctermfg=white

" Sane searching
set incsearch
set hlsearch
set smartcase

" I don't know why but otherwise the backspace key doesn't work as expected
set backspace=indent,eol,start

" Vimtex
let g:vimtex_quickfix_latexlog = {
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \ 'packages' : {
          \   'default' : 0,
          \ },
          \}
let g:vimtex_complete_enabled = 1
autocmd FileType tex,latex inoremap <buffer> <C-<Space>> <C-X><C-O>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.aux,*.bbl,*.fdb_latexmk,*.blg,*.fls,*.toc
let g:ctrlp_working_path_mode = 'ra'

" Typescript
let g:typescript_indent_disable = 1

" Gitgutter
set updatetime=100
highlight SignColumn ctermbg=NONE ctermfg=NONE

" Jedi-Vim
autocmd FileType python setlocal completeopt-=preview
let g:jedi#usages_command = "<leader>u"
let g:jedi#popup_on_dot = 0

" Airline
"let g:airline_theme = 'dracula'
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" NERDTree
let NERDTreeRespectWildIgnore=1
nnoremap <leader>e :NERDTreeToggle<CR>

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

set shell=/usr/bin/zsh

" Fugitive
nmap <leader>gs :G<CR>
nmap <leader>gc :G commit<CR>
nmap <leader>gp :G pull<CR>
nmap <leader>gP :G push<CR>
nmap <leader>gf :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
