require('dap-python').setup('~/.pyenvs/debugpy/bin/python')

vim.keymap.set('n', '<Leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<Leader>dc', '<cmd>lua require"dap".continue()<CR>')
vim.keymap.set('n', '<Leader>dq', '<cmd>lua require"dap".close()<CR>')
vim.keymap.set('n', '<Leader>dr', '<cmd>lua require"dap".repl.toggle()<CR>')
vim.keymap.set('n', '<Leader>dj', '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<Leader>dh', '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<Leader>dl', '<cmd>lua require"dap".step_out()<CR>')
