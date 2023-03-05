local lspkind = require 'lspkind'
lspkind.init()

local cmp = require 'cmp'

cmp.setup {
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(), 
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[lsp]',
                path = '[path]',
            }
        }
    },
    experimental = {
        native_menu = false,
        ghost_text = true
    }
}
