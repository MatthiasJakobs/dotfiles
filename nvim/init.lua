require('_packages')
require('_mappings')
require('_lsp')
require('_dap')

-- Legacy settings
vim.cmd [[
	set tabstop=4 softtabstop=4
	set shiftwidth=4
	set expandtab
	set smartindent
	set nohlsearch
	set incsearch
    set smartcase
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
    set updatetime=100

    set signcolumn=yes

    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'

    set clipboard+=unnamedplus
]]

