return {

-- Code formater
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},

	--Force you to be efficient
	--{ "m4xshen/hardtime.nvim",
	--lazy = false,
	--dependencies = { "MunifTanjim/nui.nvim" },
	--opts = {},
	--},
	-- Surround with a simbol
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

	---- Comment line shortcut
	"scrooloose/nerdcommenter",

	---- Close the bracket automaticly
	--'jiangmiao/auto-pairs',
	---- See index lines
	"yggdroot/indentline",

	---- Use . to repeat moves from plugins not only navites
	"tpope/vim-repeat",

	---- Move trough different panels
	"christoomey/vim-tmux-navigator",

	---- Use * to select the word in all the file
	--'nelstrom/vim-visual-star-search',

	-- Markdown preview
	-- install with yarn or npm
	--{
	--"iamcco/markdown-preview.nvim",
	--cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	--build = "cd app && yarn install",
	--init = function()
	--vim.g.mkdp_filetypes = { "markdown" }
	--end,
	--ft = { "markdown" },
	--},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		--dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		---@module 'gitsigns'
		---@type Gitsigns.Config
		---@diagnostic disable-next-line: missing-fields
		opts = {
			signs = {
				add = { text = "+" }, ---@diagnostic disable-line: missing-fields
				change = { text = "~" }, ---@diagnostic disable-line: missing-fields
				delete = { text = "_" }, ---@diagnostic disable-line: missing-fields
				topdelete = { text = "‾" }, ---@diagnostic disable-line: missing-fields
				changedelete = { text = "~" }, ---@diagnostic disable-line: missing-fields
			},
		},
	},

	-- Undo tree
	"mbbill/undotree",
    {
      "ellisonleao/carbon-now.nvim",
      lazy = true,
      cmd = "CarbonNow",
      ---@param opts cn.ConfigSchema
      opts = {
        base_url = "https://carbon.now.sh/",
          options = {
            bg = "gray",
            drop_shadow_blur = "68px",
            drop_shadow = false,
            drop_shadow_offset_y = "20px",
            font_family = "Hack",
            font_size = "18px",
            line_height = "133%",
            line_numbers = true,
            theme = "catppuccin-mocha",
            titlebar = "Made with carbon-now.nvim",
            watermark = false,
            width = "680",
            window_theme = "sharp",
            padding_horizontal = "0px",
            padding_vertical = "0px",
          },

        }
    }

}
