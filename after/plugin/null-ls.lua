local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics


local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

null_ls.setup({
    debug = false,
    sources = {
        --[[ formatting ]]
        formatting.eslint_d,
        formatting.stylua,
        formatting.clang_format.with({
            extra_args = {"-style=llvm", "-style={IndentWidth: 4, ColumnLimit: 80}"},
        }),
        --formatting.clang_format.with({ 
            --extra_args = { "-style=file:~/.config/nvim/Formater/.clang-format" }, 
            --}),
        formatting.stylelint,
        formatting.prettier,
        formatting.cmake_format,
        formatting.autopep8,
        formatting.black,
        --formatting.autopep8.with({
            --extra_args = {"-style={max_line_length: 80"},
        --}),
    },
    on_attach = on_attach,

})
