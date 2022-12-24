-- This file can be loaded by calling `lua require('plugins')` from your init.vim

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

    -- Theme/ColorScheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Highlight 
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
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
    -- Prettier bottom line
    use('itchyny/lightline.vim')

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

    -- Move trough different panels
    use('christoomey/vim-tmux-navigator')

    -- Use * to select the word in all the file 
    use('nelstrom/vim-visual-star-search')

end)
