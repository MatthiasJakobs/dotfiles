return {
    'tpope/vim-commentary',
    config = function()
        vim.keymap.set('v', '/', ':Commentary<CR>')
    end
}
