return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><Cmd>TmuxNavigateLeft<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><Cmd>TmuxNavigateDown<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><Cmd>TmuxNavigateUp<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><Cmd>TmuxNavigateRight<CR>]], opts)
    vim.keymap.set("t", "<C-\\>", [[<C-\><C-n><Cmd>TmuxNavigatePrevious<CR>]], opts)
  end,
}
