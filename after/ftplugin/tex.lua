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
	{ "<localleader>", group = "LaTeX", icon = "" },
	{ "<localleader>a", "<plug>(vimtex-context-menu)", desc = "Context Menu" },

	{ "<localleader>t", group = "Tools" },
	{ "<localleader>tc", "<plug>(vimtex-clean)", desc = "Vimtex Clean" },
	{ "<localleader>tC", "<plug>(vimtex-clean-full)", desc = "Vimtex Clean Full" },
	{ "<localleader>tg", "<plug>(vimtex-status)", desc = "Vimtex Status" },
	{ "<localleader>tG", "<plug>(vimtex-status-all)", desc = "Vimtex Status All" },
	{ "<localleader>tk", "<plug>(vimtex-stop)", desc = "Stop" },
	{ "<localleader>tK", "<plug>(vimtex-stop-all)", desc = "Stop All" },
	{ "<localleader>tm", "<plug>(vimtex-imaps-list)", desc = "Maps List" },
	{ "<localleader>tt", "<cmd>lua Snacks.picker.vimtex_toc()<cr>", desc = "Open TOC" },
	{ "<localleader>tT", "<plug>(vimtex-toc-toggle)", desc = "Toggle TOC" },
	{ "<localleader>tx", "<plug>(vimtex-reload)", desc = "Reload" },
	{ "<localleader>tX", "<plug>(vimtex-reload-state)", desc = "Reload State" },
	{ "<localleader>ts", "<plug>(vimtex-toggle-main)", desc = "Toggle Main" },
	{ "<localleader>tv", "<plug>(vimtex-view)", desc = "View" },
	{ "<localleader>tw", "<cmd>VimtexCountWords!<CR>", desc = "Word Count" },
	{ "<localleader>tp", PdfAnnots, desc = "Pull Annotations" },
	{
		"<localleader>tP",
		"<cmd>VimtexContextToggle<cr>",
		desc = "Toggle Context Menu PDF Viewer",
	},

	{ "<localleader>d", group = "Diagnostics" },
	{ "<localleader>de", "<plug>(vimtex-errors)", desc = "Vimtex Errors" },
	{ "<localleader>dq", "<plug>(vimtex-log)", desc = "Log" },

	{ "<localleader>i", group = "Info" },
	{ "<localleader>ii", "<plug>(vimtex-info)", desc = "Vimtex Info" },
	{ "<localleader>iI", "<plug>(vimtex-info-full)", desc = "Info Full" },
	{
		"<localleader>id",
		"<cmd>VimtexDocPackage<cr>",
		desc = "Package Documentation",
		mode = "n",
	},

	{ "<localleader>b", group = "Build" },
	{ "<localleader>bl", "<plug>(vimtex-compile)", desc = "Build" },
	{ "<localleader>bL", "<plug>(vimtex-compile-selected)", desc = "Build Selected" },
	{ "<localleader>bo", "<plug>(vimtex-compile-output)", desc = "Build Output" },
	{ "<localleader>bs", "<plug>(vimtex-compile-ss)", desc = "Build SS" },

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
