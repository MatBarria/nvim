return {

	---- Obsidian Plugins
	"epwalsh/obsidian.nvim",

	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "personal",
					path = "~/notes",
				},
				{
					name = "work",
					path = "~/proyecto/notes",
				},
			},

			-- see below for full list of options
			finder = "telescope.nvim",
			completion = {
				-- Set to false to disable completion.
				nvim_cmp = true,
				-- Trigger completion at 2 chars.
				min_chars = 2,
			},
			-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
			-- URL it will be ignored but you can customize this behavior here.
			---@param url string
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				--vim.fn.jobstart({"open", url})  -- Mac OS
				vim.fn.jobstart({ "xdg-open", url }) -- linux
			end,
		})
	end,
}
