return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					enabled = false, -- Disable char mode so 'f' uses jump() instead
				},
			},
		},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    -- Simulate nvim-treesitter incremental selection
    { "<c-space>", mode = { "n", "o", "x" },
      function()
        require("flash").treesitter({
          actions = {
            ["<c-space>"] = "next",
            ["<BS>"] = "prev"
          }
        })
      end, desc = "Treesitter Incremental Selection" },
  },
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					tex = { "latexindent" },
					markdown = { "markdownlint-cli2", "markdown-toc", "prettier" },
					html = { "prettier" },
					css = { "prettier" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 5000,
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_general_viewer = "zathura"
			vim.g.vimtex_context_pdf_viewer = "zathura"
			-- vim.g.vimtex_view_sioyek_options = "--new-window"
			vim.g.vimtex_bibliography_file_handler = function(file)
				vim.fn.jobstart({ "open", file }, { detach = true })
			end
			vim.g.vimtex_quickfix_ignore_filters = { -- Filter out common noise
				"Underfull",
				"Overfull",
				"specifier changed to",
				"Token not allowed in a PDF string",
				"Package hyperref Warning",
				"Marginpar on page",
			}
			vim.g.vimtex_log_ignore = { -- Suppress specific log messages
				"Underfull",
				"Overfull",
				"specifier changed to",
				"Token not allowed in a PDF string",
				"Package hyperref Warning",
				"Marginpar on page",
			}
			vim.g.vimtex_clean_enabled = 1
			vim.g.vimtex_clean_patterns = {
				"*.aux",
				"*.bbl",
				"*.blg",
				"*.brf",
				"*.fls",
				"*.fdb_latexmk",
				"*.log",
				"*.out",
				"*.toc",
				"*.nav",
				"*.snm",
				"*.vrb",
				"*.run.xml",
				"*.bcf",
				"*.synctex",
				"*.synctex.gz",
			}
		end,
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tex",
				callback = function()
					vim.opt_local.spell = true
					vim.opt_local.spelllang = { "en_us" }
					vim.keymap.set(
						"n",
						"<localleader>lw",
						"<cmd>VimtexCountWords!<cr>",
						{ buffer = true, desc = "VimTeX Count Words" }
					)
					vim.keymap.set("n", "<localleader>lt", function()
						return require("vimtex.snacks").toc()
					end, { buffer = true, desc = "Open TOC", remap = false })
				end,
			})
			-- vim.api.nvim_create_autocmd("VimLeavePre", {
			-- 	pattern = "*.tex",
			-- 	callback = function()
			-- 		vim.cmd("VimtexClean")
			-- 	end,
			-- })
			vim.api.nvim_create_user_command("TexCountSection", function()
				local output = vim.fn.systemlist("texcount -sub=section " .. vim.fn.expand("%"))
				vim.cmd("new")
				vim.bo.buftype = "nofile"
				vim.bo.bufhidden = "wipe"
				vim.bo.swapfile = false
				vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
			end, {})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({
				modes = {
					diagnostics = {
						mode = "diagnostics",
						filter = {
							severity = {
								vim.diagnostic.severity.ERROR,
								vim.diagnostic.severity.WARN,
								vim.diagnostic.severity.INFO,
								-- vim.diagnostic.severity.HINT,
							},
						},
						-- preview = {
						-- 	type = "split",
						-- 	relative = "editor",
						-- 	position = "right",
						-- 	size = 0.3,
						-- 	wo = {
						-- 		wrap = true,
						-- 	},
						-- },
					},
				},
			})
		end,
	},
	{
		"nvim-mini/mini.nvim",
		version = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "gsa",
					delete = "gsd",
					find = "gsf",
					find_left = "gsF",
					highlight = "gsh",
					replace = "gsr",
					update_n_lines = "gsn",
				},
				custom_surroundings = {
					["e"] = { output = { left = "\\begin{equation}", right = "\\end{equation}" } },
					["A"] = { output = { left = "\\begin{align}", right = "\\end{align}" } },
					["M"] = { output = { left = "\\begin{matrix}", right = "\\end{matrix}" } },
					["P"] = { output = { left = "\\begin{pmatrix}", right = "\\end{pmatrix}" } },
					["C"] = { output = { left = "\\begin{cases}", right = "\\end{cases}" } },
					["F"] = { output = { left = "\\begin{figure}", right = "\\end{figure}" } },
					["D"] = { output = { left = "\\begin{document}", right = "\\end{document}" } },
					["S"] = { output = { left = "\\begin{split}", right = "\\end{split}" } },
					["I"] = { output = { left = "\\begin{itemize}", right = "\\end{itemize}" } },
					["E"] = { output = { left = "\\begin{enumerate}", right = "\\end{enumerate}" } },
					["$"] = { output = { left = "$", right = "$" } },
					["i"] = { output = { left = "\\textit{", right = "}" } },
					["b"] = { output = { left = "\\textbf{", right = "}" } },
					["t"] = { output = { left = "\\texttt{", right = "}" } },
					["s"] = { output = { left = "\\textsc{", right = "}" } },
					["u"] = { output = { left = "\\underline{", right = "}" } },
					["o"] = { output = { left = "\\overline{", right = "}" } },
				},
			})

			require("mini.pairs").setup({
				-- empty setup, using defaults
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "▎" },
				topdelete = { text = "▎" },
				changedelete = { text = "▎" },
			},
			-- ... other options
		},
	},
	{
		"gbprod/yanky.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim", lazy = true },
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
		},
	},
}
