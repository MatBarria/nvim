return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)

                    local ok, ts = pcall(require, "nvim-treesitter")
                    if ok and ts.indentexpr then
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,

        opts = {
            ensure_install = {
                "python",
                "cpp",
                "c",
                "lua",
                "make",
                "bash",
                "markdown",
                "markdown_inline",
            },
            install_dir = vim.fn.stdpath("data") .. "/site",
        },
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
    },
}
