vim.diagnostic.config({ virtual_text = true })

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
	result.diagnostics = vim.tbl_filter(function(d)
		return not d.message:match("Marginpar on page")
	end, result.diagnostics)
	vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
end
vim.lsp.config("texlab", {
	cmd = { "texlab" },
	filetypes = { "tex", "plaintex", "bib" },
	root_markers = { ".git", "latexmkrc", ".latexmkrc", "texlab.toml" },
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("texlab")

local bib_path = "/home/ericfan/Documents/SFU-Coursework/Zotero.bib"
local last_mtime = 0
vim.loop.new_timer():start(
	2000,
	2000,
	vim.schedule_wrap(function()
		local stat = vim.loop.fs_stat(bib_path)
		if stat and stat.mtime.sec > last_mtime then
			last_mtime = stat.mtime.sec
			local clients = vim.lsp.get_clients({ name = "texlab" })
			for _, client in ipairs(clients) do
				client.notify("textDocument/didOpen", {
					textDocument = {
						uri = vim.uri_from_fname(bib_path),
						languageId = "bibtex",
						version = 1,
						text = table.concat(vim.fn.readfile(bib_path), "\n"),
					},
				})
			end
		end
	end)
)

return {}
