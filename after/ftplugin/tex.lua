-- Code for PdfAnnots adopted fron https://github.com/lervag/vimtex/issues/2294
local function PdfAnnots()
	local ok, pdf = pcall(vim.api.nvim_eval, "vimtex#context#get().handler.get_actions().entry.file")
	if not ok then
		vim.notify("No file found")
		return
	end
	-- local content = vim.fn.systemlist(string.format('pdfannots "%s"', pdf))
	local files = vim.split(pdf, ";", { plain = true })

	local pdfs = vim.tbl_filter(function(f)
		return f:match("%.pdf$")
	end, files)

	local cmd = { "pdfannots" }
	vim.list_extend(cmd, pdfs)

	local raw_content = vim.fn.system(cmd)
	local content = vim.split(raw_content, "\n", { plain = true })

	vim.cmd.new()
	vim.api.nvim_win_set_height(0, 15)
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
	vim.bo.filetype = "markdown"
	vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
end

local wk = require("which-key")

wk.add({
	-- LATEX GROUP
	{ "<localleader>", group = "LaTeX", icon = "" },
	{ "<localleader>a", desc = "Context Menu" },
	{ "<localleader>c", desc = "Vimtex Clean" },
	{ "<localleader>C", desc = "Vimtex Clean Full" },
	{ "<localleader>e", desc = "Vimtex Errors" },
	{ "<localleader>g", desc = "Vimtex Status" },
	{ "<localleader>G", desc = "Vimtex Status All" },
	{ "<localleader>i", desc = "Vimtex Info" },
	{ "<localleader>I", desc = "Info Full" },
	{ "<localleader>k", desc = "Stop" },
	{ "<localleader>K", desc = "Stop All" },
	{ "<localleader>l", desc = "Build" },
	{ "<localleader>L", desc = "Build Selected" },
	{ "<localleader>m", desc = "Maps List" },
	{ "<localleader>o", desc = "Build Output" },
	{ "<localleader>q", desc = "Log" },
	{ "<localleader>s", desc = "Toggle Main" },
	{ "<localleader>S", desc = "Build SS" },
	{ "<localleader>t", "<cmd>lua Snacks.picker.vimtex_toc()<cr>", desc = "Open TOC" },
	{ "<localleader>T", desc = "Toggle TOC" },
	{ "<localleader>v", desc = "View" },
	{ "<localleader>x", desc = "Reload" },
	{ "<localleader>X", desc = "Reload State" },
	{ "<localleader>d", "<cmd>VimtexDocPackage<cr>", desc = "Package Documentation", mode = "n" },
	{ "<localleader>w", "<cmd>VimtexCountWords!<CR>", desc = "Word Count" },
	{ "<localleader>p", PdfAnnots, desc = "Pull Annotations" },
	{ "<localleader>P", "<cmd>VimtexContextToggle", desc = "Toggle Context Menu PDF Viewer" },

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
	buffer = vim.api.nvim_get_current_buf(),
})
