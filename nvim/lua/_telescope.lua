require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = require('telescope.actions').move_selection_next, 
                ['<C-k>'] = require('telescope.actions').move_selection_previous, 
            },
        },
    },
}

------ Bindings
-- Files
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope git_files<CR>')
-- Git
vim.keymap.set('n', '<Leader>gs', '<cmd>Telescope git_status<CR>')
vim.keymap.set('n', '<Leader>gl', '<cmd>Telescope git_bcommits<CR>')
-- LSP
vim.keymap.set('n', '<Leader>lr', '<cmd>Telescope lsp_references<CR>')
-- Other
vim.keymap.set('n', '<Leader>cc', '<cmd>Telescope commands<CR>')
