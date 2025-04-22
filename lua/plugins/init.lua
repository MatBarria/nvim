return {

    -- Code formater
    {
        'nvim-lua/plenary.nvim',
        name = "plenary"
    },

    ---- Surround with a simbol
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },

    ---- Prettier bottom line
    ---- Comment line shortcut
    'scrooloose/nerdcommenter',

    ---- Close the bracket automaticly
    --'jiangmiao/auto-pairs',

    ---- See index lines
    'yggdroot/indentline',

    ---- Use . to repeat moves from plugins not only navites
    'tpope/vim-repeat',

    ---- Move trough different panels
    'christoomey/vim-tmux-navigator',

    ---- Use * to select the word in all the file 
    --'nelstrom/vim-visual-star-search',

}
