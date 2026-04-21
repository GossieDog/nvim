return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
			-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#282828" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "#282828" })
			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#282828" })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "#282828" })
		end,
	},
}
