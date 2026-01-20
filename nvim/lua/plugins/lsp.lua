return {
    {
        'williamboman/mason.nvim',
        config = function()
           require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config('lua_ls', {})
            vim.lsp.config('pyright', {
                capabilities = capabilities,
                flags = {
                  debounce_text_changes = 150,
                },
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'off'
                        }
                    },
                }
            })
            local bufoptions = {}
            local opts = {}
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufoptions)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufoptions)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufoptions)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufoptions)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufoptions)
            vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufoptions)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufoptions)
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufoptions)
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

            vim.diagnostic.config {
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                signs = {
                    text = {
                      [vim.diagnostic.severity.ERROR] = '',
                      [vim.diagnostic.severity.WARN] = '',
                      [vim.diagnostic.severity.INFO] = '',
                      [vim.diagnostic.severity.HINT] = '',
                    },
                } or {},
                virtual_text = {
                  source = 'if_many',
                  spacing = 2,
                  format = function(diagnostic)
                    local diagnostic_message = {
                      [vim.diagnostic.severity.ERROR] = diagnostic.message,
                      [vim.diagnostic.severity.WARN] = diagnostic.message,
                      [vim.diagnostic.severity.INFO] = diagnostic.message,
                      [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                  end,
                },
            }
        end
    },
}
