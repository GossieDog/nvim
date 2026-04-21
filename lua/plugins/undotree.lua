return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
	},
	config = function()
		-- Optional: Persistent undo even after closing Neovim
		vim.opt.undofile = true
	end,
}
