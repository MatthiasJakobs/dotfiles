vim.g.mapleader = ' '

-- Escape
vim.keymap.set('i', 'jk', '<ESC>')

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

-- Comments
vim.keymap.set('v', '/', ':Commentary<CR>')

-- Visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
