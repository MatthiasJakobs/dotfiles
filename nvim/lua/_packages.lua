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
    use 'tpope/vim-commentary'
    use 'christoomey/vim-tmux-navigator'
    use 'psliwka/termcolors.nvim'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'

    use 'lukas-reineke/indent-blankline.nvim'
        
end)
