return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
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
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				tex = { "latexindent" },
				markdown = { "markdownlint-cli2", "markdown-toc" },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			},
		},
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

			vim.g.vimtex_quickfix_mode = 0

			vim.g.vimtex_fold_enabled = 1
			vim.g.vimtex_fold_types = {
				envs = { enabled = 0 },
				items = { enabled = 0 },
			}
			vim.g.vimtex_quickfix_ignore_filters = {
				"Underfull",
				"Overfull",
				"Marginpar on page",
			}
		end,
		config = function()
			vim.api.nvim_create_user_command("VimtexContextToggle", function()
				if vim.g.vimtex_context_pdf_viewer == "zathura" then
					vim.g.vimtex_context_pdf_viewer = "okular"
					print("Context PDF viewer: okular")
				else
					vim.g.vimtex_context_pdf_viewer = "zathura"
					print("Context PDF viewer: zathura")
				end
			end, {})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
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
		},
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
					["F"] = { output = { left = "\\begin{figure}", right = "\\end{figure}" } },
					["D"] = { output = { left = "\\begin{document}", right = "\\end{document}" } },
					["I"] = { output = { left = "\\begin{itemize}", right = "\\end{itemize}" } },
					["E"] = { output = { left = "\\begin{enumerate}", right = "\\end{enumerate}" } },
					["$"] = { output = { left = "$", right = "$" } },
					["i"] = { output = { left = "\\textit{", right = "}" } },
					["b"] = { output = { left = "\\textbf{", right = "}" } },
					["t"] = { output = { left = "\\texttt{", right = "}" } },
					["s"] = { output = { left = "\\textsc{", right = "}" } },
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
