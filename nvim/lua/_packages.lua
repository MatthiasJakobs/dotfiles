local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' 
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'neovim/nvim-lspconfig' 
  use 'airblade/vim-gitgutter'
  use 'nvim-treesitter/nvim-treesitter'
  use 'overcache/NeoSolarized'
  use 'ctrlpvim/ctrlp.vim'
  use 'tpope/vim-commentary'
end)
