vim.cmd [[
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set termguicolors
]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.mouse = 'a'

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.cursorline = true

-- Navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Marks
vim.keymap.set('n', 'ma', 'mA')
vim.keymap.set('n', '\'a', '\'A')
vim.keymap.set('n', 'ms', 'mS')
vim.keymap.set('n', '\'s', '\'S')

-- Buffers
vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
vim.keymap.set('n', '<Leader>N', ':bprev<CR>')
vim.keymap.set('n', '<Leader>bd', ':bd<CR>')

-- Windows
vim.keymap.set('n', 'ss', ':split<CR><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w')

-- Visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
