return {
    {
        'nvim-telescope/telescope.nvim', 
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'BurntSushi/ripgrep',
        },
        config = function()
            vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
            vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')

            local telescope = require('telescope')
            local actions = require('telescope.actions')
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ['<C-j>'] = actions.move_selection_next, 
                            ['<C-k>'] = actions.move_selection_previous, 
                        },
                    },
                }
            })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    ["ui-select"] = {
                      require("telescope.themes").get_dropdown {}
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
