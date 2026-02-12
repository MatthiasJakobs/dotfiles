return {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    {
        'rcarriga/cmp-dap',
        config = function ()
            local cmp = require('cmp')
            cmp.setup({
                enabled = function ()
                    return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' or require('cmp_dap').is_dap_buffer()
                end
            })
            cmp.setup.filetype({ 'dap-repl', 'dapui_watches' }, {
                sources = {
                    { name = "dap" },
                },
            })
        end
    },
    'hrsh7th/cmp-omni', -- For TeX
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            cmp.setup {
                mapping = {
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer', keyword_length = 5 },
                    { name = 'path', keyword_length = 5 },
                },
                -- snippet = {
                --     expand = function(args)
                --         require('luasnip').lsp_expand(args.body)
                --     end,
                -- },
                experimental = {
                    native_menu = false,
                    ghost_text = false
                }
            }

            cmp.setup.filetype("tex", {
                sources = {
                    { name = "omni" },
                    { name = "buffer", keyword_length=2},
                    { name = "path", keyword_length = 5 }
                },
                formatting = {
                  format = function(entry, vim_item)
                      vim_item.menu = ({
                        omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
                        buffer = "[Buffer]",
                        -- formatting for other sources
                        })[entry.source.name]
                      return vim_item
                    end
                }
            })
        end
    }
}
