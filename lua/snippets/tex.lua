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
	-- MATH: BASIC
	-- =========================================================
	s("im", { t("$"), i(1), t("$") }),
	s("dm", { t("\\["), t({ "", "\t" }), i(1), t({ "", "\\]" }) }),
	-- Inline equation environment (numbered)
	s("eq", {
		t({ "\\begin{equation}", "\t" }),
		i(1),
		t({ "", "\\end{equation}" }),
	}),
	-- Multi-line equation (split inside equation for alignment + numbering)
	s("eqs", {
		t({ "\\begin{equation}", "\t\\begin{split}", "\t\t" }),
		i(1),
		t({ "", "\t\\end{split}", "\\end{equation}" }),
	}),
	s("ali", { t("\\begin{align*}"), t({ "", "\t" }), i(1), t({ "", "\\end{align*}" }) }), -- unnumbered
	s("alin", { t("\\begin{align}"), t({ "", "\t" }), i(1), t({ "", "\\end{align}" }) }), -- numbered
	s("gath", { t("\\begin{gather*}"), t({ "", "\t" }), i(1), t({ "", "\\end{gather*}" }) }),
	s("frac", { t("\\frac{"), i(1, "num"), t("}{"), i(2, "den"), t("}") }),
	s("binom", { t("\\binom{"), i(1, "a"), t("}{"), i(2, "b"), t("}") }),
	-- Fixed: lower limit first, upper limit second (standard convention)
	s("int", {
		t("\\int_{"),
		i(1, "a"),
		t("}^{"),
		i(2, "b"),
		t("} "),
		i(3),
		t(" \\, \\mathrm{d}"),
		i(4, "x"),
	}),
	-- Indefinite integral
	s("iint", { t("\\int "), i(1), t(" \\, \\mathrm{d}"), i(2, "x") }),
	s("text", { t("\\text{"), i(1, "text"), t("}") }),
	s("sqrt", { t("\\sqrt{"), i(1), t("}") }),
	s("sqrtn", { t("\\sqrt["), i(1, "n"), t("]{"), i(2), t("}") }),
	s("lim", { t("\\lim_{"), i(1, "x"), t(" \\to "), i(2, "\\infty"), t("} "), i(3) }),

	-- =========================================================
	-- MATH: OPERATORS & SYMBOLS
	-- =========================================================
	-- Fixed: lower index first, upper second (standard convention)
	s("sum", { t("\\sum_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} "), i(3) }),
	-- Double-indexed sum with substack
	s("sumd", {
		t("\\sum_{\\substack{"),
		i(1, "i=1"),
		t(" \\\\ "),
		i(2, "j=1"),
		t("}}^{"),
		i(3, "n"),
		t("} "),
		i(4),
	}),
	s("prod", { t("\\prod_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} "), i(3) }),
	s("inf", t("\\infty")),
	s("xx", t("\\times")),
	s("cdot", t("\\cdot")),
	s("oplus", t("\\oplus")),
	s("otimes", t("\\otimes")),
	s("...", t("\\ldots")),
	s("c...", t("\\cdots")),
	s("norm", { t("\\left\\|"), i(1), t("\\right\\|") }),
	s("abs", { t("\\left|"), i(1), t("\\right|") }),
	s("set", { t("\\{"), i(1), t("\\}") }),
	-- Definition-equals
	s("defeq", t("\\coloneqq")),
	s(":=", t("\\coloneqq")),

	-- =========================================================
	-- MATH: ACCENTS & DECORATORS
	-- =========================================================
	s("hat", { t("\\hat{"), i(1), t("}") }),
	s("bar", { t("\\bar{"), i(1), t("}") }),
	s("til", { t("\\tilde{"), i(1), t("}") }),
	s("vec", { t("\\vec{"), i(1), t("}") }),
	s("dot", { t("\\dot{"), i(1), t("}") }),
	s("ddot", { t("\\ddot{"), i(1), t("}") }),
	s("wh", { t("\\widehat{"), i(1), t("}") }),
	s("wt", { t("\\widetilde{"), i(1), t("}") }),
	s("ol", { t("\\overline{"), i(1), t("}") }),
	s("ul2", { t("\\underline{"), i(1), t("}") }), -- renamed to avoid conflict with text ul
	s("overset", { t("\\overset{"), i(1), t("}{"), i(2), t("}") }),
	s("undset", { t("\\underset{"), i(1), t("}{"), i(2), t("}") }),

	-- =========================================================
	-- MATH: NAMED OPERATORS
	-- =========================================================
	-- Standard LaTeX operators (no \operatorname needed)
	s("min", t("\\min")),
	s("max", t("\\max")),
	s("sup", t("\\sup")),
	s("inf2", t("\\inf")), -- avoid conflict with \infty snippet
	s("limsup", t("\\limsup")),
	s("liminf", t("\\liminf")),
	s("det", t("\\det")),
	s("dim", t("\\dim")),
	s("deg", t("\\deg")),
	s("exp", t("\\exp")),
	s("log", t("\\log")),
	s("ln", t("\\ln")),
	s("sin", t("\\sin")),
	s("cos", t("\\cos")),
	s("tan", t("\\tan")),
	-- Custom operators (require \operatorname or \DeclareMathOperator in preamble)
	s("ker", t("\\ker")),
	s("im", { t("\\operatorname{im}") }), -- note: shadows the inline-math "im" snippet above; remove one
	s("rank", t("\\operatorname{rank}")),
	s("tr", t("\\operatorname{tr}")),
	s("span", t("\\operatorname{span}")),
	s("col", t("\\operatorname{col}")),
	s("null", t("\\operatorname{null}")),
	s("grad", t("\\nabla")),
	s("div", t("\\operatorname{div}")),
	s("curl", t("\\operatorname{curl}")),
	s("Res", t("\\operatorname{Res}")),
	s("Var", t("\\operatorname{Var}")),
	s("Cov", t("\\operatorname{Cov}")),

	-- =========================================================
	-- MATH: AUTO-SIZED DELIMITERS
	-- =========================================================
	s("lr(", { t("\\left("), i(1), t("\\right)") }),
	s("lr[", { t("\\left["), i(1), t("\\right]") }),
	s("lr{", { t("\\left\\{"), i(1), t("\\right\\}") }),
	s("lr|", { t("\\left|"), i(1), t("\\right|") }),
	s("lr<", { t("\\left\\langle "), i(1), t(" \\right\\rangle") }),
	s("lrn", { t("\\left\\|"), i(1), t("\\right\\|") }), -- auto-sized norm

	-- =========================================================
	-- MATH: MATRICES & CASES
	-- =========================================================
	s("pmat", { t("\\begin{pmatrix}"), t({ "", "\t" }), i(1), t({ "", "\\end{pmatrix}" }) }),
	s("bmat", { t("\\begin{bmatrix}"), t({ "", "\t" }), i(1), t({ "", "\\end{bmatrix}" }) }),
	s("vmat", { t("\\begin{vmatrix}"), t({ "", "\t" }), i(1), t({ "", "\\end{vmatrix}" }) }),
	-- Column vector shorthand (2- and 3-component)
	s("cvec2", {
		t("\\begin{pmatrix} "),
		i(1, "x"),
		t(" \\\\ "),
		i(2, "y"),
		t(" \\end{pmatrix}"),
	}),
	s("cvec3", {
		t("\\begin{pmatrix} "),
		i(1, "x"),
		t(" \\\\ "),
		i(2, "y"),
		t(" \\\\ "),
		i(3, "z"),
		t(" \\end{pmatrix}"),
	}),
	s("cases", {
		t("\\begin{cases}"),
		t({ "", "\t" }),
		i(1),
		t(" & \\text{if } "),
		i(2),
		t({ " \\\\", "\t" }),
		i(3),
		t(" & \\text{otherwise}"),
		t({ "", "\\end{cases}" }),
	}),

	-- =========================================================
	-- MATH: CALCULUS
	-- =========================================================
	s("dv", { t("\\frac{d"), i(1, "f"), t("}{d"), i(2, "x"), t("}") }),
	s("ndv", {
		t("\\frac{d^{"),
		i(1, "n"),
		t("} "),
		i(2, "f"),
		t("}{d"),
		i(3, "x"),
		t("^{"),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("}}"),
	}),
	s("pdv", { t("\\frac{\\partial "), i(1, "f"), t("}{\\partial "), i(2, "x"), t("}") }),
	s("npdv", {
		t("\\frac{\\partial^{"),
		i(1, "n"),
		t("} "),
		i(2, "f"),
		t("}{\\partial "),
		i(3, "x"),
		t("^{"),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("}}"),
	}),

	-- =========================================================
	-- MATH: FONTS
	-- =========================================================
	s("mcal", { t("\\mathcal{"), i(1), t("}") }),
	s("mbb", { t("\\mathbb{"), i(1), t("}") }),
	s("mbf", { t("\\mathbf{"), i(1), t("}") }),
	s("mrm", { t("\\mathrm{"), i(1), t("}") }),
	s("mfk", { t("\\mathfrak{"), i(1), t("}") }),
	s("msf", { t("\\mathsf{"), i(1), t("}") }),
	s("mit", { t("\\mathit{"), i(1), t("}") }),

	-- =========================================================
	-- MATH: ARROWS
	-- =========================================================
	s("to", t("\\to")),
	s("gets", t("\\gets")),
	s("<->", t("\\leftrightarrow")),
	s("=>", t("\\implies")),
	s("<=>", t("\\iff")),
	s("mapsto", t("\\mapsto")),
	s("uarr", t("\\uparrow")),
	s("darr", t("\\downarrow")),
	s("xto", { t("\\xrightarrow{"), i(1), t("}") }),
	s("xlongto", { t("\\xlongrightarrow{"), i(1), t("}") }),

	-- =========================================================
	-- MATH: LOGIC & SET THEORY
	-- =========================================================
	s("AA", t("\\forall")),
	s("EE", t("\\exists")),
	s("inn", t("\\in")),
	s("notin", t("\\notin")),
	s("ssub", t("\\subset")),
	s("sube", t("\\subseteq")),
	s("sup2", t("\\supset")), -- avoid conflict with \sup operator
	s("supe", t("\\supseteq")),
	s("cup", t("\\cup")),
	s("cap", t("\\cap")),
	s("Cup", t("\\bigcup")),
	s("Cap", t("\\bigcap")),
	s("setminus", t("\\setminus")),
	s("empty", t("\\emptyset")),
	s("land", t("\\land")),
	s("lor", t("\\lor")),
	s("lnot", t("\\lnot")),
	s("neq", t("\\neq")),
	s("leq", t("\\leq")),
	s("geq", t("\\geq")),
	s("ll", t("\\ll")),
	s("gg", t("\\gg")),
	s("approx", t("\\approx")),
	s("sim", t("\\sim")),
	s("simeq", t("\\simeq")),
	s("cong", t("\\cong")),
	s("equiv", t("\\equiv")),
	s("perp", t("\\perp")),
	s("mid", t("\\mid")),
	s("nmid", t("\\nmid")),

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
	-- THEOREMS & PROOFS
	-- =========================================================
	-- Generic theorem-like environment with mirrored end tag
	s("thm", {
		t("\\begin{"),
		i(1, "theorem"),
		t("}["),
		i(2, "name"),
		t({ "]", "  " }),
		i(3),
		t({ "", "\\end{" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("}"),
	}),
	s("proof", {
		t({ "\\begin{proof}", "  " }),
		i(1),
		t({ "", "\\end{proof}" }),
	}),
	-- Shorthand theorem environments
	s("defn", {
		t({ "\\begin{definition}", "  " }),
		i(1),
		t({ "", "\\end{definition}" }),
	}),
	s("lem", {
		t({ "\\begin{lemma}", "  " }),
		i(1),
		t({ "", "\\end{lemma}" }),
	}),
	s("cor", {
		t({ "\\begin{corollary}", "  " }),
		i(1),
		t({ "", "\\end{corollary}" }),
	}),
	s("prop", {
		t({ "\\begin{proposition}", "  " }),
		i(1),
		t({ "", "\\end{proposition}" }),
	}),
	s("rmk", {
		t({ "\\begin{remark}", "  " }),
		i(1),
		t({ "", "\\end{remark}" }),
	}),
	s("ex", {
		t({ "\\begin{example}", "  " }),
		i(1),
		t({ "", "\\end{example}" }),
	}),

	-- =========================================================
	-- DOCUMENT STRUCTURE
	-- =========================================================
	s("sec", { t("\\section{"), i(1, "title"), t("}") }),
	s("ssec", { t("\\subsection{"), i(1, "title"), t("}") }),
	s("sssec", { t("\\subsubsection{"), i(1, "title"), t("}") }),
	s("par", { t("\\paragraph{"), i(1, "title"), t("}") }),

	-- =========================================================
	-- LISTS
	-- =========================================================
	s("item", {
		t({ "\\begin{itemize}", "  \\item " }),
		i(1),
		t({ "", "\\end{itemize}" }),
	}),
	s("enum", {
		t({ "\\begin{enumerate}", "  \\item " }),
		i(1),
		t({ "", "\\end{enumerate}" }),
	}),
	s("desc", {
		t({ "\\begin{description}", "  \\item[" }),
		i(1, "label"),
		t("] "),
		i(2),
		t({ "", "\\end{description}" }),
	}),

	-- =========================================================
	-- TEXT FORMATTING
	-- =========================================================
	s("bf", { t("\\textbf{"), i(1), t("}") }),
	s("it", { t("\\textit{"), i(1), t("}") }),
	s("tt", { t("\\texttt{"), i(1), t("}") }),
	s("ul", { t("\\underline{"), i(1), t("}") }),
	s("emp", { t("\\emph{"), i(1), t("}") }),
	s("sc", { t("\\textsc{"), i(1), t("}") }),

	-- =========================================================
	-- FIGURES
	-- =========================================================
	s("fig", {
		t("\\begin{figure}["),
		i(1, "htbp"),
		t({ "]", "\t\\centering", "\t\\includegraphics[width=" }),
		i(2, "0.8"),
		t("\\linewidth]{"),
		i(3, "file"),
		t({ "}", "\t\\caption{" }),
		i(4, "caption"),
		t("}"),
		t("\\label{fig:"),
		i(5, "label"),
		t({ "}", "\\end{figure}" }),
	}),
	s("fig", {
		t("\\begin{figure}["),
		i(1, "t"),
		t({ "]", "\t\\caption{" }),
		i(2, "caption"),
		t("}\\label{fig:"),
		i(3, "label"),
		t({ "}", "\t\\includegraphics[width=" }),
		i(4, "0.8"),
		t("\\linewidth]{"),
		i(5, "file"),
		t({ "}", "\t\\figurenote{" }),
		i(6, "note"),
		t({ "}", "\\end{figure}" }),
	}),
	s("incfig", {
		t({ "\\begin{figure}[htbp]", "\t\\centering", "\t\\incfig{" }),
		i(1, "file"),
		t({ "}", "\t\\caption{" }),
		i(2, "caption"),
		t("}\\label{fig:"),
		i(3, "label"),
		t({ "}", "\\end{figure}" }),
	}),
	-- Subfigures (requires subcaption package)
	s("subfig", {
		t("\\begin{subfigure}[b]{"),
		i(1, "0.48"),
		t({ "\\linewidth}", "\t\\centering", "\t\\includegraphics[width=\\linewidth]{" }),
		i(2, "file"),
		t({ "}", "\t\\caption{" }),
		i(3, "caption"),
		t("}\\label{fig:"),
		i(4, "label"),
		t({ "}", "\\end{subfigure}" }),
	}),

	-- =========================================================
	-- TABLES
	-- =========================================================
	s("tabu", {
		t("\\begin{table}["),
		i(1, "htbp"),
		t({ "]", "\t\\centering", "\t\\caption{" }),
		i(2, "caption"),
		t("}\\label{tab:"),
		i(3, "label"),
		t({ "}", "\t\\begin{tabu}{" }),
		i(4, "*{4}{X[c]}"),
		t({ "}", "\t\t\\toprule", "\t\t" }),
		i(5, "headers"),
		t({ " \\\\", "\t\t\\midrule", "\t\t" }),
		i(6),
		t({ " \\\\", "\t\t\\bottomrule", "\t\\end{tabu}", "\t\\tablenote{" }),
		i(7, "note"),
		t({ "}", "\\end{table}" }),
	}),
	-- Standard tabular (no tabu dependency)
	s("tabl", {
		t("\\begin{table}["),
		i(1, "htbp"),
		t({ "]", "\t\\centering", "\t\\caption{" }),
		i(2, "caption"),
		t("}\\label{tab:"),
		i(3, "label"),
		t({ "}", "\t\\begin{tabular}{" }),
		i(4, "lll"),
		t({ "}", "\t\t\\toprule", "\t\t" }),
		i(5, "headers"),
		t({ " \\\\", "\t\t\\midrule", "\t\t" }),
		i(6),
		t({ " \\\\", "\t\t\\bottomrule", "\t\\end{tabular}", "\\end{table}" }),
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
	s("hr", t("\\hline")),
	s("nl", t("\\\\")),
	s("ref", { t("\\ref{"), i(1), t("}") }),
	s("eqref", { t("\\eqref{"), i(1), t("}") }),
	s("cref", { t("\\cref{"), i(1), t("}") }), -- requires cleveref
	s("Cref", { t("\\Cref{"), i(1), t("}") }),
	s("label", { t("\\label{"), i(1), t("}") }),
	s("url", { t("\\url{"), i(1), t("}") }),
	s("href", { t("\\href{"), i(1, "url"), t("}{"), i(2, "text"), t("}") }),
	s("footnote", { t("\\footnote{"), i(1), t("}") }),
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
