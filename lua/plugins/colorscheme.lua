return {
    {
        "catppuccin/nvim",
        name = "catppuccin",

        config = function()
            local background = "dark"

            vim.cmd.colorscheme("catppuccin-mocha")

            vim.keymap.set("n", "<S-q>", function()
                if background == "dark" then
                    background = "light"
                    vim.opt.background = "light"
                    vim.cmd.colorscheme("catppuccin-latte")
                else
                    background = "dark"
                    vim.opt.background = "dark"
                    vim.cmd.colorscheme("catppuccin-mocha")
                end
            end, {
                desc = "Toggle Catppuccin light/dark theme",
            })
        end,
    },

    --{
    ----"morhetz/gruvbox",
    --"ellisonleao/gruvbox.nvim",
    ----name = "gruvbox",
    --config = function()
    --require("gruvbox").setup({
    --terminal_colors = true, -- add neovim terminal colors
    --undercurl = false,
    --underline = false,
    --bold = true,
    --italic = {
    --strings = false,
    --emphasis = false,
    --comments = false,
    --operators = false,
    --folds = false,
    --},
    --inverse = true, -- invert background for search, diffs, statuslines and errors
    --contrast = "hard", -- can be "hard", "soft" or empty string
    --})
    --vim.cmd("colorscheme gruvbox")
    ---- Set light colorscheme
    --local background = "dark"
    --vim.keymap.set("n", "<S-q>", function()
    --if background == "dark" then
    --background = "light"
    --elseif background == "light" then
    --background = "dark"
    --end
    --vim.opt.background = background -- set this to dark or light
    --vim.cmd("colorscheme gruvbox")
    --end)
    --end,

    --},


}
