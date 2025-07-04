return {
    -- Manage language servers from within neovim
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    -- for configuring neovim
                    "lua_ls",

                    -- my day job
                    "csharp_ls",
                    "terraformls",
                    "tflint",
                    "dockerls",
                    "docker_compose_language_service",
                    "bashls",
                    "jsonls",

                    -- bit of fun
                    "svelte",
                    "ts_ls",
                    "cssls",
                    "rust_analyzer",
                    "sqlls",
                    "eslint",
                    "powershell_es",
                    "html",
                },
                -- handlers = {
                --     lsp_zero.default_setup,
                --     lua_ls = function()
                --         local lua_opts = lsp_zero.nvim_lua_ls()
                --         require("lspconfig").lua_ls.setup(lua_opts)
                --     end,
                -- }
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require "lspconfig"
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Setup language servers. There's probably a nicer way of doing this
            lspconfig.lua_ls.setup { capabilities = capabilities }
            lspconfig.csharp_ls.setup { capabilities = capabilities }
            lspconfig.terraformls.setup { capabilities = capabilities }
            lspconfig.tflint.setup { capabilities = capabilities }
            lspconfig.dockerls.setup { capabilities = capabilities }
            lspconfig.docker_compose_language_service.setup { capabilities = capabilities }
            lspconfig.bashls.setup { capabilities = capabilities }
            lspconfig.jsonls.setup { capabilities = capabilities }
            lspconfig.svelte.setup { capabilities = capabilities }
            lspconfig.ts_ls.setup { capabilities = capabilities }
            lspconfig.cssls.setup { capabilities = capabilities }
            lspconfig.rust_analyzer.setup { capabilities = capabilities }
            lspconfig.sqlls.setup { capabilities = capabilities }
            lspconfig.eslint.setup { capabilities = capabilities }
            lspconfig.powershell_es.setup { capabilities = capabilities }
            lspconfig.html.setup { capabilities = capabilities }

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    -- NOTE: Remember that lua is a real programming language, and as such it is possible
                    -- to define small helper and utility functions so you don't have to repeat yourself
                    -- many times.
                    --
                    -- In this case, we create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc) vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc }) end

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-T>.
                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                    -- Find references for the word under your cursor.
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

                    -- Fuzzy find all the symbols in your current workspace
                    --  Similar to document symbols, except searches over your whole project.
                    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

                    -- Rename the variable under your cursor
                    --  Most Language Servers support renaming across files, etc.
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                    -- Opens a popup that displays documentation about the word under your cursor
                    --  See `:help K` for why this keymap
                    map("K", vim.lsp.buf.hover, "Hover Documentation")

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })
        end,
    },
}
