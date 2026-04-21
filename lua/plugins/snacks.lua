return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = "", key = "f", desc = "Find File", action = ":Telescope find_files" },
					{ icon = "", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{
						icon = "",
						key = "r",
						desc = "Recent Files",
						action = ":Telescope oldfiles",
					},
					{
						icon = "",
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
						icon = "󰉖",
						key = "l",
						desc = "Load Session",
						action = ":SessionManager load_session",
					},
					{
						icon = "",
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
					{ icon = "", key = "q", desc = "Quit", action = ":qa" },
				},
				-- 			header = [[
				--  _   _ ______ ______      _______ __  __
				-- | \ | |  ____/ __ \ \    / /_   _|  \/  |
				-- |  \| | |__ | |  | \ \  / /  | | | \  / |
				-- | . ` |  __|| |  | |\ \/ /   | | | |\/| |
				-- | |\  | |___| |__| | \  /   _| |_| |  | |
				-- |_| \_|______\____/   \/   |_____|_|  |_|]],
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
			},
			-- sections = {
			-- 	{
			-- 		section = "terminal",
			-- 		cmd = "chafa $HOME/.config/screenshots/dashboard.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
			-- 		height = 17,
			-- 		padding = 1,
			-- 	},
			-- 	{
			-- 		pane = 2,
			-- 		{ section = "keys", gap = 1, padding = 1 },
			-- 		{ section = "startup" },
			-- 	},
			-- },
		},
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		-- scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
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
				wo = {
					signcolumn = "no", -- Explicitly disable sign column
				},
			},
		},
		lazygit = { enabled = true },
		keys = {},
	},
}
