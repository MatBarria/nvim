-- Opend the buffers
vim.keymap.set('n', '<leader>b', function () vim.cmd("Telescope buffers") end)


local builtin = require('telescope.builtin')
-- Find a file in the project
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- find a git file in the project
--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- find a word in the project
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>pws', function()
    local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word });
end)
