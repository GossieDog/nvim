local icons = require("config.icons")

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {
							"snacks_dashboard",
							"NvimTree",
							"Avante",
							"AvanteInput",
							"AvanteSelectedFiles",
							"AvanteTodos",
						},
						winbar = { "Avante", "AvanteInput", "AvanteSelectedFiles", "AvanteTodos" },
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						-- tabline = 1000,
						-- winbar = 1000,
						refresh_time = 16, -- ~60fps
						events = {
							"WinEnter",
							"BufEnter",
							"BufWritePost",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
						},
					},
				},
				sections = {
					lualine_a = {
						"mode",
					},
					lualine_b = {
						{
							"branch",
							icon = icons.git,
						},
						{
							"diagnostics",
							symbols = {
								error = icons.error,
								warn = icons.warn,
								info = icons.info,
								hint = icons.hint,
							},
						},
					},
					lualine_c = { { "filename", path = 1 } },
					lualine_x = {
						"encoding",
						"filetype",
						{
							"diff",
							symbols = {
								added = icons.added,
								modified = icons.modified,
								removed = icons.removed,
							},
						},
					},
					lualine_y = { "progress" },
					lualine_z = {
						function()
							return os.date("%R")
						end,
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", path = 1 } },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				show_buffer_close_icons = false,
				show_close_icon = false,
				always_show_bufferline = false,
				separator_style = "slant",
				sort_by = "directory",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			dashboard = {
				enabled = true,
				preset = {
					header = [[
                                                                         
                                                                       
         ████ ██████           █████      ██                     
        ███████████             █████                             
        █████████ ███████████████████ ███   ███████████   
       █████████  ███    █████████████ █████ ██████████████   
      █████████ ██████████ █████████ █████ █████ ████ █████   
    ███████████ ███    ███ █████████ █████ █████ ████ █████  
   ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                         ]],
					keys = {
						{ icon = "", key = "f", desc = "Find File", action = ":Telescope find_files" },
						{ icon = "󰦨", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
						{
							icon = "",
							key = "r",
							desc = "Recent Files",
							action = ":Telescope oldfiles",
						},
						{
							icon = "",
							key = "c",
							desc = "Config",
							action = ":Telescope find_files cwd=~/.config/nvim",
						},
						{
							icon = "",
							key = "t",
							desc = "Todo List",
							action = ":e ~/Documents/SFU-Coursework/GeneralTodo.md",
						},
						{
							icon = "",
							key = "l",
							desc = "Load Session",
							action = ":SessionManager load_session",
						},
						{
							icon = "󰑓",
							key = "s",
							desc = "Restore Session",
							action = ":SessionManager load_last_session",
						},
						{
							icon = "󰒲",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = "", key = "h", desc = "Check Health", action = ":checkhealth" },
						{ icon = "󰈆", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			quickfile = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = {
				enabled = true,
				folds = {
					open = true, -- show open fold icons
					git_hl = true, -- use Git Signs hl for fold icons
				},
			},
			zen = {
				enabled = true,
				toggles = {
					dim = true,
					diagnostics = false,
					line_number = false,
					relative_number = false,
				},
				win = {
					width = 85,
					backdrop = {
						transparent = false,
						blend = 99,
					},
				},
				on_open = function()
					vim.fn.system("tmux set status off")
				end,
				on_close = function()
					vim.fn.system("tmux set status on")
				end,
			},
			lazygit = { enabled = true },
		},
	},
}
