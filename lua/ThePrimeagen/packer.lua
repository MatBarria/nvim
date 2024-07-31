--This file can be loaded by calling `truelua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- File searcher
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    --use {
        --"williamboman/mason.nvim",
        --opts = {
            --ensure_installed = {
                --"pyright",
            --}
        --},
    --}
    -- Theme/ColorScheme
    use { "catppuccin/nvim",  as = "catppuccin" }
    use { "morhetz/gruvbox",  as = "gruvbox" }
    use {'nyoom-engineering/oxocarbon.nvim'}

    -- Highlight 
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('p00f/nvim-ts-rainbow')
    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')

    -- Autocomplete
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Surround with a simbol
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })  

    -- Prettier bottom line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true},
            { 'chriskempson/base16-vim', opt = false },
        }
    }

    -- Code formater
    use('nvim-lua/plenary.nvim')

    use({
        "jose-elias-alvarez/null-ls.nvim",
        --config = function()
        --require("null-ls").setup()
        --end,
        requires = { "nvim-lua/plenary.nvim" },
        }
    )

    -- Comment line shortcut
    use('scrooloose/nerdcommenter')

    -- Close the bracket automaticly
    use('jiangmiao/auto-pairs')

    -- See index lines
    use('yggdroot/indentline')

    -- Use . to repeat moves from plugins not only navites
    use('tpope/vim-repeat')

    -- File list
    use('preservim/nerdtree')
    use('ryanoasis/vim-devicons')

    -- Git status
    use('tpope/vim-fugitive')

    -- Move trough different panels
    use('christoomey/vim-tmux-navigator')

    -- Use * to select the word in all the file 
    use('nelstrom/vim-visual-star-search')

    -- Open a Terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- LaTex plugins
    use('lervag/vimtex')
end)
