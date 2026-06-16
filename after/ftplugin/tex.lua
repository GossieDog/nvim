-- Code adopted fron https://github.com/lervag/vimtex/issues/2294
local function PdfAnnots()
	local ok, pdf = pcall(vim.api.nvim_eval, "vimtex#context#get().handler.get_actions().entry.file")
	if not ok then
		vim.notify("No file found")
		return
	end
	local content = vim.fn.systemlist(string.format('pdfannots "%s"', pdf))
	vim.cmd.new()
	vim.api.nvim_win_set_height(0, 15)
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
	vim.bo.filetype = "markdown"
	vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
end
vim.keymap.set("n", "<localleader>ln", PdfAnnots)
