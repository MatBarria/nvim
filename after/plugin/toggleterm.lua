require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    size = 70,
    direction = "vertical",
    open_mapping = [[<C-T>]],
    close_on_exit = true,
    shell = vim.o.shell,

}

-- Allows to move between terminals
function _G.set_terminal_keymaps()

    local opts = {noremap= true}
    vim.api.nvim_buf_set_keymap(0 , 't', '<ESC>' , [[<C-\><C-n>]],      opts)
    vim.api.nvim_buf_set_keymap(0 , 't', 'jk' ,    [[<C-\><C-n>]],      opts)
    vim.api.nvim_buf_set_keymap(0 , 't', '<C-h>' , [[<C-\><C-n><C-h>]], opts)
    --vim.api.nvim_buf_set_keymap(0 , 't', '<C-j>' , [[<C-\><C-n><C-j[[<C-\><C-n><C-h>]]>]], opts)
    --vim.api.nvim_buf_set_keymap(0 , 't', '<C-k>' , [[<C-\><C-n><C-k>]], opts)
    --vim.api.nvim_buf_set_keymap(0 , 't', '<C-l>' , [[<C-\><C-n><C-l>]], opts)

end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--

-- Open a terminal with root
local Terminal = require("toggleterm.terminal").Terminal

local root = Terminal:new( {cmd = "root", hidden = true, direction = "float"} )
function _ROOT_()
    root:toggle()
end



