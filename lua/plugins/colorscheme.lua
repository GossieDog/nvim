return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#282828" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "#282828" })
			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#282828" })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "#282828" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
			-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#282828" })
			-- vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#282828" })
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},
	{
		"vague-theme/vague.nvim",
		lazy = true,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
	},
	{
		"e-ink-colorscheme/e-ink.nvim",
		lazy = true,
	},
}
