return {

    ---- Highlight
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "p00f/nvim-ts-rainbow",
    },
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            --ensure_installed = { "html", "css", "help", "python", "cpp", "c", "lua", "markdown"},
            ensure_installed = { "python", "cpp", "c", "lua", "markdown" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            highlight = {
                enable = true,
                -- Instead of true it can also be a list of languages
                --additional_vim_regex_highlighting = { "markdown" },
            },

            --rainbow = {
                --enable = true,
                ---- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                --extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                ----max_file_lines = nil, -- Do not enable for files with more than n lines, int
            --},
        })
    end,
}


