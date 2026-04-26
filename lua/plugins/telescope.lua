return {
	---- File searcher
	"nvim-telescope/telescope.nvim",
	dependencies = {
		--"nvim-lua/plenary.nvim",
		"plenary",
	},

	--tag = "0.1.5",

	-- Opend the buffers
	vim.keymap.set("n", "<leader>b", function()
		vim.cmd("Telescope buffers")
	end),

	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		-- Find a file in the project
		vim.keymap.set("n", "<leader>f", function()
			builtin.find_files({
				hidden = true,
				find_command = {
					"find",
					".",
					"-type",
					"f",
					"!",
					"-path",
					"*/.git/*",
					"!",
					"-name",
					"*.root",
					"!",
					"-name",
					"*.pdf",
					"!",
					"-name",
					"*.png",
					"!",
					"-name",
					"*.jpg",
					"!",
					"-name",
					"*.jpeg",
				},
			})
		end, { desc = "Find files including dotfiles" })
		-- Search a git file in the project
		--vim.keymap.set('n', '<C-p>', builtin.git_files, {})

		--
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Search a word in the project" })
		-- Search a the word under the cursor in the project
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Search the word under the cursor in the project" })
		-- Search a the word under the cursor in the project CAPITAL sentive
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Search the word under the cursor in the project CAPITAL sentive" })

		vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "search [K]ey[M]aps" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
			callback = function(event)
				local buf = event.buf

				-- Find references for the word under your cursor.
				vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })

				-- Jump to the implementation of the word under your cursor.
				-- Useful when your language has ways of declaring types without an actual implementation.
				vim.keymap.set(
					"n",
					"<leader>gi",
					builtin.lsp_implementations,
					{ buffer = buf, desc = "[G]oto [I]mplementation" }
				)

				-- Jump to the definition of the word under your cursor.
				-- This is where a variable was first declared, or where a function is defined, etc.
				-- To jump back, press <C-t>.
				vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

				-- Fuzzy find all the symbols in your current document.
				-- Symbols are things like variables, functions, types, etc.
				vim.keymap.set(
					"n",
					"<leader>gO",
					builtin.lsp_document_symbols,
					{ buffer = buf, desc = "Open Document Symbols" }
				)

				-- Fuzzy find all the symbols in your current workspace.
				-- Similar to document symbols, except searches over your entire project.
				vim.keymap.set(
					"n",
					"<leader>gW",
					builtin.lsp_dynamic_workspace_symbols,
					{ buffer = buf, desc = "Open Workspace Symbols" }
				)

				-- Jump to the type of the word under your cursor.
				-- Useful when you're not sure what type a variable is and you want to see
				-- the definition of its *type*, not where it was *defined*.
				vim.keymap.set(
					"n",
					"<leader>gt",
					builtin.lsp_type_definitions,
					{ buffer = buf, desc = "[G]oto [T]ype Definition" }
				)
			end,
		})
	end,
}
