local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node

ls.add_snippets("tex", {
	-- =========================================================
	-- GREEK LETTERS (AUTOSNIPPETS)
	-- =========================================================
	s({ trig = ";a", snippetType = "autosnippet", wordTrig = false }, t("\\alpha")),
	s({ trig = ";b", snippetType = "autosnippet", wordTrig = false }, t("\\beta")),
	s({ trig = ";g", snippetType = "autosnippet", wordTrig = false }, t("\\gamma")),
	s({ trig = ";G", snippetType = "autosnippet", wordTrig = false }, t("\\Gamma")),
	s({ trig = ";d", snippetType = "autosnippet", wordTrig = false }, t("\\delta")),
	s({ trig = ";D", snippetType = "autosnippet", wordTrig = false }, t("\\Delta")),
	s({ trig = ";e", snippetType = "autosnippet", wordTrig = false }, t("\\epsilon")),
	s({ trig = ";ve", snippetType = "autosnippet", wordTrig = false }, t("\\varepsilon")),
	s({ trig = ";z", snippetType = "autosnippet", wordTrig = false }, t("\\zeta")),
	s({ trig = ";h", snippetType = "autosnippet", wordTrig = false }, t("\\eta")),
	s({ trig = ";t", snippetType = "autosnippet", wordTrig = false }, t("\\theta")),
	s({ trig = ";vt", snippetType = "autosnippet", wordTrig = false }, t("\\vartheta")),
	s({ trig = ";T", snippetType = "autosnippet", wordTrig = false }, t("\\Theta")),
	s({ trig = ";i", snippetType = "autosnippet", wordTrig = false }, t("\\iota")),
	s({ trig = ";k", snippetType = "autosnippet", wordTrig = false }, t("\\kappa")),
	s({ trig = ";l", snippetType = "autosnippet", wordTrig = false }, t("\\lambda")),
	s({ trig = ";L", snippetType = "autosnippet", wordTrig = false }, t("\\Lambda")),
	s({ trig = ";m", snippetType = "autosnippet", wordTrig = false }, t("\\mu")),
	s({ trig = ";n", snippetType = "autosnippet", wordTrig = false }, t("\\nu")),
	s({ trig = ";x", snippetType = "autosnippet", wordTrig = false }, t("\\xi")),
	s({ trig = ";X", snippetType = "autosnippet", wordTrig = false }, t("\\Xi")),
	s({ trig = ";p", snippetType = "autosnippet", wordTrig = false }, t("\\pi")),
	s({ trig = ";vp", snippetType = "autosnippet", wordTrig = false }, t("\\varpi")),
	s({ trig = ";P", snippetType = "autosnippet", wordTrig = false }, t("\\Pi")),
	s({ trig = ";r", snippetType = "autosnippet", wordTrig = false }, t("\\rho")),
	s({ trig = ";vr", snippetType = "autosnippet", wordTrig = false }, t("\\varrho")),
	s({ trig = ";s", snippetType = "autosnippet", wordTrig = false }, t("\\sigma")),
	s({ trig = ";vs", snippetType = "autosnippet", wordTrig = false }, t("\\varsigma")),
	s({ trig = ";S", snippetType = "autosnippet", wordTrig = false }, t("\\Sigma")),
	s({ trig = ";ta", snippetType = "autosnippet", wordTrig = false }, t("\\tau")),
	s({ trig = ";u", snippetType = "autosnippet", wordTrig = false }, t("\\upsilon")),
	s({ trig = ";U", snippetType = "autosnippet", wordTrig = false }, t("\\Upsilon")),
	s({ trig = ";ph", snippetType = "autosnippet", wordTrig = false }, t("\\phi")),
	s({ trig = ";vph", snippetType = "autosnippet", wordTrig = false }, t("\\varphi")),
	s({ trig = ";Ph", snippetType = "autosnippet", wordTrig = false }, t("\\Phi")),
	s({ trig = ";ch", snippetType = "autosnippet", wordTrig = false }, t("\\chi")),
	s({ trig = ";ps", snippetType = "autosnippet", wordTrig = false }, t("\\psi")),
	s({ trig = ";Ps", snippetType = "autosnippet", wordTrig = false }, t("\\Psi")),
	s({ trig = ";o", snippetType = "autosnippet", wordTrig = false }, t("\\omega")),
	s({ trig = ";O", snippetType = "autosnippet", wordTrig = false }, t("\\Omega")),

	-- =========================================================
	-- BLACKBOARD BOLD
	-- =========================================================
	s(";R", t("\\mathbb{R}")),
	s(";N", t("\\mathbb{N}")),
	s(";Z", t("\\mathbb{Z}")),
	s(";Q", t("\\mathbb{Q}")),
	s(";C", t("\\mathbb{C}")),
	s(";E", t("\\mathbb{E}")),
	s(";F", t("\\mathbb{F}")),
	s(";P", t("\\mathbb{P}")),
	s(";H", t("\\mathbb{H}")),

	-- =========================================================
	-- FIGURES
	-- =========================================================
	s("apafig", {
		t("\\begin{figure}["),
		i(1, "tb"),
		t({ "]", "\t\\caption{" }),
		i(2, "caption"),
		t("}\\label{fig:"),
		i(3, "label"),
		t({ "}", "\t\\includegraphics[width=" }),
		i(4, "0.9"),
		t("\\linewidth]{"),
		i(5, "file"),
		t({ "}", "\t\\figurenote{" }),
		i(6, "note"),
		t({ "}", "\\end{figure}" }),
	}),
	s("chicagofig", {
		t("\\begin{figure}["),
		i(1, "tb"),
		t({ "]", "\t\\includegraphics[width=" }),
		i(2, "0.9"),
		t("\\linewidth]{"),
		i(3, "file"),
		t({ "}", "\t\\caption{" }),
		i(4, "caption"),
		t({ "}\\label{fig:" }),
		i(5, { "label" }),
		t({ "}", "\\end{figure}" }),
	}),
	s("mlafig", {
		t("\\begin{figure}["),
		i(1, "tb"),
		t({ "]", "\t\\includegraphics[width=" }),
		i(2, "0.9"),
		t("\\linewidth]{"),
		i(3, "file"),
		t({ "}", "\t\\caption{" }),
		i(4, "caption"),
		t({ "}\\label{fig:" }),
		i(5, { "label" }),
		t({ "}", "\\end{figure}" }),
	}),

	s("inkfig", {
		t({ "\\begin{figure}[htbp]", "\t\\centering", "\t\\inkfig{" }),
		i(1, "file"),
		t({ "}", "\t\\caption{" }),
		i(2, "caption"),
		t("}\\label{fig:"),
		i(3, "label"),
		t({ "}", "\\end{figure}" }),
	}),

	-- =========================================================
	-- TABLES
	-- =========================================================

	s("papertable", { -- Works for APA, MLA, and Chicago
		t("\\begin{table}["),
		i(1, "tb"),
		t({ "]", "\t\\caption{" }),
		i(2, "caption"),
		t({ "}\\label{tab:" }),
		i(3, "label"),
		t({
			"}",
			"\t\\begin{tabu}{*{4}{X[c]}}",
			"\t\t\\toprule",
			"\t\t\\textbf{Names} & \\textbf{Age} & \\textbf{Height} & \\textbf{Weight (lbs)} \\\\",
			"\t\t\\midrule",
			"\t\tCarter         & 20           & 6'8             & 90                    \\\\",
			"\t\tAbby           & 32           & 5'4             & 100                   \\\\",
			"\t\tMax            & 25           & 6'1             & 100                   \\\\",
			"\t\t\\bottomrule",
			"\t\\end{tabu}",
			"\t\\tablenote{",
		}),
		i(4, "table note"),
		t({ "}", "\\end{table}" }),
	}),

	-- =========================================================
	-- MISC
	-- =========================================================
	s("mdframed", {
		t("\\begin{mdframed}"),
		t({ "", "\t" }),
		i(1, "text"),
		t({ "", "" }),
		t("\\end{mdframed}"),
	}),
	s("mdsum", {
		t("\\begin{mdframed}[frametitle=Summary]"),
		t({ "", "\t" }),
		i(1, "text"),
		t({ "", "" }),
		t("\\end{mdframed}"),
	}),
	s("mdlearn", {
		t("\\begin{mdframed}[frametitle=Learning Objectives]"),
		t({ "", "\t" }),
		i(1, "text"),
		t({ "", "" }),
		t("\\end{mdframed}"),
	}),
	s("mdread", {
		t("\\begin{mdframed}[frametitle=Reading Assignment]"),
		t({ "", "\t" }),
		i(1, "text"),
		t({ "", "" }),
		t("\\end{mdframed}"),
	}),
	s("mdtitle", {
		t("\\begin{mdframed}[frametitle="),
		i(1, "Important"),
		t("]"),
		t({ "", "\t" }),
		i(2, "text"),
		t({ "", "" }),
		t("\\end{mdframed}"),
	}),

	-- =========================================================
	-- Todonotes
	-- =========================================================
	s({ trig = " todo", wordTrig = false }, { t("\\todo[grey]{"), i(1), t("}") }),
	s({ trig = " gtodo", wordTrig = false }, { t("\\todo[green]{"), i(1), t("}") }),
	s({ trig = " btodo", wordTrig = false }, { t("\\todo[blue]{"), i(1), t("}") }),

	-- =========================================================
	-- CITATIONS
	-- =========================================================
	s({ trig = " pcite", wordTrig = false }, { t("~\\parencite{"), i(1, "citekey"), t("}") }),
	s({ trig = " acite", wordTrig = false }, { t("~\\autocite{"), i(1, "citekey"), t("}") }),
	s(
		{ trig = " numpcite", wordTrig = false },
		{ t("~\\parencite["), i(1, "pagenumber"), t("]{"), i(2, "citekey"), t("}") }
	),
	s(
		{ trig = " numacite", wordTrig = false },
		{ t("~\\autocite["), i(1, "pagenumber"), t("]{"), i(2, "citekey"), t("}") }
	),
	s("tcite", { t("\\textcite{"), i(1, "citekey"), t("}") }),
	-- Multiple citations
	s({ trig = " cites", wordTrig = false }, { t("~\\autocites{"), i(1, "key1"), t("}{"), i(2, "key2"), t("}") }),
})
