return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-bibtex.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local bibtex_actions = require("telescope-bibtex.actions")
			require("telescope").setup({
				defaults = {
					layout_strategy = "flex",
				},
				pickers = {},
				extensions = {
					bibtex = {
						-- Depth for the *.bib file
						depth = 1,
						-- Custom format for citation label
						custom_formats = {},
						-- Format to use for citation label.
						-- Try to match the filetype by default, or use 'plain'
						format = "",
						-- Path to global bibliographies (placed outside of the project)
						global_files = {
							"/home/ericfan/Documents/SFU-Coursework/Zotero.bib",
						},
						bibtex_file = "/home/ericfan/Documents/SFU-Coursework/Zotero.bib",
						-- Define the search keys to use in the picker
						search_keys = { "author", "year", "title" },
						-- Template for the formatted citation
						citation_format = "{{author}} ({{year}}), {{title}}.",
						-- Only use initials for the authors first name
						citation_trim_firstname = true,
						-- Max number of authors to write in the formatted citation
						-- following authors will be replaced by "et al."
						citation_max_auth = 2,
						-- Context awareness disabled by default
						context = true,
						-- Fallback to global/directory .bib files if context not found
						-- This setting has no effect if context = false
						context_fallback = true,
						-- Wrapping in the preview window is disabled by default
						wrap = false,
						-- user defined mappings
						mappings = {
							i = {
								["<CR>"] = bibtex_actions.key_append("%s"), -- format is determined by filetype if the user has not set it explictly
								["<C-e>"] = bibtex_actions.entry_append,
								["<C-c>"] = bibtex_actions.citation_append("{{author}} ({{year}}), {{title}}."),
							},
						},
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("bibtex")
			require("telescope").load_extension("undo")
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
			"rafamadriz/friendly-snippets",
			"archie-judd/blink-cmp-words",
		},
		event = { "InsertEnter", "CmdlineEnter" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				menu = {
					border = "rounded",
					scrollbar = false,
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "source_name" },
						},
						components = {
							label = { width = { fixed = 30 } },
						},
					},
				},
				documentation = {
					window = {
						border = "rounded",
						scrollbar = false,
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			cmdline = {
				keymap = {
					-- recommended, as the default keymap will only show and select the next item
					["<Tab>"] = { "show", "accept" },
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
				},
				completion = {
					menu = {
						auto_show = true,
					},
					ghost_text = { enabled = false },
				},
			},
			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {

					-- Use the thesaurus source
					thesaurus = {
						name = "blink-cmp-words",
						module = "blink-cmp-words.thesaurus",
						-- All available options
						opts = {
							-- A score offset applied to returned items.
							-- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
							score_offset = 0,

							-- Default pointers define the lexical relations listed under each definition,
							-- see Pointer Symbols below.
							-- Default is as below ("antonyms", "similar to" and "also see").
							definition_pointers = { "!", "&", "^" },

							-- The pointers that are considered similar words when using the thesaurus,
							-- see Pointer Symbols below.
							-- Default is as below ("similar to", "also see" }
							similarity_pointers = { "&", "^" },

							-- The depth of similar words to recurse when collecting synonyms. 1 is similar words,
							-- 2 is similar words of similar words, etc. Increasing this may slow results.
							similarity_depth = 2,
						},
					},

					-- Use the dictionary source
					dictionary = {
						name = "blink-cmp-words",
						module = "blink-cmp-words.dictionary",
						-- All available options
						opts = {
							-- The number of characters required to trigger completion.
							-- Set this higher if completion is slow, 3 is default.
							dictionary_search_threshold = 3,

							-- See above
							score_offset = 0,

							-- See above
							definition_pointers = { "!", "&", "^" },
						},
					},
				},

				-- Setup completion by filetype
				per_filetype = {
					text = { "lsp", "path", "dictionary" },
					markdown = { "lsp", "path", "thesaurus" },
					tex = { "lsp", "snippets", "dictionary", "thesaurus", "path" },
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
		config = function(_, opts)
			require("blink.cmp").setup(opts)
			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpMenuOpen",
				callback = function()
					vim.b.copilot_suggestion_hidden = true
				end,
			})
			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpMenuClose",
				callback = function()
					vim.b.copilot_suggestion_hidden = false
				end,
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = { "rafamadriz/friendly-snippets" },
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			require("luasnip").setup({
				enable_autosnippets = true,
			})
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			-- optionally enable 24-bit colour
			vim.opt.termguicolors = true
		end,
		config = function()
			require("nvim-tree").setup({
				git = {
					enable = true,
					ignore = true,
					timeout = 500,
				},
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
					signcolumn = "no",
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
			},
		},
		lazy = false,
		build = ":TSUpdate",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true

			-- Or, disable per filetype (add as you like)
			-- vim.g.no_python_maps = true
			-- vim.g.no_ruby_maps = true
			-- vim.g.no_rust_maps = true
			-- vim.g.no_go_maps = true
		end,
		config = function()
			local ensure_installed = {
				"html",
				"javascript",
				"css",
				"gitignore",
				"json",
				"bash",
				"vim",
				"vimdoc",
				"lua",
				"scss",
				"regex",
				"yaml",
			}
			require("nvim-treesitter").install(ensure_installed)

			require("nvim-treesitter-textobjects").setup({
				select = {
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						-- ['@class.outer'] = '<c-v>', -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true of false
					include_surrounding_whitespace = false,
				},
			})

			-- keymaps
			-- You can use the capture groups defined in `textobjects.scm`
			vim.keymap.set({ "x", "o" }, "af", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "if", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end)
			-- You can also use captures from other query groups like `locals.scm`
			vim.keymap.set({ "x", "o" }, "as", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
			end)
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
		},
		config = function()
			-- Optional: Persistent undo even after closing Neovim
			vim.opt.undofile = true
		end,
	},
}
