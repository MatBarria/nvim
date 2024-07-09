local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "

-- SHORTCUTS
-- Close
vim.keymap.set("n", "<leader>q", vim.cmd.q, opts)
-- Save
vim.keymap.set("n", "<leader>w", vim.cmd.w, opts)

-- add , or ; at the end of the line
vim.keymap.set("n", "<leader>;", "A;<ESC>", opts)
vim.keymap.set("n", "<leader>,", "A,<ESC>", opts)

-- Move text up and Down
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)

-- Paste withoout lossing the clipboard
vim.keymap.set("x", "<leader>p", '"_dP', opts)

-- Replace all the word in the file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
vim.keymap.set("x", "<leader>r", [[:s/\%V<C-r><C-w>/<C-r><C-w>/g<Left><Left>]], opts)

-- Replace the first instance and then use . to replces de following
-- use n if you want to skip one instance
vim.keymap.set("n", "<leader>lr", "*Nciw", opts)

-- Change the size of the panel
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move through buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Keep cursor in the middle of the screen when you search for words and scroll
vim.keymap.set("n", "<C-d>", "<C-d>Znzzzv", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
