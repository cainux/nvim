return {
	-- Manage language servers from within neovim
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- for configuring neovim
					"lua_ls",

					-- my day job
					"omnisharp",
					"terraformls",
					"tflint",
					"dockerls",
					"docker_compose_language_service",
					"bashls",

					-- bit of fun
					"svelte", -- of course
					"tsserver",
					"cssls",
					"rust_analyzer",
					"sqlls",
				},
				-- handlers = {
				--     lsp_zero.default_setup,
				--     lua_ls = function()
				--         local lua_opts = lsp_zero.nvim_lua_ls()
				--         require("lspconfig").lua_ls.setup(lua_opts)
				--     end,
				-- }
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({ capabilities = capabilities })

			lspconfig.omnisharp.setup({
				cmd = { "omnisharp" },
				organize_imports_on_format = true,
				enable_import_completion = true,
				capabilities = capabilities,
			})
			lspconfig.terraformls.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })

			lspconfig.svelte.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	-- lsp-zero 3.x
	--     { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	--     { "neovim/nvim-lspconfig" },
	--     { "hrsh7th/cmp-nvim-lsp" },
	--     { "hrsh7th/nvim-cmp" },
	--     { "L3MON4D3/LuaSnip" },

	-- Stuff from ThePrimagens 0 to LSP
	--     { "hrsh7th/cmp-buffer" },
	--     { "hrsh7th/cmp-path" },
	--     { "saadparwaiz1/cmp_luasnip" },
	--     { "hrsh7th/cmp-nvim-lua" },
	--     { "rafamadriz/friendly-snippets" },
}
