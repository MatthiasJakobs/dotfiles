local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('settings')

require('lazy').setup({
    spec='plugins',
    change_detection = {
        enabled = true,
        notify = false,
    }
})

-- require('_mappings')
-- require('_lsp')
-- require('_dap')
-- require('_completion')
-- require('_tex')
-- require('_colorizer')
-- require('_mason')

