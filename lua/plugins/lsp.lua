vim.diagnostic.config({ virtual_text = true })

vim.lsp.config("texlab", {
	cmd = { "texlab" },
	filetypes = { "tex", "plaintex", "bib" },
	root_markers = { ".git", "latexmkrc", ".latexmkrc", "texlab.toml" },
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("texlab")

vim.lsp.config("lua_ls", {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	capabilities = require("blink.cmp").get_lsp_capabilities(),
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
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("marksman")

vim.lsp.config("ltex", {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/ltex-ls" },
	filetypes = { "tex", "plaintex" },
	root_markers = { ".git", ".ltex" },
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		ltex = {
			language = "en-US",
			enabled = { "tex", "plaintex" },
			diagnosticSeverity = "information",
			additionalRules = {
				enablePickyRules = false,
			},
			disabledRules = {
				["en-US"] = { "MORFOLOGIK_RULE_EN_US" }, -- disables spell check, texlab handles that better
			},
		},
	},
})

vim.lsp.enable("ltex")

-- local bib_path = "/home/ericfan/Documents/SFU-Coursework/Zotero.bib"
-- local last_mtime = 0
-- vim.loop.new_timer():start(
-- 	2000,
-- 	2000,
-- 	vim.schedule_wrap(function()
-- 		local stat = vim.loop.fs_stat(bib_path)
-- 		if stat and stat.mtime.sec > last_mtime then
-- 			last_mtime = stat.mtime.sec
-- 			local clients = vim.lsp.get_clients({ name = "texlab" })
-- 			for _, client in ipairs(clients) do
-- 				client.notify("textDocument/didOpen", {
-- 					textDocument = {
-- 						uri = vim.uri_from_fname(bib_path),
-- 						languageId = "bibtex",
-- 						version = 1,
-- 						text = table.concat(vim.fn.readfile(bib_path), "\n"),
-- 					},
-- 				})
-- 			end
-- 		end
-- 	end)
-- )

return {}
