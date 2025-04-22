return {

	"nvim-lualine/lualine.nvim",

	dependencies = {
		{ "kyazdani42/nvim-web-devicons", opt = true },
		{ "chriskempson/base16-vim", opt = false },
	},

	config = function()
		require("lualine").setup({})

		--local trouble = require("trouble")
		--local symbols = trouble.statusline({
		--mode = "lsp_document_symbols",
		--groups = {},
		--title = false,
		--filter = { range = true },
		--format = "{kind_icon}{symbol.name:Normal}",
		---- The following line is needed to fix the background color
		---- Set it to the lualine section you want to use
		--hl_group = "lualine_c_normal",
		--})
		--lualine_c = {
		--symbols.get,
		--cond = symbols.has,
		--}
	end,
}
