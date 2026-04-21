return {
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
}
