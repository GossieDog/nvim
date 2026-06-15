return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				firewall = {
					enabled = true,
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"jsonls",
					"ltex_plus",
					"lua_ls",
					"marksman",
					"sqls",
					"texlab",
					"html",
					"cssls",
					"vtsls",
					"emmet_language_server",
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"prettierd",
					"eslint_d",
					"htmlhint",
					"luacheck",
					"markdown-toc",
					"markdownlint-cli2",
					"stylelint",
					-- run in each project: npm init -y and npm create stylelint@latest
					"shfmt",
					"stylua",
					"tree-sitter-cli",
				},
				auto_update = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("jsonls", {})
			vim.lsp.config("ltex_plus", {
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
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})
			vim.lsp.config("marksman", {})
			vim.lsp.config("sqls", {})
			vim.lsp.config("texlab", {})

			vim.lsp.enable({
				"jsonls",
				"ltex_plus",
				"lua_ls",
				"marksman",
				"sqls",
				"texlab",
				"html",
				"cssls",
				"vtsls",
				"emmet_language_server",
			})
		end,
	},
}
