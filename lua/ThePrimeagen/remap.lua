-- Set leader key
vim.g.mapleader = " "

-- SHORTCUTS


-- Close
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- Save 
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- add  ; at the end of the line
vim.keymap.set("n", "<leader>;", "A;<ESC>")

-- Keep cursor in the middle of the screen when you search for words and scroll
vim.keymap.set("n", "<C-d>", "<C-d>Znzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste withoout lossing the clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Replace all the word in the file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("x", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Replace the first instance and then use . to replces de following
-- use n if you want to skip one instance
--vim.keymap.set("n", "<silent> s*" ,'vim.g["@/"] = "\<".expand("<cword>")."\>"<CR>cgn')
--vim.keymap.set("x", "<silent> s*" ,'"sy:let @/=@s<CR>cgn')

-- Change the size of the panel
vim.keymap.set("n", "<leader>>", "10<C-w>>")
vim.keymap.set("n", "<leader><", "10<C-w><")

