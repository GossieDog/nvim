return {
	{
		"nvim-telescope/telescope.nvim",
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
				defaults = {},
				pickers = {
					find_files = {
						theme = "dropdown",
						layout_config = {
							width = 0.8,
						},
					},
					-- buffers = {
					-- 	theme = "dropdown",
					-- },
					-- resume = {
					-- 	theme = "dropdown",
					-- },
					-- git_commits = {
					-- 	theme = "dropdown",
					-- },
					-- help_tags = {
					-- 	theme = "dropdown",
					-- },
					-- YankyRingHistory = {
					-- 	theme = "dropdown",
					-- },
					-- diagnostics = {
					-- 	theme = "dropdown",
					-- },
					-- oldfiles = {
					-- 	theme = "dropdown",
					-- },
				},
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
		event = { "InsertEnter", "CmdlineEnter" },
		-- optional: provides snippets for the snippet source
		dependencies = {
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
			"rafamadriz/friendly-snippets",
			"archie-judd/blink-cmp-words",
		},

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
			keymap = { preset = "enter" },

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
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},
}
