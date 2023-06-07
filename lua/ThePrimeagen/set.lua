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

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- line width
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "LightGrey" })
vim.opt.colorcolumn = "100"

-- Open new windows on the right
vim.opt.splitright = true

