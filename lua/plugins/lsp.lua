return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"jsonls",
					"ltex",
					"lua_ls",
					"marksman",
					"sqls",
					"texlab",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("jsonls", {})
			vim.lsp.config("ltex", {
				settings = {
					ltex = {
						checkFrequency = "save",
						disabledRules = {
							["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
						},
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.config("marksman", {})
			vim.lsp.config("sqls", {})
			vim.lsp.config("texlab", {})

			vim.lsp.enable({
				"jsonls",
				"ltex",
				"lua_ls",
				"marksman",
				"sqls",
				"texlab",
			})
		end,
	},
}
