local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local tex = require('luasnip-conditions')

local function static(trig,expr)
				return s({trig="".. trig, wordTrig=false, snippetType="autosnippet"},
				t("" .. expr),
				{condition = tex.in_math }
)
end

local function fracSnippet(trig,expr)
				-- function for text snippets like \frac oder \dv
				return s({trig="([^%a])" .. trig, wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"<>\\".. expr .. "{<>}{<>}",
								{ f( function(_, snip) return snip.captures[1] end ),
								  i(1),
									i(2)}
													    ),
															{ condition = tex.in_math }

				)
end

local function sumSimilar(trig,expr)
				-- function for snippets like sum, prod or int
  return s({trig="([^%a])" .. trig, wordTrig=false, regTrig=true},
  fmta(
    "<>".. expr .. "_{<>}^{<>}",
    { f( function(_, snip) return snip.captures[1] end),
      i(1),
      i(2)}
	),
{ condition = tex.in_math }

)
end

local function quantum(trig,expr)
				-- function for snippets like bra, ket, expval
  return s({trig="" .. trig, wordTrig=false, snippetType='autosnippet' },
  fmta(
    "\\".. expr .. "{<>}",
    { i(1) }),
{ condition = tex.in_math }
)

end

local function functions(expr,open,close)
				-- function for snippets like bra, ket, expval
  return s({trig="\\" .. expr .. open , wordTrig=false, snippetType='autosnippet' },
  fmta(
    "\\".. expr .. open .. "<>" .. close,
    { d(1,get_visual) }),
{ condition = tex.in_math }
)
end

return {
				functions('tr','(',')'),
				functions('tr','{','}'),
				functions('tr','[',']'),
				-- functions('t',

				fracSnippet('ff','frac'),
				fracSnippet('dv','dv'),
				fracSnippet('pdv','pdv'),
				fracSnippet('fdv','fdv'),

				static("da", "^\\dagger"),
				static("dd", "\\dd"),
				static("bb", "\\bar"),
				static("nn", "\\nabla"),
				static("pp", "\\partial"),
				static("\\dd2", "\\dd[2]"),
				static("\\dd3", "\\dd[3]"),
				static("\\dd4", "\\dd[4]"),
				static("\\ddd", "\\dd[d]"),
				static("\\ddn", "\\dd[n]"),
				static("\\ddl", "\\dd[l]"),
				static("DD", "\\mathcal{D}"),
				static("HH", "\\mathcal{H}"),
				static("LL", "\\mathcal{L}"),
				static("OO", "\\mathcal{O}"),
				static("vv", "\\vb*"),
				static("hh", "\\hat"),
				static("ti", "\\tilde"),
				-- static("\\tilde", "\\tilde"),
				static("in", "\\int"),
				static("ss", "\\sum"),
				static("hb", "\\hbar"),
				static("00", "\\infty"),
				static("...", "\\ldots"),
				static(">>", "\\Rightarrow"),
				static("to", "\\to"),
				static("<<", "\\leftarrow"),
				static("def", "\\coloneqq"),
				static("tr", "\\tr"),
				static("sin", "\\sin"),
				static("cos", "\\cos"),
				static("tan", "\\tan"),
				static("exp", "\\exp"),
				static("ii", "\\ii"),
				static("el", "\\in"),
				static("RR", "\\mathbb{R}"),
				static("NN", "\\mathbb{N}"),

				

s({trig="=", wordTrig=false, snippetType="autosnippet"},
				t("=&"),
				{condition = tex.in_align }
),



s({trig="([^%a])me" , wordTrig=false, regTrig=true, snippetType="autosnippet"},
				fmta(
								"<>\\mel{<>}{<>}{<>}",
								{ f( function(_, snip) return snip.captures[1] end ),
								  i(1),
								  i(2),
								  i(3)}
							
				    ),
		{condition = tex.in_math}
				),


sumSimilar("sum","sum"),
sumSimilar("prod","prod"),
sumSimilar("int","int"),

quantum("ev","expval"),
quantum("br","bra"),
quantum("ke","ket"),

}
