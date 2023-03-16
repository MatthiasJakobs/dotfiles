vim.g.mapleader = ' '

-- Escape
vim.keymap.set('i', 'jk', '<ESC>')

-- Navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Buffers
vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
vim.keymap.set('n', '<Leader>N', ':bprev<CR>')
vim.keymap.set('n', '<Leader>bd', ':bd<CR>')

-- Windows
vim.keymap.set('n', 'ss', ':split<CR><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', '<Leader>sh', ':split<CR><C-w>j')
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR><C-w>l')
vim.keymap.set('n', '<Leader>M', '<C-w>T')

-- Comments
vim.keymap.set('v', '/', ':Commentary<CR>')

-- Visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
