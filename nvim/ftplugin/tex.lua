vim.wo.wrap = true

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.g.vimtex_view_general_viewer = 'skim'

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})
vim.api.nvim_set_hl(0, 'SpellBad', { fg = 'Red', underline = true })
