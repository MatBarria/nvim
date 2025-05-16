return {
    "nvim-lualine/lualine.nvim",

    dependencies = {
        { "kyazdani42/nvim-web-devicons", opt = true },
        { "chriskempson/base16-vim",      opt = false },
    },

    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto',
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {  {'branch', icon = '>'},'searchcount','diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'diff', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
        }

        local trouble = require("trouble")
        local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            -- The following line is needed to fix the background color
            -- Set it to the lualine section you want to use
            hl_group = "lualine_c_normal",
        })
        local lualine_b = {
            symbols.get,
            cond = symbols.has,
        }
    end,
}
