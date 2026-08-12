return {
    'altercation/vim-colors-solarized',
    priority = 1000,
    config = function()
        vim.o.background = 'light'
        vim.cmd.colorscheme 'solarized'

        -- The original theme predates termguicolors and otherwise uses its
        -- 16-color terminal fallback in Neovim. Apply the official palette as
        -- true-color highlights while retaining Solarized's highlight links.
        local colors = {
            base03 = '#002b36',
            base02 = '#073642',
            base01 = '#586e75',
            base00 = '#657b83',
            base0 = '#839496',
            base1 = '#93a1a1',
            base2 = '#eee8d5',
            base3 = '#fdf6e3',
            yellow = '#b58900',
            orange = '#cb4b16',
            red = '#dc322f',
            magenta = '#d33682',
            violet = '#6c71c4',
            blue = '#268bd2',
            cyan = '#2aa198',
            green = '#859900',
        }

        local highlights = {
            Normal = { fg = colors.base00, bg = colors.base3 },
            NormalFloat = { fg = colors.base00, bg = colors.base2 },
            FloatBorder = { fg = colors.base1, bg = colors.base2 },
            Comment = { fg = colors.base1, italic = true },
            Constant = { fg = colors.cyan },
            String = { fg = colors.cyan },
            Character = { fg = colors.cyan },
            Number = { fg = colors.cyan },
            Boolean = { fg = colors.cyan },
            Identifier = { fg = colors.blue },
            Function = { fg = colors.blue },
            Statement = { fg = colors.green },
            Conditional = { fg = colors.green },
            Repeat = { fg = colors.green },
            Label = { fg = colors.green },
            Operator = { fg = colors.green },
            Keyword = { fg = colors.green },
            Exception = { fg = colors.green },
            PreProc = { fg = colors.orange },
            Include = { fg = colors.orange },
            Define = { fg = colors.orange },
            Macro = { fg = colors.orange },
            Type = { fg = colors.yellow },
            StorageClass = { fg = colors.yellow },
            Structure = { fg = colors.yellow },
            Typedef = { fg = colors.yellow },
            Special = { fg = colors.red },
            Underlined = { fg = colors.violet, underline = true },
            Error = { fg = colors.red, bg = colors.base2 },
            Todo = { fg = colors.magenta, bg = colors.base2, bold = true },
            CursorLine = { bg = colors.base2 },
            CursorLineNr = { fg = colors.yellow, bg = colors.base2, bold = true },
            LineNr = { fg = colors.base1 },
            SignColumn = { fg = colors.base1, bg = colors.base3 },
            ColorColumn = { bg = colors.base2 },
            Visual = { fg = colors.base01, bg = colors.base2 },
            Search = { fg = colors.base01, bg = colors.yellow },
            IncSearch = { fg = colors.base3, bg = colors.orange },
            MatchParen = { fg = colors.red, bg = colors.base2, bold = true },
            Pmenu = { fg = colors.base00, bg = colors.base2 },
            PmenuSel = { fg = colors.base3, bg = colors.blue, bold = true },
            StatusLine = { fg = colors.base01, bg = colors.base2 },
            StatusLineNC = { fg = colors.base1, bg = colors.base2 },
            WinSeparator = { fg = colors.base1, bg = colors.base3 },
            Directory = { fg = colors.blue },
            Title = { fg = colors.orange, bold = true },
            DiagnosticError = { fg = colors.red },
            DiagnosticWarn = { fg = colors.orange },
            DiagnosticInfo = { fg = colors.blue },
            DiagnosticHint = { fg = colors.cyan },
            DiffAdd = { fg = colors.green, bg = colors.base2 },
            DiffChange = { fg = colors.yellow, bg = colors.base2 },
            DiffDelete = { fg = colors.red, bg = colors.base2 },
            DiffText = { fg = colors.orange, bg = colors.base2, bold = true },
        }

        for group, highlight in pairs(highlights) do
            vim.api.nvim_set_hl(0, group, highlight)
        end
    end,
}
