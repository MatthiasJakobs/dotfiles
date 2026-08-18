return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '▌' },
            change = { text = '▌' },
            delete = { text = '▂' },
            topdelete = { text = '▀' },
            changedelete = { text = '▌' },
            untracked = { text = '▌' },
        },
        signs_staged = {
            add = { text = '▌' },
            change = { text = '▌' },
            delete = { text = '▂' },
            topdelete = { text = '▀' },
            changedelete = { text = '▌' },
            untracked = { text = '▌' },
        },
    }
}

-- require('lazy').setup({
--     'mfussenegger/nvim-dap',
--     'mfussenegger/nvim-dap-python',
--     {
--         'rcarriga/nvim-dap-ui',
--         dependencies = {
--             'mfussenegger/nvim-dap', 
--             'nvim-neotest/nvim-nio' 
--         },
--     },
--     'tpope/vim-fugitive',
--     -- Completion
--     'hrsh7th/nvim-cmp',
--     'hrsh7th/cmp-buffer',
--     'hrsh7th/cmp-path',
--     'hrsh7th/cmp-omni', -- For TeX
--     'hrsh7th/cmp-nvim-lsp',
--     'saadparwaiz1/cmp_luasnip',
--     'onsails/lspkind.nvim',
-- })

