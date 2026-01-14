local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' 
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use 'neovim/nvim-lspconfig' 
    use { 'airblade/vim-gitgutter', branch = 'main' }
    use 'nvim-treesitter/nvim-treesitter'
    use 'dracula/vim'
    use 'folke/tokyonight.nvim'
    use 'tpope/vim-commentary'
    use 'christoomey/vim-tmux-navigator'
    use 'psliwka/termcolors.nvim'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', branch = 'master',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'BurntSushi/ripgrep',
        requries = { {'nvim-telescope/telescope.nvim' }}
    }
    use 'tpope/vim-fugitive'
    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-omni' -- For TeX
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'

    use 'onsails/lspkind.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'lervag/vimtex'

    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    use 'pangloss/vim-javascript'
    use 'norcalli/nvim-colorizer.lua'
    use 'mason-org/mason.nvim'
        
end)
