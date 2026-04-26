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
	"mbbill/undotree",
}
