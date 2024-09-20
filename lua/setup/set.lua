-- Set numbers on the left
vim.opt.nu = true
vim.opt.numberwidth = 1
-- Set number relative to the current line
vim.opt.relativenumber = true

-- Use the same clipboard that out of vim
vim.opt.clipboard = "unnamedplus"

-- Encoding?
vim.opt.encoding = "utf-8"

-- Index Size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- See changes for closed session
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Minimal number of line to keep above o bellow the current line
vim.opt.scrolloff = 10

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Set highlight on search but clean it when press esc
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Case insensitive searching unless /C or one or more letter in search word
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50

-- line width
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "LightGrey" })
vim.opt.colorcolumn = "100"

-- Open new windows on the right
vim.opt.splitright = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "High light yanking (copy) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
