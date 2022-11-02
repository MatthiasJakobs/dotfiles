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

    colorscheme NeoSolarized
]]

