return {
	---- Git status
	"tpope/vim-fugitive",
	config = function()
		--Check git status
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
	end,
}
