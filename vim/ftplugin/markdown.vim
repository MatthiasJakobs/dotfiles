" setlocal fo+=t
" setlocal tw=90
setlocal autoindent
setlocal colorcolumn=0
setlocal linebreak
setlocal nonumber
setlocal shiftwidth=4
setlocal tabstop=4
setlocal wrap
setlocal nocursorline

nnoremap j gj
nnoremap k gk

nnoremap <Up> gk
nnoremap <Down> gj

setlocal spelllang=en,de
setlocal spell

syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$].\{-}\$'
hi link math Statement
