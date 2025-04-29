return {

    ---- Add annotations to the code
    "danymat/neogen",
    require('neogen').setup {
        enabled = true,             --if you want to disable Neogen
        input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
        -- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
    },
    config = function()
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
    end
}
