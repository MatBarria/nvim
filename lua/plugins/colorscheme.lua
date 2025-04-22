return {

    --{
    --"rose-pine/neovim",
    --name = "rose-pine",
    --config = function()
    --require("rose-pine").setup({
    ----variant = "dawn", -- auto, main, moon, or dawn
    --styles = {
    --bold = true,
    --italic = false,
    --transparency = false,
    --},
    --groups = {
    --border = "muted",
    --link = "iris",
    --panel = "surface",

    ----error = "love",
    --error = "#d22e2e",
    --hint = "iris",
    --info = "foam",
    --note = "pine",
    --todo = "rose",
    --warn = "gold",
    --},
    --})

    --vim.keymap.set("n", "<S-q>", function()
    --vim.opt.background = "dark" -- set this to dark or light
    --vim.cmd("colorscheme rose-pine-main")
    --end)
    --vim.keymap.set("n", "<S-w>", function()
    ----variant = "dawn" -- auto, main, moon, or dawn
    --vim.opt.background = "light" -- set this to dark or light
    --vim.cmd("colorscheme rose-pine-dawn")
    --end)
    --vim.cmd("colorscheme rose-pine-main")
    --end,
    --},

    {
        --"morhetz/gruvbox",
        "ellisonleao/gruvbox.nvim",
        --name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = false,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                inverse = true,    -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
            })
            vim.cmd("colorscheme gruvbox")
            -- Set light colorscheme
            local background = "dark"
            vim.keymap.set("n", "<S-q>", function()
                if background == "dark" then
                    background = "light"
                elseif background == "light" then
                    background = "dark"
                end
                vim.opt.background = background -- set this to dark or light
                vim.cmd("colorscheme gruvbox")
            end)
        end,

    },
}
