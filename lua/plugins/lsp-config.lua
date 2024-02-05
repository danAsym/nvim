return {
	-- mason
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	-- mason lsp config
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tsserver",
					"rust_analyzer",
				},
			})
		end,
	},

	-- lsp config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

      -- lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

      -- python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

      -- js/ts
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

      -- rust
			lspconfig.rust_analyzer.setup({
				-- Server-specific settings. See `:help lspconfig-setup`
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {},
				},
			})
		end,
	},

	-- none-ls config
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"prettierd",
					"black",
					"ruff",
					"eslint_d",
				},
			})
		end,
	},
}
