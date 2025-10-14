require('dap-python').setup('~/.pyenvs/debugpy/bin/python')

vim.keymap.set('n', '<Leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<Leader>dc', '<cmd>lua require"dap".continue()<CR>')
vim.keymap.set('n', '<Leader>dr', '<cmd>lua require"dap".repl.open({}, "belowright 10new")<CR>')
vim.keymap.set('n', '<Leader>dj', '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<Leader>dh', '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<Leader>dl', '<cmd>lua require"dap".step_out()<CR>')
vim.keymap.set('n', '<Leader>dq', '<cmd>lua require"dap".disconnect()<CR>')
vim.keymap.set('n', '<Leader>dt', '<cmd>lua require"dapui".toggle()<CR>')

local dap = require('dap')

--- Configurations
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch Current";
    -- program = "${workspaceFolder}/${file}";
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
-- Also, overwrite if vscode file available 
require('dap.ext.vscode').load_launchjs()

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
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

local configurations = require('dap').configurations.python
for _, configuration in pairs(configurations) do
    configuration.subProcess = true
end
