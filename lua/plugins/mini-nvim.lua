return {
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
				["M"] = { output = { left = "\\begin{matrix}", right = "\\end{matrix}" } },
				["P"] = { output = { left = "\\begin{pmatrix}", right = "\\end{pmatrix}" } },
				["C"] = { output = { left = "\\begin{cases}", right = "\\end{cases}" } },
				["F"] = { output = { left = "\\begin{figure}", right = "\\end{figure}" } },
				["D"] = { output = { left = "\\begin{document}", right = "\\end{document}" } },
				["S"] = { output = { left = "\\begin{split}", right = "\\end{split}" } },
				["I"] = { output = { left = "\\begin{itemize}", right = "\\end{itemize}" } },
				["E"] = { output = { left = "\\begin{enumerate}", right = "\\end{enumerate}" } },
				["$"] = { output = { left = "$", right = "$" } },
				["i"] = { output = { left = "\\textit{", right = "}" } },
				["b"] = { output = { left = "\\textbf{", right = "}" } },
				["t"] = { output = { left = "\\texttt{", right = "}" } },
				["s"] = { output = { left = "\\textsc{", right = "}" } },
				["u"] = { output = { left = "\\underline{", right = "}" } },
				["o"] = { output = { left = "\\overline{", right = "}" } },
			},
		})

		require("mini.pairs").setup({
			-- empty setup, using defaults
		})

		require("mini.icons").setup({
			-- empty setup, using defaults
		})
	end,
}
