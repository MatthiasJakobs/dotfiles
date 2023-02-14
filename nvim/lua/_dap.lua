require('dap-python').setup('~/.pyenvs/debugpy/bin/python')

vim.keymap.set('n', '<Leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<Leader>dc', '<cmd>lua require"dap".continue()<CR>')
vim.keymap.set('n', '<Leader>dr', '<cmd>lua require"dap".repl.open({}, "belowright 10new")<CR>')
vim.keymap.set('n', '<Leader>dj', '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<Leader>dh', '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<Leader>dl', '<cmd>lua require"dap".step_out()<CR>')

local dap = require('dap')

--- Sane debugging (close all panes after it's done)
function close_all_debug_panes()
    dap.repl.close()
    dap.disconnect({terminateDebugee = true})
end
--vim.keymap.set('n', '<Leader>dq', '<cmd> lua close_all_debug_panes()<CR><C-w>j:q<CR>')
vim.keymap.set('n', '<Leader>dq', '<cmd> lua close_all_debug_panes()<CR>')
dap.defaults.python.terminal_win_cmd = 'belowright 10new'

--- Configurations
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch Current";
    program = "${file}";
    console = "integratedTerminal";
  },
  {
    type = 'python';
    request = 'launch';
    name = "Launch test.py";
    program = "${workspaceFolder}/test.py";
    console = "integratedTerminal";
  },
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = 'white', bg = 'purple' })
vim.api.nvim_set_hl(0, 'DapStopped', { fg = 'white', bg = 'green' })
vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapStopped', { text = '>', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

