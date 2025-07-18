return {

    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        --For luasnip users.
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        "j-hui/fidget.nvim",

        'stevearc/conform.nvim',
    },

    config = function()
        --local ROOT_variable = { "TH1", "TH2", "TH1F", "TH2F", "TCanvas", "TFile", "TTree", "TNtuple" }
        --require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                --"pylsp",
                "pyright",
                --"autopep8",
                "clangd",
                --"remark_ls",
            },
            handlers = {
                --require('lspconfig').pyright.setup({}),
                function(server_name) -- default handler (optional)
                    --print("setting up: ", server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                ---- Next, you can provide a dedicated handler for specific servers.
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
            },
        })

        --vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        --pattern = "*.py",
        --callback = function()
        --local lspconfig = require("lspconfig")
        --lspconfig.pyright.setup({
        --settings = {
        --python = {
        --analysis = {
        --autoSearchPaths = true,
        --useLibraryCodeForTypes = false,
        --diagnosticMode = "openFilesOnly",
        --},
        --},
        --},
        --})
        --end
        --})


        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
            }),
        })

        local luasnip = require("luasnip")
        luasnip.setup({ -- Setting LuaSnip config
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            virtual_text = true,
            virtual_line = false,
            underline = false,
            signs = true,
        })

        local conform = require("conform")

        conform.setup({
            --event= {"BufReadPre", "BufNewFile"},
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                cpp = { "clang_format" },
            },
            formatters = {
                clang_format = {
                    prepend_args = { '--style=Google', '-style={IndentWidth: 4, ColumnLimit: 80}' },
                },
            },
        })
        vim.keymap.set({ "n", "v" }, "F", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })

        vim.api.nvim_create_autocmd("LspAttach", {
            --group = vim.api.nvim_create_augroup('UserLspConfig',)
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, opts)
                vim.keymap.set("n", "<leader>vd", function()
                    vim.diagnostic.open_float()
                end, opts)
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_next()
                end, opts)
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_prev()
                end, opts)
                vim.keymap.set("n", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set("n", "<leader>vrr", function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
                vim.keymap.set("i", "<C-h>", function()
                    vim.lsp.buf.signature_help()
                end, opts)
                --lsp_formatting(ev.buf)
                --vim.keymap.set("n", "F", function()
                --vim.lsp.buf.format()
                --end, opts)
            end,
        })
    end,
}
