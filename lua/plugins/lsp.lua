return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					-- trigger FileType event to possibly load this newly installed LSP server
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			local caps = require("blink.cmp").get_lsp_capabilities()

			vim.diagnostic.config({ virtual_text = true })

			vim.lsp.config("texlab", {
				cmd = { "texlab" },
				filetypes = { "tex", "plaintex", "bib" },
				root_markers = { ".git", "latexmkrc", ".latexmkrc", "texlab.toml" },
				capabilities = caps,
			})
			vim.lsp.enable("texlab")

			vim.lsp.config("lua_ls", {
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
				capabilities = caps,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("marksman", {
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/marksman", "server" },
				filetypes = { "markdown", "markdown.mdx" },
				root_markers = { ".marksman.toml", ".git" },
				capabilities = caps,
			})
			vim.lsp.enable("marksman")

			vim.lsp.config("ltex", {
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/ltex-ls" },
				filetypes = { "tex", "plaintex" },
				root_markers = { ".git", ".ltex" },
				capabilities = caps,
				settings = {
					ltex = {
						language = "en-US",
						enabled = { "tex", "plaintex" },
						diagnosticSeverity = "information",
						checkFrequency = "save",
						additionalRules = {
							enablePickyRules = false,
						},
						disabledRules = {
							["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
						},
					},
				},
			})
			vim.lsp.enable("ltex")

			vim.lsp.config("sqls", {
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/sqls" },
				filetypes = { "sql" },
				root_markers = { ".git" },
				capabilities = caps,
				settings = {
					sqls = {
						connections = {
							{
								driver = "sqlite3",
								dataSourceName = "/home/ericfan/Documents/Spending/Spending.sqlite3",
							},
						},
					},
				},
			})
			vim.lsp.enable("sqls")

			require("mason-lspconfig").setup({
				ensure_installed = {
					"texlab",
					"lua_ls",
					"marksman",
					"ltex",
					"sqls",
				},
			})
		end,
	},
}
