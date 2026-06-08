-- Using LazyVim default options

local opt = vim.opt

local diagnostic_icons = require("config.icons")

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically.
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Set to a to enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 10 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = true --Enable line wrap
opt.breakindent = true
opt.textwidth = 0
opt.sessionoptions:append("globals")

-- CTRL l spell correction keymap (From Gilles Castel's setup)
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true })

-- CTRL arrows for window resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +10<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -10<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +10<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -10<CR>")

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_icons.error,
			[vim.diagnostic.severity.WARN] = diagnostic_icons.warn,
			[vim.diagnostic.severity.INFO] = diagnostic_icons.info,
			[vim.diagnostic.severity.HINT] = diagnostic_icons.hint,
		},
	},
	float = {
		style = "minimal",
		border = "rounded",
		source = true,
	},
})
