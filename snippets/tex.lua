local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta

local function ismath()
	return vim.api.nvim_eval "vimtex#syntax#in_mathzone()" == 1
end

local function not_ismath()
	return vim.api.nvim_eval "vimtex#syntax#in_mathzone()" == 0
end

-- set a higher priority (defaults to 0 for most snippets)
-- yes I know this is stupid af haha
local snippets = {
	s({ trig = "LTJournalArticleTemplate", name = "LTJournalArticle Template" }, {
		t "\\documentclass[\na4paper, % Paper size, use either a4paper or letterpaper \n10pt, % Default font size, can also use 11pt or 12pt, although this is not recommended \nunnumberedsections, % Comment to enable section numbering \ntwoside, % Two side traditional mode where headers and footers change between odd and even pages, comment this option to make them fixed\n]{LTJournalArticle}\n\n\\usepackage{fancyhdr}\n\\usepackage{etoolbox}\n\\usepackage{multicol}\n\\usepackage{lmodern}\n\\usepackage{csquotes}\n\n% Bibliography\n\\usepackage[\nbackend=biber,\nstyle=apa\n]{biblatex}\n\\addbibresource{",
		i(1),
		t "}\n% ---\n\n% Page header/footer\n\\pagestyle{fancy}\n\\fancyhf{}\n\\rhead{",
		i(2),
		t "}\n\\lhead{\\thepage}\n% ---\n\n% Title page\n\\title{",
		i(3),
		t "}\n\\author{",
		i(4),
		t "}\n\\date{",
		i(5),
		t "}\n\n\\begin{document}\n\\maketitle\n % ---\n% Start\n\n\n\n% ---\n End\\printbibliography\n\\end{document}",
	}),
	-- s({ trig = "figure_centered", name = "Centered Figure", priority = 10 }, {
	-- 	t("\\begin{figure}[h]\n\\centering\n\\includegraphics[width="),
	-- 	i(1, "\\columnwidth"), t("]{"), i(2), t("}")
	-- })
}

local autosnippets = {
	s({ trig = "ctp", name = "parencite", condition = not_ismath, priority = 10 }, {
		t("\\parencite{"), i(1), t("}")
	}),
	s({ trig = "ctt", name = "textcite", condition = not_ismath, priority = 10 }, {
		t("\\textcite{"), i(1), t("}")
	}),
	s({ trig = "bf", name = "mathbf", condition = ismath, priority = 10 }, {
		t("\\mathbf{"), i(1), t("}")
	}),
	s({ trig = "ptl", name = "partial", condition = ismath, priority = 10 }, {
		t("\\partial ")
	}),
	s({ trig = "\\sec", name = "section" }, {
		t("\\section{"), i(1), t({ "}", "" })
	}),
	s({ trig = "\\subsec", name = "subsection" }, {
		t("\\subsection{"), i(1), t({ "}", "" })
	}),
	s({ trig = "sseq", name = "subseteq", condition = ismath, priority = 10 }, {
		t("\\subseteq ")
	})
}

return snippets, autosnippets
