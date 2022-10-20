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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'nvim-treesitter/nvim-treesitter'
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

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git/*

" LSP
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definion)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Latex
au BufRead,BufNewFile *.tex setlocal wrap
au BufRead,BufNewFile *.tex setlocal linebreak
au BufRead,BufNewFile *.tex nnoremap j gj
au BufRead,BufNewFile *.tex nnoremap k gk

"XHTML
au BufRead,BufNewFile *.xhtml vmap <C-b> S<b>
au BufRead,BufNewFile *.xhtml vmap <C-i> S<li>
au BufRead,BufNewFile *.xhtml vmap <C-p> S<p>

" " DAP
" lua <<EOF
" local dap = require('dap')
" dap.adapters.python = {
"   type = 'executable';
"   command = '/home/matty/.pyenvs/main/bin/python';
"   args = { '-m', 'debugpy.adapter' };
" }
"
" dap.configurations.python = {
"   {
"     -- The first three options are required by nvim-dap
"     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
"     request = 'launch';
"     name = "Launch file";
"
"     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
"
"     program = "${file}"; -- This configuration will launch the current file if used.
"     pythonPath = function()
"       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
"       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
"       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
"       local cwd = vim.fn.getcwd()
"       if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
"         return cwd .. '/venv/bin/python'
"       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
"         return cwd .. '/.venv/bin/python'
"       else
"         return '/usr/bin/python'
"       end
"     end;
"   },
" }
" EOF


lua require('dap-python').setup('~/.pyenvs/debugpy/bin/python')
nnoremap <silent> <Leader>c <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Leader>l <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>j <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Leader>h <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
"nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
"nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>r <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>d <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>q <Cmd>lua require'dap'.close()<CR>
" lua require('dap-python').resolve_python = function()
"   return '/home/matty/.pyenvs/main/bin/python'
" end
