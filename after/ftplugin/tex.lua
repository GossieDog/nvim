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
vim.keymap.set("n", "<leader>ta", PdfAnnots, { desc = "Pull Annotations" })

-- Which Key
local wk = require("which-key")

wk.add({
	-- LATEX GROUP --

	{ "<localleader>l", group = "LaTeX", icon = "" },
	{ "<localleader>la", desc = "Context Menu" },
	{ "<localleader>lc", desc = "Vimtex Clean" },
	{ "<localleader>lC", desc = "Vimtex Clean Full" },
	{ "<localleader>le", desc = "Vimtex Errors" },
	{ "<localleader>lg", desc = "Vimtex Status" },
	{ "<localleader>lG", desc = "Vimtex Status All" },
	{ "<localleader>li", desc = "Vimtex Info" },
	{ "<localleader>lI", desc = "Info Full" },
	{ "<localleader>lk", desc = "Stop" },
	{ "<localleader>lK", desc = "Stop All" },
	{ "<localleader>ll", desc = "Build" },
	{ "<localleader>lL", desc = "Build Selected" },
	{ "<localleader>lm", desc = "Maps List" },
	{ "<localleader>lo", desc = "Build Output" },
	{ "<localleader>lq", desc = "Log" },
	{ "<localleader>ls", desc = "Toggle Main" },
	{ "<localleader>lS", desc = "Build SS" },
	{ "<localleader>lt", "<cmd>lua Snacks.picker.vimtex_toc()<cr>", desc = "Open TOC" },
	{ "<localleader>lT", desc = "Toggle TOC" },
	{ "<localleader>lv", desc = "View" },
	{ "<localleader>lx", desc = "Reload" },
	{ "<localleader>lX", desc = "Reload State" },
	{ "<localleader>ld", "<cmd>VimtexDocPackage<cr>", desc = "Package Documentation", mode = "n" },
	{ "<localleader>lw", "<cmd>VimtexCountWords!<CR>", desc = "Word Count" },
	{ "<localleader>lp", "<cmd>VimtexContextToggle<CR>", desc = "Toggle Context Menu PDF Viewer" },

	-- TEMPLATE GROUP --

	{ "<leader>T", group = "Templates", icon = "󰈭" },
	{
		"<leader>Ta",
		"<cmd>read ~/.config/nvim/templates/APA-Paper.tex<CR>",
		desc = "APA Paper",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TA",
		"<cmd>read ~/.config/nvim/templates/APA-Paper-Standalone.tex<CR>",
		desc = "APA Paper Standalone",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>Tf",
		"<cmd>read ~/.config/nvim/templates/APA-Figures-and-Tables.tex<CR>",
		desc = "APA Figures and Tables",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>Tn",
		"<cmd>read ~/.config/nvim/templates/Notes.tex<CR>",
		desc = "Notes.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TN",
		"<cmd>read ~/.config/nvim/templates/Notes-Standalone.tex<CR>",
		desc = "Notes-Standalone.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>Tc",
		"<cmd>read ~/.config/nvim/templates/Chicago-Paper.tex<CR>",
		desc = "Chicago Paper",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TC",
		"<cmd>read ~/.config/nvim/templates/Chicago-Paper-Standalone.tex<CR>",
		desc = "Chicago Paper Standalone",
		mode = "n",
		icon = "󰈙",
	},

	{
		"<leader>Tm",
		"<cmd>read ~/.config/nvim/templates/MLA-Paper.tex<CR>",
		desc = "MLA Paper",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TM",
		"<cmd>read ~/.config/nvim/templates/MLA-Paper-Standalone.tex<CR>",
		desc = "MLA Paper Standalone",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>Ts",
		"<cmd>read ~/.config/nvim/templates/Studying.tex<CR>",
		desc = "Studying.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>Tb",
		"<cmd>read ~/.config/nvim/templates/APA-Barebones.tex<CR>",
		desc = "APA-Barebones.tex",
		mode = "n",
		icon = "󰈙",
	},

	{ "<leader>TW", group = "Work" },
	{
		"<leader>TWR",
		"<cmd>read ~/.config/nvim/templates/Resume.tex<CR>",
		desc = "Resume.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TWr",
		"<cmd>read ~/Documents/Co-Op/Resume/EricFan-Resume.tex<CR>",
		desc = "Resume-Complete.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TWc",
		"<cmd>read ~/.config/nvim/templates/Cover-Letter.tex<CR>",
		desc = "Cover-Letter.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TWl",
		"<cmd>read ~/.config/nvim/templates/References.tex<CR>",
		desc = "References.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TWt",
		"<cmd>read ~/.config/nvim/templates/Thank-You.tex<CR>",
		desc = "Thank-You.tex",
		mode = "n",
		icon = "󰈙",
	},
	{ "<leader>TO", group = "Other" },
	{
		"<leader>TOr",
		"<cmd>read ~/.config/nvim/templates/Recipe.tex<CR>",
		desc = "Recipe.tex",
		mode = "n",
		icon = "󰈙",
	},
	{
		"<leader>TOl",
		"<cmd>read ~/.config/nvim/templates/Letter.tex<CR>",
		desc = "Letter.tex",
		mode = "n",
		icon = "󰈙",
	},

	-- PANDOC GROUP --

	{ "<leader>p", group = "Pandoc", icon = "󰈙" },
	{
		"<leader>pd",
		"<cmd>!pandoc %:p -o %:p:r.docx --citeproc --bibliography=/home/ericfan/Documents/SFU-Coursework/Zotero.bib<cr>",
		desc = "Docx",
		icon = "󰈭",
	},
	{
		"<leader>pm",
		"<cmd>!pandoc %:p -o %:p:r.md --citeproc --bibliography=/home/ericfan/Documents/SFU-Coursework/Zotero.bib<cr>",
		desc = "Markdown",
		icon = "󱀈",
	},
	{
		"<leader>pt",
		"<cmd>!pandoc %:p -o %:p:r.tex --citeproc --bibliography=/home/ericfan/Documents/SFU-Coursework/Zotero.bib<cr>",
		desc = "LaTeX",
		icon = "󰐺",
	},
	{
		"<leader>pT",
		"<cmd>!pandoc %:p -o %:p:r.txt --citeproc --bibliography=/home/ericfan/Documents/SFU-Coursework/Zotero.bib && espeak-ng -f %:p:r.txt --stdout | ffmpeg -i - -codec:a libmp3lame -qscale:a 2 %:p:r.mp3<cr>",
		desc = "Text + MP3",
		icon = "󰐺",
	},
})
