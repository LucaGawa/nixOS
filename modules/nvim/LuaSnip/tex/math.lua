local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual
local tex = require('luasnip-conditions')

local function static(trig,expr)
				return s({trig="".. trig, wordTrig=true, snippetType="autosnippet"},
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
  return s({trig=trig, wordTrig=true},
  fmta(
    expr .. "_{<>}^{<>}",
    { i(1),
      i(2)}
	),
{ condition = tex.in_math }

)
end

local function quantum(trig,expr)
				-- function for snippets like bra, ket, expval
  return s({trig="" .. trig, wordTrig=true, snippetType='autosnippet' },
  fmta(
    "\\".. expr .. "{<>}",
    { d(1,get_visual) }),
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
				static("TT", "^\\mathrm{T}"),
				static("iv", "^{-1}"),
				static("id", "\\mathds{1}"),
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
				-- static("ss", "\\sum"),
				static("pr", "\\prod"),
				static("hb", "\\hbar"),
				static("au", "\\uparrow"),
				static("ad", "\\downarrow"),
				static("00", "\\infty"),
				static("qq", "\\quad"),
				static("...", "\\ldots"),
				static(">>", "\\Rightarrow"),
				static("<>", "\\Leftrightarrow"),
				static("fa", "\\forall"),
				static("to", "\\to"),
				static("<<", "\\Leftarrow"),
				static("def", "\\coloneqq"),
				static("ap", "\\approx"),
				static("cc", "\\cdot"),
				static("tm", "\\times"),
				static("eq", "\\equiv"),
				static("ne", "\\neq"),
				static("tr", "\\tr"),
				static("sin", "\\sin"),
				static("cos", "\\cos"),
				static("tan", "\\tan"),
				static("lo", "\\log"),
				static("exp", "\\exp"),
				static("ii", "\\ii"),
				static("el", "\\in"),
				static("RR", "\\mathbb{R}"),
				static("NN", "\\mathbb{N}"),
				static("GG", "\\mathcal{G}"),
				static("CC", "\\mathbb{C}"),
				static("EV", "\\eval"),
				static("<>", "\\lessgtr"),
				static("><", "\\gtrless"),

				

s({trig="=", wordTrig=false, snippetType="autosnippet"},
				t("=&"),
				{condition = tex.in_align }
),

s({trig="m21" , wordTrig=false, snippetType='autosnippet' },
  fmta(
    "\\mqty(<>\\\\<>)",
    { i(1), i(2) }),
{ condition = tex.in_math }
),

s({trig="m12" , wordTrig=false, snippetType='autosnippet' },
  fmta(
    "\\mqty(<>&<>)",
    { i(1), i(2) }),
{ condition = tex.in_math }
),

s({trig="m22" , wordTrig=false, snippetType='autosnippet' },
  fmta(
    "\\mqty(<>&<>\\\\<>&<>)",
    { i(1), i(2), i(3), i(4) }),
{ condition = tex.in_math }
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

s({trig="bk" , wordTrig=false, snippetType='autosnippet' },
  fmta(
    "\\braket{<>}{<>}",
    { i(1), i(2) }),
{ condition = tex.in_math }
),
s({trig="com" , wordTrig=false, snippetType='autosnippet' },
  fmta(
    "\\qty[<>,<>]",
    { i(1), i(2) }),
{ condition = tex.in_math }
),

s({trig="ss" , wordTrig=true, snippetType='autosnippet' },
  fmta(
    "\\sum_{<>}",
    { i(1) }),
{ condition = tex.in_math }
),


sumSimilar("sum_{}","sum"),
sumSimilar("prod","prod"),
sumSimilar("int","int"),

quantum("ev","expval"),
quantum("br","bra"),
quantum("ke","ket"),
quantum("sq","sqrt"),
quantum("abb","abs"),

}
