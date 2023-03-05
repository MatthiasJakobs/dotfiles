local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' 
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'neovim/nvim-lspconfig' 
    use 'airblade/vim-gitgutter'
    use 'nvim-treesitter/nvim-treesitter'
    use 'dracula/vim'
    use 'ctrlpvim/ctrlp.vim'
    use 'tpope/vim-commentary'
    use 'christoomey/vim-tmux-navigator'
    use 'psliwka/termcolors.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
