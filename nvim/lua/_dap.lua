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
    -- dap.repl.close()
    dap.disconnect({terminateDebugee = true})
end
--vim.keymap.set('n', '<Leader>dq', '<cmd> lua close_all_debug_panes()<CR><C-w>j:q<CR>')
vim.keymap.set('n', '<Leader>dq', '<cmd> lua close_all_debug_panes()<CR>')
-- dap.defaults.python.terminal_win_cmd = 'belowright 10new'

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

-- DAP-UI
require("dapui").setup(
{
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "Disc.",
        pause = "⏸",
        play = "▶",
        run_last = "↺",
        step_back = "←",
        step_into = "↓",
        step_out = "↑",
        step_over = "→",
        terminate = "✗",
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "▸",
      current_frame = "",
      expanded = "▾"
    },
    layouts = {{
        elements = { {
            id = "console",
            size = 0.5
          }, {
            id = "repl",
            size = 0.5
          } },
        position = "bottom",
        size = 10
    }},
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  }
)


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


