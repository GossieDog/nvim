return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({

				-- SINGLE KEY --

				{
					"<leader>r",
					"<cmd>restart<cr>",
					desc = "Restart",
					mode = "n",
					icon = "󰜉",
				},
				{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
				{ "<leader>q", "<cmd>wa! | qa!<CR>", desc = "Quit", mode = "n" },
				{
					"<leader>C",
					"<cmd>Telescope colorscheme<CR>",
					desc = "Change Colorscheme",
					mode = "n",
					icon = "",
				},
				{ "<leader>c", "[s1z=`]", desc = "Fix Spelling", mode = "n", icon = "󰓆" },
				{ "<leader>z", "<cmd>lua Snacks.zen()<cr>", desc = "Toggle Zen Mode", mode = "n" },

				-- FIND GROUP --

				{ "<leader>f", group = "Find", mode = "n" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffer" },
				{
					"<leader>fz",
					"<cmd>Telescope bibtex theme=dropdown layout_config={width=0.8}<cr>",
					desc = "Citations",
				},
				{ "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
				{ "<leader>fg", "<cmd>Telescope git_commits<cr>", desc = "Git History" },
				{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
				{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
				{ "<leader>fy", "<cmd>YankyRingHistory<cr>", desc = "Yank History" },
				{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics", mode = "n" },
				{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File", mode = "n" },
				{ "<leader>fu", "<cmd>lua require('telescope').extensions.undo.undo()<cr>", desc = "Undo", mode = "n" },
				{ "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", mode = "n" },
				{
					"<leader>fc",
					"<cmd>Telescope find_files cwd=~/.config/nvim<cr>",
					desc = "Config File",
					mode = "n",
				},
				{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Text", mode = "n" },
				{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols", mode = "n" },

				-- GIT GROUP --

				{ "<leader>g", group = "Git" },
				{ "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>", desc = "LazyGit" },
				{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Branches" },
				{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
				{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
				{ "<leader>gk", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev Hunk", icon = "󰮲" },
				{ "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk", icon = "󰮰" },
				{ "<leader>gl", "<cmd>Gitsigns blame_line<CR>", desc = "Line Blame", icon = "󰊢" },
				{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk", icon = "󰆈" },

				-- LSP GROUP --

				{ "<leader>l", group = "LSP", icon = "󰅴" },
				{ "<leader>lm", "<cmd>Mason<cr>", desc = "Open Mason", mode = "n" },
				{ "<leader>lu", "<cmd>MasonUpdate<cr>", desc = "Mason Update", mode = "n" },
				{ "<leader>ll", "<cmd>MasonLog<cr>", desc = "Mason Log", mode = "n" },

				-- BUFFER GROUP

				{ "<leader>b", group = "Buffer" },
				{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer", mode = "n" },
				{ "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right", mode = "n" },
				{ "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left", mode = "n" },
				{ "<leader>bP", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Buffer", mode = "n" },
				{ "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer", mode = "n" },
				{ "<leader>br", "<cmd>BufferLineCloseRight <cr>", desc = "Close Right Buffers", mode = "n" },
				{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left Buffers", mode = "n" },

				{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer", mode = "n" },
				{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer", mode = "n" },

				{ "<leader>b\\", "<cmd>vsplit<CR>", desc = "Vertical Split", icon = "󰤼" },
				{ "<leader>b-", "<cmd>split<CR>", desc = "Horizontal Split", icon = "󰤼" },
				{ "<leader>bq", "<C-w>q", desc = "Close Window", icon = "" },

				{ "<leader>t", group = "Tools", icon = "" },
				{ "<leader>ts", "<cmd>set spell!<cr>", desc = "Toggle Spell Check", mode = "n" },
				{
					"<leader>tc",
					"<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>",
					desc = "Toggle Copilot",
				},
				{ "<leader>tC", "<cmd>CloakToggle<cr>", desc = "Toggle Cloak", mode = "n" },
				{
					"<leader>tf",
					function()
						require("conform").format({
							lsp_fallback = true,
							async = false,
							timeout_ms = 500,
						})
					end,
					desc = "Format",
					mode = "n",
				},
				{
					"<leader>tl",
					function()
						require("lint").try_lint()
					end,
					desc = "Lint",
					mode = "n",
				},

				-- DIAGNOSTICS GROUP --

				{ "<leader>d", group = "Diagnostics" },
				{ "<leader>dp", "<cmd>Trouble diagnostics toggle<cr>", desc = "Project Diagnostics" },
				{ "<leader>db", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
				{ "<leader>ds", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
				{ "<leader>dq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
				{ "<leader>dd", vim.diagnostic.open_float, desc = "Open diagnostic under cursor" },
				{
					"<leader>dt",
					function()
						local current = vim.diagnostic.config().virtual_text
						vim.diagnostic.config({ virtual_text = not current })
					end,
					desc = "Toggle virtual text",
				},

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

				-- SESSION GROUP --

				{ "<leader>S", group = "Sessions", icon = "󰆔" },
				{ "<leader>Sd", "<cmd>SessionManager delete_session<CR>", desc = "Delete", icon = "󰚌" },
				{ "<leader>Sl", "<cmd>SessionManager load_session<CR>", desc = "Load", icon = "󰉖" },
				{ "<leader>Ss", "<cmd>SessionManager save_current_session<CR>", desc = "Save", icon = "󰆓" },

				-- AI GROUP --

				{ "<leader>a", group = "Avante", icon = "󰚩" },
				{ "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Ask" },
				{ "<leader>aB", "<cmd>lua require('avante.api').add_all_buffers()<cr>", desc = "Add All Open Buffers" },
				{ "<leader>ac", "<cmd>AvanteClear<cr>", desc = "Clear Chat History" },
				{ "<leader>aC", "<cmd>AvanteChat<cr>", desc = "Start Chat" },
				{ "<leader>ad", "<cmd>lua require('avante.api').toggle_debug()<cr>", desc = "Toggle Debug" },
				{ "<leader>af", "<cmd>AvanteFocus<cr>", desc = "Focus" },
				{ "<leader>ah", "<cmd>AvanteHistory<cr>", desc = "Select History" },
				{ "<leader>an", "<cmd>AvanteChatNew<cr>", desc = "Create New Chat" },
				{ "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "Refresh" },
				{ "<leader>aR", "<cmd>AvanteShowRepoMap<cr>", desc = "Display Repo Map" },
				{ "<leader>as", desc = "Toggle Suggestion" },
				{ "<leader>aS", "<cmd>AvanteStop<cr>", desc = "Stop" },
				{ "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Toggle" },
				{ "<leader>az", "<cmd>lua require('avante.api').zen_mode()<cr>", desc = "Toggle Zen Mode" },
				{ "<leader>a?", "<cmd>AvanteModels<cr>", desc = "Select Model" },
				{ "<leader>am", desc = "Select ACP Mode" },
				{ "<leader>aM", desc = "Select ACP Model" },
				{
					"<leader>a+",
					function()
						local tree_ext = require("avante.extensions.nvim_tree")
						tree_ext.add_file()
					end,
					desc = "Select file in NvimTree",
				},
				{
					"<leader>a-",
					function()
						local tree_ext = require("avante.extensions.nvim_tree")
						tree_ext.remove_file()
					end,
					desc = "Deselect file in NvimTree",
				},

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
		end,
	},
}
