return {
	{
		"mason-org/mason.nvim",
		dependencies = { "saghen/blink.cmp" },
		lazy = false,
		keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"markdown-toc",
				"json-lsp",
				"ltex-ls",
				"lua-language-server",
				"markdownlint-cli2",
				"marksman",
				"nomad",
				"prettier",
				"shfmt",
				"sqls",
				"stylua",
				"texlab",
				"tree-sitter-cli",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)

			-- Enable LSPs
			local caps = require("blink.cmp").get_lsp_capabilities()

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
			-- Default Mason stuff below
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
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
}
